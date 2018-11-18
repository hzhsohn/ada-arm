with Ada.Interrupts;                use Ada.Interrupts;
with STM32.ADC;                  use STM32.ADC;
with STM32.Device;                  use STM32.Device;
with Ada.Synchronous_Task_Control;  use Ada.Synchronous_Task_Control;
with Period_ADC; use Period_ADC;

package Sensor_Peripherals is
   
   adc1 : ADC_Point renames ADC_1;
   adc1_Interrupt_Id : constant Interrupt_ID := ADC_Interrupt;
   
   ---------------------
   -- sensor list
   pressure1: Period_ADC.Period_Device(adc1'Access,adc1_Interrupt_Id);
   
      
   ----------------------
   -- initizal function
   procedure Init_Pressure(adct:not null access ADCTarget);


end Sensor_Peripherals;
