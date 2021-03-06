
with STM32.ADC;    use STM32.ADC;

package body ADC_VRef_Polling is


   Raw     : UInt32;
   Successful : Boolean;
   Timed_Out  : exception;

   procedure Init_VREF is
   begin
      Enable_Clock (ADC_1);

      Reset_All_ADC_Units;

      Configure_Common_Properties
        (Mode           => Independent,
         Prescalar      => PCLK2_Div_2,
         DMA_Mode       => Disabled,
         Sampling_Delay => Sampling_Delay_5_Cycles);

      Configure_Unit
        (ADC_1,
         Resolution => ADC_Resolution_12_Bits,
         Alignment  => Right_Aligned);

      Configure_Regular_Conversions
        (ADC_1,
         Continuous  => False,
         Trigger     => Software_Triggered,
         Enable_EOC  => True,
         Conversions => (1 => (Channel => VRef_Channel, Sample_Time => Sample_144_Cycles)));

      Enable (ADC_1);
   end Init_VREF;

   function  Read_VREF return Natural is
   begin

      Start_Conversion (ADC_1);

      Poll_For_Status (ADC_1, Regular_Channel_Conversion_Complete, Successful);
      if not Successful then
         raise Timed_Out;
      end if;

      Raw := UInt32 (Conversion_Value (ADC_1));

      return Raw;

   end Read_VREF;

end ADC_VRef_Polling;
