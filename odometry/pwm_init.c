/*
 * pwm_init.c
 *
 *  Created on: 05-Jul-2019
 *      Author: Mayuresh
 */
//-------This function initiates PWM generator 0, module 0&1----
//-------This function gives pwm of 0 duty cycle when this -----
//-------function is called on PB4,5,6,7------------------------
//-------include pwm_init.h while using this file---------------
#include<stdint.h>
#include<stdbool.h>
#include"driverlib/uart.h"
#include"inc/hw_memmap.h"
#include"inc/hw_types.h"
#include"inc/hw_sysctl.h"
#include "inc/hw_ints.h"
#include"inc/hw_gpio.h"
#include"driverlib/sysctl.h"
#include"driverlib/gpio.h"
#include"driverlib/pin_map.h"
#include "driverlib/pwm.h"
#include "driverlib/interrupt.h"

void pwm_init()
{

    SysCtlPeripheralEnable(SYSCTL_PERIPH_PWM0);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_PWM1);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
    SysCtlPWMClockSet(SYSCTL_PWMDIV_1);

    GPIOPinConfigure(GPIO_PB6_M0PWM0);
    GPIOPinConfigure(GPIO_PB7_M0PWM1);
    GPIOPinConfigure(GPIO_PB4_M0PWM2);
    GPIOPinConfigure(GPIO_PB5_M0PWM3);
    GPIOPinTypePWM(GPIO_PORTB_BASE,GPIO_PIN_6 |GPIO_PIN_7          |GPIO_PIN_4|GPIO_PIN_5);

    //PWMClockSet(PWM0_BASE, SYSCTL_PWMDIV_1);
       PWMGenDisable(PWM0_BASE,PWM_GEN_0);
    PWMGenDisable(PWM0_BASE,PWM_GEN_1);
    
    PWMGenConfigure(PWM0_BASE,PWM_GEN_0,PWM_GEN_MODE_DOWN | PWM_GEN_MODE_NO_SYNC);
    PWMGenConfigure(PWM0_BASE,PWM_GEN_1,PWM_GEN_MODE_DOWN | PWM_GEN_MODE_NO_SYNC);
    PWMGenPeriodSet(PWM0_BASE, PWM_GEN_0,320);
    PWMGenPeriodSet(PWM0_BASE, PWM_GEN_1,320);


   PWMPulseWidthSet(PWM0_BASE, PWM_OUT_2,1);
    PWMPulseWidthSet(PWM0_BASE, PWM_OUT_3,1);
    PWMPulseWidthSet(PWM0_BASE, PWM_OUT_0,1);
    PWMPulseWidthSet(PWM0_BASE, PWM_OUT_1,1);
   
    PWMGenEnable(PWM0_BASE, PWM_GEN_0);
    PWMGenEnable(PWM0_BASE, PWM_GEN_1);
    PWMOutputState(PWM0_BASE, PWM_OUT_0_BIT | PWM_OUT_1_BIT ,true);
    PWMOutputState(PWM0_BASE, PWM_OUT_2_BIT | PWM_OUT_3_BIT ,true);

}