
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with STM32.Board;  use STM32.Board;
with STM32.Device; use STM32.Device;

with HAL;          use HAL;
with STM32.ADC;    use STM32.ADC;
with STM32.GPIO;   use STM32.GPIO;

package ADC_VBat_Polling is

   procedure Init_VBat;
   function  Read_VBat return Natural;

end ADC_VBat_Polling;
