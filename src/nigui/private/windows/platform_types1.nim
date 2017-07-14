# NiGui - Win32 platform-specific code - part 1

# This file will be included in "nigui.nim".

type
  WindowImpl* = ref object of Window
    fHandle: pointer
    fModalParent: WindowImpl
    hasGL: bool

  ControlImpl* = ref object of Control
    fHandle: pointer
    fFont: pointer

  CanvasImpl* = ref object of Canvas
    fDC: pointer
    fBitmap: pointer
    fGraphics: pointer
    fFont: pointer
    fFontBrush: pointer
    fLinePen: pointer
    fAreaBrush: pointer

  ImageImpl* = ref object of Image
  