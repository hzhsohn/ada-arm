package body Peripherals is

   -----------------------------
   -- Initialize_STMicro_UART --
   -----------------------------

   procedure Initialize_STMicro_UART is
   begin
      Enable_Clock (Transceiver);
      Enable_Clock (RX_Pin & TX_Pin);

      Configure_IO
        (RX_Pin & TX_Pin,
         (Mode           => Mode_AF,
          AF             => Transceiver_AF,
          Resistors      => Pull_Up,
          AF_Output_Type => Push_Pull,
          AF_Speed       => Speed_50MHz));

      -------------------------------------
      -- uart base setting
      Disable (Transceiver);
      Set_Baud_Rate    (Transceiver, 115_200);
      Set_Mode         (Transceiver, Tx_Rx_Mode);
      Set_Stop_Bits    (Transceiver, Stopbits_1);
      Set_Word_Length  (Transceiver, Word_Length_8);
      Set_Parity       (Transceiver, No_Parity);
      Set_Flow_Control (Transceiver, No_Flow_Control);

      Enable (Transceiver);
   end Initialize_STMicro_UART;

end Peripherals;
