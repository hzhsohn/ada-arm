
with STM32;                        use STM32;
with STM32.GPIO;                   use STM32.GPIO;
with STM32.Device;                 use STM32.Device;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Peripherals;                  use Peripherals;
with Serial_Terminator;                  use Serial_Terminator;
with Serial_Hex; use Serial_Hex;
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);


procedure main is

   ---------------------
   -- define
   ---------------------

   uartRecvBuf : aliased Message (Physical_Size => 512);
   uartSendBuf : aliased Message (Physical_Size => 512);

  -- uart2RecvBuf : aliased HexData (Physical_Size => 512);
  -- uart2SendBuf : aliased HexData (Physical_Size => 512);


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
      --
   end Initialize;


begin
   Initialize;

   -- initizal input message
   Set (uartSendBuf, To => "Enter text, terminated by CR.");
   Peripherals.COM.Start_Sending (uartSendBuf'Unchecked_Access);
   Suspend_Until_True (uartSendBuf.Transmission_Complete);
--------------
   Peripherals.COM2.Init;
   -------------------------
   loop
      --        Peripherals.COM.Start_Receiving (uartRecvBuf'Unchecked_Access);
      --        -- block waiting
      --        Suspend_Until_True (uartRecvBuf.Reception_Complete);
      --
      --        -- reback uart data
      --        Set (uartSendBuf, To => "Received : " & As_String (uartRecvBuf));
      --        Peripherals.COM.Start_Sending (uartSendBuf'Unchecked_Access);
      --        Suspend_Until_True (uartSendBuf.Transmission_Complete);

     if Peripherals.COM2.isRecvDone then
        Peripherals.COM2.Start_Sending(buf => (16#0A#,16#0B#,16#0C#));
        Peripherals.COM2.Reset_Receive;
     end if;
     null;
   end loop;
end main;


