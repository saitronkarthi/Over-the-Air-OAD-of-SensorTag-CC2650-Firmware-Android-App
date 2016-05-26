/*******************************************************************************
  Filename:       SensorTag_Opt.c
  Revised:        $Date: 2013-11-06 17:27:44 +0100 (on, 06 nov 2013) $
  Revision:       $Revision: 35922 $

  Description:    This file contains the Sensor Tag sample application,
                  Optical sensor, for use with the TI Bluetooth Low 
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
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/knl/Queue.h>

#include "gatt.h"
#include "gattservapp.h"

#include "opticservice.h"
#include "SensorTag_Opt.h"
#include "sensor_opt3001.h"
#include "sensor.h"
#include "Board.h"
#include "util.h"
#include "string.h"
/*********************************************************************
 * MACROS
 */

/*********************************************************************
 * CONSTANTS
 */

// How often to perform sensor reads (milliseconds)
#define SENSOR_DEFAULT_PERIOD   800

// Length of the data for this sensor
#define SENSOR_DATA_LEN         OPTIC_DATA_LEN

// Event flag for this sensor
#define SENSOR_EVT              ST_OPTIC_SENSOR_EVT


/*********************************************************************
 * TYPEDEFS
 */

/*********************************************************************
 * GLOBAL VARIABLES
 */

/*********************************************************************
 * EXTERNAL VARIABLES
 */

/*********************************************************************
 * EXTERNAL FUNCTIONS
 */

/*********************************************************************
 * LOCAL VARIABLES
 */
static Clock_Struct periodicClock;

// Parameters
static uint8_t sensorConfig;
static uint16_t sensorPeriod;
static bool sensorReadScheduled;

/*********************************************************************
 * LOCAL FUNCTIONS
 */
static void sensorConfigChangeCB(uint8_t paramID);
static void initCharacteristicValue(uint8_t paramID, uint8_t value, 
                                    uint8_t paramLen);
static void SensorTagOpt_clockHandler(UArg arg);

/*********************************************************************
 * PROFILE CALLBACKS
 */
static sensorCBs_t sensorCallbacks =
{
  sensorConfigChangeCB,  // Characteristic value change callback
};


/*********************************************************************
 * PUBLIC FUNCTIONS
 */


/*********************************************************************
 * @fn      SensorTagOpt_init
 *
 * @brief   Initialize scheduler for light sensor
 *
 * @param   none
 *
 * @return  none
 */
void SensorTagOpt_init(void)
{
  // Add service
  Optic_addService();

  // Register callbacks with profile
  Optic_registerAppCBs(&sensorCallbacks);

  // Initialize the module state variables
  sensorPeriod = SENSOR_DEFAULT_PERIOD;
  sensorReadScheduled = false;
  SensorTagOpt_reset();
  initCharacteristicValue(SENSOR_PERI, 
                          SENSOR_DEFAULT_PERIOD / SENSOR_PERIOD_RESOLUTION, 
                          sizeof ( uint8_t ));
  
  // Initialize the driver
  sensorOpt3001Init();
  sensorOpt3001Enable(false); 
  
  // Create one-shot clocks for internal periodic events.
  Util_constructClock(&periodicClock, SensorTagOpt_clockHandler,
                      100, sensorPeriod, false, 0);
}

/*********************************************************************
 * @fn      SensorTagOpt_processCharChangeEvt
 *
 * @brief   SensorTag Accelerometer event handling 
 *
 * @param   paramID - parameter identifier
 *
 */
void SensorTagOpt_processCharChangeEvt(uint8_t paramID)
{
  uint8_t newValue;
  
  switch (paramID)
  {
  case SENSOR_CONF:
    if ((sensorTestResult() & ST_LIGHT) == 0 )
    {
      sensorConfig = ST_CFG_ERROR;
    }
    
    if (sensorConfig != ST_CFG_ERROR)
    {
      Optic_getParameter(SENSOR_CONF, &newValue);
      
      if (newValue == ST_CFG_SENSOR_DISABLE)
      {
        // Put sensor to sleep
        if (sensorConfig != ST_CFG_SENSOR_DISABLE)
        {
          Util_stopClock(&periodicClock);
          sensorOpt3001Enable(false); // Disable the sensor
          initCharacteristicValue(SENSOR_DATA, 0, SENSOR_DATA_LEN);
        }
      }
      else
      {
        if (sensorConfig == ST_CFG_SENSOR_DISABLE)
        {
          sensorOpt3001Enable(true);
          Util_startClock(&periodicClock);
        }
      }
      
      sensorConfig = newValue;
    }
    else
    {
      // Make sure the previous characteristics value is restored
      initCharacteristicValue(SENSOR_CONF, sensorConfig, sizeof ( uint8_t ));        
    }
    break;
    
  case SENSOR_PERI:
    Optic_getParameter(SENSOR_PERI, &newValue);
    sensorPeriod = newValue * SENSOR_PERIOD_RESOLUTION;
    Util_rescheduleClock(&periodicClock,sensorPeriod);
    break;
    
  default:
    // Should not get here
    break;
  }
}


/*********************************************************************
 * @fn      SensorTagOpt_reset
 *
 * @brief   Reset characteristics and disable sensor
 *
 * @param   none
 *
 * @return  none
 */
void SensorTagOpt_reset (void)
{
  sensorConfig = ST_CFG_SENSOR_DISABLE;
  sensorPeriod = SENSOR_DEFAULT_PERIOD;
  initCharacteristicValue(SENSOR_DATA, 0, SENSOR_DATA_LEN);
  initCharacteristicValue(SENSOR_CONF, ST_CFG_SENSOR_DISABLE, 
                          sizeof ( uint8_t ));

  if ( (sensorTestResult() & ST_LIGHT) > 0)
  {
    sensorOpt3001Enable(false); // Disable the sensor
  }
}


/*********************************************************************
* Private functions
*/


/*********************************************************************
 * @fn      SensorTagOpt_processSensorEvent
 *
 * @brief   SensorTag Light Meter event processor.  
 *
 */
void SensorTagOpt_processSensorEvent(void)
{
  if (sensorReadScheduled)
  {
    uint16_t data;
    
    sensorOpt3001Read(&data);
    Optic_setParameter(SENSOR_DATA, SENSOR_DATA_LEN, &data);
    sensorReadScheduled = false;
  }
}


/*********************************************************************
 * @fn      SensorTagOpt_clockHandler
 *
 * @brief   Handler function for clock time-outs.
 *
 * @param   arg - event type
 *
 * @return  none
 */
static void SensorTagOpt_clockHandler(UArg arg)
{ 
  if (sensorConfig == ST_CFG_SENSOR_ENABLE)
  {
    // Wake up the application.
    sensorReadScheduled = true;
    Semaphore_post(sem);
  }
}


/*********************************************************************
 * @fn      sensorConfigChangeCB
 *
 * @brief   Callback from Optical Service indicating a configuration change
 *
 * @param   paramIDChanged - parameter ID of the value that was changed.
 *
 * @return  none
 */
static void sensorConfigChangeCB(uint8_t paramID)
{
  // Wake up the application thread
  SensorTag_charValueChangeCB(SERVICE_ID_OPT, paramID);
}


/*********************************************************************
 * @fn      initCharacteristicValue
 *
 * @brief   Initialize a characteristic value
 *
 * @param   paramID - parameter ID of the value is to be cleared
 *
 * @param   value - value to initialize with
 *
 * @param   paramLen - length of the parameter
 *
 * @return  none
 */
static void initCharacteristicValue(uint8_t paramID, uint8_t value, 
                                    uint8_t paramLen)
{
  uint8_t data[SENSOR_DATA_LEN];
  
  memset(data,value,paramLen);
  Optic_setParameter(paramID, paramLen, data);
}


/*********************************************************************
*********************************************************************/

