/*******************************************************************************
  Filename:       SensorTag_Keys.c
  Revised:        $Date: 2013-08-23 20:45:31 +0200 (fr, 23 aug 2013) $
  Revision:       $Revision: 35100 $

  Description:    This file contains the Sensor Tag sample application,
                  Keys part, for use with the TI Bluetooth Low 
                  Energy Protocol Stack.

  Copyright 2015  Texas Instruments Incorporated. All rights reserved.

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

/*********************************************************************
 * INCLUDES
 */
#include "gatt.h"
#include "gattservapp.h"
#include "SensorTag_Keys.h"
#include "sensorTag_IO.h"
#include "ioservice.h"

#include "Board.h"
#include "peripheral.h"
#include "simplekeys.h"

#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Semaphore.h>

/*********************************************************************
 * MACROS
 */

/*********************************************************************
 * CONSTANTS
 */
#define SK_KEY_REED             0x04
#define SK_PUSH_KEYS            0x03

// Key press time-outs (milliseconds)
#define POWER_PRESS_PERIOD      3000
#define RESET_PRESS_PERIOD      6000

/*********************************************************************
 * TYPEDEFS
 */
typedef struct
{
  uint32_t tStart;
  uint32_t tStop;
} KeyPress_t;

/*********************************************************************
 * GLOBAL VARIABLES
 */

/*********************************************************************
 * EXTERNAL VARIABLES
 */

/*********************************************************************
 * EXTERNAL FUNCTIONS
 */
extern void restoreFactoryImage(void);

/*********************************************************************
 * LOCAL VARIABLES
 */
static uint8_t keys;
static KeyPress_t keyLeft;
static KeyPress_t keyRight;

/*********************************************************************
 * LOCAL FUNCTIONS
 */
static void processGapStateChange(void);

/*********************************************************************
 * PROFILE CALLBACKS
 */

/*********************************************************************
 * PUBLIC FUNCTIONS
 */

/*********************************************************************
 * @fn      SensorTagKeys_init
 *
 * @brief   Initialization function for the SensorTag keys
 *
 */
void SensorTagKeys_init(void)
{
  // Add service
  SK_AddService (GATT_ALL_SERVICES);

  // Initialize the module state variables
  SensorTagKeys_reset();
}

/*********************************************************************
 * @fn      SensorTagKeys_processKeyRight
 *
 * @brief   Interrupt handler for BUTTON 1(right)
 *
 */
void SensorTagKeys_processKeyRight(void)
{
  if (PIN_getInputValue(Board_KEY_RIGHT))
  {
    keys &= ~SK_KEY_RIGHT;
    keyRight.tStop = Clock_getTicks();
  } 
  else
  {
    keys |= SK_KEY_RIGHT;
    keyRight.tStart = Clock_getTicks();
  }
  
  // Wake up the application thread
  Semaphore_post(sem);
}

/*********************************************************************
 * @fn      SensorTagKeys_processKeyLeft
 *
 * @brief   Interrupt handler for BUTTON 2 (left)
 *
 */
void SensorTagKeys_processKeyLeft(void)
{
  if (PIN_getInputValue(Board_KEY_LEFT))
  {
    keys &= ~SK_KEY_LEFT;
    keyLeft.tStop = Clock_getTicks();
  }
  else
  {
    keys |= SK_KEY_LEFT;
    keyLeft.tStart = Clock_getTicks();
  }
  
  // Wake up the application thread
  Semaphore_post(sem);
}

/*********************************************************************
 * @fn      SensorTagKeys_processRelay
 *
 * @brief   Interrupt service routine for reed relay
 *
 */
void SensorTagKeys_processRelay(void)
{
  if (PIN_getInputValue(Board_RELAY))
  {
    keys |= SK_KEY_REED;
  }
  else
  {
    keys &= ~SK_KEY_REED;
  }
  
  // Wake up the application thread
  Semaphore_post(sem);
}


/*********************************************************************
 * @fn      SensorTagKeys_processEvent
 *
 * @brief   SensorTag Keys event processor.  
 *
 */
void SensorTagKeys_processEvent(void)
{
  static uint8_t current_keys = 0;
  
  // Set the value of the keys state to the Simple Keys Profile;
  // This will send out a notification of the keys state if enabled
  if (current_keys != keys)
  {
    SK_SetParameter( SK_KEY_ATTR, sizeof ( uint8_t ), &keys);
    
    // Insert key state into advertising data
    if ( gapProfileState == GAPROLE_ADVERTISING )
    {
      sensorTag_updateAdvertisingData(keys);
    }
    
    // Check if right key was pressed for more than 3 seconds and less than 6
    if ( (current_keys & SK_KEY_RIGHT)!=0 && (keys & SK_KEY_RIGHT)==0 )
    {
      
      if (gapProfileState == GAPROLE_CONNECTED)
      {
        int duration;
        
        duration = ((keyRight.tStop - keyRight.tStart) * Clock_tickPeriod) 
          / 1000;
        
        // Connected: change state after 3 second press (power/right button)
        if (duration > POWER_PRESS_PERIOD && duration < RESET_PRESS_PERIOD)
        {
          processGapStateChange();
        }
      }
      else
      {
        // Not connected; change state immediately (power/right button)
        processGapStateChange();
      } 
    }

    // Check if both keys were pressed for more than 6 seconds
    if ( (current_keys & SK_PUSH_KEYS)==SK_PUSH_KEYS 
        && (keys & SK_PUSH_KEYS)!=SK_PUSH_KEYS )
    {
      int duration;
      uint8_t rel;
      
      // Check which key has been released
      rel = current_keys ^ keys;
      
      if (rel & SK_KEY_RIGHT)
      {
        duration = ((keyRight.tStop - keyRight.tStart) * Clock_tickPeriod) 
          / 1000;
      }
      else
      {
        duration = ((keyLeft.tStop - keyLeft.tStart) * Clock_tickPeriod) 
          / 1000;
      }
      
      // Both keys have been pressed for 6 seconds -> restore factory image
      if ( duration > RESET_PRESS_PERIOD )
      {
        SensorTag_blinkLed(Board_BUZZER, 10);
        
        // Apply factory image and reboot
        SensorTag_applyFactoryImage();
      }
    }
  }
  
  current_keys = keys;
}

/*********************************************************************
 * @fn      SensorTagKeys_reset
 *
 * @brief   Reset key state to 'not pressed'
 *
 * @param   none
 *
 * @return  none
 */
void SensorTagKeys_reset(void)
{
  keyLeft.tStart = 0;
  keyLeft.tStop = 0;
  keyRight.tStart = 0;
  keyRight.tStop = 0;
  keys = 0;
  SK_SetParameter(SK_KEY_ATTR, sizeof ( uint8_t ), &keys);
}

/*********************************************************************
 * @fn      processGapStateChange
 *
 * @brief   Change the GAP state. 
 *          1. Connected -> disconnect and start advertising
 *          2. Advertising -> stop advertising
 *          3. Disconnected/not advertising -> start advertising
 *
 * @param   none
 *
 * @return  none
 */
static void processGapStateChange(void)
{
  if (gapProfileState != GAPROLE_CONNECTED)
  {
    uint8_t current_adv_enabled_status;
    uint8_t new_adv_enabled_status;
    
    // Find the current GAP advertising status
    GAPRole_GetParameter( GAPROLE_ADVERT_ENABLED, &current_adv_enabled_status);
    
    if( current_adv_enabled_status == FALSE )
    {
      new_adv_enabled_status = TRUE;
    }
    else
    {
      new_adv_enabled_status = FALSE;
    }
    
    // Change the GAP advertisement status to opposite of current status
    GAPRole_SetParameter(GAPROLE_ADVERT_ENABLED, sizeof( uint8_t ), 
                         &new_adv_enabled_status);
  }
  
  if (gapProfileState == GAPROLE_CONNECTED)
  {
    uint8_t adv_enabled = TRUE;
    
    // Disconnect
    GAPRole_TerminateConnection();
    
    // Start advertising
    GAPRole_SetParameter(GAPROLE_ADVERT_ENABLED, sizeof( uint8_t ), 
                         &adv_enabled);
  }
}

/*********************************************************************
*********************************************************************/

