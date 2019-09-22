/*
 * timer_init.c
 *
 *  Created on: 11-Aug-2019
 *      Author: mayuresh
 */
//-------This function initiates both timer of timer 4&5----
//-------It gives interrupt on reaching particular value for 
---------both timer-----------------------------------------
//-------include this file wherever using function tim_isr &nav_isr -------------------------------------------
//-------include timer_init.h while using this file---------
#include "stdio.h"
#include "stdint.h"
#include "stdbool.h"
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
//#include "inc/tm4c123gh6pm.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_gpio.h"
#include "inc/hw_ints.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/timer.h"
#include "driverlib/interrupt.h"
#include "odom_init.h"
#include "timer_init.h"
#include "pose_update.h"
#include "navigation.h"


void Tim_ISR (void);
void NAV_ISR (void);
void Timer_init(void)
{
        SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER4);

        TimerDisable(TIMER4_BASE,TIMER_BOTH);
        TimerConfigure(TIMER4_BASE,TIMER_CFG_PERIODIC_UP);
        TimerLoadSet(TIMER4_BASE,TIMER_BOTH,8000000);
        IntEnable(INT_TIMER4A);
        TimerIntRegister(TIMER4_BASE,TIMER_BOTH,Tim_ISR);
        TimerIntEnable(TIMER4_BASE,TIMER_TIMA_TIMEOUT);
        IntMasterEnable();
        TimerEnable(TIMER4_BASE,TIMER_BOTH);


        SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER5);
        TimerDisable(TIMER5_BASE,TIMER_BOTH);
        TimerConfigure(TIMER5_BASE,TIMER_CFG_PERIODIC_UP);
        TimerLoadSet(TIMER5_BASE,TIMER_BOTH,1500000);
        IntEnable(INT_TIMER5A);
        TimerIntRegister(TIMER5_BASE,TIMER_BOTH,NAV_ISR);
        TimerIntEnable(TIMER5_BASE,TIMER_TIMA_TIMEOUT);
        IntMasterEnable();
        TimerEnable(TIMER5_BASE,TIMER_BOTH);
}




