
with Last_Chance_Handler;    pragma Unreferenced (Last_Chance_Handler);

with STM32.IWDG;    use STM32.IWDG;
with Ada.Real_Time; use Ada.Real_Time;
with STM32.Board;   use STM32.Board;

package Independent_WatchDog is

   procedure Init_IWDG ;
   procedure Keep_IWDG with Inline;

end Independent_WatchDog;
