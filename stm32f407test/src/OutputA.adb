------------------------------------------------------------------------------
--                                                                          --
--                             GNAT EXAMPLE                                 --
--                                                                          --
--             Copyright (C) 2014, Free Software Foundation, Inc.           --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;

with OutputA;     use OutputA;
with Registers;     use Registers;
with STM32F4.GPIO;  use STM32F4.GPIO;

package body OutputA is
   --
   RCC_AHB1ENR_GPIOA : constant Word := 16#01#;
   --
   function As_Word is new Ada.Unchecked_Conversion
     (Source => Pin, Target => Word);

   --set pin on
   procedure On (This : Pin) is
   begin
      GPIOA.BSRR := As_Word (This);
   end On;

   --set pin off
   procedure Off (This : Pin) is
   begin
      GPIOA.BSRR := Shift_Left (As_Word (This), 16);
   end Off;

   procedure All_Off is
   begin
      GPIOA.ODR := 16#0000#;
   end All_Off;

   procedure All_On is
   begin
      GPIOA.ODR := 16#FFFF#;
   end All_On;


begin
   --  Enable clock for GPIO-A
   RCC.AHB1ENR := RCC.AHB1ENR or RCC_AHB1ENR_GPIOA;

   --  Configure PA
   GPIOA.MODER   (0 .. 11) := (others => Mode_OUT);
   GPIOA.OTYPER  (12 .. 15) := (others => Type_PP);
   GPIOA.OSPEEDR (12 .. 15) := (others => Speed_50MHz);
   GPIOA.PUPDR   (12 .. 15) := (others => No_Pull);
end OutputA;
