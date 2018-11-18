with Ada.Interrupts;                use Ada.Interrupts;
with STM32.ADC;                  use STM32.ADC;
with Ada.Synchronous_Task_Control;  use Ada.Synchronous_Task_Control;


package Period_ADC is
   
   type ADCTarget  is
      record
         target:access ADC_Point;
         channel: Analog_Input_Channel;
         get_value_complete : Suspension_Object;
      end record;

   protected type Period_Device(adcpin:not null access ADC_Point;
                                IRQ: Interrupt_ID) is
   
      procedure Init_Period_Dev;
      function Read_Value return Natural;
      
   private
      
      -- return value was more than 0
      adc_value:Natural:=0;
      
   end Period_Device;
      

end Period_ADC;
