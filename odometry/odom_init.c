/*
 * odom_init.c
 *
 *  Created on: 11-Aug-2019
 *      Author: mayuresh
 */
#include <pose_update.h>
#include "stdio.h"
#include "math.h"
# include "stdlib.h"
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
#include "timer_init.h"
#include "encoder_init.h"
#include "odom_init.h"
#include  "string.h"
#include "pose_update.h"
//-----------this function calls for encoder_init & Timer_init --
//-----------it sets up initial coordinates of bot---------------

void odom_init()
{
    
    start_pose.x = get_cord(x_raw);
    start_pose.y = get_cord(y_raw);
    start_pose.phi = get_cord(phi_raw);

    x_real_time = start_pose.x;
    y_real_time=start_pose.y;
    theta=start_pose.phi;

    encoder_init();
    Timer_init();
}
