

/**
 * main.c
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
#include "driverlib/uart.h"
#include "uart_init.h"
#include "string.h"
#include "Trans_AT.h"
#include "node_search.h"
#include "handshake.h"
#include "fr_api.h"
#include "navigation.h"

void main()
{
    int *quad;
    int idx,index,end,dir=2;
//get_grid();  //user will feed the array of points
//quad_asgn(); //quadrants will be assigned to 4 bots
quad=quad_asgn(&index,&end);
idx=index;
while(1)
{
next_x=quad[idx]*100;
next_y=quad[idx+1]*100;
go_to_goal();
idx+=dir;
if(end==idx)
{
  idx=index;
  dir=-2;
}
if(end==idx && dir==-2)
{
    go_in_direction('B');
}
}
}
