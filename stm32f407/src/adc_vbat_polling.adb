
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with STM32.Board;  use STM32.Board;
with STM32.Device; use STM32.Device;

with HAL;          use HAL;
with STM32.ADC;    use STM32.ADC;
with STM32.GPIO;   use STM32.GPIO;

package body ADC_VBat_Polling is

   Counts  : UInt32;
   Voltage : UInt32;  -- in millivolts

   Successful : Boolean;
   Timed_Out : exception;

begin
   Enable_Clock (VBat.ADC.all);

   Reset_All_ADC_Units;

   Configure_Common_Properties
     (Mode           => Independent,
      Prescalar      => PCLK2_Div_2,
      DMA_Mode       => Disabled,
      Sampling_Delay => Sampling_Delay_5_Cycles);

   Configure_Unit
     (VBat.ADC.all,
      Resolution => ADC_Resolution_12_Bits,
      Alignment  => Right_Aligned);

   Configure_Regular_Conversions
     (VBat.ADC.all,
      Continuous  => False,
      Trigger     => Software_Triggered,
      Enable_EOC  => True,
      Conversions => (1 => (VBat.Channel, Sample_Time => Sample_112_Cycles)));

   Enable (VBat.ADC.all);

   loop
      Start_Conversion (VBat.ADC.all);

      Poll_For_Status (VBat.ADC.all, Regular_Channel_Conversion_Complete, Successful);
      if not Successful then
         raise Timed_Out;
      end if;

      Counts := UInt32 (Conversion_Value (VBat.ADC.all));

      Voltage := ((Counts * VBat_Bridge_Divisor) * ADC_Supply_Voltage) / 16#FFF#;
      --  16#FFF# because we are using 12-bit conversion resolution

      Print (0, 24, Voltage, "mv");

   end loop;
end ADC_VBat_Polling;
