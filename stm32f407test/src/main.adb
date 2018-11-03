
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.

with LEDs;
with OutputA;
with System;

procedure Main is
   pragma Priority (System.Priority'First);
begin
   loop
      LEDs.All_On;
      Leds.All_Off;
      OutputA.All_On;
      OutputA.All_Off;
   end loop;
end Main;
