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

--  This file provides declarations for the user LEDs on the STM32F4 Discovery
--  board from ST Microelectronics.

with STM32F4;  use STM32F4;

package OutputA is
   pragma Elaborate_Body;

   type Pin is (A,B,C,D,E,F,G,H);
   for Pin use
     (A   => 16#01#,
      B   => 16#02#,
      C   => 16#04#,
      D   => 16#08#,
      E   => 16#10#,
      F   => 16#20#,
      G   => 16#40#,
      H   => 16#80#);
   for Pin'Size use Word'Size;

   --  we convert the LED values to Word values in order to write them to
   --  the register, so the size must be the same

   procedure On  (This : Pin) with Inline;
   procedure Off (This : Pin) with Inline;
   procedure All_Off with Inline;
   procedure All_On  with Inline;

end OutputA;
