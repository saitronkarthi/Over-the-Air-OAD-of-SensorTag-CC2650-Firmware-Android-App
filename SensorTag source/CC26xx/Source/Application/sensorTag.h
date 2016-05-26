/*******************************************************************************
  Filename:       SensorTag.h
  Revised:        $Date: 2013-11-20 20:28:12 +0100 (on, 20 nov 2013) $
  Revision:       $Revision: 36163 $

  Description:    This file contains the SensorTag application's
                  definitions and prototypes.

  Copyright 2015 Texas Instruments Incorporated. All rights reserved.

  IMPORTANT: Your use of this Software is limited to those specific rights
  granted under the terms of a software license agreement between the user
  who downloaded the software, his/her employer (which must be your employer)
  and Texas Instruments Incorporated (the "License").  You may not use this
  Software unless you agree to abide by the terms of the License. The License
  limits your use, and you acknowledge, that the Software may not be modified,
  copied or distributed unless embedded on a Texas Instruments microcontroller
  or used solely and exclusively in conjunction with a Texas Instruments radio
  frequency transceiver, which is integrated into your product.  Other than for
  the foregoing purpose, you may not use, reproduce, copy, prepare derivative
  works of, modify, distribute, perform, display or sell this Software and/or
  its documentation for any purpose.

  YOU FURTHER ACKNOWLEDGE AND AGREE THAT THE SOFTWARE AND DOCUMENTATION ARE
  PROVIDED “AS IS” WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED,
  INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY, TITLE,
  NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL
  TEXAS INSTRUMENTS OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER CONTRACT,
  NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER
  LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
  INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE
  OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT
  OF SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
  (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.

  Should you have any questions regarding your right to use this Software,
  contact Texas Instruments Incorporated at www.TI.com.
*******************************************************************************/

#ifndef SENSORTAG_H
#define SENSORTAG_H

#ifdef __cplusplus
extern "C"
{
#endif

/*********************************************************************
 * INCLUDES
 */
#include "ICall.h"
#include "peripheral.h"
#include <ti/sysbios/knl/Clock.h>
#include <ti/drivers/PIN.h>

/*********************************************************************
 * CONSTANTS
 */
  
// Service ID's for internal application use
#define SERVICE_ID_TMP       0x01
#define SERVICE_ID_OPT       0x02
#define SERVICE_ID_MOV       0x04
#define SERVICE_ID_HUM       0x05
#define SERVICE_ID_BAR       0x06
#define SERVICE_ID_IO        0x07
#define SERVICE_ID_KEYS      0x08
#define SERVICE_ID_CC        0x09
#define SERVICE_ID_DISPLAY   0x0A
#define SERVICE_ID_LIGHT     0x0B

 /*********************************************************************
 * MACROS
 */

#ifdef FEATURE_LCD
#define LCD_WRITE_STRING(s,x,y) devpkLcdText(s,x,y)
#define LCD_WRITES_STATUS(s) SensorTag_displayStatus(s)
#else
#define LCD_WRITE_STRING(s,x,y)
#define LCD_WRITES_STATUS(s)
#endif
  
 /*********************************************************************
 * VARIABLES
 */
extern ICall_Semaphore sem;
extern gaprole_States_t gapProfileState;

extern PIN_State pinGpioState;
extern PIN_Handle hGpioPin;


/*********************************************************************
 * FUNCTIONS
 */

/*
 * Task creation function for SensorTag
 */
extern void SensorTag_createTask(void);

/*
 * Function to call when a characteristic value has changed
 */
extern void SensorTag_charValueChangeCB(uint8_t sensorID, uint8_t paramID);

/*
 * Function to check the program stack
 */
extern void SensorTag_checkStack(void);

/*
 * Function to blink LEDs 'n' times
 */
extern void SensorTag_blinkLed(uint8_t led, uint8_t nBlinks);

/*
 * Function to load the factory image and reboot it
 */
extern void SensorTag_applyFactoryImage(void);

/*
 * Update the advertising data with the latest key press status
 */
void sensorTag_updateAdvertisingData(uint8_t keyStatus);

/*********************************************************************
*********************************************************************/

#ifdef __cplusplus
}
#endif

#endif /* SENSORTAG_H */
