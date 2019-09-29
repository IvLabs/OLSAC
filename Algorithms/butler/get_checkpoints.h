/*
 * get_checkpoints.h
 *
 *  Created on: 16-Aug-2019
 *      Author: mayuresh
 */

#ifndef GET_CHECKPOINTS_H_
#define GET_CHECKPOINTS_H_

//---------variables-------------------------------------------------------------------------------------------------
#define table_length 4
#define table_breadth 5

#define curr_x 0
#define curr_y 0

int grid[100][100];

//---------functions------------------------------------------------------------------------------------------------

void get_checkpoints(int* x ,int* y, int x_pre, int y_pre);
void get_temp_goal(int x_sp, int y_sp,int* x_cp ,int* y_cp,int* x ,int* y,int x_pre, int y_pre);

#endif /* GET_CHECKPOINTS_H_ */
