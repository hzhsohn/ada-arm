
with Last_Chance_Handler;   pragma Unreferenced (Last_Chance_Handler);
with HAL;           use HAL;
with STM32.Device;  use STM32.Device;


package Window_WatchDog is

   procedure Init_WWDG;
   procedure Keep_WWDG with Inline;

end Window_WatchDog;
