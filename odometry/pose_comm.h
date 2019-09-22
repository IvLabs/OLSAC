/*
 * pose_comm.h
 *
 *  Created on: 12-Aug-2019
 *      Author: mayuresh
 */

#ifndef POSE_COMM_H_
#define POSE_COMM_H_

//------------variables------------------------------------------------------------------------------------------------

extern float x_real_time,y_real_time,theta;

typedef struct{
    char mac_id[8];
    float x;
    float y;
    float phi;
}pose;

extern pose start_pose,current_pose,bot[100];
pose start_pose,current_pose,bot[100];


void uart_init(void);
void send_float(float w, char* mac);
void fr_api(char* k, char api, char* mac);

void send(char data[100],char api,char* mac);

#endif /* POSE_COMM_H_ */
//------------variables------------------------------------------------------------------------------------------------

