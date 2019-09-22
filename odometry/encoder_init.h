/*
 * encoder_init.h
 *
 *  Created on: 06-Jun-2019
 *      Author: Mayuresh
 */

#ifndef ENCODER_INIT_H_
#define ENCODER_INIT_H_

extern void encoder_init(void);

typedef struct
{
    int pos[400];
    int direction[400];
    uint32_t velocity[400];


}encoder_parameters;

 extern encoder_parameters wh1,wh2;

#endif /* ENCODER_INIT_H_ */
