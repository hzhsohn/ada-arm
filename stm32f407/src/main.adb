
with STM32;                        use STM32;
with STM32.GPIO;                   use STM32.GPIO;
with STM32.Device;                 use STM32.Device;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Peripherals;                  use Peripherals;
with Serial_Terminator;                  use Serial_Terminator;
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);


procedure main is

   ---------------------
   -- define
   ---------------------

   uartRecvBuf : aliased Message (Physical_Size => 512);  -- arbitrary size
   uartSendBuf : aliased Message (Physical_Size => 512);  -- arbitrary size

   -- function

   procedure Initialize;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Peripherals.Initialize_STMicro_UART;
      --uart recv init
      uartRecvBuf.Terminator := ASCII.CR;
   end Initialize;


begin
   Initialize;

   -- initizal input message
   Set (uartSendBuf, To => "Enter text, terminated by CR.");
   Peripherals.COM.Start_Sending (uartSendBuf'Unchecked_Access);
   Suspend_Until_True (uartSendBuf.Transmission_Complete);

   -------------------------
   loop
      Peripherals.COM.Start_Receiving (uartRecvBuf'Unchecked_Access);
      -- block waiting
      Suspend_Until_True (uartRecvBuf.Reception_Complete);

      -- reback uart data
      Set (uartSendBuf, To => "Received : " & As_String (uartRecvBuf));
      Peripherals.COM.Start_Sending (uartSendBuf'Unchecked_Access);
      Suspend_Until_True (uartSendBuf.Transmission_Complete);

   end loop;
end main;


