
package body UART_Peripherals is

   -------------------------------------
   -- uart1 base setting
   procedure Initialize_COM1(recvBuf : not null access HexData) is
   begin
      Enable_Clock (tuart1);
      Enable_Clock (tuart1_RX_Pin & tuart1_TX_Pin);

      Configure_IO
        (tuart1_RX_Pin & tuart1_TX_Pin,
         (Mode           => Mode_AF,
          AF             => tuart1_AF,
          Resistors      => Pull_Up,
          AF_Output_Type => Push_Pull,
          AF_Speed       => Speed_50MHz));

      Disable (tuart1);
      Set_Baud_Rate    (tuart1, 115_200);
      Set_Mode         (tuart1, Tx_Rx_Mode);
      Set_Stop_Bits    (tuart1, Stopbits_1);
      Set_Word_Length  (tuart1, Word_Length_8);
      Set_Parity       (tuart1, No_Parity);
      Set_Flow_Control (tuart1, No_Flow_Control);

      Enable (tuart1);

      ---------------------
      COM1.Init(recvBuf);
   end;

   -------------------------------------
   -- uart2 base setting
   procedure Initialize_COM2(recvBuf : not null access HexData) is
   begin

      Enable_Clock (tuart2);
      Enable_Clock (tuart2_RX_Pin & tuart2_TX_Pin);

      Configure_IO
        (tuart2_RX_Pin & tuart2_TX_Pin,
         (Mode           => Mode_AF,
          AF             => tuart2_AF,
          Resistors      => Pull_Up,
          AF_Output_Type => Push_Pull,
          AF_Speed       => Speed_50MHz));

      Disable (tuart2);
      Set_Baud_Rate    (tuart2, 115_200);
      Set_Mode         (tuart2, Tx_Rx_Mode);
      Set_Stop_Bits    (tuart2, Stopbits_1);
      Set_Word_Length  (tuart2, Word_Length_8);
      Set_Parity       (tuart2, No_Parity);
      Set_Flow_Control (tuart2, No_Flow_Control);

      Enable (tuart2);

      --------------------
      COM2.Init(recvBuf);
   end;


end UART_Peripherals;
