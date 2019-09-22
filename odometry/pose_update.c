/*
 * pose_update.c
 *
 *  Created on: 11-Aug-2019
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
#include "timer_init.h"
#include "pose_update.h"
#include "pose_comm.h"


#define WIDTH 12.00                //distance between the two wheels
#define CIRCUM 8.00                //circumference of wheel
#define PPR 400.00                 //pulses per revoluton
#define L(x) ((x*CIRCUM)/PPR)     //expression for distance covered by wheel

extern float x_realtime,y_realtime,theta;
float lL=0,lR=0,dtheta=0,theta=0,disp=0,x_real_time=9,y_real_time;


void Tim_ISR(){


    lL = L(QEIPositionGet(QEI0_BASE));
    lR = L(QEIPositionGet(QEI1_BASE));

    QEIPositionSet(QEI1_BASE,0);
    QEIPositionSet(QEI0_BASE,0);

    dtheta = (lL-lR)/(2*WIDTH);
    theta = theta + dtheta;
    disp=(lL+lR)/2 ;
    x_real_time=x_real_time+(disp*sin(theta));
    y_real_time=y_real_time+(disp*cos(theta));

}
//function to get coordinate of bot[i]
void pose_update (pose bot)
{
    char str[11]='coordinate';
    fr_api( str,  0x10, bot.mac_id);
}
