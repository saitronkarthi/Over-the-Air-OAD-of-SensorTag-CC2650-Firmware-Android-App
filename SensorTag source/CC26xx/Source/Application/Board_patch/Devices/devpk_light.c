/*******************************************************************************
*  File name:      devpk_light.c
*  Revised:        $Date: 2015-03-07 10:33:11 +0100 (fr, 07 mar 2015) $
*  Revision:       $Revision: 12329 $
*
*  Description:    Simple wrapper for LED light DevPack
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

// TI RTOS drivers
#include <ti/sysbios/BIOS.h>
#include <ti/drivers/PIN.h>
#include <ti/sysbios/family/arm/cc26xx/Power.h>
#include <ti/sysbios/family/arm/cc26xx/PowerCC2650.h>
#include "Board.h"

// Temporary PWM solution directly on DriverLib
// (until a Timer RTOS driver is in place)
#include <ti/drivers/PIN/PINCC26XX.h>
#include <driverLib/timer.h>

#include "devpk_light.h"

/* -----------------------------------------------------------------------------
*                           Constants and macros
* ------------------------------------------------------------------------------
*/
#define PWM_DIV_FACTOR      256
#define TIMER_LOADSET       (PWM_DIV_FACTOR-1)

/* -----------------------------------------------------------------------------
*                           Type definitions
* ------------------------------------------------------------------------------
*/
/* -----------------------------------------------------------------------------
*                           Local variables
* ------------------------------------------------------------------------------
*/
static PIN_Config BoardLightPinTable[] =
{
    Board_DEVPK_LIGHT_BLUE | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_DEVPK_LIGHT_RED | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_DEVPK_LIGHT_GREEN | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_DEVPK_LIGHT_WHITE | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,

    PIN_TERMINATE
};

static PIN_Handle hPin = NULL;
static PIN_State pinState;

/* -----------------------------------------------------------------------------
*                           Private Functions
* ------------------------------------------------------------------------------
*/

/* -----------------------------------------------------------------------------
*                           Public Functions
* ------------------------------------------------------------------------------
*/

/*******************************************************************************
 * @fn          devpkLightOpen
 *
 * @brief       Initialize the Light DevPack
 *
 * @descr       Initializes the pins used by the LED Light DevPack
 *
 * @return      true if success
 */
bool devpkLightOpen(void)
{
  hPin = PIN_open(&pinState, BoardLightPinTable);

   // Turn on PERIPH power domain and clock for GPT0 and GPT1
  Power_setDependency(PERIPH_GPT0);
  Power_setDependency(PERIPH_GPT1);

  // Assign GPT0 to blue and green LED
  TimerConfigure(GPT0_BASE, TIMER_CFG_SPLIT_PAIR|TIMER_CFG_A_PWM|TIMER_CFG_B_PWM);
  TimerLoadSet(GPT0_BASE, TIMER_BOTH, TIMER_LOADSET);

  // Assign GPT1 to red and white LED
  TimerConfigure(GPT1_BASE, TIMER_CFG_SPLIT_PAIR|TIMER_CFG_A_PWM|TIMER_CFG_B_PWM);
  TimerLoadSet(GPT1_BASE, TIMER_BOTH, TIMER_LOADSET);

  return hPin != 0;
}


/*******************************************************************************
 * @fn          devpkSetLight
 *
 * @brief       Set the intensity value of a light
 *
 * @return      true if success
 */
bool devpkSetLight(uint8_t id, uint8_t intensity)
{
  if (hPin != 0)
  {

    if (intensity > 0)
    {
      // Configure pin for PWM output
      switch (id)
      {
      case Board_DEVPK_LIGHT_BLUE:
        TimerDisable(GPT0_BASE, TIMER_A);
        PINCC26XX_setMux(hPin, id, IOC_PORT_MCU_PORT_EVENT0);
        TimerMatchSet(GPT0_BASE, TIMER_A, TIMER_LOADSET - intensity);
        TimerEnable(GPT0_BASE, TIMER_A);
        break;

      case Board_DEVPK_LIGHT_GREEN:
        TimerDisable(GPT0_BASE, TIMER_B);
        PINCC26XX_setMux(hPin, id, IOC_PORT_MCU_PORT_EVENT1);
        TimerMatchSet(GPT0_BASE, TIMER_B, TIMER_LOADSET - intensity);
        TimerEnable(GPT0_BASE, TIMER_B);
        break;

      case Board_DEVPK_LIGHT_WHITE:
        TimerDisable(GPT1_BASE, TIMER_A);
        PINCC26XX_setMux(hPin, id, IOC_PORT_MCU_PORT_EVENT2);
        TimerMatchSet(GPT1_BASE, TIMER_A, TIMER_LOADSET - intensity);
        TimerEnable(GPT1_BASE, TIMER_A);
        break;

      case Board_DEVPK_LIGHT_RED:
        TimerDisable(GPT1_BASE, TIMER_B);
        PINCC26XX_setMux(hPin, id, IOC_PORT_MCU_PORT_EVENT3);
        TimerMatchSet(GPT1_BASE, TIMER_B, TIMER_LOADSET - intensity);
        TimerEnable(GPT1_BASE, TIMER_B);
        break;

      default:
        break;
      }
    }
    else
    {
      // Configure pin as GPIO
      PINCC26XX_setMux(hPin, id, IOC_PORT_GPIO);
    }
  }

  return hPin != 0;
}

/*******************************************************************************
 * @fn          devpkLightClose
 *
 * @brief       Closes the LED Light interface
 *
 * @return      true if success
 */
void devpkLightClose(void)
{
  if (hPin != NULL)
  {
    // Turn off PERIPH power domain and clock for GPT0 and GPT1
    Power_releaseDependency(PERIPH_GPT0);
    Power_releaseDependency(PERIPH_GPT1);

    PIN_close(hPin);
    hPin = NULL;
  }
}
