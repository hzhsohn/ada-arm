
with System;
with STM32F4;                     use STM32F4;
with STM32F4.GPIO;                use STM32F4.GPIO;
with STM32F4.Reset_Clock_Control; use STM32F4.Reset_Clock_Control;
with STM32F4.SYSCONFIG_Control;   use STM32F4.SYSCONFIG_Control;

package Registers is

   pragma Warnings (Off, "*may call Last_Chance_Handler");
   pragma Warnings (Off, "*may be incompatible with alignment of object");

   RCC : RCC_Register with
     Volatile,
     Address => System'To_Address (RCC_Base);

   GPIOA : GPIO_Register with
     Volatile,
     Address => System'To_Address (GPIOA_Base);
   pragma Import (Ada, GPIOA);

   GPIOD : GPIO_Register with
     Volatile,
     Address => System'To_Address (GPIOD_Base);
   pragma Import (Ada, GPIOD);

   EXTI : EXTI_Register with
     Volatile,
     Address => System'To_Address (EXTI_Base);
   pragma Import (Ada, EXTI);

   SYSCFG : SYSCFG_Register with
     Volatile,
     Address => System'To_Address (SYSCFG_Base);
   pragma Import (Ada, SYSCFG);

   pragma Warnings (On, "*may call Last_Chance_Handler");
   pragma Warnings (On, "*may be incompatible with alignment of object");

end Registers;
