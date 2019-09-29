/*
 * Trans_AT.c
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
#include "uart_init.h"
//#include "Trans_AT.h"
//------------this is function transfers AT command-----------
//------------It takes command & parameter to be send as input --------------------------------------------------------
//------------as TIVA & XBEE communicates via UART we need to include UART_init.h&Trans_AT.h while using this function ------------------------------------------------------
//

void Trans_AT(char *command,char *parameter)
{
    uart_init();
    unsigned int s=0,r=0;
    unsigned char dil=0x7E;
    unsigned int sum= 4 + strlen(parameter);
    int len1=(((sum%16))+((sum/16)%16)*16);
    int len2=((((sum/256)%16))+((sum/4096)%16)*16);
    unsigned char fr_id= 0x00;
    char api=*command;
    unsigned int datasum=0;
    unsigned int macsum =0;

    char frameA[8]= {0x7E, 0x00, 0x04, 0x09, 0x00, 0x57, 0x52, 0x4D};
    char frameB[8]= {0x7E, 0x00, 0x04, 0x09, 0x00, 0x41, 0x43, 0x72};




    for( s=0;s<2;s++)
    {
        datasum= datasum+ command[s];
    }

    for(s=0;parameter[s]!='\0';s++)
    {

        macsum= macsum+ parameter[s];
    }

    unsigned int sum1= api + fr_id + datasum + macsum ;
    int checksum1=255-(((sum1%16))+((sum1/16)%16)*16);
    unsigned char checksum=checksum1;

    char frame[200]={dil, len2, len1, api, fr_id};


    int j=5;
    for(r=0;r<2;r++)
    {
    frame[j]=command[r];
    j++;
    }
    for(s=0;parameter[s]!='\0';s++)
    {
    frame[j]=parameter[s];
    j++;
    }


    frame[j]=checksum;

   
    for (r=0;r<=j;r++)
    {
        UARTCharPut(UART5_BASE,frame[r]);
    }
    for (r=0;r<8;r++)
        {
            UARTCharPut(UART5_BASE,frameA[r]);
        }
    for (r=0;r<8;r++)
        {
            UARTCharPut(UART5_BASE,frameB[r]);
        }
}

