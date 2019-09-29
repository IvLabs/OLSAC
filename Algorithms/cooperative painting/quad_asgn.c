/*
 * qyad_asgn.c
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
#include "uart_init.h"
#include "string.h"
#include "Trans_AT.h"
#include "node_search.h"
#include "handshake.h"
//#include "fr_api.h"
#include "get_grid.h"
#include  "get_my_id.h"
#include "quad_asgn.h"

//extern int grid[10];
//extern int id;
//extern int j;
int *grid;
//int quad[10];
float dist;
char id;
int min,idx,j=0;
int quad[10];


//
// dividing grid into 4 quadrants
// assign quadrant to each 4 robots 
//
int *quad_asgn(int *idx,int *end )
{
    grid=get_grid();
    int i=0,j,a=0,b=0,c=0,d=0,k=0;      //"j" is the total size of grid array
    //int quad[10];
    float dist;


   id = get_my_id();
       if(id == 1)
       {
           for(i=0;i<j;i+=2)
               {
                   if(grid[i]>=0 && grid[i+1]>=0)   //for +ve x and y:-quad1
                   {
                       quad[*end]=grid[i]*res;
                       quad[(*end)+1]=grid[i+1]*res;

                       (*end)=(*end)+2;
                   }
                }
           for(i=0; i<=((*end)-2); i+=2)
           {
               dist=sqrt(pow(quad[i], 2) +  pow(quad[i+1], 2));
               if(min == 0)
                   min = dist;
               else if(min>dist)
               {
               min = dist;
               *idx = i;

               }
           }
           return quad;
       }

       else if(id == 2)
       {
           for(i=0;i<j;i+=2)
           {
               if(grid[i]<0 && grid[i+1]>=0)
                   {
                       quad[(*end)]=grid[i]*res;
                       quad[(*end)+1]=grid[i+1]*res;
                       (*end)=(*end)+2;
                   }
           }

             for(i=0; i<=((*end)-2); i+=2)
             {
                 dist=sqrt(pow(quad[i], 2) +  pow(quad[i+1], 2));
                 if(min == 0)
                     min = dist;
                 else if(min>dist)
                 {
                 min = dist;
                 *idx = i;

                 }
             }
             return quad;
       }

       else if(id == 3)
       {
           for(i=0;i<j;i+=2)
           {
                if(grid[i]<0 && grid[i+1]<0)
                    {
                        quad[(*end)]=grid[i]*res;
                        quad[(*end)+1]=grid[i+1]*res;

                        (*end)=(*end)+2;
                    }
            }

             for(i=0; i<=((*end)-2); i+=2)
             {
                 dist=sqrt(pow(quad[i], 2) +  pow(quad[i+1], 2));
                 if(min == 0)
                     min = dist;
                 else if(min>dist)
                 {
                 min = dist;
                 *idx = i;
  //               i++;
  //               k++;
                 }
             }
             return quad;
       }

       else if(id == 4)
       {
           for(i=0;i<j;i+=2)
           {
                 if(grid[i]>=0 && grid[i+1]<0)
                     {
                        quad[(*end)]=grid[i]*res;
                        quad[(*end)+1]=grid[i+1]*res;
//                        i++;
                        (*end)=(*end)+2;
                     }
            }
             for(i=0; i<=((*end)-2); i+=2)
             {
                 dist=sqrt(pow(quad[i], 2) +  pow(quad[i+1], 2));
                 if(min == 0)
                     min = dist;
                 else if(min>dist)
                 {
                 min = dist;
                 *idx = i;
  //               i++;
  //               k++;
                 }
             }
             return quad;
        }
       else
       {
           return 0;
       }

}
//}



