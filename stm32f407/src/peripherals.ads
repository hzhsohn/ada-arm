------------------------------------------------------------------------------
--                                                                          --
--                 Copyright (C) 2015-2016, AdaCore                         --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with Serial_Terminator;
with Serial_Hex;
with STM32.Device;         use STM32.Device;
with STM32.GPIO;           use STM32.GPIO;
with STM32.USARTs;         use STM32.USARTs;
with Ada.Interrupts;       use Ada.Interrupts;
with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package Peripherals is

   ---------------------------------------------------------------
   -- terminator uart initizal config
   tuart1 : USART renames USART_1;
   tuart1_Interrupt_Id : constant Interrupt_ID := USART1_Interrupt;
   tuart1_AF : constant STM32.GPIO_Alternate_Function := GPIO_AF_USART1_7;
   tuart1_TX_Pin : constant GPIO_Point := PB7;
   tuart1_RX_Pin : constant GPIO_Point := PB6;
   COM : Serial_Terminator.Controller (tuart1'Access, tuart1_Interrupt_Id);

   -- hex data uart initizal config
   tuart2 : USART renames USART_2;
   tuart2_Interrupt_Id : constant Interrupt_ID := USART2_Interrupt;
   tuart2_AF : constant STM32.GPIO_Alternate_Function := GPIO_AF_USART1_7;
   tuart2_TX_Pin : constant GPIO_Point := PA9;
   tuart2_RX_Pin : constant GPIO_Point := PA10;
   COM2 : Serial_Hex.Controller (tuart2'Access, tuart2_Interrupt_Id);

   ---------------------------------------------------------------
   -- pwm config


   ------------------------------
   -- header function define
   procedure Initialize_STMicro_UART;


end Peripherals;
