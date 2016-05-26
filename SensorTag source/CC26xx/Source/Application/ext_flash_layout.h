/*******************************************************************************
  Filename:       ext_flash_layout.h
  Revised:        $Date: 2010-08-06 08:56:11 -0700 (Fri, 06 Aug 2010) $
  Revision:       $Revision: 23333 $

  Description:    Contains a layout plan for the external flash of the SensorTag

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

#ifndef EXT_FLASH_LAYOUT_H
#define EXT_FLASH_LAYOUT_H

// Base loader start address (internal flash)
#define BL_OFFSET                   0x1F001

// Page size
#define EFL_PAGE_SIZE               0x1000
#define EFL_FLASH_SIZE              0x80000

// Image mirror (used during OAD)
#define EFL_ADDR_IMAGE_MIRROR			  0x00000
#define EFL_SIZE_IMAGE_MIRROR			  0x20000

// Recovery (factory reset)
#define EFL_ADDR_RECOVERY   			  0x20000
#define EFL_SIZE_RECOVERY					  0x20000

// Unreserved (for user applications)
#define EFL_ADDR_USER							  0x40000
#define EFL_SIZE_USER							  0x20000

// Image information (meta-data)
#define EFL_ADDR_META							  0x78000
#define EFL_SIZE_META							  0x08000

#define EFL_IMAGE_INFO_ADDR_APP     ( EFL_ADDR_META + 0x0000 )
#define EFL_IMAGE_INFO_ADDR_STACK   ( EFL_ADDR_META + 0x1000 )
#define EFL_IMAGE_INFO_ADDR_BIM     ( EFL_ADDR_META + 0x2000 )
#define EFL_IMAGE_INFO_ADDR_FACTORY ( EFL_ADDR_META + 0x3000 )

// Image types
#define EFL_OAD_IMG_TYPE_APP			  1
#define EFL_OAD_IMG_TYPE_STACK	  	2
#define EFL_OAD_IMG_TYPE_BIM		    3
#define EFL_OAD_IMG_TYPE_FACTORY    4

// Address/length resolution
#define EFL_OAD_ADDR_RESOLUTION     4

typedef struct 
{
  uint16_t crc[2];     // crc[0] calculated by OAD client before transfer
	                     // crc[1] calculated from flash after transfer
  uint16_t ver;        // Version number
  uint16_t len;        // Image length in 4-byte blocks (OAD_ADDR_RESOLUTION)
  uint8_t uid[4];      // User-defined Image Identification bytes
  uint16_t addr;       // Address offset in 4-byte blocks (OAD_ADDR_RESOLUTION)
	uint16_t imgType;    // BIM, APP, STACK
} ExtImageInfo_t;

#endif /* EXT_FLASH_LAYOUT_H */
