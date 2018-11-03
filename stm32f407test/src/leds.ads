
with STM32F4;  use STM32F4;

package LEDs is
   pragma Elaborate_Body;

   type User_LED is (Green, Orange, Red, Blue);

   for User_LED use
     (Green  => 16#1000#,
      Orange => 16#2000#,
      Red    => 16#4000#,
      Blue   => 16#8000#);

   --  As a result of the representation clause, avoid iterating directly over
   --  the type since that will require an implicit lookup in the generated
   --  code of the loop.  Such usage seems unlikely so this direct
   --  representation is reasonable, and efficient.

   for User_LED'Size use Word'Size;
   --  we convert the LED values to Word values in order to write them to
   --  the register, so the size must be the same

   LED3 : User_LED renames Orange;
   LED4 : User_LED renames Green;
   LED5 : User_LED renames Red;
   LED6 : User_LED renames Blue;

   procedure On  (This : User_LED) with Inline;
   procedure Off (This : User_LED) with Inline;

   procedure All_Off with Inline;
   procedure All_On  with Inline;

end LEDs;
