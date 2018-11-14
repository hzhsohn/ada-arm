
with STM32;                        use STM32;
with STM32.GPIO;                   use STM32.GPIO;
with STM32.Device;                 use STM32.Device;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Peripherals;                  use Peripherals;
with Serial_Hex; use Serial_Hex;
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with Window_WWDG; use Window_WWDG;


procedure main is

   ---------------------
   -- define
   ---------------------

   uartRecvBuf : aliased HexData (Physical_Size => 512);
   uartSendBuf : aliased HexData (Physical_Size => 512);

   uart2RecvBuf : aliased HexData (Physical_Size => 512);
   uart2SendBuf : aliased HexData (Physical_Size => 512);

   -----------------------
   vref : UInt32:=0;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      --uart recv init
      Peripherals.Initialize_COM1(uartRecvBuf'Unchecked_Access);
      Peripherals.Initialize_COM2(uart2RecvBuf'Unchecked_Access);

      --
      Peripherals.Initialize_ADC_VRef;

      ----------------
      --watch dog
      --Window_WWDG.Init_Watchdog;

   end Initialize;



begin
   Initialize;

   loop

      ---------------------------
      --wei dog
      Window_WWDG.Keep_Watchdog;

      ---------------------------
      -- read refance volt
      ---------------------------
      vref:=Peripherals.readVRef;

      ---------------------------
      -- UART1
      ---------------------------
      if Peripherals.COM1.isRecvDone then
         ---------------------------------
         -- reback uart
         Peripherals.COM1.Start_Sending(This => uartSendBuf'Unchecked_Access,str => "abcdefg");
         Suspend_Until_True (uartSendBuf.Transmission_Complete);

         ---------------------------------
         -- reset recevice
         Peripherals.COM1.Reset_Receive;
      end if;

      ---------------------------
      -- UART2
      ---------------------------
      if Peripherals.COM2.isRecvDone then
         ---------------------------------
         -- reback uart
         Peripherals.COM2.Start_Sending(This => uart2SendBuf'Unchecked_Access,
                                        buf => (16#0A#,16#0B#,16#0C#,16#0D#,16#99#));
         Suspend_Until_True (uart2SendBuf.Transmission_Complete);

         Peripherals.COM2.Start_Sending(This => uart2SendBuf'Unchecked_Access,
                                        buf => (16#01#,16#02#,16#03#,16#04#,16#05#));
         Suspend_Until_True (uart2SendBuf.Transmission_Complete);
         ---------------------------------
         -- reset recevice
         Peripherals.COM2.Reset_Receive;
      end if;

   end loop;
end main;


