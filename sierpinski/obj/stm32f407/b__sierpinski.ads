pragma Warnings (Off);
pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: Community 2018 (20180523-73)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_sierpinski" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  ada.exceptions%s
   --  ada.exceptions%b
   --  system.parameters%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.secondary_stack%s
   --  system.secondary_stack%b
   --  ada.tags%s
   --  ada.tags%b
   --  system.unsigned_types%s
   --  system.assertions%s
   --  system.assertions%b
   --  hal%s
   --  stm32%s
   --  stm32_svd%s
   --  stm32_svd.rcc%s
   --  stm32_svd.rng%s
   --  hal.bitmap%s
   --  hal.framebuffer%s
   --  last_chance_handler%s
   --  last_chance_handler%b
   --  stm32.rng%s
   --  stm32.rng%b
   --  stm32.rng.polling%s
   --  stm32.rng.polling%b
   --  sierpinski%b
   --  END ELABORATION ORDER

end ada_main;
