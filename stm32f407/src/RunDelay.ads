
with Last_Chance_Handler;   pragma Unreferenced (Last_Chance_Handler);
with HAL;           use HAL;
with STM32.Device;  use STM32.Device;


package RunDelay is

    procedure wait with Inline;

end RunDelay;
