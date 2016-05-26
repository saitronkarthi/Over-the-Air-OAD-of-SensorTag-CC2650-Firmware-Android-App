/*******************************************************************************
  Filename:       SensorTag_ConnCtrl.c
  Revised:        $Date: 2013-08-23 20:45:31 +0200 (fr, 23 aug 2013) $
  Revision:       $Revision: 35100 $

  Description:    This file contains the Sensor Tag sample application,
                  Connection Control, for use with the TI Bluetooth Low 
                  Energy Protocol Stack.

  Copyright 2014 - 2015 Texas Instruments Incorporated. All rights reserved.

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

#ifdef FEATURE_OAD

/*******************************************************************************
 * INCLUDES
 */
#include "gatt.h"
#include "gattservapp.h"
#include "SensorTag_ConnCtrl.h"
#include "ccservice.h"

#include "Board.h"
#include "peripheral.h"

#include <ti/sysbios/knl/Semaphore.h>

/*******************************************************************************
 * MACROS
 */

/*******************************************************************************
 * CONSTANTS
 */

/*******************************************************************************
 * TYPEDEFS
 */

/*******************************************************************************
 * GLOBAL VARIABLES
 */

/*******************************************************************************
 * EXTERNAL VARIABLES
 */

/*******************************************************************************
 * EXTERNAL FUNCTIONS
 */

/*******************************************************************************
 * LOCAL VARIABLES
 */

/*******************************************************************************
 * LOCAL FUNCTIONS
 */
static void ccChangeCB( uint8_t newParamID);

/*******************************************************************************
 * PROFILE CALLBACKS
 */
static ccCBs_t sensorTag_ccCBs =
{
  ccChangeCB,               // Characteristic value change callback
};


/*******************************************************************************
 * PUBLIC FUNCTIONS
 */

/*******************************************************************************
 * @fn      SensorTagConnectionControl_init
 *
 * @brief   Initialization function for the SensorTag keys
 *
 */
void SensorTagConnectionControl_init(void)
{
  // Add service
  CcService_addService();
  CcService_registerAppCBs(&sensorTag_ccCBs);
}

/*******************************************************************************
 * @fn      SensorTagConnectionControl_update
 *
 * @brief   Update the Connection Control service with the current connection
 *          control settings
 *
 */
void SensorTagConnectionControl_update(void)
{
  uint8_t buf[CCSERVICE_CHAR1_LEN];
  uint16_t connInterval;
  uint16_t connSlaveLatency;
  uint16_t connTimeout; 
  
  // Get the connection control data
  GAPRole_GetParameter(GAPROLE_CONN_INTERVAL, &connInterval);
  GAPRole_GetParameter(GAPROLE_SLAVE_LATENCY, &connSlaveLatency);
  GAPRole_GetParameter(GAPROLE_CONN_TIMEOUT, &connTimeout);

  buf[0] = LO_UINT16(connInterval);
  buf[1] = HI_UINT16(connInterval);
  buf[2] = LO_UINT16(connSlaveLatency);
  buf[3] = HI_UINT16(connSlaveLatency);
  buf[4] = LO_UINT16(connTimeout);
  buf[5] = HI_UINT16(connTimeout);

  CcService_setParameter(CCSERVICE_CHAR1,sizeof(buf),buf);
}

/*******************************************************************************
 * @fn      SensorTagConnControl_processCharChangeEvt
 *
 * @brief   Process a change in the connection control characteristics
 *
 * @return  none
 */
void SensorTagConnControl_processCharChangeEvt(uint8_t paramID)
{
  // CCSERVICE_CHAR1: read & notify only
  
  // CCSERVICE_CHAR: requested connection parameters
  if (paramID == CCSERVICE_CHAR2)
  {
    uint8_t buf[CCSERVICE_CHAR2_LEN];
    
    // Get new connection parameters
    CcService_getParameter( CCSERVICE_CHAR2, buf);
    
    // Update connection parameters
    GAPRole_SendUpdateParam( BUILD_UINT16(buf[0],buf[1]), 
                            BUILD_UINT16(buf[2],buf[3]), // minConnInterval, maxConnInterval
                            BUILD_UINT16(buf[4],buf[5]), 
                            BUILD_UINT16(buf[6],buf[7]),  // slaveLatency, timeoutMultiplier
                            GAPROLE_TERMINATE_LINK);
  }
  // CCSERVICE_CHAR3: Disconnect request
  else if (paramID == CCSERVICE_CHAR3)
  {
    // Any change in the value will terminate the connection
    GAPRole_TerminateConnection();
  }
}

/*******************************************************************************
 * @fn      SensorTagConnControl_paramUpdateCB
 *
 * @brief   Called when connection parameters are updates
 *
 * @param   connInterval - new connection interval
 *
 * @param   connSlaveLatency - new slave latency
 *
 * @param   connTimeout - new connection timeout
 *
 * @return  none
*/
void SensorTagConnControl_paramUpdateCB(uint16_t connInterval, 
                      uint16_t connSlaveLatency, uint16_t connTimeout)
{
  uint8_t buf[CCSERVICE_CHAR1_LEN];

  buf[0] = LO_UINT16(connInterval);
  buf[1] = HI_UINT16(connInterval);
  buf[2] = LO_UINT16(connSlaveLatency);
  buf[3] = HI_UINT16(connSlaveLatency);
  buf[4] = LO_UINT16(connTimeout);
  buf[5] = HI_UINT16(connTimeout);

  CcService_setParameter(CCSERVICE_CHAR1,sizeof(buf),buf);
}

/*******************************************************************************
* Private functions
*/

/*******************************************************************************
 * @fn      ccChangeCB
 *
 * @brief   Callback from Connection Control indicating a value change
 *
 * @param   paramID - parameter ID of the value that was changed.
 *
 * @return  none
 */
static void ccChangeCB(uint8_t paramID)
{
  // Wake up the application thread
  SensorTag_charValueChangeCB(SERVICE_ID_CC, paramID);
}


/*******************************************************************************
*******************************************************************************/

#endif
