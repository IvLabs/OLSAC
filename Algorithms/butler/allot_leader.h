/*
 * allot_leader.h
 *
 *  Created on: 16-Aug-2019
 *      Author: mayuresh
 */

#ifndef ALLOT_LEADER_H_
#define ALLOT_LEADER_H_

//---------variables-------------------------------------------------------------------------------------------------
typedef struct{
    char macid[8];
    float x;
    float y;
}dist;

dist lead;

//---------functions------------------------------------------------------------------------------------------------

float get_current_pose_of_bot(char* mac, char p);



#endif /* ALLOT_LEADER_H_ */
