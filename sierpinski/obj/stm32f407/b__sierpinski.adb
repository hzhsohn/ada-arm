pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sierpinski.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sierpinski.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E18 : Short_Integer; pragma Import (Ada, E18, "last_chance_handler_E");
   E21 : Short_Integer; pragma Import (Ada, E21, "stm32__rng_E");
   E27 : Short_Integer; pragma Import (Ada, E27, "stm32__rng__polling_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      null;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      E18 := E18 + 1;
      E21 := E21 + 1;
      E27 := E27 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sierpinski");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   C:\Users\han.zh\Desktop\ada-arm\sierpinski\obj\stm32f407\last_chance_handler.o
   --   C:\Users\han.zh\Desktop\ada-arm\sierpinski\obj\stm32f407\sierpinski.o
   --   -LC:\Users\han.zh\Desktop\ada-arm\sierpinski\obj\stm32f407\
   --   -LC:\Users\han.zh\Desktop\ada-arm\sierpinski\obj\stm32f407\
   --   -LC:\Users\han.zh\Desktop\ada-arm\Ada_Drivers_Library\examples\shared\common\
   --   -LC:\Users\han.zh\Desktop\ada-arm\Ada_Drivers_Library\boards\stm32f407_discovery\obj\full_lib_Debug\
   --   -LC:\gnat\2018-arm-elf\arm-eabi\lib\gnat\zfp-stm32f4\adalib\
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
