
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with STM32.Device; use STM32.Device;
with HAL;          use HAL;
with STM32.GPIO;   use STM32.GPIO;

package ADC_VRef_Polling is

   procedure init;
   function  read return UInt32;

end ADC_VRef_Polling;
