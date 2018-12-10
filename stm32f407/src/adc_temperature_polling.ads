
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with STM32.Board;  use STM32.Board;
with STM32.Device; use STM32.Device;

with HAL;         use HAL;
with STM32.ADC;   use STM32.ADC;
with STM32.GPIO;  use STM32.GPIO;

package ADC_Temperature_Polling is

   procedure Init_ADC_Temperature;
   function  Read_ADC_Temperature return Float;

end ADC_Temperature_Polling;
