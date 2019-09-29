/*
 * encoder_init.c
 *
 *  Created on: 16-Aug-2019
 *      Author: harshad
 */


#include "stdio.h"
#include "stdint.h"
#include "stdbool.h"
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
//#include "inc/tm4c123gh6pm.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_gpio.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/qei.h"
#include "driverlib/pin_map.h"
#include "driverlib/interrupt.h"
#include "encoder_init.h"
//
// to enable and initialize the encoders
//

void encoder_init(void)
{
    SysCtlPeripheralEnable(SYSCTL_PERIPH_QEI1);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_QEI0);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);

        GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE,GPIO_PIN_1);
        HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY; // to Lock the other pin which is not in use
        HWREG(GPIO_PORTD_BASE + GPIO_O_CR) |= 0x80;
        HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = 0;

        GPIOPinTypeQEI( GPIO_PORTD_BASE, GPIO_PIN_6 | GPIO_PIN_7);
        GPIOPinConfigure(GPIO_PD6_PHA0);
        GPIOPinConfigure(GPIO_PD7_PHB0);

        GPIOPinTypeQEI( GPIO_PORTC_BASE, GPIO_PIN_5 | GPIO_PIN_6);
        GPIOPinConfigure(GPIO_PC5_PHA1);
        GPIOPinConfigure(GPIO_PC6_PHB1);

        QEIDisable(QEI1_BASE);
        QEIDisable(QEI0_BASE);
        QEIConfigure(QEI1_BASE,QEI_CONFIG_CAPTURE_A |QEI_CONFIG_NO_RESET|QEI_CONFIG_QUADRATURE |QEI_CONFIG_NO_SWAP,799);
        QEIConfigure(QEI0_BASE,QEI_CONFIG_CAPTURE_A |QEI_CONFIG_NO_RESET|QEI_CONFIG_QUADRATURE |QEI_CONFIG_NO_SWAP,799);
        QEIVelocityConfigure(QEI0_BASE,QEI_VELDIV_64,SysCtlClockGet());
        QEIVelocityEnable(QEI0_BASE);
        QEIVelocityEnable(QEI1_BASE);
        QEIVelocityConfigure(QEI1_BASE,QEI_VELDIV_64,SysCtlClockGet());
        QEIEnable(QEI0_BASE);
        QEIEnable(QEI1_BASE);
        QEIPositionSet(QEI1_BASE,0);
        QEIPositionSet(QEI0_BASE,0);

}

