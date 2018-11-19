--with Ada.Synchronous_Task_Control;  use Ada.Synchronous_Task_Control;


package Period_Peripherals is
   
   procedure Init_Period_Dev;
   procedure Loop_Refresh_Period;
   function Get_VRef_Value return Float;
   function Get_VBat_Value return Float;
   function Get_Board_NTC_Value return Float;

end Period_Peripherals;
