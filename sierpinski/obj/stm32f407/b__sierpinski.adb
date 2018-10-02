pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sierpinski.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sierpinski.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;

package body ada_main is

   E097 : Short_Integer; pragma Import (Ada, E097, "system__soft_links_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "system__exception_table_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "ada__tags_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "system__bb__timing_events_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__streams_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__finalization_root_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "ada__finalization_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "system__storage_pools_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "system__finalization_masters_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "ada__real_time_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__pool_global_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__tasking__protected_objects_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "system__tasking__protected_objects__multiprocessors_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "system__tasking__restricted__stages_E");
   E232 : Short_Integer; pragma Import (Ada, E232, "cortex_m__cache_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "hal__audio_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "hal__bitmap_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "hal__block_drivers_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "hal__framebuffer_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "hal__gpio_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "hal__i2c_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "hal__real_time_clock_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "hal__sdmmc_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "hal__spi_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "hal__time_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "cs43l22_E");
   E252 : Short_Integer; pragma Import (Ada, E252, "hal__uart_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "lis3dsh_E");
   E257 : Short_Integer; pragma Import (Ada, E257, "lis3dsh__spi_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "ravenscar_time_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "sdmmc_init_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "stm32__adc_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "stm32__dac_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "stm32__dma__interrupts_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "stm32__exti_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "stm32__power_control_E");
   E259 : Short_Integer; pragma Import (Ada, E259, "stm32__rng_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "stm32__rng__polling_E");
   E221 : Short_Integer; pragma Import (Ada, E221, "stm32__rtc_E");
   E244 : Short_Integer; pragma Import (Ada, E244, "stm32__spi_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "stm32__spi__dma_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "stm32__i2c_E");
   E250 : Short_Integer; pragma Import (Ada, E250, "stm32__usarts_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "stm32__sdmmc_interrupt_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "stm32__i2s_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "stm32__i2c__dma_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "stm32__gpio_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "stm32__sdmmc_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "stm32__syscfg_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "stm32__device_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "stm32__setup_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "stm32__board_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "last_chance_handler_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, True, True, False, False, False, False, True, 
           False, False, False, False, False, False, False, True, 
           True, False, False, False, False, False, True, False, 
           False, False, False, False, False, False, False, False, 
           True, True, False, False, True, True, False, False, 
           False, True, False, False, False, False, True, False, 
           True, True, False, False, False, False, True, True, 
           True, True, True, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, True, True, 
           False, True, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           False, False, False, True, True, True, True, False, 
           False, False, False, False, True, True, False, True, 
           True, False, True, True, False, True, False, False, 
           False, False, False, True, False, False, True, False, 
           False, False, True, True, False, False, False, True, 
           False, False, False, True, False, False, False, False, 
           False, False, False, False, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, False, True, True, True, False, 
           False, True, False, False, False, True, False, False, 
           False, False, True, False),
         Count => (0, 0, 0, 1, 0, 0, 0, 0, 3, 0),
         Unknown => (False, False, False, False, False, False, False, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E095 := E095 + 1;
      Ada.Tags'Elab_Body;
      E061 := E061 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E097 := E097 + 1;
      E083 := E083 + 1;
      Ada.Streams'Elab_Spec;
      E008 := E008 + 1;
      System.Finalization_Root'Elab_Spec;
      E126 := E126 + 1;
      Ada.Finalization'Elab_Spec;
      E124 := E124 + 1;
      System.Storage_Pools'Elab_Spec;
      E128 := E128 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E121 := E121 + 1;
      Ada.Real_Time'Elab_Body;
      E137 := E137 + 1;
      System.Pool_Global'Elab_Spec;
      E130 := E130 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E194 := E194 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E200 := E200 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E213 := E213 + 1;
      E232 := E232 + 1;
      HAL.AUDIO'ELAB_SPEC;
      E218 := E218 + 1;
      HAL.BITMAP'ELAB_SPEC;
      E006 := E006 + 1;
      HAL.BLOCK_DRIVERS'ELAB_SPEC;
      E241 := E241 + 1;
      HAL.FRAMEBUFFER'ELAB_SPEC;
      E133 := E133 + 1;
      HAL.GPIO'ELAB_SPEC;
      E182 := E182 + 1;
      HAL.I2C'ELAB_SPEC;
      E190 := E190 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E222 := E222 + 1;
      HAL.SDMMC'ELAB_SPEC;
      E236 := E236 + 1;
      HAL.SPI'ELAB_SPEC;
      E143 := E143 + 1;
      HAL.TIME'ELAB_SPEC;
      E150 := E150 + 1;
      CS43L22'ELAB_SPEC;
      CS43L22'ELAB_BODY;
      E255 := E255 + 1;
      HAL.UART'ELAB_SPEC;
      E252 := E252 + 1;
      LIS3DSH'ELAB_SPEC;
      LIS3DSH'ELAB_BODY;
      E145 := E145 + 1;
      LIS3DSH.SPI'ELAB_SPEC;
      LIS3DSH.SPI'ELAB_BODY;
      E257 := E257 + 1;
      Ravenscar_Time'Elab_Spec;
      Ravenscar_Time'Elab_Body;
      E149 := E149 + 1;
      E234 := E234 + 1;
      STM32.ADC'ELAB_SPEC;
      E159 := E159 + 1;
      E165 := E165 + 1;
      E206 := E206 + 1;
      E178 := E178 + 1;
      E224 := E224 + 1;
      E259 := E259 + 1;
      E262 := E262 + 1;
      STM32.RTC'ELAB_SPEC;
      STM32.RTC'ELAB_BODY;
      E221 := E221 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E244 := E244 + 1;
      STM32.SPI.DMA'ELAB_SPEC;
      STM32.SPI.DMA'ELAB_BODY;
      E246 := E246 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.USARTS'ELAB_SPEC;
      STM32.I2S'ELAB_SPEC;
      STM32.I2C.DMA'ELAB_SPEC;
      STM32.GPIO'ELAB_SPEC;
      STM32.SDMMC'ELAB_SPEC;
      E240 := E240 + 1;
      STM32.GPIO'ELAB_BODY;
      E171 := E171 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E154 := E154 + 1;
      STM32.SDMMC'ELAB_BODY;
      E229 := E229 + 1;
      STM32.I2S'ELAB_BODY;
      E217 := E217 + 1;
      STM32.I2C.DMA'ELAB_BODY;
      E192 := E192 + 1;
      STM32.I2C'ELAB_BODY;
      E186 := E186 + 1;
      E176 := E176 + 1;
      STM32.USARTS'ELAB_BODY;
      E250 := E250 + 1;
      E152 := E152 + 1;
      STM32.BOARD'ELAB_SPEC;
      E142 := E142 + 1;
      E135 := E135 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sierpinski");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   C:\Users\han.zh\Desktop\ada-arm\sierpinski\obj\stm32f407\last_chance_handler.o
   --   C:\Users\han.zh\Desktop\ada-arm\sierpinski\obj\stm32f407\sierpinski.o
   --   -LC:\Users\han.zh\Desktop\ada-arm\sierpinski\obj\stm32f407\
   --   -LC:\Users\han.zh\Desktop\ada-arm\sierpinski\obj\stm32f407\
   --   -LC:\Users\han.zh\Desktop\ada-arm\Ada_Drivers_Library\examples\shared\common\
   --   -LC:\Users\han.zh\Desktop\ada-arm\Ada_Drivers_Library\boards\stm32f407_discovery\obj\full_lib_Debug\
   --   -LC:\gnat\2018-arm-elf\arm-eabi\lib\gnat\ravenscar-full-stm32f4\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
