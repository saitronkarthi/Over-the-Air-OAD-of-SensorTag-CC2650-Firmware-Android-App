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
//! \addtogroup context_api
//! @{
//
//*****************************************************************************

//*****************************************************************************
//
//! Initializes a drawing context.
//!
//! \param pContext is a pointer to the drawing context to initialize.
//! \param pDisplay is a pointer to the tDisplayInfo structure that describes
//! the display driver to use.
//!
//! This function initializes a drawing context, preparing it for use.  The
//! provided display driver will be used for all subsequent graphics
//! operations, and the default clipping region will be set to the extent of
//! the screen.
//!
//! \return None.
//
//*****************************************************************************
void
GrContextInit(tContext *pContext, const tDisplay *pDisplay)
{
    //
    // Check the arguments.
    //
    assert(pContext);
    assert(pDisplay);

    //
    // Set the size of the context.
    //
    pContext->lSize = sizeof(tContext);

    //
    // Save the pointer to the display.
    //
    pContext->pDisplay = pDisplay;

    //
    // Initialize the extent of the clipping region to the extents of the
    // screen.
    //
    pContext->sClipRegion.sXMin = 0;
    pContext->sClipRegion.sYMin = 0;
    pContext->sClipRegion.sXMax = pDisplay->usWidth - 1;
    pContext->sClipRegion.sYMax = pDisplay->usHeight - 1;

    //
    // Provide a default color and font.
    //
    pContext->ulForeground = 0;
    pContext->ulBackground = 0;
    pContext->pFont = 0;
}

//*****************************************************************************
//
//! Sets the extents of the clipping region.
//!
//! \param pContext is a pointer to the drawing context to use.
//! \param pRect is a pointer to the structure containing the extents of the
//! clipping region.
//!
//! This function sets the extents of the clipping region.  The clipping region
//! is not allowed to exceed the extents of the screen, but may be a portion of
//! the screen.
//!
//! The supplied coordinate are inclusive; \e sXMin of 1 and \e sXMax of 1 will
//! define a clipping region that will display only the pixels in the X = 1
//! column.  A consequence of this is that the clipping region must contain
//! at least one row and one column.
//!
//! \return None.
//
//*****************************************************************************
void
GrContextClipRegionSet(tContext *pContext, tRectangle *pRect)
{
    uint32_t  ulW, ulH;

    //
    // Check the arguments.
    //
    assert(pContext);
    assert(pRect);

    //
    // Get the width and height of the display.
    //
    ulW = DpyWidthGet(pContext->pDisplay);
    ulH = DpyHeightGet(pContext->pDisplay);

    //
    // Set the extents of the clipping region, forcing them to reside within
    // the extents of the screen.
    //
    pContext->sClipRegion.sXMin = ((pRect->sXMin < 0) ? 0 :
                                   ((pRect->sXMin >= ulW) ? (ulW - 1) :
                                    pRect->sXMin));
    pContext->sClipRegion.sYMin = ((pRect->sYMin < 0) ? 0 :
                                   ((pRect->sYMin >= ulH) ? (ulH - 1) :
                                    pRect->sYMin));
    pContext->sClipRegion.sXMax = ((pRect->sXMax < 0) ? 0 :
                                   ((pRect->sXMax >= ulW) ? (ulW - 1) :
                                    pRect->sXMax));
    pContext->sClipRegion.sYMax = ((pRect->sYMax < 0) ? 0 :
                                   ((pRect->sYMax >= ulH) ? (ulH - 1) :
                                    pRect->sYMax));
}

//*****************************************************************************
//
// Close the Doxygen group.
//! @}
//
//*****************************************************************************
