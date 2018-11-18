package body Period_ADC is

   -------------------
   -- Analog_Device --
   -------------------

   protected body Period_Device is

      -----------------
      -- Init_Period_Dev --
      -----------------

      procedure Init_Period_Dev is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "Init_Analog unimplemented");
         raise Program_Error with "Unimplemented procedure Init_Analog";
      end Init_Analog;

      ----------------
      -- Read_Value --
      ----------------

      function Read_Value return Natural is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "Read_Value unimplemented");
         raise Program_Error with "Unimplemented function Read_Value";
         return Read_Value;
      end Read_Value;

   end Period_Device;

end Period_ADC;
