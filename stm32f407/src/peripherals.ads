with STM32.Device;         use STM32.Device;
with STM32.GPIO;           use STM32.GPIO;
with STM32.USARTs;         use STM32.USARTs;
with Ada.Interrupts;       use Ada.Interrupts;
with Ada.Interrupts.Names; use Ada.Interrupts.Names;
with Serial_Hex;           use Serial_Hex;
with HAL; use HAL;

package Peripherals is

   ---------------------------------------------------------------
   -- terminator uart initizal config
   tuart1 : USART renames USART_1;
   tuart1_Interrupt_Id : constant Interrupt_ID := USART1_Interrupt;
   tuart1_AF : constant STM32.GPIO_Alternate_Function := GPIO_AF_USART1_7;
   tuart1_TX_Pin : constant GPIO_Point := PB7;
   tuart1_RX_Pin : constant GPIO_Point := PB6;
   COM1 : Serial_Hex.Controller (tuart1'Access, tuart1_Interrupt_Id);

   -- hex data uart initizal config
   tuart2 : USART renames USART_2;
   tuart2_Interrupt_Id : constant Interrupt_ID := USART2_Interrupt;
   tuart2_AF : constant STM32.GPIO_Alternate_Function := GPIO_AF_USART2_7;
   tuart2_TX_Pin : constant GPIO_Point := PA2;
   tuart2_RX_Pin : constant GPIO_Point := PA3;
   COM2 : Serial_Hex.Controller (tuart2'Access, tuart2_Interrupt_Id);

   ---------------------------------------------------------------
   -- pwm config

   ---------------------------------------------------------------
   -- adc config
   function readVRef return UInt32;


   ------------------------------
   -- header function define
   procedure Initialize_COM1(recvBuf : not null access HexData);
   procedure Initialize_COM2(recvBuf : not null access HexData);
   procedure Initialize_ADC_VRef;


end Peripherals;
