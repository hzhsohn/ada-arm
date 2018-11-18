
with STM32.WWDG;    use STM32.WWDG;
with Ada.Real_Time; use Ada.Real_Time;

package body Window_WatchDog is

   ----------------------------------------------------------------------------
   --  For the following, see Figure 215 in RM0090, illustrating the watchdog
   --  behavior and significant events. Note that time is increasing to the
   --  right in the figure.
   --  www.st.com/resource/en/reference_manual/DM00031020.pdf
   ----------------------------------------------------------------------------

   Initial_Count : constant Downcounter := 127;
   --  This is the initial counter value of the countdown timer. In the figure,
   --  this is the counter value at the start of the "refresh not allowed"
   --  interval.  It is an arbitrary, user-defined value.

   Window_Start_Count : constant Downcounter := 80;
   --  This is the value of the countdown counter when the refresh window is to
   --  open. In the figure, this is the counter value at the start of the
   --  "refresh allowed" interval. It is an arbitrary, user-defined value.
   --
   --  The last counter value prior to reset is always 64 (16#40#). At 16#3F#
   --  the high-order counter bit T6 (see the figure) clears, causing the
   --  watchdog to trigger the system reset (when activated). That is also
   --  the closing of the refresh window.

   Clock_Prescaler : constant Prescalers := Divider_8;

   --  The above are all that is required to drive the watchdog (by passing
   --  them to the API routines). The rest of the constants that follow are
   --  used to calculate a demonstration-specific delay value used purely to
   --  show how the watchdog behaves. We calculate these values so that the
   --  source code will be independent of a given board. They are also useful
   --  for understanding the watchdog refresh window opening and closing
   --  times. The goal is to calculate the Time_Span value for the window,
   --  ie the "refresh allowed" interval in the figure, so that you can
   --  experiment with values relative to that window.

   PCLK1_Frequency : constant UInt32 := System_Clock_Frequencies.PCLK1;
   --  The PCLK1 frequency on the STM32F429I Discovery boards is 45MHz, for
   --  example, and that is what we use in the comments below.

   Divider : constant UInt32 := (case Clock_Prescaler is
                                    when Divider_1 => 1,
                                    when Divider_2 => 2,
                                    when Divider_4 => 4,
                                    when Divider_8 => 8);

   WWDG_Counter_Freq : constant UInt32 := PCLK1_Frequency / 4096 / Divider;
   --  45MHz / 4096 / 8 = 1373 Hz

   WWDG_Counter_Period : constant Duration := 1.0 / Duration (WWDG_Counter_Freq);
   --  1 / 1373 = ~0.000728

   WWDG_Timeout : constant Duration := WWDG_Counter_Period * 64;
   --  ~0.000728 * 64 = ~0.046
   --
   --  The time at which the timeout occurs, ie the window closes. The
   --  watchdog always triggers at count 63 (16#3F# in the diagram).

   Refresh_Window_Closing : constant Time_Span := To_Time_Span (WWDG_Timeout);
   --  ~46 ms
   --
   --  The time at which the window closes, just before the reset will be
   --  triggered.

   Refresh_Not_Allowed : constant Integer := Integer (Initial_Count - Window_Start_Count);
   --  (127 - 80) = 47
   --
   --  This is the interval, in terms of counts, before the refresh window
   --  opens, ie before when the downcounter matches the Window_Start_Count
   --  value. In the figure, this is the width of the "refresh now allowed"
   --  interval.

   WWDG_Window_Starts : constant Duration := WWDG_Counter_Period * Refresh_Not_Allowed;
   --  ~0.000728 * 47 = ~0.034
   --
   --  The time at which the window opens, immediately after the "refresh not
   --  allowed" interval ends.

   Refresh_Window_Opening : constant Time_Span := To_Time_Span (WWDG_Window_Starts);
   --  ~34ms

   --  So now we know, given the assumed PCLK1 value and the user-defined
   --  configuration selections, that the "refresh allowed" window opens
   --  approximately 34ms after the watchdog is activated/refreshed, and closes
   --  approximately 46ms after being activated/refreshed. The window is thus
   --  approximately 12ms wide.

   Window_Midpoint : constant Time_Span :=
       Refresh_Window_Opening + ((Refresh_Window_Closing - Refresh_Window_Opening) / 2);
   --  The midpoint of the window, given the above calculations, is
   --  approximately 40ms after activation/refresh.

   Application_Work_Interval : constant Time_Span := Window_Midpoint;
   --  The amount to pause before refreshing the watchdog counter, representing
   --  some work being done by the application. The midpoint of the refresh
   --  window is chosen arbitrarily. Experiment with different values within
   --  and outside the window to see that refreshing outside the window will
   --  trigger the reset.


   -------------------------------
   procedure Init_WWDG is
   begin

      if WWDG_Reset_Indicated then
         --  We missed the refresh window in a previous execution of the program
         --  and were reset, so signal that fact.
         Clear_WWDG_Reset_Flag;
         --else
      end if;

      Enable_Watchdog_Clock;
      Reset_Watchdog;
      Set_Watchdog_Prescaler (Clock_Prescaler);
      Set_Watchdog_Window (Window_Start_Count);
      Activate_Watchdog (Initial_Count);

   end Init_WWDG;



   --------------------------------
   procedure Keep_WWDG is
   begin
      --test delay time.
      delay until Clock + Application_Work_Interval;
      Refresh_Watchdog_Counter (Initial_Count);
   end Keep_WWDG;


end Window_WatchDog;
