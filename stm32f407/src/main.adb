
with STM32;                        use STM32;
with STM32.GPIO;                   use STM32.GPIO;
with STM32.Device;                 use STM32.Device;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Peripherals;                  use Peripherals;
with Serial_Port;                  use Serial_Port;
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);



procedure main is

   Uart1_DevBuff : aliased Message (Physical_Size => 1024);  -- arbitrary size


   procedure Initialize;
   procedure RebackUartData;

   --------------
   -- RebackUartData Interact --
   --------------

   procedure RebackUartData is
      Received : aliased Message (Physical_Size => 1024);  -- arbitrary size
--  isRecvOK: Boolean :=False;
   begin
      Received.Terminator := ASCII.CR;

      -- initizal input message
      Set (Uart1_DevBuff, To => "Enter text, terminated by CR.");
      Peripherals.COM.Start_Sending (Uart1_DevBuff'Unchecked_Access);
      Suspend_Until_True (Uart1_DevBuff.Transmission_Complete);

      -------------------------
      loop
         Peripherals.COM.Start_Receiving (Received'Unchecked_Access);
         Suspend_Until_True (Received.Reception_Complete);
--         --get recv complete status
--         isRecvOK:=Current_State(Received.Reception_Complete);
--         if isRecvOK then
--         end if;

         -- reback uart data
         Set (Uart1_DevBuff, To => "Received : " & As_String (Received));
         Peripherals.COM.Start_Sending (Uart1_DevBuff'Unchecked_Access);
         Suspend_Until_True (Uart1_DevBuff.Transmission_Complete);
      end loop;
   end RebackUartData;


   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Peripherals.Initialize_STMicro_UART;

   end Initialize;

begin
   Initialize;
   RebackUartData;
end main;


