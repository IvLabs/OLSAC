/*
 * odom_init.h
 *
 *  Created on: 11-Aug-2019
 *      Author: mayuresh
 */

#ifndef ODOM_INIT_H_
#define ODOM_INIT_H_



extern float x_real_time,y_real_time,theta;

typedef struct{
    char mac_id[8];
    float x;
    float y;
    float phi;
}pose;

extern pose start_pose,current_pose,bot[100];
pose start_pose,current_pose,bot[100];

//---functions-------------------------------------------------------------------------------------------------------------

void odom_init();

#endif /* ODOM_INIT_H_ */
