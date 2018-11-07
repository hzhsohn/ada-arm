
with Ada.Interrupts;                use Ada.Interrupts;
with STM32.USARTs;                  use STM32.USARTs;
with Ada.Synchronous_Task_Control;  use Ada.Synchronous_Task_Control;

with HAL; use HAL;

package Serial_Hex is

   type HexData(Physical_Size : Positive) is
      record
         buff          : UInt8_Array(0..Physical_Size);
         size          : Natural := 0;
         isRecvDone    : Boolean:=False;            -- non-block recevice
         Transmission_Complete : Suspension_Object; -- block sending
      end record;

   procedure Set (This : in out HexData;  To :UInt8_Array)with
     Pre => To'Length <= This.Physical_Size;


   type Error_Conditions is new UInt8;

   No_Error_Detected      : constant Error_Conditions := 2#0000_0000#;
   Parity_Error_Detected  : constant Error_Conditions := 2#0000_0001#;
   Noise_Error_Detected   : constant Error_Conditions := 2#0000_0010#;
   Frame_Error_Detected   : constant Error_Conditions := 2#0000_0100#;
   Overrun_Error_Detected : constant Error_Conditions := 2#0000_1000#;
   DMA_Error_Detected     : constant Error_Conditions := 2#0001_0000#;


   protected type Controller (Device : access USART;  IRQ : Interrupt_ID) is

      pragma Interrupt_Priority;

      function Errors_Detected return Error_Conditions;

      procedure Start_Sending (Msg : not null access HexData);

      procedure Start_Receiving (Msg : not null access HexData);

   private

      procedure Handle_Transmission with Inline;

      procedure Handle_Reception with Inline;

      procedure Detect_Errors with Inline;

      Next_Out          : Integer;
      Outgoing_Msg      : access HexData;

      Next_In           : Integer;
      Incoming_Msg      : access HexData;

      Errors            : Error_Conditions := No_Error_Detected;

      procedure IRQ_Handler;
      pragma Attach_Handler (IRQ_Handler, IRQ);

   end Controller;

end Serial_Hex;
