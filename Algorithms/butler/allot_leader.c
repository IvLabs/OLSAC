/*
 * allot_leader.c
 *
 *  Created on: 16-Aug-2019
 *      Author: mayuresh
 */
#include "stdio.h"
#include "stdint.h"
#include "stdbool.h"
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "math.h"
//#include "inc/tm4c123gh6pm.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_gpio.h"
#include "inc/hw_ints.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/timer.h"
#include "driverlib/interrupt.h"
#include "allot_leader.h"


/*
 * periodically locate the leader and maintain the distance with it.
 */
void follow_ISR(){
    float temp_x = (get_current_pose_of_bot(&lead.macid[0], 'x'))-lead.x;
    float temp_y = (get_current_pose_of_bot(&lead.macid[0], 'y'))-lead.y;

    go_to_goal(temp_x,temp_y);
}

/*
 * timer for follow ISR
 */
void Timer_init(void)
{
        SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER4);

        TimerDisable(TIMER4_BASE,TIMER_BOTH);
        TimerConfigure(TIMER4_BASE,TIMER_CFG_PERIODIC_UP);
        TimerLoadSet(TIMER4_BASE,TIMER_BOTH,8000000);

        IntEnable(INT_TIMER4A);
        TimerIntRegister(TIMER4_BASE,TIMER_BOTH,follow_ISR());
        TimerIntEnable(TIMER4_BASE,TIMER_TIMA_TIMEOUT);
        IntMasterEnable();


}
/*
 * to allot leader to follow maintaining some distance
 * input:
 * 1. mac_id of leader
 * 2. distance to be maintained in terms of x&y coordinates
 */
void allot_leader(char* mac,float x, float y){

            lead.x = x;
            lead.y = y;
            int i=0;
            for(i=0;i<8;i++)
                lead.macid[i] = *(mac+i);
            TimerEnable(TIMER4_BASE, TIMER_BOTH);

}

