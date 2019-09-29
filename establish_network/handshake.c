/*
 * handshake.c
 *
 *  Created on: 11-Aug-2019
 *      Author: Mayuresh
 */

#include "stdio.h"
#include "string.h"
# include "stdlib.h"
#include "stdint.h"
#include "stdbool.h"
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_gpio.h"
#include "driverlib/uart.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "uart_init.h"

struct mac_id{
        char macid[100];
        int count;
}bot[100];


/*
* to verify the connection established 
* PF3 will be high if connection is proper
*/

extern struct mac_id bot[100];
void handshake()
{
SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);

GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE,GPIO_PIN_3);


    uart_init();

    int y=0,count=0,k=0;
    char p;
   char frame20[27]={0x7E, 0x00, 0x17, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFE, 0xE8, 0xE8, 0x00, 0x11, 0xC1, 0x05, 0x00, 0x00, 0x61, 0x62, 0x63, 0x26};

    for(y=0;y<27;y++)
    {
        UARTCharPut(UART5_BASE,frame20[y]);
    }
    SysCtlDelay(5333333);
while(UARTCharsAvail(UART5_BASE))
{

    if((UARTCharGetNonBlocking(UART5_BASE))==0x7E)
    {
        count++;
        GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_3,0xFF);
        for(y=0;y<3;y++)
            p=UARTCharGetNonBlocking(UART5_BASE);
        for(y=0;y<8;y++)
        {
            bot[k].macid[y]=UARTCharGetNonBlocking(UART5_BASE);
        }
        k++;
    }
    p=UARTCharGetNonBlocking(UART5_BASE);
}
GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_3,0x00);
}
