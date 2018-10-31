﻿DeclareModule Structures
  
  ;- STRUCTURE
  Structure COORDINATE
    y.i[4]
    x.i[4]
    height.i[4]
    width.i[4]
  EndStructure
  
  Structure MOUSE
    X.i
    Y.i
    From.i ; at point widget
    Buttons.i
  EndStructure
  
  Structure ALIGN
    Right.b
    Bottom.b
    Vertical.b
    Horisontal.b
  EndStructure
  
  Structure PAGE
    Pos.i
    Length.i
    ScrollStep.i
  EndStructure
  
  Structure CANVAS
    Mouse.MOUSE
    Gadget.i
    Window.i
    
    Input.c
    Key.i[2]
  EndStructure
  
  Structure COLOR
    Front.i[4]
    Fore.i[4]
    Back.i[4]
    Line.i[4]
    Frame.i[4]
    Arrows.i[4]
  EndStructure
  
  Structure IMAGE Extends Coordinate
    handle.i[2]
    change.b
    Align.ALIGN
  EndStructure
  
  Structure TEXT Extends COORDINATE
    ;     Char.c
    Len.i
    FontID.i
    String.s[3]
    Count.i[2]
    Change.b
    
    Align.ALIGN
    
    Lower.b
    Upper.b
    Pass.b
    Editable.b
    Numeric.b
    MultiLine.b
    Vertical.b
    Rotate.f
    
    Mode.i
  EndStructure
  
  Structure SCROLL Extends COORDINATE
    Window.i
    Gadget.i
    
    Max.i
    Min.i
    
    Both.b ; we see both scrolbars
    
    Size.i[4]
    Type.i[4]
    Focus.i
    Buttons.i
    Radius.i
    
    Hide.b[2]
    Alpha.a[2]
    Disable.b[2]
    Vertical.b
    DrawingMode.i
    
    Page.PAGE
    Area.PAGE
    Thumb.PAGE
    Button.PAGE
    Color.COLOR[4]
  EndStructure
  
  Structure Widget_S Extends COORDINATE
    Index.i  ; Index of new list element
    Handle.i ; Adress of new list element
    InLine.i
    
    *Widget.Widget_S
    Canvas.CANVAS
    Color.COLOR[4]
    Text.TEXT[4]
    
    fSize.i
    bSize.i
    Hide.b[2]
    Disable.b[2]
    Cursor.i[2]
    
    Caret.i[2] ; 0 = Pos ; 1 = PosFixed
    Line.i[2] ; 0 = Pos ; 1 = PosFixed
    
    
    Type.i
    
    From.i  ; at point widget | item
    Focus.i
    LostFocus.i
    
    Drag.b
    Resize.b ; 
    Toggle.b ; 
    Checked.b[2]
    Vertical.b
    Interact.b ; будет ли взаимодействовать с пользователем?
    Radius.i
    Buttons.i
    
    Clip.COORDINATE
    
    ; tree
    time.i
    adress.i[2]
    sublevel.i
    box.Coordinate
    *data
    collapsed.b
    childrens.i
    Item.i
    Attribute.l
    change.b
    flag.i
    Image.IMAGE
    
    Scroll.SCROLL
    vScroll.SCROLL
    hScroll.SCROLL
    
    *Default
    Alpha.a[2]
    
    DrawingMode.i
    
    List Items.Widget_S()
    List Columns.Widget_S()
    
  EndStructure
  
  Global Widget_FrameColor_Default = $FFBABABA
  Global Widget_Color_Enter = $FFD3FECA ; $FFFCEADA
  Global Widget_FrameColor_Enter = $FF44FB1C ; $FFFFC288
  Global Widget_FrameColor_Focus = $FF24B002 ; $FFD5A719 ; $FFE89C3D ; $FFDE9541 ; $FFFADBB3 ;   
  Global Widget_FontColor_Default = $FF000000 ; $FF0B0B0B
  Global Widget_FontColor_Focus = $FFFFFFFF
  
  Global *Focus.Widget_S
  Global NewList List.Widget_S()
  Global Use_List_Canvas_Gadget
EndDeclareModule 

Module Structures 
  
EndModule 

UseModule Structures
; IDE Options = PureBasic 5.62 (MacOS X - x64)
; Folding = -4-
; EnableXP