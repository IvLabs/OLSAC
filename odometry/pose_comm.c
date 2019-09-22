/*
 * pose_comm.c
 *
 *  Created on: 12-Aug-2019
 *      Author: mayuresh
 */

#include "stdio.h"
#include "math.h"
# include "stdlib.h"
#include "stdint.h"
#include "stdbool.h"
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "inc/tm4c123gh6pm.h"
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
#include "driverlib/pwm.h"

#include "pose_comm.h"
#include "odom_init.h"
#include "pose_update.h"
extern income store_pose;
income store_pose;
float num,y;
char* k;
int i;
char temp[5]={'\0','\0','\0','\0','\0','\0'};
void req_ISR();
extern int maa;
//------------ This function initialises UART &UART interrupt on //------------ pin PE4 (RX)& PE5(TX) ---------------------------
//------------ include uart_init.h while using this file--------
void uart_init(void)
{
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART5);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);
    GPIOPinConfigure(GPIO_PE4_U5RX);
    GPIOPinConfigure(GPIO_PE5_U5TX);
    GPIOPinTypeUART(GPIO_PORTE_BASE,GPIO_PIN_4 | GPIO_PIN_5);
    UARTConfigSetExpClk(UART5_BASE,SysCtlClockGet(),9600,(UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE));
    IntMasterEnable();
    UARTIntEnable(UART5_BASE, UART_INT_RX);
   IntRegister(INT_UART5,req_ISR);                             //ISR is a name of function used as interrupt handler
   UARTIntRegister(UART5_BASE, req_ISR);


   SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
   SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
   GPIOPinConfigure(GPIO_PA0_U0RX);
   GPIOPinConfigure(GPIO_PA1_U0TX);
   GPIOPinTypeUART(GPIO_PORTA_BASE,GPIO_PIN_0 | GPIO_PIN_1);
   UARTConfigSetExpClk(UART0_BASE,SysCtlClockGet(),9600,(UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE));

}

//------------this function gets called when there is recieve //------------interrupt on UART---------------------------------
//------------it also stores all coordinates in corresponding bot
//------------other data is stored in recive_data string---------

void req_ISR()
{
   int i,j=0;
   char a,p;
   char mac_id_req[8];
   int data_length=0;
   char recieve_data[100];
   for(i=0;i<9;i++)
   {
     switch(i)
     {
     case 2:

         data_length=UARTCharGet(UART5_BASE);
         data_length=data_length-12;
         break;

     case 4:
         for(j=0;j<8;j++)
                      mac_id_req[j] = UARTCharGet(UART5_BASE);
         break;

     case 8:

         for(j=0;j<data_length;j++)
         {
             recieve_data[j]=UARTCharGet(UART5_BASE);
         }
         break;

     default:
             a=UARTCharGet(UART5_BASE);
     }
   }
     if(recieve_data-"coordinate"=='0')
     {
         send_float(my_pose , mac_id_req);
     }
     else if(recieve _data[0]=='#'||recieve _data[0]=='$')
     {
         for(i=0;i<no_of_bot;i++)
         {
             if(bot[i].mac_id-mac_id_req=='0')
             {
                 bot[i].x= *(&recieve _data[4]);
                 bot[i].y= *(&recieve _data[9]);
                 bot[i].phi= *(&recieve _data[14]);
                 bot[i].time_stamp= *(&recieve _data[19]);

                 break;
             }
         }
     }

     UARTIntClear(UART5_BASE, UART_INT_RX|UART_INT_RT);

}

//-------------This function sends current pose(X,Y co-ordinate& //-------------theta) the bot to bot whose mac_id is given-------
void send_float(pose my_pose, char* mac)
{
   int x=1000*my_ pose.x;
   int y=1000*my_ pose.y ;
   int phi=1000*my_ pose.phi;
   int time _stamp=1000*my_ pose.time_stamp;

       char* u;
       u=&x;
       if(x<0)
             {
                 temp[5]='$';
             }
    else{
            temp[5]='#';
        }

    for(i=5;i<9;i++)
    {
        temp[i+1]=*(u+i);
    }


       u=&y;
       if(y<0)
             {
                 temp[5]='$';
             }
    else{
            temp[5]='#';
        }

    for(i=5;i<9;i++)
    {
        temp[i+1]=*(u+i);
    }


           u=&phi;
    if(phi<0)
                {
                    temp[10]='$';
                }
       else{
               temp[10]='#';
           }

       for(i=10;i<14;i++)
       {
           temp[i+1]=*(u+i);
       }




    fr_api(temp,0x10,mac);

}


void fr_api(char* k, char api, char* mac)
{
    unsigned char dil=0x7E;
                                                     maa = *k;
    int y =0;
    int z=0;
    if(*(k) == '$'|| *k == '#'){
        z=15;
    }
    else if(api == 0x11){
        z=4;
    }
    else{
    for(y=0;*(k+y)!='\0';y++)
    {
        z++;
    }
    }
    if(api == 0x11){
        unsigned int sum=  0x0014 + z;
        unsigned char src_ep= 0xE8;
        unsigned char end_ep =0xE8;
        unsigned char cluster_ID[2];
        cluster_ID[0] = 0x00;
        cluster_ID[1] = 0x11;
        unsigned char profile_ID[2];
        profile_ID[0] = 0xC1;
        profile_ID[1] = 0x05;
             }
    else
        unsigned int sum=  0x000E + z;

        int len1=(((sum%16))+((sum/16)%16)*16);
        int len2=((((sum/256)%16))+((sum/4096)%16)*16);

        unsigned char fr_id= 0x00;
        /*unsigned char macid[8] = {0x00, 0x13, 0xA2, 0x00, 0x41, 0x63, 0xCB, 0xB1};
        if(xbee==2)
        {
       //  macid[5] = 0xDC;
        // macid[6] = 0x85;
         macid[7] = 0xAB;
        }*/
        unsigned char destadd[2];
        destadd[0]=0xFF;
        destadd[1]=0xFE;



        unsigned char br_rad= 0x00;
        unsigned char opt= 0x00;
        unsigned int datasum=0;
        unsigned char macsum =0;
       // char frame[400]={dil, len2, len1, api, fr_id};
       // char frame[400]={0x01};


        //datasum=datasum+info.identifier;
        int s=0;
        for( s=0;s<z;s++)
        {
            datasum= datasum+ *(k+s);
        }

        for( s=0;s<8;s++)
        {

            macsum= macsum+ *(mac+s);
        }


        if(api == 0x11){
            unsigned int sum1=api + datasum+ fr_id + macsum + 0xFF + 0xFE + 0xE8+ 0xE8 + 0x00 + 0x11 + 0xC1 + 0x05 + br_rad + opt;
        }
        else
            unsigned int sum1=api + datasum+ fr_id + macsum + 0xFF + 0xFE + br_rad + opt;



            int checksum1=255-(((sum1%16))+((sum1/16)%16)*16);
        //int checksum1=767-sum1;
            unsigned char checksum=checksum1;



        char frame[200]={dil, len2, len1, api, fr_id};

            int j=5;

            for( s=0;s<8;s++)
            {
          frame[j]=*(mac+s);
          j++;

            }

            frame[j]=destadd[0];
          frame[++j]=destadd[1];

          if(api == 0x11){
            frame[++j]=src_ep;
            frame[++j]=dest_ep;
            frame[++j]=cluster_ID[0];
            frame[++j]=cluster_ID[1];
            frame[++j]=profile_ID[0];
            frame[++j]=profile_ID[1];
                      }
            frame[++j]=br_rad;

            frame[++j]=opt;

            j++;

            for(s=0;s<z;s++)
            {
            frame[j]=*(k+s);
            j++;
            }




            frame[j]=checksum;

       // char frame[23]= {0x7E, 0x00, 0x12,0x10,0x01,0x00,0x13,0xA2,0x00,0x41,0x63,0xCB,0xF7,0xFF,0xFE,0x00,0x00,0x23,0x2B,0x00,0x2B,0x5D};
        int r=0;
        if(api == 0x11)
            z=10;
        for (r=0;r<18+z;r++)
        {
            //maa++;
            UARTCharPut(UART5_BASE,frame[r]);
            //UARTCharPut(UART0_BASE,frame[r]);

        }


}

//----------this function sends strings -------------------------

void send(char data[100],char api,char* mac)
{
    fr_api(data,api,mac);

}
