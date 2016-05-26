/*******************************************************************************
*  File name:      devpk_lcd.h
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
#ifndef _DEVPK_LCD_H_
#define _DEVPK_LCD_H_
/* -----------------------------------------------------------------------------
*                                          Includes
* ------------------------------------------------------------------------------
*/
#include <stdbool.h>

/* -----------------------------------------------------------------------------
*                                          Constants
* ------------------------------------------------------------------------------
*/
#define DEVPK_LCD_POWER_OFF     0
#define DEVPK_LCD_POWER_ON      1

#define DEVPK_LCD_BLANK_LINE    "                " // 16 positions

/* -----------------------------------------------------------------------------
*                                          Functions
* ------------------------------------------------------------------------------
*/
bool devpkLcdOpen(void);
bool devpkLcdPower(uint8_t state);
bool devpkLcdClear(void);
bool devpkLcdClearLine(uint8_t line);
bool devpkLcdText(const char *str, uint8_t line, uint8_t col);
bool devpkLcdImage(const uint8_t *pAddr);
bool devpkLcdInvert(void);
void devpkLcdClose(void);
void devpkLcdSelect(bool select);

#endif
