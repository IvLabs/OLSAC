/*
 * get_grid.c
 *
 *  Created on: 14-Aug-2019
 *      Author: harshad
 */

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
#include "driverlib/uart.h"
#include "driverlib/pin_map.h"
#include "driverlib/interrupt.h"
#include "get_grid.h"


 int grid[1000];
//
// taking painting,etc. as a input in the form of grid 
// input via UART5
//
int *get_grid()
{
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE,GPIO_PIN_3);
    GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_3,0xFF);

    char p;
    int i=0,t=0;

    while(0)
    {
        p=UARTCharGetNonBlocking(UART5_BASE);
        i++;
        if(i==15)
        {
            for(i=0;i<200;i++)
            {
                if(UARTCharGetNonBlocking(UART5_BASE)=='~')
                {
                    p=UARTCharGetNonBlocking(UART5_BASE);
                    p=UARTCharGetNonBlocking(UART5_BASE);
                    GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_3,0x00);
                    return grid;
                }
                grid[t]=((UARTCharGetNonBlocking(UART5_BASE))-30);
                t++;
            }
            p=UARTCharGetNonBlocking(UART5_BASE);
            i=0;
        }
    }

}



