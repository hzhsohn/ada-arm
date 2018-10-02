with Last_Chance_Handler; pragma Unreferenced (Last_Chance_Handler);
with Interfaces; use Interfaces;
with HAL; use HAL;
--with STM32.Board; use STM32.Board;
with HAL.Bitmap; use HAL.Bitmap;
with HAL.Framebuffer; use HAL.Framebuffer;
with STM32.RNG.Polling; use STM32.RNG.Polling;

procedure main is
   i:Natural:=0;
begin

   Initialize_RNG;


   loop
      i:=i+1;
      i:=i mod 5;
      if(i mod 2)=0 then
        null;
      end if;
   end loop;
end main;

