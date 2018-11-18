
package body Independent_WatchDog is


   Watchdog_Count : constant := 4095;  -- arbitrary
   --  The clock driving the watchdog downcounter is approximately 32KHz, so
   --  dividing by 32 gives about 1 millisecond per count. Thus the count gives
   --  approximately that many milliseconds before the system reset interrupt
   --  is triggered. Feel free to experiment with this value.

   Watchdog_Count_Offset : constant := -90; -- arbitrary
   --  The entirely arbitrary amount to add/subtract to the watchdog count, ie
   --  the time that causes a board reset, in order to experiment with causing
   --  the reset to occur. This value is added to the Watchdog_Count and the
   --  result passed to Do_Work, thereby controlling whether the watchdog timer
   --  trips or not. Feel free to experiment with this value.

   Work_Time : constant := Watchdog_Count + Watchdog_Count_Offset;
   --  The value passed to Do_Work which determines the amount of time taken by
   --  that call. By changing the value of Watchdog_Count_Offset you can cause
   --  the reset to occur, or not.  Note that optimization will have influence.

   ---------------------------------------
   procedure Init_IWDG is
   begin
      Initialize_Watchdog (Prescaler => Divider_32, Count => Watchdog_Count);
      Start_Watchdog;
   end Init_IWDG;

   procedure Keep_IWDG is
   begin
      Reset_Watchdog;
   end Keep_IWDG;


end Independent_WatchDog;
