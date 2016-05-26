/*******************************************************************************
  Filename:       SensorTag_Mov.c
  Revised:        $Date: 2013-11-06 17:27:44 +0100 (on, 06 nov 2013) $
  Revision:       $Revision: 35922 $

  Description:    This file contains the Movement Processor sub-application.
                  It uses the MPU-9250 Wake-on-movement feature to allow the
                  MPU to turn off the gyroscope and magnetometer when no activity 
				  is detected.

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
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/knl/Queue.h>

#include "gatt.h"
#include "gattservapp.h"

#include "Board.h"
#include "movementservice.h"
#include "SensorTag_Mov.h"
#include "sensor_mpu9250.h"
#include "sensor.h"
#include "util.h"
#include "string.h"

/*********************************************************************
 * MACROS
 */
#define MOVEMENT_INACT_CYCLES   ( MOVEMENT_INACT_TIMEOUT * (1000/sensorPeriod) )

/*********************************************************************
 * CONSTANTS and MACROS
 */
// How often to perform sensor reads (milliseconds)
#define SENSOR_DEFAULT_PERIOD   1000

// Length of the data for this sensor
#define SENSOR_DATA_LEN         MOVEMENT_DATA_LEN

// Event flag for this sensor
#define SENSOR_EVT              ST_GYROSCOPE_SENSOR_EVT

// Movement task states
#define APP_STATE_ERROR           0xFF
#define APP_STATE_OFF             0
#define APP_STATE_IDLE            1
#define APP_STATE_ACTIVE          2

// Movement task configuration
#define MOVEMENT_INACT_TIMEOUT    10     // 10 seconds
#define GYR_SHAKE_THR             10.0
#define WOM_THR                   10

// Configuration bit-masks (bits 0-6 defined in sensor_mpu9250.h)
#define MOV_WOM_ENABLE            0x0080
#define MOV_MASK_WOM_THRESHOLD    0x3C00 // TBD
#define MOV_MASK_INACT_TIMEOUT    0xC000 // TBD

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
static uint16_t sensorPeriod;
static volatile bool sensorReadScheduled;
static uint8_t sensorData[SENSOR_DATA_LEN];

// Application state variables

// MPU config:
// bit 0-2:   accelerometer enable(z,y,x)
// bit 3-5:   gyroscope enable (z,y,x)
// bit 6:     magnetometer enable
// bit 7:     WOM enable
// bit 8-9:   accelerometer range (2,4,8,16)
static uint16_t mpuConfig;

static uint8_t appState;
static volatile bool mpuDataRdy;
static uint32_t nActivity;
static uint8_t movThreshold;
static uint8_t mpuIntStatus;
static bool shakeDetected;
static uint8_t nMotions;

/*********************************************************************
 * LOCAL FUNCTIONS
 */
static void sensorChangeCB( uint8_t paramID);
static void initCharacteristicValue( uint8_t paramID, uint8_t value,
                                    uint8_t paramLen);
static void SensorTagMov_clockHandler(UArg arg);
static void appStateSet(uint8_t newState);

/*********************************************************************
 * PROFILE CALLBACKS
 */
static sensorCBs_t sensorCallbacks =
{
  sensorChangeCB,  // Characteristic value change callback
};


/*********************************************************************
 * PUBLIC FUNCTIONS
 */

/*********************************************************************
 * @fn      SensorTagMov_init
 *
 * @brief   Initialization function for the SensorTag movement sub-application
 *
 */
void SensorTagMov_init( void )
{
  // Add service
  Movement_addService();

  // Register callbacks with profile
  Movement_registerAppCBs(&sensorCallbacks);

  // Initialize the module state variables
  mpuConfig = ST_CFG_SENSOR_DISABLE;
  sensorPeriod = SENSOR_DEFAULT_PERIOD;
  sensorReadScheduled = false;

  appState = APP_STATE_OFF;
  nMotions = 0;

  if (sensorMpu9250Init())
  {
    SensorTagMov_reset();
    sensorMpu9250RegisterCallback(SensorTagMov_processInterrupt);
  }

  // Initialize characteristics
  initCharacteristicValue(SENSOR_PERI,
                          SENSOR_DEFAULT_PERIOD / SENSOR_PERIOD_RESOLUTION,
                          sizeof ( uint8_t ));

  // Create continuous clock for internal periodic events.
  Util_constructClock(&periodicClock, SensorTagMov_clockHandler,
                      1000, sensorPeriod, false, 0);
}


/*********************************************************************
 * @fn      SensorTagMov_processInterrupt
 *
 * @brief   Interrupt handler for MPU
 *
 */
void SensorTagMov_processInterrupt(void)
{
  // Wake up the application thread
  mpuDataRdy = true;
  sensorReadScheduled = true;
  Semaphore_post(sem);
}


/*********************************************************************
 * @fn      SensorTagMov_processSensorEvent
 *
 * @brief   SensorTag Gyroscope sensor event processor.
 *
 */
void SensorTagMov_processSensorEvent(void)
{
  if (sensorReadScheduled)
  {
    uint8_t axes;

    axes = mpuConfig & MPU_AX_ALL;

    if ((axes != ST_CFG_SENSOR_DISABLE) && (axes != ST_CFG_ERROR))
    {
      // Get interrupt status (clears interrupt)
      mpuIntStatus = sensorMpu9250IntStatus();

      // Process gyro and accelerometer
      if (mpuDataRdy || appState == APP_STATE_ACTIVE)
      {
        if (mpuIntStatus & MPU_MOVEMENT)
        {
          // Motion detected (small filter)
          nMotions++;
          if (nMotions == 2)
          {
            nActivity = MOVEMENT_INACT_CYCLES;
          }
        }
        else if (mpuIntStatus & MPU_DATA_READY)
        {
          // Read gyro data
          sensorMpu9250GyroRead((uint16_t*)sensorData);

          // Read accelerometer data
          sensorMpu9250AccRead((uint16_t*)&sensorData[6]);

          if (shakeDetected)
          {
            // Motion detected by gyro
            nActivity = MOVEMENT_INACT_CYCLES;
            shakeDetected = false;
          }
        }

        mpuDataRdy = false;

        if (appState == APP_STATE_ACTIVE && !!(mpuConfig & MPU_AX_MAG))
        {
          uint8_t status;

          status = sensorMpu9250MagRead((int16_t*)&sensorData[12]);

          // Always measure magnetometer (not interrupt driven)
          if (status == MAG_BYPASS_FAIL)
          {
            // Idle on error
            nActivity = 0;
            appState = APP_STATE_ERROR;
          }
          else if (status != MAG_STATUS_OK)
          {
            sensorMpu9250MagReset();
          }
        }
      }

      if (nActivity>0)
      {
        if (appState != APP_STATE_ACTIVE)
        {
          // Transition to active state
          appState = APP_STATE_ACTIVE;
          nMotions = 0;
          if (sensorMpu9250Reset())
          {
            sensorMpu9250Enable(axes);
          }
        }
        if (mpuConfig & MOV_WOM_ENABLE)
        {
          nActivity--;
        }

        // Send data
        Movement_setParameter(SENSOR_DATA, SENSOR_DATA_LEN, sensorData);
      }
      else
      {
        if (appState != APP_STATE_IDLE)
        {
          // Transition from active to idle state
          nMotions = 0;
          appState = APP_STATE_IDLE;
          if (sensorMpu9250Reset())
          {
            sensorMpu9250WomEnable(movThreshold);
          }
        }
      }
    }

    sensorReadScheduled = false;
  }
}

/*********************************************************************
 * @fn      SensorTagMov_processCharChangeEvt
 *
 * @brief   SensorTag Movement event handling
 *
 */
void SensorTagMov_processCharChangeEvt(uint8_t paramID)
{
  uint16_t newCfg;
  uint8_t newValue8;

  switch (paramID)
  {
  case SENSOR_CONF:
    if ((sensorTestResult() & ST_MPU) == 0)
    {
      mpuConfig = ST_CFG_ERROR;
    }

    if (mpuConfig != ST_CFG_ERROR)
    {
      Movement_getParameter(SENSOR_CONF, &newCfg);

      if ( (newCfg & MPU_AX_ALL) == ST_CFG_SENSOR_DISABLE)
      {
        // All axes off, turn off device power
        mpuConfig = newCfg;
        appStateSet(APP_STATE_OFF);
      }
      else
      {
        // Some axes on; power up and activate MPU
        mpuConfig = newCfg;
        appStateSet(APP_STATE_ACTIVE);
        if (sensorMpu9250PowerIsOn())
        {
          delay_ms(5);
          mpuConfig = newCfg | (sensorMpu9250AccReadRange() << 8);
        }
      }

      Movement_setParameter(SENSOR_CONF, sizeof(mpuConfig), (uint8_t*)&mpuConfig);
    }
    else
    {
      // Make sure the previous characteristics value is restored
      initCharacteristicValue(SENSOR_CONF, mpuConfig, sizeof ( mpuConfig ));
    }

    // Data initially zero
    initCharacteristicValue(SENSOR_DATA, 0, SENSOR_DATA_LEN);
    break;

  case SENSOR_PERI:
    Movement_getParameter(SENSOR_PERI, &newValue8);
    sensorPeriod = newValue8 * SENSOR_PERIOD_RESOLUTION;
    Util_rescheduleClock(&periodicClock,sensorPeriod);
    break;

  default:
    // Should not get here
    break;
  }
}

/*********************************************************************
 * @fn      SensorTagMov_reset
 *
 * @brief   Reset characteristics and disable sensor
 *
 * @param   none
 *
 * @return  none
 */
void SensorTagMov_reset (void)
{
  initCharacteristicValue(SENSOR_DATA, 0, SENSOR_DATA_LEN);
  mpuConfig = ST_CFG_SENSOR_DISABLE | (ACC_RANGE_8G << 8);
  Movement_setParameter(SENSOR_CONF, sizeof(mpuConfig), (uint8_t*)&mpuConfig);

  // Remove power from the MPU
  appStateSet(APP_STATE_OFF);
}


/*********************************************************************
* Private functions
*/

/*********************************************************************
 * @fn      SensorTagMov_clockHandler
 *
 * @brief   Handler function for clock time-outs.
 *
 * @param   arg - event type
 *
 * @return  none
 */
static void SensorTagMov_clockHandler(UArg arg)
{
  // Schedule readout periodically
  sensorReadScheduled = true;
  Semaphore_post(sem);
}


/*********************************************************************
 * @fn      sensorChangeCB
 *
 * @brief   Callback from Movement Service indicating a value change
 *
 * @param   paramID - parameter ID of the value that was changed.
 *
 * @return  none
 */
static void sensorChangeCB(uint8_t paramID)
{
  // Wake up the application thread
  SensorTag_charValueChangeCB(SERVICE_ID_MOV, paramID);
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
static void initCharacteristicValue( uint8_t paramID, uint8_t value,
                                    uint8_t paramLen )
{
  memset(sensorData,value,paramLen);
  Movement_setParameter(paramID, paramLen, sensorData);
}

/*******************************************************************************
 * @fn      appStateSet
 *
 * @brief   Set the application state
 *
 */
static void appStateSet(uint8_t newState)
{
  if (newState == APP_STATE_OFF)
  {
    appState = APP_STATE_OFF;

    sensorMpu9250Enable(0);
    sensorMpu9250PowerOff();

    // Stop scheduled data measurements
    Util_stopClock(&periodicClock);
  }

  if (newState == APP_STATE_ACTIVE || newState == APP_STATE_IDLE)
  {
    appState = APP_STATE_ACTIVE;
    nActivity = MOVEMENT_INACT_CYCLES;
    movThreshold = WOM_THR;
    mpuIntStatus = 0;
    shakeDetected = false;
    mpuDataRdy = false;

    sensorMpu9250PowerOn();
    sensorMpu9250Enable(mpuConfig & 0xFF);

    if (newState == APP_STATE_ACTIVE)
    {
      // Start scheduled data measurements
      Util_startClock(&periodicClock);
    }
    else
    {
      // Stop scheduled data measurements
      Util_stopClock(&periodicClock);
    }
  }
}

/*********************************************************************
*********************************************************************/

