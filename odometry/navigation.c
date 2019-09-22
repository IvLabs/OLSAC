/*
 *  navigation.c
 *
 *  Created on: 12-Aug-2019
 *      Author: mayuresh
 */




#include "stdio.h"
#include "math.h"
# include "stdlib.h"
#include "stdint.h"
#include "stdbool.h"
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
 // #include "inc/tm4c123gh6pm.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_gpio.h"
#include "inc/hw_ints.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/timer.h"
#include "driverlib/qei.h"
#include "driverlib/uart.h"
#include "driverlib/interrupt.h"
#include "driverlib/pin_map.h"
#include "driverlib/pwm.h"

#include "timer_init.h"
#include "navigation.h"

float v1,v2,m1=20000,m2=0,e1,e2, r1=30,r2=40,sum5,sum2,t1=0,t2=0,kp1=0.3,ki1=0,kp2=0.3,ki2=0,d1,d2,dc1,dc2;
char a;
int mul1=0,mul2=0,mul3=0,mul4=0;
//-----------This function gets called after particular timer interrupt-----------------------------
//---------------------this function is basically PID in order to reach particular velocity--------------

void NAV_ISR(){
    v1=QEIVelocityGet(QEI0_BASE);
    v2=QEIVelocityGet(QEI1_BASE);

    e1=r1-v1;
    sum5 =sum5+e1;
    d1=(kp1*e1);//+(t*ki1*sum5);
    dc1 = (dc1 + d1);
    t1=(dc1/m1)+1;

    e2=r2-v2;
    sum2 =sum2+e2;
    d2=(kp2*e2);//+(t*ki2*sum2);
    dc2 = dc2 + d2;
     t2=(dc2/m1)+1;

            PWMPulseWidthSet(PWM0_BASE, PWM_OUT_0,t1*mul1);
            PWMPulseWidthSet(PWM0_BASE, PWM_OUT_1,t1*mul2);
            PWMPulseWidthSet(PWM0_BASE, PWM_OUT_2,t2*mul3);
            PWMPulseWidthSet(PWM0_BASE, PWM_OUT_3,t2*mul4);

		 TimerIntClear(TIMER5_BASE,TIMER_TIMA_TIMEOUT);
}
//--------- This function gets called after particular timer interrupt--------------------------
//------------------this function is basically PID in order to reach particular velocity----------------

void go_in_direction(char p){

    switch(p)
          {
          case'W':
          {
              r1=40;
              r2=40;
              mul1=1;
              mul3=1;
              mul2=0;
              mul4=0;
              break;
          }
          case'A':
          {
              r1=10;
              r2=30;
              mul1=1;
              mul3=1;
              mul2=0;
              mul4=0;
              break;
          }
          case'D':
          {
              r1=30;
              r2=10;
              mul1=1;
              mul3=1;
              mul2=0;
              mul4=0;
              break;
          }
          case'S':
          {
              r1=40;
              r2=40;
              mul1=0;
              mul3=0;
              mul2=1;
              mul4=1;
              break;
          }
          case'R':
          {
              r1=40;
              r2=40;
              mul1=1;
              mul2=0;
              mul3=0;
              mul4=1;
              break;
          }
          case 'L':
          {
              r1=40;
              r2=40;
              mul1=0;
              mul2=1;
              mul3=1;
              mul4=0;
          }
          }

}