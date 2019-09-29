/*
 * go_to_goal.c
 *
 *  Created on: 16-Aug-2019
 *      Author: harshad
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
#include "quad_asgn.h"
#include "pose_update.h"
#include "navigation.h"
#include "timer_init.h"


int next_theta,current_x,current_y,current_theta;

//
// go to required next x and y coordinate with respect to itself
//

int go_to_goal(int next_x,int next_y)
{
    next_x=next_x*100;
    next_y=next_y*100;
    next_theta=(atan(next_y/next_x))*100;
    current_x=pose_update('x')*100;
    current_y=pose_update('y')*100;
    current_theta=pose_update('t')*100;
    if(next_theta-current_theta<=3.14)
    {
        while(next_theta!=current_theta)
    {
        go_in_direction('L');
        current_theta=pose_update('t')*100;
    }
    }
    else{
        while(next_theta!=current_theta)
            {
                go_in_direction('R');
                current_theta=pose_update('t')*100;
            }
    }

    while((next_x!=current_x) || (next_y!=current_y))
    {
        go_in_direction('W');
        current_theta=pose_update('t')*100;
        current_x=pose_update('x')*100;
        current_y=pose_update('y')*100;
    }
return 0;
}





