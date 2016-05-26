/* --COPYRIGHT--,BSD
 * Copyright (c) 2013, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * --/COPYRIGHT--*/

#include "grlib.h"

//*****************************************************************************
//
//! \addtogroup image_api
//! @{
//
//*****************************************************************************

//*****************************************************************************
//
// The buffer that holds the converted palette of the image to be drawn. This
// buffer contains the actual data to be written to the LCD after translation.
//
//*****************************************************************************
static uint16_t g_pulConvertedPalette[256];


//*****************************************************************************
//
//! Converts the bitmap image palette.
//!
//! \param pContext is a pointer to the drawing context to use.
//! \param pBitmap is a pointer to the image.
//!
//! This function converts the palette of a bitmap image. The image palette is in
//! 24 bit RGB form, and this function converts that to a format to be sent to the
//! LCD using DpyColorTranslate function. The converted palette is contained in a
//! global buffer while the original image palette remains unchanged.
//!
//! \return is the address of the global buffer containing the converted palette.
//
//*****************************************************************************
uint16_t * GrPaletteConversion(const tContext *pContext, const tImage *  pBitmap)
{  
  if (pBitmap->NumColors > 256) 
  {
    return 0;
  }
  
  int16_t i;
  int16_t NumColors = pBitmap->NumColors;
  const uint32_t  * pulPalette = &pBitmap->pPalette[0];
  for (i = 0; i < NumColors; i++) 
  {
    g_pulConvertedPalette[i] = DpyColorTranslate(pContext->pDisplay, *(pulPalette + i));
  }
  return &g_pulConvertedPalette[0];
}

//*****************************************************************************
//
//! Draws a bitmap image.
//!
//! \param pContext is a pointer to the drawing context to use.
//! \param pucImage is a pointer to the image to draw.
//! \param lX is the X coordinate of the upper left corner of the image.
//! \param lY is the Y coordinate of the upper left corner of the image.
//!
//! This function draws a bitmap image.  The image may be 1 bit per pixel, 4
//! bits per pixel or 8 bits per pixel (using a palette supplied in the image 
//! data).  It can be uncompressed data, or it can be compressed using 
//! several different compression types. Compression options are 4-bit run
//! length encoding, 8-bit run length encoding, and a custom run length encoding
//! variation written for complex 8-bit per pixel images.
//!
//! \return None.
//
//*****************************************************************************
void
GrImageDraw(const tContext *pContext, const tImage *pBitmap, int16_t lX,
            int16_t lY)
{
    int16_t lBPP, lWidth, lHeight, lX0, lX1, lX2;
    const uint16_t *pucPalette;
    const uint8_t * pucImage;

    //
    // Check the arguments.
    //
    assert(pContext);
    assert(pBitmap);

    //
    // Get the image format from the image data.
    //
    lBPP = pBitmap->BPP;

    //
    // Get the image width from the image data.
    //
    lWidth = pBitmap->XSize;


    //
    // Get the image height from the image data.
    //
    lHeight = pBitmap->YSize;

    //
    // Return without doing anything if the entire image lies outside the
    // current clipping region.
    //
    if((lX > pContext->sClipRegion.sXMax) ||
       ((lX + lWidth - 1) < pContext->sClipRegion.sXMin) ||
       (lY > pContext->sClipRegion.sYMax) ||
       ((lY + lHeight - 1) < pContext->sClipRegion.sYMin))
    {
        return;
    }

    //
    // Get the starting X offset within the image based on the current clipping
    // region.
    //
    if(lX < pContext->sClipRegion.sXMin)
    {
        lX0 = pContext->sClipRegion.sXMin - lX;
    }
    else
    {
        lX0 = 0;
    }

    //
    // Get the ending X offset within the image based on the current clipping
    // region.
    //
    if((lX + lWidth - 1) > pContext->sClipRegion.sXMax)
    {
        lX2 = pContext->sClipRegion.sXMax - lX;
    }
    else
    {
        lX2 = lWidth - 1;
    }

    //
    // Reduce the height of the image, if required, based on the current
    // clipping region.
    //
    if((lY + lHeight - 1) > pContext->sClipRegion.sYMax)
    {
        lHeight = pContext->sClipRegion.sYMax - lY + 1;
    }

    //
    // The image palette is in 24 bit R-G-B format. The palette needs
    // to be translated into the color format accepted by the LCD 
    // and stored in g_pulConvertedPalette[] buffer
    //
    pucPalette = GrPaletteConversion(pContext, pBitmap); 
    pucImage = pBitmap->pPixel;
    
    //
    // Check if the image is not compressed.
    //
    if(!(lBPP & 0xF0))
    {
        //
        // The image is not compressed.  See if the top portion of the image
        // lies above the clipping region.
        //
        if(lY < pContext->sClipRegion.sYMin)
        {
            //
            // Determine the number of rows that lie above the clipping region.
            //
            lX1 = pContext->sClipRegion.sYMin - lY;

            //
            // Skip past the data for the rows that lie above the clipping
            // region.
            //
            pucImage += (((lWidth * lBPP) + 7) / 8) * lX1;

            //
            // Decrement the image height by the number of skipped rows.
            //
            lHeight -= lX1;

            //
            // Increment the starting Y coordinate by the number of skipped
            // rows.
            //
            lY += lX1;
        }
        
        while(lHeight--)
        {
          //
          // Draw this row of image pixels.
          //
          DpyPixelDrawMultiple(pContext->pDisplay, lX + lX0, lY, lX0 & 7,
                               lX2 - lX0 + 1, lBPP,
                               pucImage + ((lX0 * lBPP) / 8), pucPalette);
          
          //
          // Skip past the data for this row.
          //
          pucImage += ((lWidth * lBPP) + 7) / 8;
          
          //
          // Increment the Y coordinate.
          //
          lY++;
        }
    }
    else
        {
           //
           // The image is compressed with RLE4 or RLE8 Algorithm
           //

          const uint8_t *pucData = pucImage;
          uint8_t ucRunLength, ucTempRun;
          uint8_t ucNoOverrun = 1;
          uint16_t uiColor;
          uint16_t uiLineCnt = 0;
          uint16_t lXS = lX;

           lBPP &= 0x0F;

           while(lHeight--)
           {
             //
             // Draw this row of image pixels.
             //
             while(uiLineCnt < lWidth)
             {
               if(ucNoOverrun)      // Read next byte
               {
                 if(lBPP == 8)      // RLE 8 bit encoding
                 {
                   // Read Run Length
                   ucRunLength = *pucData++;
                   // Read Color Pointer
                   uiColor = *pucData++;
                 }
                 else     // lBPP = 4; RLE 4 bit encoding
                 {

                   // Read Run Length
                   ucRunLength = (*pucData) >> 4;
                   // Read Color Pointer
                   uiColor = (*pucData++) & 0x0F;
                 }
                 uiColor = (*(uint16_t *)(pucPalette + uiColor));

               }
               else
               {
                 //Last line run overran the edge
                 //Skip color and run length update and clear overrun flag
                 ucNoOverrun = 1;
                 ucRunLength = ucTempRun;
               }

               //After original value, but it still needs to be written once
               if((ucRunLength + uiLineCnt) >= lWidth)
               {
                 //Run length runs past current line

                 //Set left over run length for next line to ucTempRun
                 ucTempRun = ucRunLength - (lWidth - uiLineCnt);
                 //Set ucRunLength to finish this line
                 ucRunLength = (lWidth - uiLineCnt);
                 //Set line overrun flag
                 ucNoOverrun = 0;
               }

               //Draw single pixel
               DpyPixelDraw(pContext->pDisplay, lX, lY, uiColor);
			   lX++;

               uiLineCnt++;

               while(ucRunLength--)
               {
                 //Draw run of pixels
            	DpyPixelDraw(pContext->pDisplay, lX, lY, uiColor);

				lX++;

				uiLineCnt++;
               }
             }
             //End of line reached
             uiLineCnt = 0;   //Reset Pixel Count
             lY++;            //Increment Y value
             lX = lXS;
           }
       }
}

//*****************************************************************************
//
// Close the Doxygen group.
//! @}
//
//*****************************************************************************
