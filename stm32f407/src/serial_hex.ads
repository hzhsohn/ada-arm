
with Ada.Interrupts;                use Ada.Interrupts;
with STM32.USARTs;                  use STM32.USARTs;
with Ada.Synchronous_Task_Control;  use Ada.Synchronous_Task_Control;
with HAL;                           use HAL;


package Serial_Hex is

   type Error_Conditions is new UInt8;

   No_Error_Detected      : constant Error_Conditions := 2#0000_0000#;
   Parity_Error_Detected  : constant Error_Conditions := 2#0000_0001#;
   Noise_Error_Detected   : constant Error_Conditions := 2#0000_0010#;
   Frame_Error_Detected   : constant Error_Conditions := 2#0000_0100#;
   Overrun_Error_Detected : constant Error_Conditions := 2#0000_1000#;
   DMA_Error_Detected     : constant Error_Conditions := 2#0001_0000#;


   -----------------------
   type HexData(Physical_Size : Positive) is
      record
         buff          : UInt8_Array(0..Physical_Size);
         size          : Natural := 0;
         isRecvDone    : Boolean:=False;            -- non-block recevice
         Transmission_Complete : Suspension_Object;--send blocking
      end record;


   ------------------------
   procedure trStringToUint8Array(sendbuf:access HexData;
                                 str:String);

   ------------------------
   protected type Controller (Device : access USART;
                              IRQ : Interrupt_ID) is

      procedure Init(recvBuf : not null access HexData);
      procedure Start_Sending (This : not null access HexData;
                              str: String);
      procedure Start_Sending (This : not null access HexData;
                               buf: UInt8_Array);
      procedure Reset_Receive ;
      function isRecvDone return Boolean;


   private

      pragma Interrupt_Priority;
      function Errors_Detected return Error_Conditions;
      procedure Handle_Transmission with Inline;
      procedure Handle_Reception with Inline;
      procedure Detect_Errors with Inline;
      Errors : Error_Conditions := No_Error_Detected;
      procedure IRQ_Handler;
      pragma Attach_Handler (IRQ_Handler, IRQ);

      --------------------
      Next_Out          : Natural;
      Outgoing_Msg      : access HexData;

      Next_In           : Natural;
      Incoming_Msg      : access HexData;


   end Controller;

end Serial_Hex;
