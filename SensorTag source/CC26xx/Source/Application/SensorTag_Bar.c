/*******************************************************************************
  Filename:       SensorTag_Bar.c
  Revised:        $Date: 2013-11-06 17:27:44 +0100 (on, 06 nov 2013) $
  Revision:       $Revision: 35922 $

  Description:    This file contains the Sensor Tag sample application,
                  Barometer part, for use with the TI Bluetooth Low
                  Energy Protocol Stack.

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
**************************************************************************/

/*********************************************************************
 * INCLUDES
 */
#include "gatt.h"
#include "gattservapp.h"

#include "barometerservice.h"
#include "SensorTag_Bar.h"
#include "sensor_bmp280.h"
#include "sensor.h"
#include "Board.h"

#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/knl/Task.h>

#include "string.h"
/*********************************************************************
 * MACROS
 */

/*********************************************************************
 * CONSTANTS
 */

// How often to perform sensor reads (milliseconds)
#define SENSOR_DEFAULT_PERIOD   1000

// Constants for two-stage reading
#define SENSOR_FSM_PERIOD       80

// Length of the data for this sensor
#define SENSOR_DATA_LEN         BAROMETER_DATA_LEN

// Event flag for this sensor
#define SENSOR_EVT              ST_BAROMETER_SENSOR_EVT

// Task configuration
#define SENSOR_TASK_PRIORITY    1
#define SENSOR_TASK_STACK_SIZE  600

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
// Entity ID globally used to check for source and/or destination of messages
static ICall_EntityID sensorSelfEntity;

// Semaphore globally used to post events to the application thread
static ICall_Semaphore sensorSem;

// Task setup
static Task_Struct sensorTask;
static Char sensorTaskStack[SENSOR_TASK_STACK_SIZE];

// Parameters
static uint8_t sensorConfig;
static uint16_t sensorPeriod;

/*********************************************************************
 * LOCAL FUNCTIONS
 */
static void sensorTaskFxn(UArg a0, UArg a1);
static void sensorConfigChangeCB( uint8_t paramID);
static void initCharacteristicValue( uint8_t paramID, uint8_t value,
                                    uint8_t paramLen);

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
 * @fn      SensorTagBar_createTask
 *
 * @brief   Task creation function for barometer sensor
 *
 * @param   none
 *
 * @return  none
 */
void SensorTagBar_createTask(void)
{
  Task_Params taskParames;

  // Create the task for the state machine
  Task_Params_init(&taskParames);
  taskParames.stack = sensorTaskStack;
  taskParames.stackSize = SENSOR_TASK_STACK_SIZE;
  taskParames.priority = SENSOR_TASK_PRIORITY;

  Task_construct(&sensorTask, sensorTaskFxn, &taskParames, NULL);
}

/*********************************************************************
 * @fn      SensorTagBar_processCharChangeEvt
 *
 * @brief   SensorTag Barometer event handling
 *
 */
void SensorTagBar_processCharChangeEvt(uint8_t paramID)
{
  uint8_t newValue;

  switch (paramID)
  {
  case SENSOR_CONF:
    if ((sensorTestResult() & ST_PRESSURE) == 0)
    {
      sensorConfig = ST_CFG_ERROR;
    }

    if (sensorConfig != ST_CFG_ERROR)
    {
      Barometer_getParameter(SENSOR_CONF, &newValue);

      if ( newValue == ST_CFG_SENSOR_DISABLE)
      {
        sensorConfig = ST_CFG_SENSOR_DISABLE;
        initCharacteristicValue(SENSOR_DATA, 0, SENSOR_DATA_LEN);

        // Deactivate task
        Task_setPri(Task_handle(&sensorTask), -1);
      }
      else if (newValue == ST_CFG_SENSOR_ENABLE)
      {
        sensorConfig = ST_CFG_SENSOR_ENABLE;
        // Activate task
        Task_setPri(Task_handle(&sensorTask), SENSOR_TASK_PRIORITY);
      }
    }
    else
    {
      // Make sure the previous characteristics value is restored
      initCharacteristicValue(SENSOR_CONF, sensorConfig, sizeof(uint8_t));
    }

    // Make sure sensor is disabled
    sensorBmp280Enable(false);

    break;

  case SENSOR_PERI:
    Barometer_getParameter(SENSOR_PERI, &newValue);
    sensorPeriod = newValue * SENSOR_PERIOD_RESOLUTION;
    break;

  default:
    // Should not get here
    break;
  }
}

/*********************************************************************
 * @fn      SensorTagBar_reset
 *
 * @brief   Reset characteristics and disable sensor
 *
 * @param   none
 *
 * @return  none
 */
void SensorTagBar_reset(void)
{
  sensorConfig = ST_CFG_SENSOR_DISABLE;
  initCharacteristicValue(SENSOR_DATA, 0, SENSOR_DATA_LEN);
  initCharacteristicValue(SENSOR_CONF, ST_CFG_SENSOR_DISABLE, sizeof(uint8_t));
  sensorBmp280Init();
}

/*********************************************************************
* Private functions
*/

/*********************************************************************
 * @fn      sensorTaskInit
 *
 * @brief   Initialization function for the SensorTag barometer
 *
 */
static void sensorTaskInit(void)
{
  // Register task with BLE stack
  ICall_registerApp(&sensorSelfEntity, &sensorSem);

  // Add service
  Barometer_addService();

  // Register callbacks with profile
  Barometer_registerAppCBs(&sensorCallbacks);

  // Initialize the module state variables
  sensorConfig = ST_CFG_SENSOR_DISABLE;
  sensorPeriod = SENSOR_DEFAULT_PERIOD;
  SensorTagBar_reset();
  initCharacteristicValue(SENSOR_PERI, SENSOR_DEFAULT_PERIOD
                          / SENSOR_PERIOD_RESOLUTION, sizeof ( uint8_t ));
}

/*********************************************************************
 * @fn      sensorTaskFxn
 *
 * @brief   The task loop of the humidity readout task
 *
 * @return  none
 */
static void sensorTaskFxn(UArg a0, UArg a1)
{
  // Initialize the task
  sensorTaskInit();

  // Deactivate task (active only when measurement is enabled)
  Task_setPri(Task_handle(&sensorTask), -1);

  // Task loop
  while (true)
  {
    if ( sensorConfig == ST_CFG_SENSOR_ENABLE )
    {
      uint8_t data[BMP_DATA_SIZE];
      int32_t temp;
      uint32_t press;
      bool success;

      // Readout
      sensorBmp280Enable(true);
      delay_ms(SENSOR_FSM_PERIOD);
      success = sensorBmp280Read(data);
      sensorBmp280Enable(false);

      // Processing
      if (success)
      {
        sensorBmp280Convert(data,&temp,&press);

        data[2] = (temp >> 16) & 0xFF;
        data[1] = (temp >> 8) & 0xFF;
        data[0] = temp & 0xFF;

        data[5] = (press >> 16) & 0xFF;
        data[4] = (press >> 8) & 0xFF;
        data[3] = press & 0xFF;
      }

      // Send data
      Barometer_setParameter(SENSOR_DATA, SENSOR_DATA_LEN, data);
      delay_ms(sensorPeriod - SENSOR_FSM_PERIOD);
    }
    else
    {
      delay_ms(SENSOR_DEFAULT_PERIOD);
    }
  }
}

/*********************************************************************
 * @fn      sensorConfigChangeCB
 *
 * @brief   Callback from Barometer Service indicating a value change
 *
 * @param   paramID - parameter ID of the value that was changed.
 *
 * @return  none
 */
static void sensorConfigChangeCB(uint8_t paramID)
{
  // Wake up the application thread
  SensorTag_charValueChangeCB(SERVICE_ID_BAR, paramID);
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

  memset(data, value, paramLen);
  Barometer_setParameter(paramID, paramLen, data);
}


/*********************************************************************
*********************************************************************/

