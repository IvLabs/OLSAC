/*
 * get_checkpoints.c
 *
 *  Created on: 16-Aug-2019
 *      Author: mayuresh
 */

#include "get_checkpoints.h"

/*
 * return -1 in provided array if checkpoint not available
 *
 */
void get_checkpoints(int* x ,int* y, int x_pre, int y_pre){
    int i=0;
    for(i=0;i<4;i++){
        *(x+i) = x_pre + table_length;
        *(y+i) = y_pre + table_breadth;
    }

}
/*
 *
 * *x and *y temp goals
  */
void get_temp_goal(int x_sp, int y_sp,int* x_cp ,int* y_cp,int* x ,int* y,int x_pre, int y_pre){
    int i=0;
    for(i=0;i<4;i++){
        if((*(x_cp+i) > x_pre && *(x_cp+i) < x_sp) || (*(x_cp+i) < x_pre && *(x_cp+i) > x_sp))
        {
            if(grid[*(x_cp+i)][y_pre] == 0){
                *x = *(x_cp+i);
                *y = y_pre;
                grid[*(x_cp+i)][y_pre] = 1;
                grid[x_pre][y_pre] = 0;
                grid_update(*(x_cp+i),y_pre,x_pre,y_pre);
                break;
            }
        }

        if((*(y_cp+i) > y_pre && *(y_cp+i) < y_sp) || (*(y_cp+i) < y_pre && *(y_cp+i) > y_sp))
        {
            if(grid[*(y_cp+i)][x_pre] == 0){
                *y = *(y_cp+i);
                *x = x_pre;
                grid[x_pre][*(y_cp+i)] = 1;
                grid[x_pre][y_pre] = 0;
                grid_update(x_pre,*(y_cp+i),x_pre,y_pre);
                break;
            }
        }
    }
}

/*
 * updating global grid
 */

void grid_update(char a,char b,char c,char d){
    char k[4];
    k[0] = a;
    k[1] = b;
    k[2] = c;
    k[3] = d;
    char macID[8] = {0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF};
    fr_api(&k[0],0x11,&macID[0]);
}
