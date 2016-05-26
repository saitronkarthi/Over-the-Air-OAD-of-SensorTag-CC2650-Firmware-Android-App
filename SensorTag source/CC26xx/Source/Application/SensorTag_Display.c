/*******************************************************************************
  Filename:       SensorTagDisplay.c
  Revised:        $Date: 2013-08-23 20:45:31 +0200 (fr, 23 aug 2013) $
  Revision:       $Revision: 35100 $

  Description:    This file contains the Sensor Tag sample application,
                  LCD DevPack support.

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
#include "SensorTag.h"
#include "SensorTag_Display.h"
#include "displayservice.h"
#include "sensor.h"
#include "devpk_lcd.h"
#include "devinfoservice.h"
#include "stdio.h"

// DriverLib
#include <driverlib/aon_batmon.h>

/*********************************************************************
 * MACROS
 */

/*********************************************************************
 * CONSTANTS
 */

/*********************************************************************
 * TYPEDEFS
 */
typedef struct
{
  uint8_t line;
  uint8_t column;
} CursorPos_t;

/*********************************************************************
 * GLOBAL VARIABLES
 */

/*********************************************************************
 * EXTERNAL VARIABLES
 */

/*********************************************************************
 * EXTERNAL FUNCTIONS
 */
extern char *Util_convertBdAddr2Str(uint8_t *pAddr);

/*********************************************************************
 * LOCAL VARIABLES
 */
static CursorPos_t pos;

/*********************************************************************
 * LOCAL FUNCTIONS
 */
static void displayChangeCB(uint8_t newParamID);

/*********************************************************************
 * PROFILE CALLBACKS
 */
static sensorCBs_t sensorTag_displayCBs =
{
  displayChangeCB,               // Characteristic value change callback
};


/*********************************************************************
 * PUBLIC FUNCTIONS
 */

/*********************************************************************
 * @fn      SensorTagDisplay_init
 *
 * @brief   Initialization function for the SensorTag Display
 *
 */
void SensorTagDisplay_init(void)
{
  uint8_t config[DISPLAY_CONF_LEN];
  
  // Add service
  Display_addService();
  Display_registerAppCBs(&sensorTag_displayCBs);

  // Initialize the module state variables
  Display_getParameter(DISPLAY_CONF,config);
  
  // Store active "cursor" position
  pos.line = config[1];
  pos.column = config[2];
  
  // Initialize LCD
  devpkLcdOpen();
}


/*********************************************************************
 * @fn      SensorTagDisplay_processCharChangeEvt
 *
 * @brief   Process a change in the IO characteristics
 *
 * @return  none
 */
void SensorTagDisplay_processCharChangeEvt(uint8_t paramID)
{
  if (paramID == DISPLAY_CONF)
  {
    uint8_t config[DISPLAY_CONF_LEN];

    Display_getParameter(DISPLAY_CONF,config);
    
    // Execute the control sequence
    switch (config[0])
    {
    case DISPLAY_CONF_OFF:
      devpkLcdPower(DEVPK_LCD_POWER_OFF);
      break;
      
    case DISPLAY_CONF_ON:
      devpkLcdPower(DEVPK_LCD_POWER_ON);
      break;
      
    case DISPLAY_CONF_CLR:
      // Clear display
      devpkLcdClear();
      break;
      
    case DISPLAY_CONF_CLR_LINE:
      // Clear display
      pos.line = config[1];
      devpkLcdClearLine(pos.line);
      break;
    
    case DISPLAY_CONF_INV:
      devpkLcdInvert();
      SensorTag_displayStatus("Connected");
      break;
      
    case DISPLAY_CONF_MOV:
      // Store active "cursor" position
      pos.line = config[1];
      pos.column = config[2];
      break;
      
    default:
      break;
    }
  } 
  
  if (paramID == DISPLAY_DATA)
  {
    uint8_t data[DISPLAY_DATA_LEN];
    
    Display_getParameter(DISPLAY_DATA, data);
    LCD_WRITE_STRING((const char*)data, pos.line, pos.column);
  }
}

/*******************************************************************************
 * @fn      SensorTag_displayStatus
 *
 * @brief   Display main status parameters on the display. 
 *
 *          - device name
 *          - device address
 *          - firmware revision
 *          - connection status
 *
 * @param   gapStatus - connection status
 *
 * @return  none
 */
void SensorTag_displayStatus(const char *strStatus)
{
  uint8_t buf[24];
  
  // Line 0: device info
  DevInfo_GetParameter(DEVINFO_MODEL_NUMBER, buf);
  devpkLcdText((const char*)buf, 0, 0);

  // Line 1: board address
  GAPRole_GetParameter(GAPROLE_BD_ADDR, buf);
  devpkLcdText(Util_convertBdAddr2Str(buf), 1, 1);
  
  // Line 2: firmware revision
  DevInfo_GetParameter(DEVINFO_FIRMWARE_REV, buf);
  devpkLcdText("FW rev.", 2,1);
  devpkLcdText((const char*)buf, 2, 11);

  // Line 10: battery level (clear)
  devpkLcdClearLine(10);
  
  // Line 11: GAP connection status
  devpkLcdClearLine(11);
  devpkLcdText(strStatus, 11, 2);
}


/*******************************************************************************
 * @fn      SensorTag_displayBatteryVoltage
 *
 * @brief   Display the battery voltage in millivolts
 *
 * @param   gapStatus - connection status
 *
 * @return  none
 */
void SensorTag_displayBatteryVoltage(void)
{
  char buf[24];
  uint32_t batt;
  
  // Battery monitor (bit 10:8 - integer, but 7:0 fraction)
  batt = AONBatMonBatteryVoltageGet();
  
  batt = (batt * 125) >> 5;
  sprintf(buf,"Batt: %d mV", batt);
  devpkLcdText(buf, 10, 1);
}

/*******************************************************************************
* Private functions
*/

/*******************************************************************************
 * @fn      displayChangeCB
 *
 * @brief   Callback from IO service indicating a value change
 *
 * @param   paramID - parameter ID of the value that was changed.
 *
 * @return  none
 */
static void displayChangeCB( uint8_t newParamID )
{
  // Wake up the application thread
  SensorTag_charValueChangeCB(SERVICE_ID_DISPLAY, newParamID);
}



/*******************************************************************************
*******************************************************************************/

