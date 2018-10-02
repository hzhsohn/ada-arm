with Last_Chance_Handler; pragma Unreferenced (Last_Chance_Handler);
with Interfaces; use Interfaces;
with HAL; use HAL;
--with STM32.Board; use STM32.Board;
with HAL.Bitmap; use HAL.Bitmap;
with HAL.Framebuffer; use HAL.Framebuffer;
with STM32.RNG.Polling; use STM32.RNG.Polling;

procedure Sierpinski is
   i:Natural:=0;
begin

   Initialize_RNG;
   loop
      i:=i+1;
   end loop;
end Sierpinski;

