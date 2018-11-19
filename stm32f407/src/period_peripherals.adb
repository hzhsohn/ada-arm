
with HAL;          use HAL;
with STM32.Device; use STM32.Device;
with STM32.ADC;   use STM32.ADC;
with ADC_VRef_Polling;

package body Period_Peripherals is


   ---------------------------
   -- parameter volt
   ---------------------------
   vref: Natural:=0; --refance voltage
   vbat: Natural:=0; --battery voltage
   vntc: Natural:=0; --borad temperature


   ---------------------
   -- Init_Period_Dev --
   ---------------------

   procedure Init_Period_Dev is
   begin

      ADC_VRef_Polling.Init_VREF;

   end Init_Period_Dev;


   procedure Loop_Refresh_Period is
   begin

      vref:=ADC_VRef_Polling.Read_VREF;

   end Loop_Refresh_Period;

   ---------------------
   -- Read_VRef_Value --
   ---------------------

   function Get_VRef_Value return Float is
      tmp: Float := 0.0;
   begin

      tmp := (Float (vref) / 4096.0) * Float (ADC_Supply_Voltage);
      return tmp;
   end Get_VRef_Value;

   ---------------------
   -- Read_VBat_Value --
   ---------------------

   function Get_VBat_Value return Float is
       tmp: Float := 0.0;
   begin
       tmp := (Float (vbat) / 4096.0) * Float (ADC_Supply_Voltage);
      return tmp;
   end Get_VBat_Value;

   --------------------------
   -- Read_Board_NTC_Value --
   --------------------------

   function Get_Board_NTC_Value return Float is
       tmp: Float := 0.0;
   begin
       tmp := (Float (vntc) / 4096.0) * Float (ADC_Supply_Voltage);
      return tmp;
   end Get_Board_NTC_Value;

end Period_Peripherals;
