
--  This program demonstrates reading the analog voltage value on a GPIO
--  pin with an ADC unit, using polling. The pin is continously polled in an
--  infinite loop, displaying the current sample on each iteration. Connect the
--  pin to an appropriate external input voltage to drive the displayed value.
--  Absent an input, the sensed (and displayed) value will be meaningless. The
--  green LED will toggle on each iteration, as an additional indication of
--  execution.
--
--  NB: The input voltage must not exceed the maximum allowed for the board's
--  circuitry!  A value between zero and three volts (inclusive) is safe.
--
--  The displayed value is the raw sample quantity in the range 0 .. 4095,
--  representing an input voltage of 0.0 to 3.0 volts. Thus, for an
--  incoming voltage of 1.5 volts, the sample would be approximately half of
--  4095, i.e., 2048.

--  Note that you will likely need to reset the board manually after loading.

with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with STM32.Board;  use STM32.Board;
with STM32.Device; use STM32.Device;

with HAL;          use HAL;
with STM32.ADC;    use STM32.ADC;
with STM32.GPIO;   use STM32.GPIO;

with Ada.Real_Time;  use Ada.Real_Time;

package ADC_Other_GPIO_Polling is

   procedure Init_ADC_Other;
   function  Read_ADC_Other return UInt32;

end ADC_Other_GPIO_Polling;
