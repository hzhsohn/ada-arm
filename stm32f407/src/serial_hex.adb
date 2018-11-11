
package body Serial_Hex is

   ----------------
   -- Controller --
   ----------------

   protected body Controller is

      ---------------------
      -- Errors_Detected --
      ---------------------

      function Errors_Detected return Error_Conditions is
      begin
         return Errors;
      end Errors_Detected;

      -------------------
      -- Detect_Errors --
      -------------------

      procedure Detect_Errors is
      begin
         --  check for parity error
         if Status (Device.all, Parity_Error_Indicated) and
           Interrupt_Enabled (Device.all, Parity_Error)
         then
            Clear_Status (Device.all, Parity_Error_Indicated);
            Errors := Errors or Parity_Error_Detected;
         end if;

         --  check for framing error
         if Status (Device.all, Framing_Error_Indicated) and
           Interrupt_Enabled (Device.all, Error)
         then
            Clear_Status (Device.all, Framing_Error_Indicated);
            Errors := Errors or Frame_Error_Detected;
         end if;

         --  check for noise error
         if Status (Device.all, USART_Noise_Error_Indicated) and
           Interrupt_Enabled (Device.all, Error)
         then
            Clear_Status (Device.all, USART_Noise_Error_Indicated);
            Errors := Errors or Noise_Error_Detected;
         end if;

         --  check for overrun error
         if Status (Device.all, Overrun_Error_Indicated) and
           Interrupt_Enabled (Device.all, Error)
         then
            Clear_Status (Device.all, Overrun_Error_Indicated);
            Errors := Errors or Overrun_Error_Detected;
         end if;
      end Detect_Errors;

      -------------------------
      -- Handle_Transmission --
      -------------------------

      procedure Handle_Transmission is
      begin
         Transmit (Device.all, UInt8'Pos (Outgoing_Msg.buff (Next_Out)));
         Next_Out := Next_Out + 1;
         if Next_Out = Outgoing_Msg.size then
            Disable_Interrupts (Device.all, Source => Transmit_Data_Register_Empty);
            Set_True (Outgoing_Msg.Transmission_Complete);
         end if;
      end Handle_Transmission;

      ----------------------
      -- Handle_Reception --
      ----------------------

      procedure Handle_Reception is
         d8 : constant UInt8 := UInt8'Val (Current_Input (Device.all));

      begin
         Incoming_Msg.buff(Next_In):=d8;
         if(d8=0)then
            loop
               exit when not Status (Device.all, Read_Data_Register_Not_Empty);
            end loop;
            Incoming_Msg.isRecvDone:=True;
            Disable_Interrupts (Device.all, Source => Received_Data_Not_Empty);
         else
            Next_In := Next_In + 1;

         end if;

      end Handle_Reception;

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure IRQ_Handler is
      begin
         Detect_Errors;

         --  check for data arrival
         if Status (Device.all, Read_Data_Register_Not_Empty) and
           Interrupt_Enabled (Device.all, Received_Data_Not_Empty)
         then
            Handle_Reception;
            Clear_Status (Device.all, Read_Data_Register_Not_Empty);
         end if;

         --  check for transmission ready
         if Status (Device.all, Transmit_Data_Register_Empty) and
           Interrupt_Enabled (Device.all, Transmit_Data_Register_Empty)
         then
            Handle_Transmission;
            Clear_Status (Device.all, Transmit_Data_Register_Empty);
         end if;
      end IRQ_Handler;

      -------------------
      -- init --
      -------------------
      procedure Init(recvBuf : not null access HexData) is
      begin
         Incoming_Msg:=recvBuf;
         Reset_Receive;

         Enable_Interrupts (Device.all, Source => Parity_Error);
         Enable_Interrupts (Device.all, Source => Error);
         Enable_Interrupts (Device.all, Source => Received_Data_Not_Empty);
         Disable_Interrupts (Device.all, Source => Transmit_Data_Register_Empty);

      end;

      -------------------
      -- Start_Sending --
      -------------------

      procedure Start_Sending (This : not null access HexData;
                               buf: UInt8_Array) is

      begin

         Outgoing_Msg:=This;
         Next_Out := Outgoing_Msg.buff'First;

         Outgoing_Msg.size :=buf'Length;
         for i in 0..Outgoing_Msg.size-1 loop
            Outgoing_Msg.buff(i):= buf(i);
         end loop;

         Enable_Interrupts (Device.all, Source => Parity_Error);
         Enable_Interrupts (Device.all, Source => Error);
         Enable_Interrupts (Device.all, Source => Transmit_Data_Register_Empty);

      end Start_Sending;

      ---------------------
      -- Start_Receiving --
      ---------------------

      procedure Reset_Receive  is
      begin
         Next_In := Incoming_Msg.buff'First;
         Incoming_Msg.isRecvDone:=False;
         Enable_Interrupts (Device.all, Source => Received_Data_Not_Empty);
      end Reset_Receive;

      --
      function isRecvDone return Boolean is
      begin
         return Incoming_Msg.isRecvDone;
      end isRecvDone;


   end Controller;

end Serial_Hex;
