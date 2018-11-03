
with Ada.Unchecked_Conversion;

with Registers;     use Registers;
with STM32F4.GPIO;  use STM32F4.GPIO;

package body LEDs is

   function As_Word is new Ada.Unchecked_Conversion
     (Source => User_LED, Target => Word);

   procedure On (This : User_LED) is
   begin
      GPIOD.BSRR := As_Word (This);
   end On;

   procedure Off (This : User_LED) is
   begin
      GPIOD.BSRR := Shift_Left (As_Word (This), 16);
   end Off;

   All_LEDs_On  : constant Word := Green'Enum_Rep or Red'Enum_Rep or
                                   Blue'Enum_Rep  or Orange'Enum_Rep;

   pragma Compile_Time_Error
     (All_LEDs_On /= 16#F000#,
      "Invalid representation for All_LEDs_On");

   All_LEDs_Off : constant Word := Shift_Left (All_LEDs_On, 16);

   procedure All_Off is
   begin
      GPIOD.BSRR := All_LEDs_Off;
   end All_Off;

   procedure All_On is
   begin
      GPIOD.BSRR := All_LEDs_On;
   end All_On;

   procedure Initialize is
      RCC_AHB1ENR_GPIOD : constant Word := 16#08#;
   begin
      --  Enable clock for GPIO-D
      RCC.AHB1ENR := RCC.AHB1ENR or RCC_AHB1ENR_GPIOD;

      --  Configure PD12-15
      GPIOD.MODER   (12 .. 15) := (others => Mode_OUT);
      GPIOD.OTYPER  (12 .. 15) := (others => Type_PP);
      GPIOD.OSPEEDR (12 .. 15) := (others => Speed_100MHz);
      GPIOD.PUPDR   (12 .. 15) := (others => No_Pull);
   end Initialize;

begin
   Initialize;
end LEDs;
