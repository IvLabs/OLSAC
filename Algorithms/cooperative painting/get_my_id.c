/*
 * get_my_id.c
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
 // #include "inc/tm4c123gh6pm.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_gpio.h"
#include "inc/hw_ints.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/uart.h"
#include "driverlib/pin_map.h"
#include "driverlib/interrupt.h"
#include "get_my_id.h"
#include "uart_init.h"


//
//it returns it's own MAC_ID
//
char get_my_id()
{
SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE,GPIO_PIN_2);
GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_2,0xFF);
    char id;
    char k2,k1;
    while(1)
    {
       k1=UARTCharGetNonBlocking(UART5_BASE);
       k2=UARTCharGetNonBlocking(UART5_BASE);
       if(k1=='I' && k2=='D')
       {
           id=UARTCharGetNonBlocking(UART5_BASE);
           GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_2,0x00);
           return id;
       }
    }
}


//
// returns the resolution of grid 
//
char get_res()
{
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE,GPIO_PIN_1);
    GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_1,0xFF);
    char res;
    char k2,k1,k3;
    while(1)
    {
       k1=UARTCharGetNonBlocking(UART5_BASE);
       k2=UARTCharGetNonBlocking(UART5_BASE);
       k3=UARTCharGetNonBlocking(UART5_BASE);
       if(k1=='R' && k2=='E'&& k3=='S')
       {
           res=UARTCharGetNonBlocking(UART5_BASE);
           GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_1,0x00);
           return res;
       }
    }
}
