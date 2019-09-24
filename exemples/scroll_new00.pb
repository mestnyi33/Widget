﻿;
; Os              : All
; Version         : 1.4
; License         : Free
; Module name     : Scroll
; Author          : mestnyi
; PB version:     : 5.46 =< 5.62
; Last updated    : 22 Sep 2018
; Topic           : https://www.purebasic.fr/english/posting.php?mode=edit&f=12&p=521603
;

CompilerIf #PB_Compiler_IsMainFile
  DeclareModule Constant
    CompilerIf #PB_Compiler_Version =< 546
      Enumeration #PB_EventType_FirstCustomValue
        #PB_EventType_Resize
      EndEnumeration
    CompilerEndIf
  EndDeclareModule 
  Module Constant : EndModule : UseModule Constant
CompilerEndIf

DeclareModule Scroll
  EnableExplicit
  #Vertical = #PB_ScrollBar_Vertical
  
  Structure PAGE
    Pos.l
    Length.l
    ScrollStep.l
  EndStructure
  
  Structure COLOR
    Front.l[4]
    Fore.l[4]
    Back.l[4]
    Line.l[4]
    Frame.l[4]
  EndStructure
  
  Structure COORDINATE
    y.l[4]
    x.l[4]
    height.l[4]
    width.l[4]
  EndStructure
  
  Structure STRUCT Extends COORDINATE
    Max.l
    Min.l
    
    Both.b ; we see both scrolbars
    
    Type.l
    Focus.l
    Buttons.l
    Button.Page
    
    Radius.l
    
    Hide.b[2]
    Alpha.a[2]
    Disable.b[2]
    Vertical.b
    DrawingMode.l
    
    Page.PAGE
    Area.PAGE
    Thumb.PAGE
    Color.Color[4]
  EndStructure
  
  Declare.b Draw(*Scroll.Struct)
  Declare.l Y(*Scroll.Struct)
  Declare.l X(*Scroll.Struct)
  Declare.l Width(*Scroll.Struct)
  Declare.l Height(*Scroll.Struct)
  Declare.b SetState(*Scroll.Struct, ScrollPos.l)
  Declare.l SetAttribute(*Scroll.Struct, Attribute.l, Value.l)
  Declare.b SetColor(*Scroll.Struct, ColorType.l, Color.l, Item.l=- 1, State.l=1)
  Declare.b Resize(*This.Struct, iX.l,iY.l,iWidth.l,iHeight.l, *Scroll.Struct=#Null)
  Declare.b Resizes(*v.Struct, *h.Struct, X.l,Y.l,Width.l,Height.l)
  Declare.b Updates(*v.Struct, *h.Struct, ScrollArea_X, ScrollArea_Y, ScrollArea_Width, ScrollArea_Height)
  Declare.b CallBack(*This.Struct, EventType.l, MouseX.l, MouseY.l, WheelDelta.l=0, AutoHide.b=0, *Scroll.Struct=#Null)
  Declare.b Gadget(*Scroll.Struct, X.l,Y.l,Width.l,Height.l, Min.l, Max.l, PageLength.l, Flag.l, Radius.l=0)
  
  Declare DrawArrow(X,Y, Size, Direction, Color, Thickness = 1)
EndDeclareModule

Module Scroll
  Macro Colors(_this_, _i_, _ii_, _iii_)
    If _this_\Color[_i_]\Line[_ii_]
      _this_\Color[_i_]\Line[_iii_] = _this_\Color[_i_]\Line[_ii_]
    Else
      _this_\Color[_i_]\Line[_iii_] = _this_\Color[0]\Line[_ii_]
    EndIf
    
    If _this_\Color[_i_]\Fore[_ii_]
      _this_\Color[_i_]\Fore[_iii_] = _this_\Color[_i_]\Fore[_ii_]
    Else
      _this_\Color[_i_]\Fore[_iii_] = _this_\Color[0]\Fore[_ii_]
    EndIf
    
    If _this_\Color[_i_]\Back[_ii_]
      _this_\Color[_i_]\Back[_iii_] = _this_\Color[_i_]\Back[_ii_]
    Else
      _this_\Color[_i_]\Back[_iii_] = _this_\Color[0]\Back[_ii_]
    EndIf
    
    If _this_\Color[_i_]\Frame[_ii_]
      _this_\Color[_i_]\Frame[_iii_] = _this_\Color[_i_]\Frame[_ii_]
    Else
      _this_\Color[_i_]\Frame[_iii_] = _this_\Color[0]\Frame[_ii_]
    EndIf
  EndMacro
  
  Macro BoxGradient(_type_, _x_,_y_,_width_,_height_,_color_1_,_color_2_, _radius_=0, _alpha_=255)
    BackColor(_color_1_&$FFFFFF|_alpha_<<24)
    FrontColor(_color_2_&$FFFFFF|_alpha_<<24)
    If _type_
      LinearGradient(_x_,_y_, (_x_+_width_), _y_)
    Else
      LinearGradient(_x_,_y_, _x_, (_y_+_height_))
    EndIf
    RoundBox(_x_,_y_,_width_,_height_, _radius_,_radius_)
    BackColor(#PB_Default) : FrontColor(#PB_Default) ; bug
  EndMacro
  
  Macro ResetColor(_this_)
    Colors(_this_, 0, 1, 0)
    Colors(_this_, 1, 1, 0)
    Colors(_this_, 2, 1, 0)
    Colors(_this_, 3, 1, 0)
    
    
    Colors(_this_, 1, 1, 1)
    Colors(_this_, 2, 1, 1)
    Colors(_this_, 3, 1, 1)
    
    Colors(_this_, 1, 2, 2)
    Colors(_this_, 2, 2, 2)
    Colors(_this_, 3, 2, 2)
    
    Colors(_this_, 1, 3, 3)
    Colors(_this_, 2, 3, 3)
    Colors(_this_, 3, 3, 3)
  EndMacro
  
  Macro ThumbPos(_this_, _scroll_pos_)
    (_this_\Area\Pos + Round((_scroll_pos_-_this_\Min) * (_this_\Area\Length / (_this_\Max-_this_\Min)), #PB_Round_Nearest))
  EndMacro
  
  Macro ThumbLength(_this_)
    Round(_this_\Area\Length - (_this_\Area\Length / (_this_\Max-_this_\Min))*((_this_\Max-_this_\Min) - _this_\Page\Length), #PB_Round_Nearest)
  EndMacro
  
  Procedure DrawArrow(X,Y, Size, Direction, Color, Thickness = 1)
    Protected I
    
    
    If Direction = 1
      For i = 0 To Size 
        ; в верх
        LineXY((X+i)+Size,(Y+i-1)-(Thickness),(X+i)+Size,(Y+i-1)+(Thickness),Color) ; Левая линия
        LineXY(((X+(Size))-i),(Y+i-1)-(Thickness),((X+(Size))-i),(Y+i-1)+(Thickness),Color) ; правая линия
      Next
    ElseIf Direction = 3
      For i = 0 To Size
        ; в низ
        LineXY((X+i),(Y+i)-(Thickness),(X+i),(Y+i)+(Thickness),Color) ; Левая линия
        LineXY(((X+(Size*2))-i),(Y+i)-(Thickness),((X+(Size*2))-i),(Y+i)+(Thickness),Color) ; правая линия
      Next
    ElseIf Direction = 0 ; в лево
      For i = 0 To Size  
        ; в лево
        LineXY(((X+1)+i)-(Thickness),(((Y-2)+(Size))-i),((X+1)+i)+(Thickness),(((Y-2)+(Size))-i),Color) ; правая линия
        LineXY(((X+1)+i)-(Thickness),((Y-2)+i)+Size,((X+1)+i)+(Thickness),((Y-2)+i)+Size,Color)         ; Левая линия
      Next
    ElseIf Direction = 2 ; в право
      For i = 0 To Size
        ; в право
        LineXY(((X+2)+i)-(Thickness),((Y-2)+i),((X+2)+i)+(Thickness),((Y-2)+i),Color) ; Левая линия
        LineXY(((X+2)+i)-(Thickness),(((Y-2)+(Size*2))-i),((X+2)+i)+(Thickness),(((Y-2)+(Size*2))-i),Color) ; правая линия
      Next
    EndIf
    
  EndProcedure
  
  Procedure.i Match(Value.i, Grid.i, Max.i=$7FFFFFFF)
    If Grid 
      Value = Round((Value/Grid), #PB_Round_Nearest) * Grid : If (Value>Max) : Value=Max : EndIf
    EndIf
    
    ProcedureReturn Value
  EndProcedure
  
  Procedure.l Pos(*This.Struct, ThumbPos.l)
    Protected ScrollPos.l
    
    With *This
      ScrollPos = Match(\Min + Round((ThumbPos - \Area\Pos) / (\Area\Length / (\Max-\Min)), #PB_Round_Nearest), \Page\ScrollStep)
      If (\Vertical And \Type = #PB_GadgetType_TrackBar) : ScrollPos = ((\Max-\Min)-ScrollPos) : EndIf
    EndWith
    
    ProcedureReturn ScrollPos
  EndProcedure
  
  ;-
  Procedure.b Draw(*Scroll.Struct)
    With *Scroll
      If Not \Hide And \Alpha
        ; Draw scroll bar background
        DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
        RoundBox(\X[0],\Y[0],\Width[0],\Height[0],\Radius,\Radius,\Color[0]\Back&$FFFFFF|\Alpha<<24)
        
        If \Vertical
          ; Draw left line
          If \Both
            ; "Это пустое пространство между двумя скроллами тоже закрашиваем если скролл бара кнопки не круглые"
            If Not \Radius : Box(\X[2],\Y[2]+\height[2]+1,\Width[2],\Height[2],\Color[0]\Back&$FFFFFF|\Alpha<<24) : EndIf
            Line(\X[0],\Y[0],1,\height[0]-\Radius/2,\Color[0]\Line&$FFFFFF|\Alpha<<24)
          Else
            Line(\X[0],\Y[0],1,\Height[0],\Color[0]\Line&$FFFFFF|\Alpha<<24)
          EndIf
        Else
          ; Draw top line
          If \Both
            Line(\X[0],\Y[0],\width[0]-\Radius/2,1,\Color[0]\Line&$FFFFFF|\Alpha<<24)
          Else
            Line(\X[0],\Y[0],\Width[0],1,\Color[0]\Line&$FFFFFF|\Alpha<<24)
          EndIf
        EndIf
        
        If \Thumb\Length
          ; Draw thumb
          DrawingMode(\DrawingMode|#PB_2DDrawing_AlphaBlend)
          BoxGradient(\Vertical,\X[3],\Y[3],\Width[3],\Height[3],\Color[3]\Fore,\Color[3]\Back, \Radius, \Alpha)
          
          ; Draw thumb frame
          If \DrawingMode = #PB_2DDrawing_Gradient
            DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
            RoundBox(\X[3],\Y[3],\Width[3],\Height[3],\Radius,\Radius,\Color[3]\Frame&$FFFFFF|\Alpha<<24)
          EndIf
        EndIf
        
        If \Button\Length
          ; Draw buttons
          DrawingMode(\DrawingMode|#PB_2DDrawing_AlphaBlend)
          BoxGradient(\Vertical,\X[1],\Y[1],\Width[1],\Height[1],\Color[1]\Fore,\Color[1]\Back, \Radius, \Alpha)
          BoxGradient(\Vertical,\X[2],\Y[2],\Width[2],\Height[2],\Color[2]\Fore,\Color[2]\Back, \Radius, \Alpha)
          
          ; Draw buttons frame
          If \DrawingMode = #PB_2DDrawing_Gradient
            DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
            RoundBox(\X[1],\Y[1],\Width[1],\Height[1],\Radius,\Radius,\Color[1]\Frame&$FFFFFF|\Alpha<<24)
            RoundBox(\X[2],\Y[2],\Width[2],\Height[2],\Radius,\Radius,\Color[2]\Frame&$FFFFFF|\Alpha<<24)
          EndIf
          
          ; Draw arrows
          DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
          DrawArrow(\X[1]+(\Width[1]-6)/2,\Y[1]+(\Height[1]-3)/2, 3, Bool(\Vertical), \Color[1]\Line&$FFFFFF|\Alpha<<24)
          DrawArrow(\X[2]+(\Width[2]-6)/2,\Y[2]+(\Height[2]-3)/2, 3, Bool(\Vertical)+2, \Color[2]\Line&$FFFFFF|\Alpha<<24)
        EndIf
        
        If \DrawingMode = #PB_2DDrawing_Gradient
          ; Draw thumb lines
          DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
          If \Vertical
            Line(\X[3]+(\Width[3]-8)/2,\Y[3]+\Height[3]/2-3,9,1,\Color[3]\Line&$FFFFFF|\Alpha<<24)
            Line(\X[3]+(\Width[3]-8)/2,\Y[3]+\Height[3]/2,9,1,\Color[3]\Line&$FFFFFF|\Alpha<<24)
            Line(\X[3]+(\Width[3]-8)/2,\Y[3]+\Height[3]/2+3,9,1,\Color[3]\Line&$FFFFFF|\Alpha<<24)
          Else
            Line(\X[3]+\Width[3]/2-3,\Y[3]+(\Height[3]-8)/2,1,9,\Color[3]\Line&$FFFFFF|\Alpha<<24)
            Line(\X[3]+\Width[3]/2,\Y[3]+(\Height[3]-8)/2,1,9,\Color[3]\Line&$FFFFFF|\Alpha<<24)
            Line(\X[3]+\Width[3]/2+3,\Y[3]+(\Height[3]-8)/2,1,9,\Color[3]\Line&$FFFFFF|\Alpha<<24)
          EndIf
        EndIf
      EndIf
    EndWith 
  EndProcedure
  
  Procedure.l X(*Scroll.Struct)
    Protected Result.l
    
    If *Scroll
      With *Scroll
        If Not \Hide[1] And \Alpha
          Result = \X
        Else
          Result = \X+\Width
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.l Y(*Scroll.Struct)
    Protected Result.l
    
    If *Scroll
      With *Scroll
        If Not \Hide[1] And \Alpha
          Result = \Y
        Else
          Result = \Y+\Height
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.l Width(*Scroll.Struct)
    Protected Result.l
    
    If *Scroll
      With *Scroll
        If Not \Hide[1] And \Width And \Alpha
          Result = \Width
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.l Height(*Scroll.Struct)
    Protected Result.l
    
    If *Scroll
      With *Scroll
        If Not \Hide[1] And \Height And \Alpha
          Result = \Height
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.b SetState(*Scroll.Struct, ScrollPos.l)
    Protected Result.b
    
    With *Scroll
      If (\Vertical And \Type = #PB_GadgetType_TrackBar) : ScrollPos = ((\Max-\Min)-ScrollPos) : EndIf
      
      If ScrollPos < \Min : ScrollPos = \Min : EndIf
      If ScrollPos > (\Max-\Page\Length)
        ScrollPos = (\Max-\Page\Length)
      EndIf
      
      If \Page\Pos<>ScrollPos : \Page\Pos=ScrollPos
        \Thumb\Pos = ThumbPos(*Scroll, ScrollPos)
        
        If \Vertical
          \Y[3] = \Thumb\Pos
          \Height[3] = \Thumb\Length
        Else
          \X[3] = \Thumb\Pos
          \Width[3] = \Thumb\Length
        EndIf
        
        Result = #True
      EndIf
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.l SetAttribute(*Scroll.Struct, Attribute.l, Value.l)
    Protected Result.l
    
    With *Scroll
      Select Attribute
        Case #PB_ScrollBar_Minimum
          If \Min <> Value
            \Min = Value
            \Page\Pos = Value
            Result = #True
          EndIf
          
        Case #PB_ScrollBar_Maximum
          If \Max <> Value
            If \Min > Value
              \Max = \Min + 1
            Else
              \Max = Value
            EndIf
            
            \Page\ScrollStep = (\Max-\Min) / 100
            
            Result = #True
          EndIf
          
        Case #PB_ScrollBar_PageLength
          If \Page\Length <> Value
            If Value > (\Max-\Min) : \Max = Value ; Если этого page_length вызвать раньше maximum то не правильно работает
              \Page\Length = (\Max-\Min)
            Else
              \Page\Length = Value
            EndIf
            
            Result = #True
          EndIf
          
      EndSelect
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.b SetColor(*Scroll.Struct, ColorType.l, Color.l, Item.l=- 1, State.l=1)
    Protected Result
    
    With *Scroll
      Select ColorType
        Case #PB_Gadget_LineColor
          If Item=- 1
            \Color\Line[State] = Color
          Else
            \Color[Item]\Line[State] = Color
          EndIf
          
        Case #PB_Gadget_BackColor
          If Item=- 1
            \Color\Back[State] = Color
          Else
            \Color[Item]\Back[State] = Color
          EndIf
          
        Case #PB_Gadget_FrontColor
        Default ; Case #PB_Gadget_FrameColor
          If Item=- 1
            \Color\Frame[State] = Color
          Else
            \Color[Item]\Frame[State] = Color
          EndIf
          
      EndSelect
    EndWith
    
    ResetColor(*Scroll)
    
    ProcedureReturn Bool(Color)
  EndProcedure
  
  Procedure.b Resize(*This.Struct, X.l,Y.l,Width.l,Height.l, *Scroll.Struct=#Null)
    Protected Result, Lines, ScrollPage
    
    With *This
      ScrollPage = ((\Max-\Min) - \Page\Length)
      Lines = Bool(\Type=#PB_GadgetType_ScrollBar)
      
      If *Scroll
        If \Vertical
          If Height=#PB_Ignore : If *Scroll\Hide : Height=(*Scroll\Y+*Scroll\Height)-\Y : Else : Height = *Scroll\Y-\Y : EndIf : EndIf
        Else
          If Width=#PB_Ignore : If *Scroll\Hide : Width=(*Scroll\X+*Scroll\Width)-\X : Else : Width = *Scroll\X-\X : EndIf : EndIf
        EndIf
      EndIf
      
      ;
      If X=#PB_Ignore : X = \X[0] : EndIf : If Y=#PB_Ignore : Y = \Y[0] : EndIf 
      If Width=#PB_Ignore : Width = \Width[0] : EndIf : If Height=#PB_Ignore : Height = \Height[0] : EndIf
      
      ;
      If ((\Max-\Min) >= \Page\Length)
        If \Vertical
          \Area\Pos = Y+\Button\Length
          \Area\Length = (Height-\Button\Length*2)
        Else
          \Area\Pos = X+\Button\Length
          \Area\Length = (Width-\Button\Length*2)
        EndIf
        
        If \Area\Length
          \Thumb\Length = ThumbLength(*This)
          
          If (\Area\Length > \Button\Length)
            If \Button\Length
              If (\Thumb\Length < \Button\Length)
                \Area\Length = Round(\Area\Length - (\Button\Length-\Thumb\Length), #PB_Round_Nearest)
                \Thumb\Length = \Button\Length 
              EndIf
            Else
              If (\Thumb\Length < 7)
                \Area\Length = Round(\Area\Length - (7-\Thumb\Length), #PB_Round_Nearest)
                \Thumb\Length = 7
              EndIf
            EndIf
          Else
            \Thumb\Length = \Area\Length 
          EndIf
          
          If \Area\Length > 0
            If (\Type <> #PB_GadgetType_TrackBar) And (\Thumb\Pos+\Thumb\Length) >= (\Area\Length+\Button\Length)
              SetState(*This, ScrollPage)
            EndIf
            
            \Thumb\Pos = ThumbPos(*This, \Page\Pos)
          EndIf
        EndIf
      EndIf
      
      
      \X[0] = X : \Y[0] = Y : \Width[0] = Width : \Height[0] = Height                                             ; Set scroll bar coordinate
      
      If \Vertical
        \X[1] = X + Lines : \Y[1] = Y : \Width[1] = Width - Lines : \Height[1] = \Button\Length                   ; Top button coordinate on scroll bar
        \X[2] = X + Lines : \Width[2] = Width - Lines : \Height[2] = \Button\Length : \Y[2] = Y+Height-\Height[2] ; Botom button coordinate on scroll bar
        \X[3] = X + Lines : \Width[3] = Width - Lines : \Y[3] = \Thumb\Pos : \Height[3] = \Thumb\Length           ; Thumb coordinate on scroll bar
      Else
        \X[1] = X : \Y[1] = Y + Lines : \Width[1] = \Button\Length : \Height[1] = Height - Lines                  ; Left button coordinate on scroll bar
        \Y[2] = Y + Lines : \Height[2] = Height - Lines : \Width[2] = \Button\Length : \X[2] = X+Width-\Width[2]  ; Right button coordinate on scroll bar
        \Y[3] = Y + Lines : \Height[3] = Height - Lines : \X[3] = \Thumb\Pos : \Width[3] = \Thumb\Length          ; Thumb coordinate on scroll bar
      EndIf
      
      \Hide[1] = Bool(Not ((\Max-\Min) > \Page\Length))
      ProcedureReturn \Hide[1]
    EndWith
  EndProcedure
  
  Procedure.b Updates(*v.Struct, *h.Struct, ScrollArea_X, ScrollArea_Y, ScrollArea_Width, ScrollArea_Height)
    Protected iWidth = X(*v), iHeight = Y(*h)
    Static hPos, vPos : vPos = *v\Page\Pos : hPos = *h\Page\Pos
    
    ; Вправо работает как надо
    If ScrollArea_Width<*h\Page\Pos+iWidth 
      ScrollArea_Width=*h\Page\Pos+iWidth
      ; Влево работает как надо
    ElseIf ScrollArea_X>*h\Page\Pos And
           ScrollArea_Width=*h\Page\Pos+iWidth 
      ScrollArea_Width = iWidth 
    EndIf
    
    ; Вниз работает как надо
    If ScrollArea_Height<*v\Page\Pos+iHeight
      ScrollArea_Height=*v\Page\Pos+iHeight 
      ; Верх работает как надо
    ElseIf ScrollArea_Y>*v\Page\Pos And
           ScrollArea_Height=*v\Page\Pos+iHeight 
      ScrollArea_Height = iHeight 
    EndIf
    
    If ScrollArea_X>0 : ScrollArea_X=0 : EndIf
    If ScrollArea_Y>0 : ScrollArea_Y=0 : EndIf
    
    If ScrollArea_X<*h\Page\Pos : ScrollArea_Width-ScrollArea_X : EndIf
    If ScrollArea_Y<*v\Page\Pos : ScrollArea_Height-ScrollArea_Y : EndIf
    
    If *v\Max<>ScrollArea_Height : SetAttribute(*v, #PB_ScrollBar_Maximum, ScrollArea_Height) : EndIf
    If *h\Max<>ScrollArea_Width : SetAttribute(*h, #PB_ScrollBar_Maximum, ScrollArea_Width) : EndIf
    
    If *v\Page\Length<>iHeight : SetAttribute(*v, #PB_ScrollBar_PageLength, iHeight) : EndIf
    If *h\Page\Length<>iWidth : SetAttribute(*h, #PB_ScrollBar_PageLength, iWidth) : EndIf
    
    If ScrollArea_Y<0 : SetState(*v, (ScrollArea_Height-ScrollArea_Y)-ScrollArea_Height) : EndIf
    If ScrollArea_X<0 : SetState(*h, (ScrollArea_Width-ScrollArea_X)-ScrollArea_Width) : EndIf
    
    *v\Hide = Resize(*v, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *h) 
    *h\Hide = Resize(*h, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *v)
    
    If *v\Hide : *v\Page\Pos = 0 : If vPos : *v\Hide = vPos : EndIf : Else : *v\Page\Pos = vPos : *h\Width = iWidth+*v\Width : EndIf
    If *h\Hide : *h\Page\Pos = 0 : If hPos : *h\Hide = hPos : EndIf : Else : *h\Page\Pos = hPos : *v\Height = iHeight+*h\Height : EndIf
    
    ProcedureReturn Bool(ScrollArea_Height>=iHeight Or ScrollArea_Width>=iWidth)
  EndProcedure
  
  Procedure.b Resizes(*v.Struct, *h.Struct, X.l,Y.l,Width.l,Height.l )
    If Width=#PB_Ignore : Width = *v\X+*v\Width : Else : Width+x : EndIf
    If Height=#PB_Ignore : Height = *h\Y+*h\Height : Else : Height+y : EndIf
    
    Protected iWidth = Width-Width(*v), iHeight = Height-Height(*h)
    
    If *v\width And *v\Page\Length<>iHeight : SetAttribute(*v, #PB_ScrollBar_PageLength, iHeight) : EndIf
    If *h\height And *h\Page\Length<>iWidth : SetAttribute(*h, #PB_ScrollBar_PageLength, iWidth) : EndIf
    
    *v\Hide = Resize(*v, Width-*v\Width, Y, #PB_Ignore, #PB_Ignore, *h) : iWidth = Width-Width(*v)
    *h\Hide = Resize(*h, X, Height-*h\Height, #PB_Ignore, #PB_Ignore, *v) : iHeight = Height-Height(*h)
    
    If *v\width And *v\Page\Length<>iHeight : SetAttribute(*v, #PB_ScrollBar_PageLength, iHeight) : EndIf
    If *h\height And *h\Page\Length<>iWidth : SetAttribute(*h, #PB_ScrollBar_PageLength, iWidth) : EndIf
    
    If *v\width : *v\Hide = Resize(*v, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *h) : EndIf
    If *h\height : *h\Hide = Resize(*h, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *v) : EndIf
    
    ; Do we see both scrolbars?
    *v\Both = Bool(Not *h\Hide) 
    *h\Both = Bool(Not *v\Hide) 
    
    If *v\Hide : *v\Page\Pos = 0 : Else
      If *h\Radius : Resize(*h, #PB_Ignore, #PB_Ignore, *v\x+*v\Radius/2-1, #PB_Ignore) : EndIf
    EndIf
    If *h\Hide : *h\Page\Pos = 0 : Else
      If *v\Radius : Resize(*v, #PB_Ignore, #PB_Ignore, #PB_Ignore, *h\y+*v\Radius/2-1) : EndIf
    EndIf
    
    ProcedureReturn Bool(*v\Hide|*h\Hide)
  EndProcedure
  
  Procedure.b CallBack(*This.Struct, EventType.l, MouseX.l, MouseY.l, WheelDelta.l=0, AutoHide.b=0, *Scroll.Struct=#Null)
    Protected Result, Buttons
    Static LastX, LastY, Last, *Thisis.Struct, Cursor, Drag, Down
    
    With *This
      ;       If \Hide
      ;         If *This = *Thisis
      ;           \Buttons = 0
      ;           \Focus = 0
      ;         EndIf
      ;       EndIf
      
      ; get at point buttons
      If Down ; GetGadgetAttribute(EventGadget(), #PB_Canvas_Buttons)
        Buttons = \Buttons 
      Else
        If (Mousex>=\x And Mousex<\x+\Width And Mousey>\y And Mousey=<\y+\Height) 
          If (Mousex>\x[1] And Mousex=<\x[1]+\Width[1] And  Mousey>\y[1] And Mousey=<\y[1]+\Height[1])
            Buttons = 1
          ElseIf (Mousex>\x[3] And Mousex=<\x[3]+\Width[3] And Mousey>\y[3] And Mousey=<\y[3]+\Height[3])
            Buttons = 3
          ElseIf (Mousex>\x[2] And Mousex=<\x[2]+\Width[2] And Mousey>\y[2] And Mousey=<\y[2]+\Height[2])
            Buttons = 2
          Else
            Buttons =- 1
          EndIf
        EndIf
      EndIf
      
      ; get
      Select EventType
        Case #PB_EventType_MouseWheel  
          If *Thisis = *This
            Select WheelDelta
              Case-1 : Result = SetState(*This, \Page\Pos - (\Max-\Min)/30)
              Case 1 : Result = SetState(*This, \Page\Pos + (\Max-\Min)/30)
            EndSelect
          EndIf
          
        Case #PB_EventType_MouseLeave 
          If Not Drag : \Buttons = 0 : Buttons = 0 : LastX = 0 : LastY = 0 : EndIf
        Case #PB_EventType_LeftButtonUp : Down = 0 :  Drag = 0 :  LastX = 0 : LastY = 0
        Case #PB_EventType_LeftButtonDown : Down = 1
          If Buttons : \Buttons = Buttons : Drag = 1 : *Thisis = *This : EndIf
          
          Select Buttons
            Case - 1
              If *Thisis = *This Or (\Height>(\Y[2]+\Height[2]) And \Buttons =- 1) 
                If \Vertical
                  Result = SetState(*This, Pos(*This, (MouseY-\Thumb\Length/2)))
                Else
                  Result = SetState(*This, Pos(*This, (MouseX-\Thumb\Length/2)))
                EndIf
              EndIf
            Case 1 : Result = SetState(*This, (\Page\Pos - \Page\ScrollStep))
            Case 2 : Result = SetState(*This, (\Page\Pos + \Page\ScrollStep))
            Case 3 : LastX = MouseX - \Thumb\Pos : LastY = MouseY - \Thumb\Pos
          EndSelect
          
        Case #PB_EventType_MouseMove
          If Drag
            If Bool(LastX|LastY) 
              If *Thisis = *This
                If \Vertical
                  Result = SetState(*This, Pos(*This, (MouseY-LastY)))
                Else
                  Result = SetState(*This, Pos(*This, (MouseX-LastX)))
                EndIf
              EndIf
            EndIf
          Else
            If Buttons
              If Last <> Buttons
                If *Thisis>0 : CallBack(*Thisis, #PB_EventType_MouseLeave, MouseX, MouseY, WheelDelta) : EndIf
                EventType = #PB_EventType_MouseEnter
                Last = Buttons
              EndIf
              
              If *Thisis <> *This 
                ; Debug "Мышь находится внутри"
                Cursor = GetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor)
                SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, #PB_Cursor_Default)
                *Thisis = *This
              EndIf
              
              \Buttons = Buttons
            ElseIf *Thisis = *This
              If Cursor <> GetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor)
                ; Debug "Мышь находится снаружи"
                SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, Cursor)
              EndIf
              EventType = #PB_EventType_MouseLeave
              \Buttons = 0
              *Thisis = 0
              Last = 0
            EndIf
          EndIf
          
      EndSelect
      
      ; set colors
      Select EventType
        Case #PB_EventType_Focus : \Focus = #True : Result = #True
        Case #PB_EventType_LostFocus : \Focus = #False : Result = #True
        Case #PB_EventType_LeftButtonDown, #PB_EventType_LeftButtonUp, #PB_EventType_MouseEnter, #PB_EventType_MouseLeave
          If Buttons>0
            \Color[Buttons]\Fore = \Color[Buttons]\Fore[2+Bool(EventType=#PB_EventType_LeftButtonDown)]
            \Color[Buttons]\Back = \Color[Buttons]\Back[2+Bool(EventType=#PB_EventType_LeftButtonDown)]
            \Color[Buttons]\Frame = \Color[Buttons]\Frame[2+Bool(EventType=#PB_EventType_LeftButtonDown)]
            \Color[Buttons]\Line = \Color[Buttons]\Line[2+Bool(EventType=#PB_EventType_LeftButtonDown)]
          ElseIf Not Drag And Not Buttons 
            ResetColor(*This)
          EndIf
          
          Result = #True
          
      EndSelect
      
      If AutoHide =- 1 : *Scroll = 0
        If Not *Thisis : *Thisis =- 1 : EndIf
        AutoHide = Bool(EventType() = #PB_EventType_MouseLeave)
      ElseIf AutoHide And *Thisis = *This
        *Thisis =- 1
      EndIf
      
      ; Auto hides
      If (AutoHide And Not Drag And Not Buttons) 
        If \Alpha <> \Alpha[1] : \Alpha = \Alpha[1] 
          Result =- 1
        EndIf 
      EndIf
      If EventType = #PB_EventType_MouseEnter And *Thisis =- 1
        If \Alpha < 255 : \Alpha = 255
          
          If *Scroll
            If \Vertical
              Resize(*This, #PB_Ignore, #PB_Ignore, #PB_Ignore, (*Scroll\y+*Scroll\height)-\y) 
            Else
              Resize(*This, #PB_Ignore, #PB_Ignore, (*Scroll\x+*Scroll\width)-\x, #PB_Ignore) 
            EndIf
          EndIf
          
          Result =- 2
        EndIf 
      EndIf
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.b Gadget(*Scroll.Struct, X.l,Y.l,Width.l,Height.l, Min.l, Max.l, PageLength.l, Flag.l, Radius.l=0)
    
    With *Scroll
      \Alpha = 255
      \Alpha[1] = 0
      \Radius = Radius
      \Color[0]\Fore[1] = $F6F6F6 
      \Color[0]\Frame[1] = $BABABA
      
      \Color[0]\Back[1] = $F9F9F9 ; $F0F0F0 
      \Color[1]\Back[1] = $E2E2E2  
      \Color[2]\Back[1] = $E2E2E2 
      \Color[3]\Back[1] = $E2E2E2 
      
      \Color[0]\Line[1] = $FFFFFF
      \Color[1]\Line[1] = $5B5B5B
      \Color[2]\Line[1] = $5B5B5B
      \Color[3]\Line[1] = $5B5B5B
      
      ;
      \Color[0]\Fore[2] = $EAEAEA
      \Color[0]\Back[2] = $CECECE
      \Color[0]\Line[2] = $5B5B5B
      \Color[0]\Frame[2] = $8F8F8F
      
      ;
      \Color[0]\Fore[3] = $E2E2E2
      \Color[0]\Back[3] = $B4B4B4
      \Color[0]\Line[3] = $FFFFFF
      \Color[0]\Frame[3] = $6F6F6F
      
      ResetColor(*Scroll)
      
      \Type = #PB_GadgetType_ScrollBar
      \DrawingMode = #PB_2DDrawing_Gradient
      \Vertical = Bool(Flag&#PB_ScrollBar_Vertical)
      
      If \Vertical
        If width < 21
          \Button\Length = width - 1
        Else
          \Button\Length = 17
        EndIf
      Else
        If height < 21
          \Button\Length = height - 1
        Else
          \Button\Length = 17
        EndIf
      EndIf
      
      If \Min <> Min : SetAttribute(*Scroll, #PB_ScrollBar_Minimum, Min) : EndIf
      If \Max <> Max : SetAttribute(*Scroll, #PB_ScrollBar_Maximum, Max) : EndIf
      If \Page\Length <> Pagelength : SetAttribute(*Scroll, #PB_ScrollBar_PageLength, Pagelength) : EndIf
    EndWith
    
    ProcedureReturn Resize(*Scroll, X,Y,Width,Height)
  EndProcedure
  
EndModule

;- EXAMPLE
; IncludePath "C:\Users\as\Documents\GitHub\"
; XIncludeFile "module_scroll.pbi"

EnableExplicit

Structure canvasitem
  img.i
  x.i
  y.i
  width.i
  height.i
  alphatest.i
EndStructure

Enumeration
  #MyCanvas = 1   ; just to test whether a number different from 0 works now
EndEnumeration

Global *v.Scroll::Struct=AllocateStructure(Scroll::Struct)
Global *h.Scroll::Struct=AllocateStructure(Scroll::Struct)

Global isCurrentItem=#False
Global currentItemXOffset.i, currentItemYOffset.i
Global Event.i, x.i, y.i, drag.i, hole.i, Width, Height
Global NewList Images.canvasitem()

Procedure AddImage (List Images.canvasitem(), x, y, img, alphatest=0)
  If AddElement(Images())
    Images()\img    = img
    Images()\x      = x
    Images()\y      = y
    Images()\width  = ImageWidth(img)
    Images()\height = ImageHeight(img)
    Images()\alphatest = alphatest
  EndIf
EndProcedure

Procedure Draw (canvas.i, List Images.canvasitem())
  Protected iWidth = Scroll::X(*v), iHeight = Scroll::Y(*h)
  
  If StartDrawing(CanvasOutput(canvas))
    
    ClipOutput(0,0, iWidth, iHeight)
    
    DrawingMode(#PB_2DDrawing_Default)
    Box(0, 0, iWidth, iHeight, RGB(255,255,255))
    
    DrawingMode(#PB_2DDrawing_AlphaBlend)
    ForEach Images()
      DrawImage(ImageID(Images()\img),Images()\x - *h\Page\Pos,Images()\y - *v\Page\Pos) ; draw all images with z-order
    Next
    
    UnclipOutput()
    
    Scroll::Draw(*v)
    Scroll::Draw(*h)
    
    StopDrawing()
  EndIf
EndProcedure

Procedure.i HitTest (List Images.canvasitem(), x, y)
  Shared currentItemXOffset.i, currentItemYOffset.i
  Protected alpha.i, isCurrentItem.i = #False
  
  If LastElement(Images()) ; search for hit, starting from end (z-order)
    Repeat
      If x >= Images()\x - *h\Page\Pos And x < Images()\x - *h\Page\Pos + Images()\width
        If y >= Images()\y - *v\Page\Pos And y < Images()\y - *v\Page\Pos + Images()\height
          alpha = 255
          
          If Images()\alphatest And ImageDepth(Images()\img)>31
            If StartDrawing(ImageOutput(Images()\img))
              DrawingMode(#PB_2DDrawing_AlphaChannel)
              alpha = Alpha(Point(x-Images()\x, y-Images()\y)) ; get alpha
              StopDrawing()
            EndIf
          EndIf
          
          If alpha
            MoveElement(Images(), #PB_List_Last)
            isCurrentItem = #True
            currentItemXOffset = x - Images()\x
            currentItemYOffset = y - Images()\y
            Break
          EndIf
        EndIf
      EndIf
    Until PreviousElement(Images()) = 0
  EndIf
  
  ProcedureReturn isCurrentItem
EndProcedure

AddImage(Images(),  10, 10, LoadImage(#PB_Any, #PB_Compiler_Home + "Examples/Sources/Data/PureBasic.bmp"))
AddImage(Images(), 100,100, LoadImage(#PB_Any, #PB_Compiler_Home + "Examples/Sources/Data/GeeBee2.bmp"))
AddImage(Images(),  50,200, LoadImage(#PB_Any, #PB_Compiler_Home + "Examples/Sources/Data/AlphaChannel.bmp"))

hole = CreateImage(#PB_Any,100,100,32)
If StartDrawing(ImageOutput(hole))
  DrawingMode(#PB_2DDrawing_AllChannels)
  Box(0,0,100,100,RGBA($00,$00,$00,$00))
  Circle(50,50,48,RGBA($00,$FF,$FF,$FF))
  Circle(50,50,30,RGBA($00,$00,$00,$00))
  StopDrawing()
EndIf
AddImage(Images(),170,70,hole,1)


Macro GetScrollCoordinate()
  ScrollX = Images()\x
  ScrollY = Images()\Y
  ScrollWidth = Images()\x+Images()\width
  ScrollHeight = Images()\Y+Images()\height
  
  PushListPosition(Images())
  ForEach Images()
    If ScrollX > Images()\x : ScrollX = Images()\x : EndIf
    If ScrollY > Images()\Y : ScrollY = Images()\Y : EndIf
    If ScrollWidth < Images()\x+Images()\width : ScrollWidth = Images()\x+Images()\width : EndIf
    If ScrollHeight < Images()\Y+Images()\height : ScrollHeight = Images()\Y+Images()\height : EndIf
  Next
  PopListPosition(Images())
EndMacro

Procedure ScrollUpdates(*v.Scroll::Struct, *h.Scroll::Struct, ScrollArea_X, ScrollArea_Y, ScrollArea_Width, ScrollArea_Height)
  Protected iWidth = Scroll::X(*v), iHeight = Scroll::Y(*h)
  Static hPos, vPos : vPos = *v\Page\Pos : hPos = *h\Page\Pos
  
  ; Вправо работает как надо
  If ScrollArea_Width<*h\Page\Pos+iWidth 
    ScrollArea_Width=*h\Page\Pos+iWidth
    ; Влево работает как надо
  ElseIf ScrollArea_X>*h\Page\Pos And
         ScrollArea_Width=*h\Page\Pos+iWidth 
    ScrollArea_Width = iWidth 
  EndIf
  
  ; Вниз работает как надо
  If ScrollArea_Height<*v\Page\Pos+iHeight
    ScrollArea_Height=*v\Page\Pos+iHeight 
    ; Верх работает как надо
  ElseIf ScrollArea_Y>*v\Page\Pos And
         ScrollArea_Height=*v\Page\Pos+iHeight 
    ScrollArea_Height = iHeight 
  EndIf
  
  If ScrollArea_X>0 : ScrollArea_X=0 : EndIf
  If ScrollArea_Y>0 : ScrollArea_Y=0 : EndIf
  
  If ScrollArea_X<*h\Page\Pos : ScrollArea_Width-ScrollArea_X : EndIf
  If ScrollArea_Y<*v\Page\Pos : ScrollArea_Height-ScrollArea_Y : EndIf
  
  If *v\Max<>ScrollArea_Height : Scroll::SetAttribute(*v, #PB_ScrollBar_Maximum, ScrollArea_Height) : EndIf
  If *h\Max<>ScrollArea_Width : Scroll::SetAttribute(*h, #PB_ScrollBar_Maximum, ScrollArea_Width) : EndIf
  
  If *v\Page\Length<>iHeight : Scroll::SetAttribute(*v, #PB_ScrollBar_PageLength, iHeight) : EndIf
  If *h\Page\Length<>iWidth : Scroll::SetAttribute(*h, #PB_ScrollBar_PageLength, iWidth) : EndIf
  
  If ScrollArea_Y<0 : Scroll::SetState(*v, (ScrollArea_Height-ScrollArea_Y)-ScrollArea_Height) : EndIf
  If ScrollArea_X<0 : Scroll::SetState(*h, (ScrollArea_Width-ScrollArea_X)-ScrollArea_Width) : EndIf
  
  *v\Hide = Scroll::Resize(*v, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *h) 
  *h\Hide = Scroll::Resize(*h, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *v)
  
  ;   If *v\Hide : *v\Page\Pos = 0 : Else : *v\Page\Pos = vPos : *h\Width = iWidth+*v\Width : EndIf
  ;   If *h\Hide : *h\Page\Pos = 0 : Else : *h\Page\Pos = hPos : *v\Height = iHeight+*h\Height : EndIf
  
  If *v\Hide : *v\Page\Pos = 0 : If vPos : *v\Hide = vPos : EndIf : Else : *v\Page\Pos = vPos : *h\Width = iWidth+*v\Width : EndIf
  If *h\Hide : *h\Page\Pos = 0 : If hPos : *h\Hide = hPos : EndIf : Else : *h\Page\Pos = hPos : *v\Height = iHeight+*h\Height : EndIf
  
  ProcedureReturn Bool(ScrollArea_Height>=iHeight Or ScrollArea_Width>=iWidth)
EndProcedure

Procedure CallBack()
  Protected Repaint
  Protected Event = EventType()
  Protected Canvas = EventGadget()
  Protected MouseX = GetGadgetAttribute(Canvas, #PB_Canvas_MouseX)
  Protected MouseY = GetGadgetAttribute(Canvas, #PB_Canvas_MouseY)
  Protected Buttons = GetGadgetAttribute(EventGadget(), #PB_Canvas_Buttons)
  Protected WheelDelta = GetGadgetAttribute(EventGadget(), #PB_Canvas_WheelDelta)
  Protected Width = GadgetWidth(Canvas)
  Protected Height = GadgetHeight(Canvas)
  Protected ScrollX, ScrollY, ScrollWidth, ScrollHeight
  
  If Scroll::CallBack(*v, Event, MouseX, MouseY, WheelDelta) 
    Repaint = #True 
  EndIf
  If Scroll::CallBack(*h, Event, MouseX, MouseY, WheelDelta) 
    Repaint = #True 
  EndIf
  
  Select Event
    Case #PB_EventType_LeftButtonUp
      GetScrollCoordinate()
      
      If (ScrollX<0 Or ScrollY<0)
        PushListPosition(Images())
        ForEach Images()
          If ScrollX<0
            *h\Page\Pos =- ScrollX
            Images()\X-ScrollX
          EndIf
          If ScrollY<0
            *v\Page\Pos =- ScrollY
            Images()\Y-ScrollY
          EndIf
        Next
        PopListPosition(Images())
      EndIf
      
  EndSelect     
  
  
  If (*h\Buttons Or *v\Buttons)
    Select Event
      Case #PB_EventType_LeftButtonUp
        Debug "----------Up---------"
        GetScrollCoordinate()
        ScrollUpdates(*v,*h, ScrollX, ScrollY, ScrollWidth, ScrollHeight)
        ;           Protected iWidth = Width-Scroll::Width(*v), iHeight = Height-Scroll::Height(*h)
        ;   
        ;         Debug ""+*h\Hide+" "+ScrollX+" "+Str(ScrollWidth-iWidth)
        ;         Debug ""+*v\Hide+" "+ScrollY+" "+Str(ScrollHeight-iHeight)
        
        PushListPosition(Images())
        ForEach Images()
          ;           If *h\Hide And (ScrollWidth-Width)>0 : Images()\X-(ScrollWidth-Width) : EndIf
          ;           If *v\Hide And (ScrollHeight-Height)>0 : Images()\Y-(ScrollHeight-Height) : EndIf
          If *h\Hide>1 : Images()\X-*h\Hide : EndIf
          If *v\Hide>1 : Images()\Y-*v\Hide : EndIf
        Next
        PopListPosition(Images())
        
        
    EndSelect
  Else
    Select Event
      Case #PB_EventType_LeftButtonUp : Drag = #False
      Case #PB_EventType_LeftButtonDown
        isCurrentItem = HitTest(Images(), Mousex, Mousey)
        If isCurrentItem 
          Repaint = #True 
          Drag = #True
        EndIf
        
      Case #PB_EventType_MouseMove
        If Drag = #True
          If isCurrentItem
            If LastElement(Images())
              Images()\x = Mousex - currentItemXOffset
              Images()\y = Mousey - currentItemYOffset
              SetWindowTitle(EventWindow(), Str(Images()\x))
              
              GetScrollCoordinate()
              Repaint = Scroll::Updates(*v,*h, ScrollX, ScrollY, ScrollWidth, ScrollHeight)
            EndIf
          EndIf
        EndIf
        
      Case #PB_EventType_Resize : ResizeGadget(Canvas, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore) ; Bug (562)
        GetScrollCoordinate()
        
        If *h\Max<>ScrollWidth : Scroll::SetAttribute(*h, #PB_ScrollBar_Maximum, ScrollWidth) : EndIf
        If *v\Max<>ScrollHeight : Scroll::SetAttribute(*v, #PB_ScrollBar_Maximum, ScrollHeight) : EndIf
        
        Scroll::Resizes(*v, *h, 0, 0, Width, Height)
        Repaint = #True
        
    EndSelect
  EndIf 
  
  If Repaint : Draw(#MyCanvas, Images()) : EndIf
EndProcedure

Procedure ResizeCallBack()
  ResizeGadget(#MyCanvas, #PB_Ignore, #PB_Ignore, WindowWidth(EventWindow(), #PB_Window_InnerCoordinate)-20, WindowHeight(EventWindow(), #PB_Window_InnerCoordinate)-20)
EndProcedure


If Not OpenWindow(0, 0, 0, 420, 420, "Move/Drag Canvas Image", #PB_Window_SystemMenu | #PB_Window_SizeGadget | #PB_Window_ScreenCentered) 
  MessageRequester("Fatal error", "Program terminated.")
  End
EndIf

;
CanvasGadget(#MyCanvas, 10, 10, 400, 400)

*v\Hide = Scroll::Gadget(*v, 380, 0,  20, 380, 0, 0, 0, #PB_ScrollBar_Vertical)
*h\Hide = Scroll::Gadget(*h, 0, 380, 380,  20, 0, 0, 0, 0)

PostEvent(#PB_Event_Gadget, 0,#MyCanvas,#PB_EventType_Resize)
BindGadgetEvent(#MyCanvas, @CallBack())
BindEvent(#PB_Event_SizeWindow, @ResizeCallBack(), 0)

Repeat
  Event = WaitWindowEvent()
Until Event = #PB_Event_CloseWindow
; IDE Options = PureBasic 5.70 LTS (MacOS X - x64)
; Folding = ---------------------------------
; EnableXP