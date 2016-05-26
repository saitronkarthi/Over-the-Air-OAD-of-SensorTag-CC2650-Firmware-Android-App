/*******************************************************************************
*  File name:      devpk_lcd.c
*  Revised:        $Date: 2015-03-07 10:33:11 +0100 (fr, 07 mar 2015) $
*  Revision:       $Revision: 12329 $
*
*  Description:    Simple wrapper for Sharp LCD display.
*
*  Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
*
*
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions
*  are met:
*
*    Redistributions of source code must retain the above copyright
*    notice, this list of conditions and the following disclaimer.
*
*    Redistributions in binary form must reproduce the above copyright
*    notice, this list of conditions and the following disclaimer in the
*    documentation and/or other materials provided with the distribution.
*
*    Neither the name of Texas Instruments Incorporated nor the names of
*    its contributors may be used to endorse or promote products derived
*    from this software without specific prior written permission.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*******************************************************************************/

/* -----------------------------------------------------------------------------
*                           Includes
* ------------------------------------------------------------------------------
*/
#include "bsp_spi.h"
#include "grlib.h"
#include "Sharp96x96.h"

// TI RTOS drivers
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/drivers/PIN.h>
#include "Board.h"

#include "devpk_lcd.h"

/* -----------------------------------------------------------------------------
*                           Constants and macros
* ------------------------------------------------------------------------------
*/
#define delay_ms(i) ( CPUdelay(8000*(i)) )

// Defining the LCD with 6x8 font, 16 columns and 12 lines
#define CHAR_WIDTH           6
#define CHAR_HEIGHT          8

// LCD DevPack
#define Board_DEVPK_LCD_EXTCOMIN    IOID_22
#define Board_DEVPK_LCD_EXTMODE     IOID_28
#define Board_DEVPK_LCD_DISP        IOID_29


/* -----------------------------------------------------------------------------
*                           Type definitions
* ------------------------------------------------------------------------------
*/
typedef struct
{
  uint32_t fg;
  uint32_t bg;
} DisplayColor_t;

/* -----------------------------------------------------------------------------
*                           Local variables
* ------------------------------------------------------------------------------
*/
static PIN_Config BoardDevpackLCDPinTable[] =
{
    Board_SPI_DEVPK_CS | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MIN,       /* DevPack chip select */
    Board_DEVPK_LCD_EXTCOMIN | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MIN, /* LCD */
    Board_DEVPK_LCD_EXTMODE | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MIN,  /* LCD */
    Board_DEVPK_LCD_DISP | PIN_GPIO_OUTPUT_EN | PIN_GPIO_HIGH | PIN_PUSHPULL | PIN_DRVSTR_MIN,    /* LCD */

    PIN_TERMINATE
};

// Pin configuration
static PIN_Handle hLcdPin = NULL;
static PIN_State pinState;

// Graphics library
static tContext g_sContext;
static DisplayColor_t display;

// Access control
static Semaphore_Struct semLCD;
static Semaphore_Handle hSemLCD;
static Semaphore_Params semParamsLCD;

/* -----------------------------------------------------------------------------
*                                          Functions
* ------------------------------------------------------------------------------
*/
/*******************************************************************************
 * @fn          devpkLcdOpen
 *
 * @brief       Initialize the LCD
 *
 * @descr       Initializes the pins used by the LCD, creates resource access
 *              protection semaphore, turns on the LCD device, initializes the
 *              frame buffer, initializes to white background/dark foreground,
 *              and finally clears the display.
 *
 * @return      true if success
 */
bool devpkLcdOpen(void)
{
  hLcdPin = PIN_open(&pinState, BoardDevpackLCDPinTable);

  if (hLcdPin != 0)
  {
    display.bg = ClrBlack;
    display.fg = ClrWhite;

    // Open the SPI driver
    bspSpiOpen();

    // Exclusive access
    Semaphore_Params_init(&semParamsLCD);
    semParamsLCD.mode = Semaphore_Mode_BINARY;
    Semaphore_construct(&semLCD, 1, &semParamsLCD);
    hSemLCD = Semaphore_handle(&semLCD);

    // Turn on the display
    PIN_setOutputValue(hLcdPin,Board_DEVPK_LCD_DISP,1);

    // Graphics library init
    GrContextInit(&g_sContext, &g_sharp96x96LCD);

    // Graphics properties
    GrContextForegroundSet(&g_sContext, display.fg);
    GrContextBackgroundSet(&g_sContext, display.bg);
    GrContextFontSet(&g_sContext, &g_sFontFixed6x8);

    // Clear display
    GrClearDisplay(&g_sContext);
    GrFlush(&g_sContext);
  }

  return hLcdPin != 0;
}


/*******************************************************************************
 * @fn          devpkLcdPower
 *
 * @brief       Enables/disables the display
 *
 * @return      true if success
 */
bool devpkLcdPower(uint8_t state)
{
  bool ret;

  if (hLcdPin != NULL &&
      (state == DEVPK_LCD_POWER_OFF | state == DEVPK_LCD_POWER_ON))
  {
    PIN_setOutputValue(hLcdPin, Board_DEVPK_LCD_DISP, state);
    ret = true;
  }
  else
  {
    ret = false;
  }

  return ret;
}

/*******************************************************************************
 * @fn          devpkLcdInvert
 *
 * @brief       Inverts the foreground and background colours
 *
 * @return      true if success
 */
bool devpkLcdInvert(void)
{
  if (hLcdPin != NULL)
  {
    uint32_t tmp;

    // Swap background and foreground
    tmp = display.fg;
    display.fg = display.bg;
    display.bg = tmp;

    GrContextForegroundSet(&g_sContext, display.fg);
    GrContextBackgroundSet(&g_sContext, display.bg);
    GrClearDisplay(&g_sContext);

    GrFlush(&g_sContext);
  }

  return hLcdPin != 0;
}

/*******************************************************************************
 * @fn          devpkLcdClear
 *
 * @brief       Clears the display
 *
 * @return      true if success
 */
bool devpkLcdClear(void)
{
  if (hLcdPin != NULL)
  {
    GrClearDisplay(&g_sContext);
    GrFlush(&g_sContext);
  }

  return hLcdPin != 0;
}

/*******************************************************************************
 * @fn          devpkLcdClearLine
 *
 * @brief       Clears line 'n of the display
 *
 * @param       line - line index (0 .. 11)
 *
 * @return      true if success
 */
bool devpkLcdClearLine(uint8_t line)
{
  return devpkLcdText(DEVPK_LCD_BLANK_LINE, line, 0);
}

/*******************************************************************************
 * @fn          devpkLcdText
 *
 * @brief       Write a text string to a specific line/column of the display
 *
 * @param       str - text to apply
 * @param       line - line index (0 .. 11)
 * @param       col - column index (0 .. 15)
 *
 * @return      true if success
 */
bool devpkLcdText(const char *str, uint8_t line, uint8_t col)
{
  if (hLcdPin != NULL)
  {
    uint8_t xp, yp;

    Semaphore_pend(hSemLCD, BIOS_WAIT_FOREVER);

    xp = col * CHAR_WIDTH + 1;
    yp = line * CHAR_HEIGHT + 0;

    // Draw a text on the display
    GrStringDraw(&g_sContext,
                 str,
                 AUTO_STRING_LENGTH,
                 xp,
                 yp,
                 OPAQUE_TEXT);

    GrFlush(&g_sContext);

    Semaphore_post(hSemLCD);
  }

  return hLcdPin != NULL;
}

/*******************************************************************************
 * @fn          devpkLcdImage
 *
 * @brief       Write an image to the display
 *
 * @param       pAddr - address of the image in internal flash or RAM
 *
 * @return      true if success
 */
bool devpkLcdImage(const uint8_t *pAddr)
{
  if (hLcdPin != NULL)
  {
    // TBD: Future implementation
  }

  return hLcdPin != NULL;
}

/*******************************************************************************
 * @fn          devpkLcdClose
 *
 * @brief       Turns of the display and releases the LCD control pins
 *
 * @return      true if success
 */
void devpkLcdClose(void)
{
  if (hLcdPin != NULL)
  {
    // Turn off the display
    PIN_setOutputValue(hLcdPin,Board_DEVPK_LCD_DISP,0);

    PIN_close(hLcdPin);
    hLcdPin = NULL;

    bspSpiClose();
  }
}

/*******************************************************************************
 * @fn          devpkLcdSelect
 *
 * @brief       Select/deselect the DevPack on the SensorTag
 *              (this function is called from GrLib only)
 *
 * @param       select - true to select, false to deselect
 *
 * @return      none
 */
void devpkLcdSelect(bool select)
{
  if (select)
  {
    PIN_setOutputValue(hLcdPin,Board_SPI_DEVPK_CS,Board_DEVPK_CS_ON);
  }
  else
  {
    PIN_setOutputValue(hLcdPin,Board_SPI_DEVPK_CS,Board_DEVPK_CS_OFF);
  }
}
