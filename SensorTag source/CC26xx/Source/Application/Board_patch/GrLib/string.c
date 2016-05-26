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
//! \addtogroup string_api
//! @{
//
//*****************************************************************************

//*****************************************************************************
//
// The character printed by GrStringDraw in place of any character in the
// string which does not appear in the font.  When using a font which does not
// include this character, a space is left instead.
//
//*****************************************************************************
#define ABSENT_CHAR_REPLACEMENT '.'

//*****************************************************************************
//
// Counts the number of zeros at the start of a word.  This macro uses
// compiler-specific constructs to perform an inline insertion of the "clz"
// instruction, which counts the leading zeros directly.
//
//*****************************************************************************
int16_t NumLeadingZeros(int32_t  x)
{
  int32_t  y = 0x80, count =0;
  int32_t  i;
  for (i=0; i< 32; i++)
  {
    if (0x00 != (x & y ))
      break;
    count++;
    y = y >> 1;
  }    
   return count;
}
//*****************************************************************************
//
//! Determines the width of a string.
//!
//! \param pContext is a pointer to the drawing context to use.
//! \param pcString is the string in question.
//! \param lLength is the length of the string.
//!
//! This function determines the width of a string (or portion of the string)
//! when drawn with a particular font.  The \e lLength parameter allows a
//! portion of the string to be examined without having to insert a NULL
//! character at the stopping point (would not be possible if the string was
//! located in flash); specifying a length of -1 will cause the width of the
//! entire string to be computed.
//!
//! \return Returns the width of the string in pixels.
//
//*****************************************************************************
int32_t 
GrStringWidthGet(const tContext *pContext, const char *pcString, int32_t  lLength)
{
    const uint16_t *pusOffset;
    const uint8_t *pucData;
    uint8_t ucFirst, ucLast, ucAbsent;
    int32_t  lWidth;

    //
    // Check the arguments.
    //
    assert(pContext);
    assert(pcString);

    //
    // Get some pointers to relevant information in the font to make things
    // easier, and give the compiler a hint about extraneous loads that it can
    // avoid.
    //
    if(pContext->pFont->ucFormat & FONT_EX_MARKER)
    {
        tFontEx *pFont;

        pFont = (tFontEx *)(pContext->pFont);

        pucData = pFont->pucData;
        pusOffset = pFont->pusOffset;
        ucFirst = pFont->ucFirst;
        ucLast = pFont->ucLast;

        //
        // Does the default absent character replacement exist in the font?
        //
        if((ABSENT_CHAR_REPLACEMENT >= ucFirst) &&
           (ABSENT_CHAR_REPLACEMENT <= ucLast))
        {
            //
            // Yes - use the standard character when an absent character is
            // found.
            //
            ucAbsent = ABSENT_CHAR_REPLACEMENT;
        }
        else
        {
            //
            // The default absent character is not present in the font so use
            // the first character (we only use its width here) instead.
            //
            ucAbsent = pFont->ucFirst;
        }
    }
    else
    {
        pucData = pContext->pFont->pucData;
        pusOffset = pContext->pFont->pusOffset;
        ucFirst = 32;
        ucLast = 126;
        ucAbsent = ABSENT_CHAR_REPLACEMENT;
    }

    //
    // Loop through the characters in the string.
    //
    for(lWidth = 0; *pcString && lLength; pcString++, lLength--)
    {
        //
        // Get a pointer to the font data for the next character from the
        // string.  If there is not a glyph for the next character, replace it
        // with a ".".
        //
        if((*pcString >= ucFirst) && (*pcString <= ucLast))
        {
            //
            // Add the width of this character as drawn with the given font.
            //
            lWidth += pucData[pusOffset[*pcString - ucFirst] + 1];
        }
        else
        {
            //
            // This character does not exist in the font so replace it with
            // a '.' instead.  This matches the approach taken in GrStringDraw
            // and ensures that the width returned here represents the
            // rendered dimension of the string.
            //
            lWidth += pucData[pusOffset[ucAbsent - ucFirst] + 1];
        }
    }

    //
    // Return the width of the string.
    //
    return(lWidth);
}

//*****************************************************************************
//
//! Draws a string.
//!
//! \param pContext is a pointer to the drawing context to use.
//! \param pcString is a pointer to the string to be drawn.
//! \param lLength is the number of characters from the string that should be
//! drawn on the screen.
//! \param lX is the X coordinate of the upper left corner of the string
//! position on the screen.
//! \param lY is the Y coordinate of the upper left corner of the string
//! position on the screen.
//! \param bOpaque is true of the background of each character should be drawn
//! and false if it should not (leaving the background as is).
//!
//! This function draws a string of test on the screen.  The \e lLength
//! parameter allows a portion of the string to be examined without having to
//! insert a NULL character at the stopping point (which would not be possible
//! if the string was located in flash); specifying a length of -1 will cause
//! the entire string to be rendered (subject to clipping).
//!
//! \return None.
//
//*****************************************************************************
void
GrStringDraw(const tContext *pContext, const char *pcString, int32_t  lLength,
             int32_t  lX, int32_t  lY, uint32_t  bOpaque)
{
    int32_t  lIdx, lX0, lY0, lCount, lOff, lOn, lBit;
    const uint8_t *pucData;
    const uint8_t *pucGlyphs;
    const uint16_t *pusOffset;
    uint8_t ucFirst, ucLast, ucAbsent;
    tContext sCon;

    int32_t  lYSave = lY;
    lY = 0;

    
    //
    // Check the arguments.
    //
    assert(pContext);
    assert(pcString);

    //
    // Copy the drawing context into a local structure that can be modified.
    //
    sCon = *pContext;

    //
    // Extract various parameters from the font depending upon whether it's
    // in the tFont or tFontEx format.
    //
    if(pContext->pFont->ucFormat & FONT_EX_MARKER)
    {
        tFontEx *pFont;

        pFont = (tFontEx *)(pContext->pFont);

        pucGlyphs = pFont->pucData;
        pusOffset = pFont->pusOffset;
        ucFirst = pFont->ucFirst;
        ucLast = pFont->ucLast;

        //
        // Does the default absent character replacement exist in the font?
        //
        if((ABSENT_CHAR_REPLACEMENT >= ucFirst) &&
           (ABSENT_CHAR_REPLACEMENT <= ucLast))
        {
            //
            // Yes - use the standard character when an absent character is
            // found.
            //
            ucAbsent = ABSENT_CHAR_REPLACEMENT;
        }
        else
        {
            //
            // The default absent character is not present in the font so use
            // the first character instead.
            //
            ucAbsent = pFont->ucFirst;
        }
    }
    else
    {
        pucGlyphs = pContext->pFont->pucData;
        pusOffset = pContext->pFont->pusOffset;
        ucFirst = 32;
        ucLast = 126;
        ucAbsent = ABSENT_CHAR_REPLACEMENT;
    }

    //
    // Loop through the characters in the string.
    //
    while(*pcString && lLength--)
    {
        //
        // Stop drawing the string if the right edge of the clipping region has
        // been exceeded.
        //
        if(lX > sCon.sClipRegion.sXMax)
        {
            break;
        }

        //
        // Get a pointer to the font data for the next character from the
        // string.  If there is not a glyph for the next character, replace it
        // with the "absent" character (usually '.').
        //
        if((*pcString >= ucFirst) && (*pcString <= ucLast))
        {
            pucData = (pucGlyphs + pusOffset[*pcString - ucFirst]);
        }
        else
        {
            pucData = (pucGlyphs + pusOffset[ucAbsent - ucFirst]);
        }
        pcString++;

        //
        // See if the entire character is to the left of the clipping region.
        //
        if((lX + pucData[1]) < sCon.sClipRegion.sXMin)
        {
            //
            // Increment the X coordinate by the width of the character.
            //
            lX += pucData[1];

            //
            // Go to the next character in the string.
            //
            continue;
        }

        //
        // Loop through the bytes in the encoded data for this glyph.
        //
        for(lIdx = 2, lX0 = 0, lBit = 0, lY0 = 0; lIdx < pucData[0]; )
        {
            //
            // See if the bottom of the clipping region has been exceeded.
            //
            if((lY + lY0) > sCon.sClipRegion.sYMax)
            {
                //
                // Stop drawing this character.
                //
                break;
            }

            //
            // See if the font is uncompressed.
            //
            if((sCon.pFont->ucFormat & ~FONT_EX_MARKER) ==
                FONT_FMT_UNCOMPRESSED)
            {
                //
                // Count the number of off pixels from this position in the
                // glyph image.
                //
                for(lOff = 0; lIdx < pucData[0]; )
                {
                    //
                    // Get the number of zero pixels at this position.
                    //
                    lCount = NumLeadingZeros(pucData[lIdx] << lBit);

                    //
                    // If there were more than 8, then it is a "false" result
                    // since it counted beyond the end of the current byte.
                    // Therefore, simply limit it to the number of pixels
                    // remaining in this byte.
                    //
                    if(lCount > 8)
                    {
                        lCount = 8 - lBit;
                    }

                    //
                    // Increment the number of off pixels.
                    //
                    lOff += lCount;

                    //
                    // Increment the bit position within the byte.
                    //
                    lBit += lCount;

                    //
                    // See if the end of the byte has been reached.
                    //
                    if(lBit == 8)
                    {
                        //
                        // Advance to the next byte and continue counting off
                        // pixels.
                        //
                        lBit = 0;
                        lIdx++;
                    }
                    else
                    {
                        //
                        // Since the end of the byte was not reached, there
                        // must be an on pixel.  Therefore, stop counting off
                        // pixels.
                        //
                        break;
                    }
                }

                //
                // Count the number of on pixels from this position in the
                // glyph image.
                //
                for(lOn = 0; lIdx < pucData[0]; )
                {
                    //
                    // Get the number of one pixels at this location (by
                    // inverting the data and counting the number of zeros).
                    //
                    lCount = NumLeadingZeros(~(pucData[lIdx] << lBit));
                    

                    //
                    // If there were more than 8, then it is a "false" result
                    // since it counted beyond the end of the current byte.
                    // Therefore, simply limit it to the number of pixels
                    // remaining in this byte.
                    //
                    if(lCount > 8)
                    {
                        lCount = 8 - lBit;
                    }

                    //
                    // Increment the number of on pixels.
                    //
                    lOn += lCount;

                    //
                    // Increment the bit position within the byte.
                    //
                    lBit += lCount;

                    //
                    // See if the end of the byte has been reached.
                    //
                    if(lBit == 8)
                    {
                        //
                        // Advance to the next byte and continue counting on
                        // pixels.
                        //
                        lBit = 0;
                        lIdx++;
                    }
                    else
                    {
                        //
                        // Since the end of the byte was not reached, there
                        // must be an off pixel.  Therefore, stop counting on
                        // pixels.
                        //
                        break;
                    }
                }
            }

            //
            // Otherwise, the font is compressed with a pixel RLE scheme.
            //
            else
            {
                //
                // See if this is a byte that encodes some on and off pixels.
                //
                if(pucData[lIdx])
                {
                    //
                    // Extract the number of off pixels.
                    //
                    lOff = (pucData[lIdx] >> 4) & 15;

                    //
                    // Extract the number of on pixels.
                    //
                    lOn = pucData[lIdx] & 15;

                    //
                    // Skip past this encoded byte.
                    //
                    lIdx++;
                }

                //
                // Otherwise, see if this is a repeated on pixel byte.
                //
                else if(pucData[lIdx + 1] & 0x80)
                {
                    //
                    // There are no off pixels in this encoding.
                    //
                    lOff = 0;

                    //
                    // Extract the number of on pixels.
                    //
                    lOn = (pucData[lIdx + 1] & 0x7f) * 8;

                    //
                    // Skip past these two encoded bytes.
                    //
                    lIdx += 2;
                }

                //
                // Otherwise, this is a repeated off pixel byte.
                //
                else
                {
                    //
                    // Extract the number of off pixels.
                    //
                    lOff = pucData[lIdx + 1] * 8;

                    //
                    // There are no on pixels in this encoding.
                    //
                    lOn = 0;

                    //
                    // Skip past these two encoded bytes.
                    //
                    lIdx += 2;
                }
            }

            //
            // Loop while there are any off pixels.
            //
            while(lOff)
            {
                //
                // See if the bottom of the clipping region has been exceeded.
                //
                if((lY + lY0) > sCon.sClipRegion.sYMax)
                {
                    //
                    // Ignore the remainder of the on pixels.
                    //
                    break;
                }

                //
                // See if there is more than one on pixel that will fit onto
                // the current row.
                //
                if((lOff > 1) && ((lX0 + 1) < pucData[1]))
                {
                    //
                    // Determine the number of on pixels that will fit on this
                    // row.
                    //
                    lCount = (((lX0 + lOff) > pucData[1]) ? pucData[1] - lX0 :
                              lOff);

                    //
                    // If this row is within the clipping region, draw a
                    // horizontal line that corresponds to the sequence of on
                    // pixels.
                    //
                    if(((lY + lY0) >= sCon.sClipRegion.sYMin) && bOpaque)
                    {
                        sCon.ulForeground = pContext->ulBackground;
                        GrLineDrawH(&sCon, lX + lX0, lX + lX0 + lCount - 1,
                        		lYSave + lY + lY0);
                    }

                    //
                    // Decrement the count of on pixels by the number on this
                    // row.
                    //
                    lOff -= lCount;

                    //
                    // Increment the X offset by the number of on pixels.
                    //
                    lX0 += lCount;
                }

                //
                // Otherwise, there is only a single on pixel that can be
                // drawn.
                //
                else
                {
                    //
                    // If this pixel is within the clipping region, then draw
                    // it.
                    //
                    if(((lX + lX0) >= sCon.sClipRegion.sXMin) &&
                       ((lX + lX0) <= sCon.sClipRegion.sXMax) &&
                       ((lY + lY0) >= sCon.sClipRegion.sYMin) && bOpaque)
                    {
                       DpyPixelDraw(pContext->pDisplay, lX + lX0, lYSave + lY + lY0,
                                     pContext->ulBackground);
                    }

                    //
                    // Decrement the count of on pixels.
                    //
                    lOff--;

                    //
                    // Increment the X offset.
                    //
                    lX0++;
                }

                //
                // See if the X offset has reached the right side of the
                // character glyph.
                //
                if(lX0 == pucData[1])
                {
                    //
                    // Increment the Y offset.
                    //
                    lY0++;

                    //
                    // Reset the X offset to the left side of the character
                    // glyph.
                    //
                    lX0 = 0;
                }
            }

            //
            // Loop while there are any on pixels.
            //
            while(lOn)
            {
                //
                // See if the bottom of the clipping region has been exceeded.
                //
                if((lY + lY0) > sCon.sClipRegion.sYMax)
                {
                    //
                    // Ignore the remainder of the on pixels.
                    //
                    break;
                }

                //
                // See if there is more than one on pixel that will fit onto
                // the current row.
                //
                if((lOn > 1) && ((lX0 + 1) < pucData[1]))
                {
                    //
                    // Determine the number of on pixels that will fit on this
                    // row.
                    //
                    lCount = (((lX0 + lOn) > pucData[1]) ? pucData[1] - lX0 :
                              lOn);

                    //
                    // If this row is within the clipping region, draw a
                    // horizontal line that corresponds to the sequence of on
                    // pixels.
                    //
                    if((lY + lY0) >= sCon.sClipRegion.sYMin)
                    {
                        sCon.ulForeground = pContext->ulForeground;
                        GrLineDrawH(&sCon, lX + lX0, lX + lX0 + lCount - 1,
                        		lYSave + lY + lY0);
                        
                    }

                    //
                    // Decrement the count of on pixels by the number on this
                    // row.
                    //
                    lOn -= lCount;

                    //
                    // Increment the X offset by the number of on pixels.
                    //
                    lX0 += lCount;
                }

                //
                // Otherwise, there is only a single on pixel that can be
                // drawn.
                //
                else
                {
                    //
                    // If this pixel is within the clipping region, then draw
                    // it.
                    //
                    if(((lX + lX0) >= sCon.sClipRegion.sXMin) &&
                       ((lX + lX0) <= sCon.sClipRegion.sXMax) &&
                       ((lY + lY0) >= sCon.sClipRegion.sYMin))
                    	DpyPixelDraw(pContext->pDisplay, lX + lX0, lYSave + lY + lY0,
                                     pContext->ulForeground);
          
                    //
                    // Decrement the count of on pixels.
                    //
                    lOn--;

                    //
                    // Increment the X offset.
                    //
                    lX0++;
                }

                //
                // See if the X offset has reached the right side of the
                // character glyph.
                //
                if(lX0 == pucData[1])
                {
                    //
                    // Increment the Y offset.
                    //
                    lY0++;

                    //
                    // Reset the X offset to the left side of the character
                    // glyph.
                    //
                    lX0 = 0;
                }
            }
        }

        //
        // Increment the X coordinate by the width of the character.
        //
        lX += pucData[1];
    }
}

//*****************************************************************************
//
// Close the Doxygen group.
//! @}
//
//*****************************************************************************
