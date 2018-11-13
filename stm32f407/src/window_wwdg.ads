
with Last_Chance_Handler;   pragma Unreferenced (Last_Chance_Handler);

with HAL;           use HAL;
with STM32.Device;  use STM32.Device;

package Window_WWDG is

   procedure Init_Watchdog;
   procedure Keep_Watchdog with Inline;
   procedure Test_Delay with Inline;

end Window_WWDG;
