/*
 * node_search.c
 *
 *  Created on: 11-Aug-2019
 *      Author: Mayuresh
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

/*
* calculates the checksum for the frame
*/
void checksum(char *frame)
{
    int sum=0,i,checksum1;
    for(i=3;i<18;i++)
    {
        sum=sum+frame[i];
    }
    checksum1=255-(((sum%16))+((sum/16)%16)*16);
    unsigned char checksum=checksum1;
    frame[18]=checksum;

}


/*
* connect with all the surrounding robots with common PAN ID
*/

void node_search(int no_of_bots)
{

 uart_init();
char p;
int h=0;
char frame1[8]={0x7E, 0x00, 0x04, 0x08, 0x36, 0x4E, 0x54, 0x1F};
char frame2[8]={0x7E, 0x00, 0x04, 0x08, 0x0D, 0x4E, 0x44, 0x58};
char frame[10];

int l=0,u=0;
for(l=0;l<8;l++)
{
    UARTCharPut(UART5_BASE,frame1[l]);
}
for(l=0;l<11;l++)
{
    p=UARTCharGetNonBlocking(UART5_BASE);
}
for(l=0;l<8;l++)
{
    UARTCharPut(UART5_BASE,frame2[l]);
}

while(h<=no_of_bots)
{
    h++;
for(l=0;l<29;l++)
{
   if(l>9 && l<18 )
    {
        frame[u]=UARTCharGetNonBlocking(UART5_BASE);
        u++;
    }
    else
    {
        p=UARTCharGetNonBlocking(UART5_BASE);
    }
}
char frame3[19]={0x7E, 0x00, 0x0F, 0x17, 0x00, frame[0], frame[1],frame[2], frame[3], frame[4], frame[5], frame[6], frame[7], 0xFF, 0xFE, 0x02, 0x52, 0x3F, 0x52};
checksum(frame3);
char frame4[19]={0x7E, 0x00, 0x0F, 0x17, 0x00, frame[0], frame[1],frame[2], frame[3], frame[4], frame[5], frame[6], frame[7], 0xFF, 0xFE, 0x02, 0x25, 0x43, 0x7A};
checksum(frame4);
char frame5[8]={0x7E, 0x00, 0x04, 0x08, 0x00, 0x4B, 0x5A, 0x52};

char frame6[19]={0x7E, 0x00, 0x0F, 0x17, 0x00, frame[0], frame[1],frame[2], frame[3], frame[4], frame[5], frame[6], frame[7], 0x6C, 0xE9, 0x00, 0x56, 0x48, 0xEC};
checksum(frame6);
char frame7[19]={0x7E, 0x00, 0x0F, 0x17, 0x00, frame[0], frame[1],frame[2], frame[3], frame[4], frame[5], frame[6], frame[7], 0xFF, 0xFE, 0x02, 0x41, 0x50, 0x4E};
checksum(frame7);
char frame8[19]={0x7E, 0x00, 0x0F, 0x17, 0x00, frame[0], frame[1],frame[2], frame[3], frame[4], frame[5], frame[6], frame[7], 0xFF, 0xFE, 0x02, 0x4D, 0x50, 0x41};
checksum(frame8);
char frame9[19]={0x7E, 0x00, 0x0F, 0x17, 0x00, frame[0], frame[1],frame[2], frame[3], frame[4], frame[5], frame[6], frame[7], 0xFF, 0xFE, 0x02, 0x48, 0x56, 0x3F};
checksum(frame9);
char frame10[19]={0x7E, 0x00, 0x0F, 0x17, 0x00, frame[0], frame[1],frame[2], frame[3], frame[4], frame[5], frame[6], frame[7], 0xFF, 0xFE, 0x02, 0x56, 0x52, 0x34};
checksum(frame10);

for(l=0;l<19;l++)
{
    UARTCharPut(UART5_BASE,frame3[l]);
}
for(l=0;l<19;l++)
{
    UARTCharPut(UART5_BASE,frame4[l]);
}
for(l=0;l<8;l++)
{
    UARTCharPut(UART5_BASE,frame5[l]);
}
for(l=0;l<19;l++)
{
    UARTCharPut(UART5_BASE,frame6[l]);
}
for(l=0;l<19;l++)
{
    UARTCharPut(UART5_BASE,frame7[l]);
}
for(l=0;l<19;l++)
{
    UARTCharPut(UART5_BASE,frame8[l]);
}
for(l=0;l<19;l++)
{
    UARTCharPut(UART5_BASE,frame9[l]);
}
for(l=0;l<19;l++)
{
    UARTCharPut(UART5_BASE,frame10[l]);
}
}

}
