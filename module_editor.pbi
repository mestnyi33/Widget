﻿CompilerIf #PB_Compiler_OS = #PB_OS_MacOS 
  IncludePath "/Users/as/Documents/GitHub/Widget/"
CompilerElseIf #PB_Compiler_OS = #PB_OS_Windows
  ;  IncludePath "/Users/as/Documents/GitHub/Widget/"
CompilerElseIf #PB_Compiler_OS = #PB_OS_Linux
  IncludePath "/Users/a/Documents/GitHub/Widget/"
CompilerEndIf
; XIncludeFile "module_scroll.pbi"

CompilerIf #PB_Compiler_IsMainFile
  XIncludeFile "module_draw.pbi"
  
  XIncludeFile "module_macros.pbi"
  XIncludeFile "module_constants.pbi"
  XIncludeFile "module_structures.pbi"
  XIncludeFile "module_scroll.pbi"
  XIncludeFile "module_text.pbi"
  
  CompilerIf #VectorDrawing
    UseModule Draw
  CompilerEndIf
CompilerEndIf

DeclareModule Editor
  EnableExplicit
  UseModule Macros
  UseModule Constants
  UseModule Structures
  
  CompilerIf #VectorDrawing
    UseModule Draw
  CompilerEndIf
  
  
  ;- DECLARE
  Declare.i Draw(*This.Widget_S, Canvas.i=-1)
  Declare GetState(Gadget.i)
  Declare.s GetText(Gadget.i)
  Declare SetState(Gadget.i, State.i)
  Declare GetAttribute(Gadget.i, Attribute.i)
  Declare SetAttribute(Gadget.i, Attribute.i, Value.i)
  Declare SetText(Gadget, Text.s, Item.i=0)
  Declare SetFont(Gadget, FontID.i)
  Declare AddItem(Gadget,Item,Text.s,Image.i=-1,Flag.i=0)
  
  Declare.i Resize(*This.Widget_S, X.i,Y.i,Width.i,Height.i, Canvas.i=-1)
  Declare.i Create(Canvas.i, Widget, X.i, Y.i, Width.i, Height.i, Text.s, Flag.i=0, Radius.i=0)
  Declare.i Gadget(Gadget.i, X.i, Y.i, Width.i, Height.i, Flag.i=0)
  Declare.i CallBack(*This.Widget_S, EventType.i, Canvas.i=-1, CanvasModifiers.i=-1)
  
EndDeclareModule

Module Editor
  ; ;   UseModule Constant
  ;- PROCEDURE
  Procedure item_from(*This.Widget_S, MouseX=-1, MouseY=-1, focus=0)
    Protected adress.i
    Protected lostfocus.l=-1, collapsed.l, sublevel.l, coll.l
    
    With *This
      PushListPosition(\Items()) 
      ForEach \Items()
        If \Items()\from = \Items()\Item 
          \Items()\from =- 1
          adress = @\Items()
          Break
        EndIf
      Next
      
      ForEach \Items()
        If \Items()\Item = \Items()\focus
          If Bool(MouseX=-1 And MouseY=-1 And focus=1)
            \Items()\lostfocus = \Items()\focus
            *This\focus = 0
          EndIf
          adress = @\Items()
          Break
        EndIf
      Next
      
      If Not Bool(MouseX=-1 And MouseY=-1)
        ForEach \Items()
          If \Items()\hide : Continue : EndIf
          If (MouseY > (\Items()\Y) And MouseY =< ((\Items()\Y+\Items()\Height))) And 
             ((MouseX > \Items()\X) And (MouseX =< (\Items()\X+\Items()\Width)))
            
            If focus
              If (MouseY > (\Items()\box\y[1]) And MouseY =< ((\Items()\box\y[1]+\Items()\box\height[1]))) And 
                 ((MouseX > \Items()\box\x[1]) And (MouseX =< (\Items()\box\x[1]+\Items()\box\width[1])))
                
                \Items()\checked ! 1
                *This\Change = 1
              EndIf
              
              If (Not \flag&#NoButtons And \Items()\childrens) And
                 (MouseY > (\Items()\box\y[0]) And MouseY =< ((\Items()\box\y[0]+\Items()\box\height[0]))) And 
                 ((MouseX > \Items()\box\x[0]) And (MouseX =< (\Items()\box\x[0]+\Items()\box\width[0])))
                
                sublevel = \Items()\sublevel
                \Items()\collapsed ! 1
                
                PushListPosition(\Items())
                While NextElement(\Items())
                  If sublevel = \Items()\sublevel
                    Break
                  ElseIf sublevel < \Items()\sublevel 
                    If \Items()\adress
                      PushListPosition(\Items())
                      ChangeCurrentElement(\Items(), \Items()\adress)
                      collapsed = \Items()\collapsed
                      If \Items()\hide
                        collapsed = 1
                      EndIf
                      PopListPosition(\Items())
                    EndIf
                    
                    \Items()\hide = collapsed
                  EndIf
                Wend
                PopListPosition(\Items())
                
              Else
                ; Get entered item only on image and text 
                If Not *This\flag&#FullSelection And
                   ((MouseX < \Items()\text\x-*This\Image\width) Or (MouseX > \Items()\text\x+\Items()\text\width))
                  Break
                EndIf
                
                If adress 
                  PushListPosition(\Items()) 
                  ChangeCurrentElement(\Items(), adress)
                  If \Items()\focus = \Items()\Item
                    lostfocus = \Items()\focus 
                    \Items()\lostfocus =- 1
                    \Items()\focus =- 1
                  EndIf
                  PopListPosition(\Items()) 
                  If lostfocus <> \Items()\Item
                    \Items()\lostfocus = lostfocus
                    *This\Item = \Items()\Item
                    *This\Change = 1
                  EndIf
                EndIf
                
                \Items()\focus = \Items()\Item
              EndIf
              
            EndIf
            
            If \Items()\from <> \Items()\Item 
              \Items()\from = \Items()\Item
              *This\from = \Items()\from
              ;  *This\text = \Items()\text 
            EndIf
            
            adress = @\Items()
            
            Break
          EndIf
        Next
      EndIf
      PopListPosition(\Items())
    EndWith
    
    ProcedureReturn adress
  EndProcedure
  
  Procedure.i Clip(*This.Widget_S, X.i,Y.i,Width.i,Height.i)
    ; Static Clip_X.i,Clip_Y.i,Clip_Width.i,Clip_Height.i
    
    With *This
      If X<>#PB_Ignore 
        \Clip\X = X
      EndIf
      If Y<>#PB_Ignore 
        \Clip\Y = Y
      EndIf
      If Width<>#PB_Ignore 
        \Clip\Width = Width
      EndIf
      If Height<>#PB_Ignore 
        \Clip\Height = Height
      EndIf
      
      CompilerIf #PB_Compiler_OS <> #PB_OS_MacOS 
        ClipOutput(\Clip\X,\Clip\Y,\Clip\Width,\Clip\Height)
      CompilerEndIf
    EndWith
  EndProcedure
  
  Procedure.i Draw(*This.Widget_S, Canvas.i=-1)
    Protected Drawing, Wrap, String.s, StringWidth
    Protected IT,Text_Y,Text_X,Width,Height
    
    If Not *This\Hide
      With *This
        If Canvas=-1 : Canvas = EventGadget() : EndIf
        If Canvas <> \Canvas\Gadget : ProcedureReturn : EndIf
        
        ; Make output text
        If \Text\String.s
          If \Text\FontID 
            DrawingFont(\Text\FontID) 
          EndIf
          
          If \Text\Change
            \Text\Height = TextHeight("A") + 1
            \Text\Width = TextWidth(\Text\String.s)
          EndIf
          
          If (\Text\Change Or \Resize)
            Text::MultiLine(*This)
          EndIf
          
          If \Text\Change
            \Text\Change = 0
          EndIf
          
          If \Resize
            \Resize = 0
          EndIf
        EndIf 
        
        ; Draw back color
        If \Color\Fore
          DrawingMode(#PB_2DDrawing_Gradient)
          BoxGradient(\Vertical,\X[1],\Y[1],\Width[1],\Height[1],\Color\Fore,\Color\Back,\Radius)
        Else
          DrawingMode(#PB_2DDrawing_Default)
          RoundBox(\X[1],\Y[1],\Width[1],\Height[1],\Radius,\Radius,\Color\Back)
        EndIf
        
        Clip(*This, \X[2],\Y[2],\Width[2],\Height[2])
      EndWith 
      
      ; Draw items text
      If ListSize(*This\Items())
        With *This\Items()
          Protected ScrollPagePos = *This\vScroll\Page\Pos
          
          PushListPosition(*This\Items())
          ForEach *This\Items()
            \Hide = Bool( Not Bool(\y+\height-ScrollPagePos>*This\y[2] And \y-ScrollPagePos<*This\height[2]))
            ;Debug ScrollPagePos
            
            If Not \Hide
              ; Draw selections
              If \Item=*This\Line
                ; Draw items back color
                If \Color\Fore
                  DrawingMode(#PB_2DDrawing_Gradient)
                  BoxGradient(\Vertical,*This\X[2],\Y-ScrollPagePos,*This\Width[2],\Height,*This\Color\Fore[2],*This\Color\Back[2],\Radius)
                Else
                  DrawingMode(#PB_2DDrawing_Default)
                  RoundBox(*This\X[2],\Y-ScrollPagePos,*This\Width[2],\Height,\Radius,\Radius,*This\Color\Back[2])
                EndIf
                
                DrawingMode(#PB_2DDrawing_Outlined)
                Box(*This\x[2],\y-ScrollPagePos,*This\width[2],\height, *This\Color\Frame[2])
              EndIf
              
              ; Draw image
              If \Image\handle
                DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                DrawAlphaImage(\Image\handle, \Image\x, \Image\y-ScrollPagePos, \alpha)
              EndIf
              
              ; Draw string
              If \Text[1]\Change : \Text[1]\Change = #False
                \Text[1]\Width = TextWidth(\Text[1]\String.s) 
              EndIf 
              
              If \Text\String.s
                Clip(*This, \X, #PB_Ignore, \Width, #PB_Ignore) 
                
                If \Text\FontID 
                  DrawingFont(\Text\FontID) 
                EndIf
                
                If \Text[2]\Change : \Text[2]\Change = #False 
                  \Text[2]\X = \Text[0]\X+\Text[1]\Width
                  \Text[2]\Width = TextWidth(\Text[2]\String.s) ; bug in mac os
                  \Text[3]\X = \Text[2]\X+\Text[2]\Width
                EndIf 
                
                If \Text[3]\Change : \Text[3]\Change = #False 
                  \Text[3]\Width = TextWidth(\Text[3]\String.s)
                EndIf
                
                ;If *This\Focus = *This 
                Protected Left,Right
                Left =- (\Text[1]\Width+(Bool(*This\Caret>*This\Caret[1])*\Text[2]\Width))
                Right = (\Width + Left)
                
                If *This\Scroll\X < Left
                  *This\Scroll\X = Left
                ElseIf *This\Scroll\X > Right
                  *This\Scroll\X = Right
                ElseIf (*This\Scroll\X < 0 And *This\Caret = *This\Caret[1] And Not *This\Canvas\Input) ; Back string
                  *This\Scroll\X = (\Width-\Text[3]\Width) + Left
                  If *This\Scroll\X>0
                    *This\Scroll\X=0
                  EndIf
                EndIf
                ;EndIf
                
                ; Draw text
                If \Text[2]\Len > 0 And *This\Color\Front <> *This\Color\Front[3]
                  
                  CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
                    If (*This\Caret[1] > *This\Caret And *This\Line[1] = *This\Line) Or (*This\Line[1] > *This\Line And *This\Line = \Item)
                      \Text[3]\X = \Text\X+TextWidth(Left(\Text\String.s, *This\Caret[1])) 
                      
                      If *This\Line[1] = *This\Line
                        \Text[2]\X = \Text[3]\X-\Text[2]\Width
                      EndIf
                      
                      If \Text[3]\String.s
                        DrawingMode(#PB_2DDrawing_Transparent)
                        DrawText((\Text[3]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[3]\String.s, *This\Color\Front)
                      EndIf
                      
                      DrawingMode(#PB_2DDrawing_Default)
                      Box((\Text[2]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[2]\Width+\Text[2]\Width[2], \Text\Height, *This\Color\Frame[3])
                      
                      If \Text[2]\String.s
                        DrawingMode(#PB_2DDrawing_Transparent)
                        DrawText((\Text\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[1]\String.s+\Text[2]\String.s, *This\Color\Front[3])
                      EndIf
                      
                      If \Text[1]\String.s
                        DrawingMode(#PB_2DDrawing_Transparent)
                        DrawText((\Text\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[1]\String.s, *This\Color\Front)
                      EndIf
                    Else
                      DrawingMode(#PB_2DDrawing_Transparent)
                      DrawText((\Text\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text\String.s, *This\Color\Front)
                      
                      DrawingMode(#PB_2DDrawing_Default)
                      Box((\Text[2]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[2]\Width+\Text[2]\Width[2], \Text\Height, *This\Color\Frame[3])
                      
                      If \Text[2]\String.s
                        DrawingMode(#PB_2DDrawing_Transparent)
                        DrawText((\Text[2]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[2]\String.s, *This\Color\Front[3])
                      EndIf
                    EndIf
                  CompilerElse
                    If \Text[1]\String.s
                      DrawingMode(#PB_2DDrawing_Transparent)
                      DrawRotatedText((\Text[0]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[1]\String.s, Bool(\Text\Vertical)**This\Text\Rotate, *This\Color\Front)
                    EndIf
                    
                    DrawingMode(#PB_2DDrawing_Default)
                    Box((\Text[2]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[2]\Width+\Text[2]\Width[2], \Text[0]\Height, *This\Color\Frame[3])
                    
                    If \Text[2]\String.s
                      DrawingMode(#PB_2DDrawing_Transparent)
                      DrawRotatedText((\Text[2]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[2]\String.s, Bool(\Text\Vertical)**This\Text\Rotate, *This\Color\Front[3])
                    EndIf
                    
                    If \Text[3]\String.s
                      DrawingMode(#PB_2DDrawing_Transparent)
                      DrawRotatedText((\Text[3]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[3]\String.s, Bool(\Text\Vertical)**This\Text\Rotate, *This\Color\Front)
                    EndIf
                  CompilerEndIf
                  
                Else
                  If \Text[2]\Len > 0
                    DrawingMode(#PB_2DDrawing_Default)
                    Box((\Text[2]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[2]\Width+\Text[2]\Width[2], \Text[0]\Height, *This\Color\Frame[3])
                  EndIf
                  
                  DrawingMode(#PB_2DDrawing_Transparent)
                  DrawRotatedText((\Text[0]\X+*This\Scroll\X), \Text\Y-ScrollPagePos, \Text[0]\String.s, Bool(\Text\Vertical)**This\Text\Rotate, *This\Color\Front)
                EndIf
                
              EndIf
            EndIf
            
          Next
          PopListPosition(*This\Items()) ; 
          
          If *This\Text\Editable ;And *This\Caret = *This\Caret[1] And *This\Line = *This\Line[1] And Not \Text[2]\Width[2]
                                 ; Debug ""+ *This\Caret +" "+ *This\Caret[1] +" "+ \Text[1]\Width +" "+ \Text[1]\String.s
            DrawingMode(#PB_2DDrawing_XOr)     
            Line(((\Text[0]\X+*This\Scroll\X) + \Text[1]\Width), \Text[0]\Y, 1, \Text[0]\Height, $FFFFFFFF ! *This\Color\Frame[3])
          EndIf
          
          Wrap = Bool(*This\Text\MultiLine)
          
          If *This\vScroll\Page\Length And *This\vScroll\Max<>*This\Scroll\Height And
             Scroll::SetAttribute(*This\vScroll, #PB_ScrollBar_Maximum, *This\Scroll\Height)
            Scroll::Resizes(*This\vScroll, *This\hScroll, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
            ; *This\vScroll\Page\ScrollStep = height
          EndIf
          If Not Wrap And *This\hScroll\Page\Length And *This\hScroll\Max<>*This\Scroll\Width And
             Scroll::SetAttribute(*This\hScroll, #PB_ScrollBar_Maximum, *This\Scroll\Width)
            Scroll::Resizes(*This\vScroll, *This\hScroll, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
          EndIf
          
          Scroll::Draw(*This\vScroll)
          If Not Wrap
            Scroll::Draw(*This\hScroll)
          EndIf
        EndWith  
      EndIf
      
      ; Draw frames
      With *This
        ;         Clip(*This, \X[1]-2,\Y[1]-2,\Width[1]+4,\Height[1]+4)
        Clip(*This, \X[1]-1,\Y[1]-1,\Width[1]+2,\Height[1]+2)
        
        ; Draw image
        If \Image\handle
          DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
          DrawAlphaImage(\Image\handle, \Image\x, \Image\y, \alpha)
        EndIf
        
        ; Draw frames
        DrawingMode(#PB_2DDrawing_Outlined)
        
        If \Default
          RoundBox(\X[1]+2,\Y[1]+2,\Width[1]-4,\Height[1]-4,\Radius,\Radius,\Color\Frame[3])
          ;           If \Radius ; Сглаживание краев)))
          ;             RoundBox(\X[1]+2,\Y[1]+3,\Width[1]-4,\Height[1]-6,\Radius,\Radius,\Color\Frame[3]) ; $D5A719)
          ;           EndIf
          ;           RoundBox(\X[1]+3,\Y[1]+3,\Width[1]-6,\Height[1]-6,\Radius,\Radius,\Color\Frame[3])
        EndIf
        
        If \Focus = *This ;  Debug "\Focus "+\Focus
          RoundBox(\X[1],\Y[1],\Width[1],\Height[1],\Radius,\Radius,\Color\Frame[3])
          If \Radius ; Сглаживание краев))) ; RoundBox(\X[1],\Y[1],\Width[1]+1,\Height[1]+1,\Radius,\Radius,\Color\Frame[3])
            RoundBox(\X[1],\Y[1]-1,\Width[1],\Height[1]+2,\Radius,\Radius,\Color\Frame[3]) ; $D5A719)
          EndIf
          RoundBox(\X[1]-1,\Y[1]-1,\Width[1]+2,\Height[1]+2,\Radius,\Radius,\Color\Frame[3])
        Else
          If \fSize
            RoundBox(\X[1],\Y[1],\Width[1],\Height[1],\Radius,\Radius,\Color\Frame)
          EndIf
        EndIf
      EndWith
    EndIf
    
  EndProcedure
  
  Procedure ReDraw(*This.Widget_S, Canvas =- 1)
    If StartDrawing(CanvasOutput(*This\Canvas\Gadget))
      Draw(*This, Canvas)
      StopDrawing()
    EndIf
  EndProcedure
  
  Procedure Caret(*This.Widget_S, Line.i = 0)
    Static LastLine.i =- 1,  LastItem.i =- 1
    Protected Item.i, SelectionLen.i=7
    Protected Position.i =- 1, i.i, Len.i, X.i, FontID.i, String.s, 
              CursorX.i, Distance.f, MinDistance.f = Infinity()
    
    With *This
      If Line < 0 And FirstElement(*This\Items())
        ; А если выше всех линии текста,
        ; то позиция коректора начало текста.
        Position = 0
      ElseIf Line < ListSize(*This\Items()) And 
             SelectElement(*This\Items(), Line)
        ; Если находимся на линии текста, 
        ; то получаем позицию коректора.
        
        If ListSize(\Items())
          X = (\Items()\Text\X+\Scroll\X)
          Len = \Items()\Text\Len; + Len(" ")
          FontID = \Items()\Text\FontID
          String.s = \Items()\Text\String.s;+" "
          If Not FontID : FontID = \Text\FontID : EndIf
          
          If StartDrawing(CanvasOutput(\Canvas\Gadget)) 
            If FontID : DrawingFont(FontID) : EndIf
            
            For i = 0 To Len
              CursorX = X + TextWidth(Left(String.s, i))
              Distance = (\Canvas\Mouse\X-CursorX)*(\Canvas\Mouse\X-CursorX)
              
              ; Получаем позицию коpректора
              If MinDistance > Distance 
                MinDistance = Distance
                Position = i
              EndIf
            Next
            
            ; Длина переноса строки
            PushListPosition(\Items())
            If \Canvas\Mouse\Y < \Y+\Text\Height/2
              Item.i =- 1 
            Else
              Item.i = ((((\Canvas\Mouse\Y-\Y-\Text\Y)-\Scroll\Y) / (\Text\Height/2)) - 1)/2
            EndIf
            
            If LastLine <> \Line Or LastItem <> Item
              \Items()\Text[2]\Width[2] = 0
              
              If \Line[1] = \Line 
                If Position = len
                  If Item = \Line
                    If Position = len And Not \Items()\Text[2]\Len : \Items()\Text[2]\Len = 1
                      \Items()\Text[2]\X = \Items()\Text[0]\X+\Items()\Text\Width
                    EndIf 
                    If Not SelectionLen
                      \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                    Else
                      \Items()\Text[2]\Width[2] = SelectionLen
                    EndIf
                  EndIf
                EndIf
                
              ElseIf \Line[1] < \Line ; Если начинаем виделят сверху вниз
                If Position = len
                  If Item = \Line
                    If Not SelectionLen
                      \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                    Else
                      \Items()\Text[2]\Width[2] = SelectionLen
                    EndIf
                  EndIf
                EndIf
                
                If PreviousElement(*This\Items())
                  If Position = len And Not \Items()\Text[2]\Len : \Items()\Text[2]\Len = 1
                    \Items()\Text[2]\X = \Items()\Text[0]\X+\Items()\Text\Width
                  EndIf 
                  If Not SelectionLen
                    \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                  Else
                    \Items()\Text[2]\Width[2] = SelectionLen
                  EndIf
                EndIf
                
              ElseIf \Line[1] > \Line ; Если начинаем виделят снизу вверх
                If Position = len And Not \Items()\Text[2]\Len : \Items()\Text[2]\Len = 1
                  \Items()\Text[2]\X = \Items()\Text[0]\X+\Items()\Text\Width
                EndIf 
                If Not SelectionLen
                  \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                Else
                  \Items()\Text[2]\Width[2] = SelectionLen
                EndIf
                
                ;If PreviousElement(*This\Items())
                If Position = len
                  If Item < \Line
                    ;If Not \Items()\Text[2]\Len 
                    \Items()\Text[2]\Len = 1
                    \Items()\Text[2]\X = \Items()\Text[0]\X+\Items()\Text\Width
                    ;EndIf 
                    Debug  \Items()\Text\String
                    If Not SelectionLen
                      \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                    Else
                      \Items()\Text[2]\Width[2] = SelectionLen
                    EndIf
                  EndIf
                EndIf
                ;EndIf
                
                
              EndIf
              
              Debug "width "+\Items()\Text[2]\Width[2]
              
              LastItem = Item
              LastLine = \Line
            EndIf
            PopListPosition(\Items())
            
            StopDrawing()
          EndIf
        EndIf
        
      ElseIf LastElement(*This\Items())
        ; Иначе, если ниже всех линии текста,
        ; то позиция коректора конец текста.
        Position = \Items()\Text\Len
      EndIf
    EndWith
    
    ProcedureReturn Position
  EndProcedure
  
  Procedure _2Caret(*This.Widget_S, Line.i = 0)
    Static LastLine.i,  LastItem.i
    Protected Item.i, SelectionLen.i=0
    Protected Position.i =- 1, i.i, Len.i, X.i, FontID.i, String.s, 
              CursorX.i, Distance.f, MinDistance.f = Infinity()
    
    With *This
      If Line < 0 And FirstElement(*This\Items())
        ; А если выше всех линии текста,
        ; то позиция коректора начало текста.
        Position = 0
      ElseIf Line < ListSize(*This\Items()) And 
             SelectElement(*This\Items(), Line)
        ; Если находимся на линии текста, 
        ; то получаем позицию коректора.
        
        If ListSize(\Items())
          X = (\Items()\Text\X+\Scroll\X)
          Len = \Items()\Text\Len; + Len(" ")
          FontID = \Items()\Text\FontID
          String.s = \Items()\Text\String.s;+" "
          If Not FontID : FontID = \Text\FontID : EndIf
          
          If StartDrawing(CanvasOutput(\Canvas\Gadget)) 
            If FontID : DrawingFont(FontID) : EndIf
            
            For i = 0 To Len
              CursorX = X + TextWidth(Left(String.s, i))
              Distance = (\Canvas\Mouse\X-CursorX)*(\Canvas\Mouse\X-CursorX)
              
              ; Получаем позицию коpректора
              If MinDistance > Distance 
                MinDistance = Distance
                Position = i
              EndIf
            Next
            
            ; Длина переноса строки
            PushListPosition(\Items())
            Item.i = ((((\Canvas\Mouse\Y-\Y-\Text\Y)-\Scroll\Y) / (\Text\Height/2)) - 1)/2
            
            
            ;             If \Line >= \Line[1] And
            ;                LastItem <> Item
            ;               
            ;               If Position = len
            ;                 
            ;                 
            ;                 If Item = \Line
            ;                   Debug "show "
            ;                   If Not \Items()\Text[2]\Len : \Items()\Text[2]\Len = 1
            ;                       \Items()\Text[2]\X = \Items()\Text[0]\X+\Items()\Text\Width
            ;                   EndIf 
            ;                   If Not SelectionLen
            ;                     \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
            ;                   Else
            ;                     \Items()\Text[2]\Width[2] = SelectionLen
            ;                   EndIf
            ;                 Else
            ;                   Debug "hide " ; If \Line < LastItem
            ;                   If \Line = \Line[1]
            ;                     \Items()\Text[2]\Len = 0
            ;                     \Items()\Text[2]\Width = 0
            ;                   EndIf
            ;                   \Items()\Text[2]\Width[2] = 0
            ;                   ; EndIf
            ;                 EndIf
            ;               EndIf
            ;               
            ;               LastItem = Item
            ;             EndIf
            
            If LastLine <> \Line Or LastItem <> Item
              ;               If \Line[1] <> \Line
              \Items()\Text[2]\Width[2] = 0
              ;               EndIf
              
              If \Line[1] = \Line ; Если начинаем виделят сверху вниз
                If Position = len
                  Debug 555
                  If Item = \Line
                    If Position = len And Not \Items()\Text[2]\Len : \Items()\Text[2]\Len = 1
                      \Items()\Text[2]\X = \Items()\Text[0]\X+\Items()\Text\Width
                    EndIf 
                    If Not SelectionLen
                      \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                    Else
                      \Items()\Text[2]\Width[2] = SelectionLen
                    EndIf
                  EndIf
                EndIf
                
              ElseIf \Line[1] < \Line ; Если начинаем виделят сверху вниз
                If Position = len
                  If Item = \Line
                    If Not SelectionLen
                      \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                    Else
                      \Items()\Text[2]\Width[2] = SelectionLen
                    EndIf
                  EndIf
                EndIf
                
                If PreviousElement(*This\Items())
                  If Position = len And Not \Items()\Text[2]\Len : \Items()\Text[2]\Len = 1
                    \Items()\Text[2]\X = \Items()\Text[0]\X+\Items()\Text\Width
                  EndIf 
                  If Not SelectionLen
                    \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                  Else
                    \Items()\Text[2]\Width[2] = SelectionLen
                  EndIf
                EndIf
                
              ElseIf \Line[1] > \Line ; Если начинаем виделят снизу вверх
                If Position = len And Not \Items()\Text[2]\Len : \Items()\Text[2]\Len = 1
                  \Items()\Text[2]\X = \Items()\Text[0]\X+\Items()\Text\Width
                EndIf 
                If Not SelectionLen
                  \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                Else
                  \Items()\Text[2]\Width[2] = SelectionLen
                EndIf
                Debug  5646
                If PreviousElement(*This\Items())
                  If Position = len
                    If Item = \Line
                      If Not SelectionLen
                        \Items()\Text[2]\Width[2] = \Items()\Width-\Items()\Text\Width
                      Else
                        \Items()\Text[2]\Width[2] = SelectionLen
                      EndIf
                    EndIf
                  EndIf
                EndIf
                
                
              EndIf
              
              LastItem = Item
              LastLine = \Line
            EndIf
            PopListPosition(\Items())
            
            StopDrawing()
          EndIf
        EndIf
        
      ElseIf LastElement(*This\Items())
        ; Иначе, если ниже всех линии текста,
        ; то позиция коректора конец текста.
        Position = \Items()\Text\Len
      EndIf
    EndWith
    
    ProcedureReturn Position
  EndProcedure
  
  Procedure RemoveText(*This.Widget_S)
    ;ProcedureReturn
    
    With *This\Items()
      ;Debug *This\Line
      ;*This\Caret = 0
      If *This\Caret > *This\Caret[1] : *This\Caret = *This\Caret[1] : EndIf
      ; Debug "  "+*This\Caret +" "+ *This\Caret[1]
      ;\Text\String.s = RemoveString(\Text\String.s, Trim(\Text[2]\String.s, #LF$), #PB_String_CaseSensitive, 0, 1) ; *This\Caret
      \Text\String.s = RemoveString(\Text\String.s, \Text[2]\String.s, #PB_String_CaseSensitive, 0, 1) ; *This\Caret
      \Text\String.s[1] = RemoveString(\Text\String.s[1], \Text[2]\String.s, #PB_String_CaseSensitive, 0, 1) ; *This\Caret
      \Text[2]\String.s[1] = \Text[2]\String.s
      \Text\Len = Len(\Text\String.s)
      \Text[2]\String.s = ""
      \Text[2]\Len = 0
    EndWith
  EndProcedure
  
  Procedure Remove(*This.Widget_S)
    Protected Caret
    
    With *This
      PushListPosition(\Items())
      FirstElement(\Items()) ; LastElement(\Items()) ; 
      While NextElement(\Items()) ; PreviousElement(\Items())  ; 
        
        If \Items()\Text[2]\Len = \Items()\Text\Len
          \Items()\Caret - Caret
          \Text\String.s = RemoveString(\Text\String.s, \Items()\Text[2]\String.s+#LF$, #PB_String_CaseSensitive, \Items()\Caret, 1)
          Caret + \Items()\Caret
          *This\Line - 1
        ElseIf \Items()\Text[2]\Len > 0
             Debug " get "+\Items()\Text\String.s+" "+\Items()\Text[2]\String.s
          ; If \Caret < \Caret[1] : \Caret = \Caret[1] : EndIf
         
             If \Caret[1] < \Caret
               If \Items()\Text[2]\Width[2]
                 \Text\String.s = RemoveString(\Text\String.s, \Items()\Text[2]\String.s+#LF$, #PB_String_CaseSensitive, \Items()\Caret+\Caret[1], 1) 
                 ;             \Caret = \Items()\Text\Len - \Items()\Text[2]\Len
                 ;             \Caret[1] = \Caret
               Else
                 \Items()\Caret - Caret
                 Debug \Items()\Caret
                 \Text\String.s = RemoveString(\Text\String.s, \Items()\Text[2]\String.s, #PB_String_CaseSensitive, \Items()\Caret, 1) 
                 *This\Line - 1
               EndIf
             EndIf
              Caret = \Items()\Text[2]\Len
           EndIf
      Wend
      PopListPosition(\Items())
      
;       \Text\Len = Len(\Text\String.s)
; 
;         If \Caret > \Caret[1] : \Caret = \Caret[1] : EndIf
;       \Text\String.s = RemoveString(\Text\String.s, \Items()\Text[2]\String.s, #PB_String_CaseSensitive, \Items()\Caret+\Caret, 1)
      \Text\Len = Len(\Text\String.s)
      \Text\Change = 1
      
      Debug \Text\String.s
    EndWith
    
    ProcedureReturn 1
  EndProcedure
  Procedure _Remove(*This.Widget_S)
    Protected Caret
    
    With *This
      PushListPosition(\Items())
      FirstElement(\Items()) ; LastElement(\Items()) ; 
      While NextElement(\Items()) ; PreviousElement(\Items())  ; 
        
        If \Items()\Text[2]\Len = \Items()\Text\Len
          \Items()\Caret - Caret
          \Text\String.s = RemoveString(\Text\String.s, \Items()\Text[2]\String.s+#LF$, #PB_String_CaseSensitive, \Items()\Caret, 1)
          Caret + \Items()\Caret
          *This\Line - 1
        ElseIf \Items()\Text[2]\Len > 0
             Debug " get "+\Items()\Text\String.s+" "+\Items()\Text[2]\String.s
          ; If \Caret < \Caret[1] : \Caret = \Caret[1] : EndIf
         
             If \Caret[1] > \Caret
               If \Items()\Text[2]\Width[2]
                 \Text\String.s = RemoveString(\Text\String.s, \Items()\Text[2]\String.s+#LF$, #PB_String_CaseSensitive, \Items()\Caret+\Caret, 1) 
                 ;             \Caret = \Items()\Text\Len - \Items()\Text[2]\Len
                 ;             \Caret[1] = \Caret
                Caret = \Items()\Text[2]\Len
              Else
                 \Items()\Caret - Caret
                 Debug \Items()\Caret
                 \Text\String.s = RemoveString(\Text\String.s, \Items()\Text[2]\String.s, #PB_String_CaseSensitive, \Items()\Caret, 1) 
                 *This\Line - 1
               EndIf
             EndIf
           EndIf
      Wend
      PopListPosition(\Items())
      
;       \Text\Len = Len(\Text\String.s)
; 
;         If \Caret > \Caret[1] : \Caret = \Caret[1] : EndIf
;       \Text\String.s = RemoveString(\Text\String.s, \Items()\Text[2]\String.s, #PB_String_CaseSensitive, \Items()\Caret+\Caret, 1)
      \Text\Len = Len(\Text\String.s)
      \Text\Change = 1
      
      Debug \Text\String.s
    EndWith
    
    ProcedureReturn 1
  EndProcedure
  
  Procedure SelectionText(*This.Widget_S) ; Ok
    Static Caret.i =- 1, Caret1.i =- 1, Line.i =- 1
    Protected Position.i
    
    With *This\Items()
      ;Debug "7777    "+*This\Caret +" "+ *This\Caret[1] +" "+*This\Line +" "+ *This\Line[1] +" "+ \Text\String
      
      If (Caret <> *This\Caret Or Line <> *This\Line Or (*This\Caret[1] >= 0 And Caret1 <> *This\Caret[1]))
        \Text[2]\String.s = ""
        ; Debug 8888
        PushListPosition(*This\Items())
        If *This\Line[1] = *This\Line
          If *This\Caret[1] = *This\Caret And \Text[2]\Len > 0 
            \Text[2]\Len = 0 
          EndIf
          If PreviousElement(*This\Items()) And \Text[2]\Len > 0 
            \Text[2]\Width[2] = 0 
            \Text[2]\Len = 0 
          EndIf
        ElseIf *This\Line[1] > *This\Line
          If PreviousElement(*This\Items()) And \Text[2]\Len > 0 
            \Text[2]\Len = 0 
          EndIf
        Else
          If NextElement(*This\Items()) And \Text[2]\Len > 0 
            \Text[2]\Len = 0 
          EndIf
        EndIf
        PopListPosition(*This\Items())
        
        If *This\Line[1] = *This\Line
          If *This\Caret[1] = *This\Caret 
            Position = *This\Caret[1]
            ;             If *This\Caret[1] = \Text\Len
            ;              ; Debug 555
            ;             ;  \Text[2]\Len =- 1
            ;             EndIf
            ; Если выделяем с право на лево
          ElseIf *This\Caret[1] > *This\Caret 
            ; |<<<<<< to left
            Position = *This\Caret
            \Text[2]\Len = (*This\Caret[1]-Position)
          Else 
            ; >>>>>>| to right
            Position = *This\Caret[1]
            \Text[2]\Len = (*This\Caret-Position)
          EndIf
          
          ; Если выделяем снизу вверх
        ElseIf *This\Line[1] > *This\Line
          ; <<<<<|
          Position = *This\Caret
          \Text[2]\Len = \Text\Len-Position
          \Text[2]\Len | Bool(\Text\Len=Position) ; 
        Else
          ; >>>>>|
          Position = 0
          \Text[2]\Len = *This\Caret
        EndIf
        
        \Text[1]\String.s = Left(\Text\String.s, Position) : \Text[1]\Change = #True
        If \Text[2]\Len > 0
          \Text[2]\String.s = Mid(\Text\String.s, 1+Position, \Text[2]\Len) : \Text[2]\Change = #True
        EndIf
        \Text[3]\String.s = Right(\Text\String.s, \Text\Len-(Position + \Text[2]\Len)) : \Text[3]\Change = #True
        
        Line = *This\Line
        Caret = *This\Caret
        Caret1 = *This\Caret[1]
      EndIf
    EndWith
    
    ProcedureReturn Position
  EndProcedure
  
  Procedure.s AddString(*This.Widget_S, Item =- 1,Text.s="")
    Protected String.s, i
    
    With *This
      If Not ListSize(\Items())
        If StartDrawing(CanvasOutput(\Canvas\Gadget))
          If \Text\FontID 
            DrawingFont(\Text\FontID) 
          EndIf
          
          Text::MultiLine(*This)
          StopDrawing()
        EndIf
      Else
        PushListPosition(\Items())
        ForEach \Items()
          If Item = ListIndex(\Items())
            If String.s
              String.s  +#LF$+ Text.s
            Else
              String.s  + Text.s
            EndIf
          EndIf
          
          If String.s
            String.s +#LF$+ \Items()\Text\String.s
          Else
            String.s + \Items()\Text\String.s
          EndIf
        Next
        PopListPosition(\Items())
        ;         *This\Text\Count = CountString(*This\Text\String.s, #LF$)
        ;       
        ;       For i=0 To *This\Text\Count
        ;         If Item = i
        ;           If String.s
        ;             String.s  +#LF$+ Text.s
        ;           Else
        ;             String.s  + Text.s
        ;           EndIf
        ;         EndIf
        ;         
        ;         If String.s
        ;           String.s +#LF$+ StringField(*This\Text\String.s, i + 1, #LF$)
        ;         Else
        ;           String.s + StringField(*This\Text\String.s, i + 1, #LF$)
        ;         EndIf
        ;       Next
        
        \Text\String.s = String.s 
        \Text\Len = Len(String.s)
        \Text\Change = 1
      EndIf
    EndWith
    
    ProcedureReturn String.s
  EndProcedure
  
  
  Procedure ResetLen(*This.Widget_S)
    With *This
      PushListPosition(\Items())
      ForEach \Items() 
        If \Items()\Text[2]\Len <> 0
          \Items()\Text[2]\Len = 0 
        EndIf
        If \Items()\Text[2]\Width[2] <> 0
          \Items()\Text[2]\Width[2] = 0 
        EndIf
        ; ; ;         
        ; ; ; ;           \Items()\Text[1]\String = ""
        ; ; ; ;           \Items()\Text[2]\String = ""
        ; ; ; ;           \Items()\Text[3]\String = ""
        ; ; ; ;         EndIf
      Next
      PopListPosition(\Items())
    EndWith
  EndProcedure
  
  Procedure Cut(*This.Widget_S)
    Protected String.s
    ;;;ProcedureReturn Remove(*This)
    
    With *This\Items()
      If ListSize(*This\Items()) 
        ;If \Text[2]\Len > 0
        If *This\Line[1] = *This\Line
          Debug "Cut Black"
          If \Text[2]\Len > 0
            RemoveText(*This)
          Else
            \Text[2]\String.s[1] = Mid(\Text\String.s, *This\Caret, 1)
            \Text\String.s = Left(\Text\String.s, *This\Caret - 1) + Right(\Text\String.s, \Text\Len-*This\Caret)
            \Text\String.s[1] = Left(\Text\String.s[1], *This\Caret - 1) + Right(\Text\String.s[1], Len(\Text\String.s[1])-*This\Caret)
            *This\Caret - 1 
          EndIf
        Else
          Debug " Cut " +*This\Caret +" "+ *This\Caret[1]+" "+\Text[2]\Len
          
          If \Text[2]\Len > 0
            ;If *This\Line > *This\Line[1] 
            RemoveText(*This)
            ;EndIf
            
            If \Text[2]\Len = \Text\Len
              SelectElement(*This\Items(), *This\Line)
            EndIf
          EndIf
          
          ; Выделили сверх вниз
          If *This\Line > *This\Line[1] 
            Debug "  Cut_1_ForEach"
            
            PushListPosition(*This\Items())
            ForEach *This\Items() 
              If \Text[2]\Len > 0
                If \Text[2]\Len = \Text\Len
                  DeleteElement(*This\Items(), 1) 
                Else
                  RemoveText(*This)
                EndIf
              EndIf
            Next
            PopListPosition(*This\Items())
            
            *This\Caret = *This\Caret[1]
            ; Выделили снизу верх 
          ElseIf *This\Line[1] > *This\Line 
            *This\Line[1] = *This\Line 
            
            *This\Caret[1] = *This\Caret  ; Выделили пос = 0 фикс = 1
            
            ;             Debug "  Cut_21_ForEach"
            ;               
            ;             PushListPosition(*This\Items())
            ;             ForEach *This\Items() 
            ;               If \Text[2]\Len > 0
            ;                 If \Text[2]\Len = \Text\Len
            ;                   DeleteElement(*This\Items(), 1) 
            ;                 Else
            ;                   RemoveText(*This)
            ;                 EndIf
            ;               EndIf
            ;             Next
            ;             PopListPosition(*This\Items())
            
          EndIf
          
          
          If *This\Line[1]>=0 And *This\Line[1]<ListSize(*This\Items())
            ;If *This\Line > *This\Line[1]
            String.s = \Text\String.s
            DeleteElement(*This\Items(), 1)
            ;EndIf
            SelectElement(*This\Items(), *This\Line[1])
            
            If Not *This\Caret
              *This\Caret = \Text\Len-Len(#LF$)
            EndIf
            
            ; Выделили сверху вниз
            If *This\Line > *This\Line[1]
              *This\Line = *This\Line[1]
              *This\Caret = *This\Caret[1] ; Выделили пос = 0 фикс = 0
              \Text\String.s = String.s + \Text\String.s 
            Else
              ;;*This\Caret[1] = *This\Caret  ; Выделили пос = 0 фикс = 1
              \Text\String.s = \Text\String.s + String.s 
            EndIf
            
            \Text\Len = Len(\Text\String.s)
          EndIf
          
          PushListPosition(*This\Items())
          ForEach *This\Items()
            If \Text[2]\Len > 0 
              Debug "  Cut_2_ForEach"
              If \Text[2]\Len = \Text\Len
                DeleteElement(*This\Items(), 1) 
              Else
                RemoveText(*This)
              EndIf
            EndIf
          Next
          PopListPosition(*This\Items())
          
        EndIf
        ;EndIf  
      EndIf
    EndWith
  EndProcedure
  
  Procedure.s Copy(*This.Widget_S)
    Protected String.s
    
    With *This
      PushListPosition(\Items())
      ForEach \Items()
        If \Items()\Text[2]\Len > 0 
          String.s+\Items()\Text[2]\String.s+#LF$
        EndIf
      Next
      PopListPosition(\Items())
      
      String.s = Trim(String.s, #LF$)
      
      ; Для совместимости с виндовсовским 
      If String.s And Not *This\Caret
        String.s+#LF$+#CR$
      EndIf
    EndWith
    
    ProcedureReturn String.s
  EndProcedure
  
  
  Procedure ToUp(*This.Widget_S)
    Protected Repaint
    ; Если дошли до начала строки то 
    ; переходим в конец предыдущего итема
    
    With *This
      If (\Line[1] > 0 And \Line = \Line[1]) : \Line[1] - 1 : \Line = \Line[1]
        SelectElement(\Items(), \Line[1])
        Repaint =- 1 
      EndIf
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure ToDown(*This.Widget_S)
    Protected Repaint
    ; Если дошли до начала строки то 
    ; переходим в конец предыдущего итема
    
    With *This
      If (\Line < ListSize(\Items()) - 1 And \Line = \Line[1]) : \Line[1] + 1 : \Line = \Line[1]
        SelectElement(\Items(), \Line[1]) 
        Repaint =- 1 
      EndIf
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure ToLeft(*This.Widget_S) ; Ok
    Protected Repaint
    
    With *This
      If \Items()\Text[2]\Len
        If \Line[1] > \Line 
          Swap \Line[1], \Line
          
          If SelectElement(\Items(), \Line[1]) 
            \Items()\Text[1]\String.s = Left(\Items()\Text\String.s, \Caret[1]) 
            \Items()\Text[1]\Change = #True
          EndIf
        ElseIf \Line > \Line[1] And 
               \Caret[1] > \Caret
          Swap \Caret[1], \Caret
        ElseIf \Caret > \Caret[1] 
          Swap \Caret, \Caret[1]
        EndIf
        
        If \Line <> \Line[1]
          ResetLen(*This)
          \Line = \Line[1]
          Repaint =- 1
        EndIf
      ElseIf \Caret[1] > 0 
        \Caret - 1 
      EndIf
      
      If \Caret[1] <> \Caret
        \Caret[1] = \Caret 
        Repaint =- 1 
      ElseIf Not Repaint And ToUp(*This.Widget_S)
        \Caret = \Items()\Text\Len
        \Caret[1] = \Caret
        Repaint =- 1 
      EndIf
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure ToRight(*This.Widget_S) ; Ok
    Protected Repaint
    
    With *This
      If \Items()\Text[2]\Len
        If \Line > \Line[1] 
          Swap \Line, \Line[1] 
          Swap \Caret, \Caret[1]
          
          If SelectElement(\Items(), \Line[1]) 
            \Items()\Text[1]\String.s = Left(\Items()\Text\String.s, \Caret[1]) 
            \Items()\Text[1]\Change = #True
          EndIf
        ElseIf \Line[1] = \Line And 
               \Caret > \Caret[1] 
          Swap \Caret, \Caret[1]
        EndIf
        
        If \Line <> \Line[1]
          ResetLen(*This)
          \Line = \Line[1]
          Repaint =- 1
        EndIf
      ElseIf \Caret[1] < \Items()\Text\Len 
        \Caret[1] + 1 
      EndIf
      
      If \Caret <> \Caret[1]
        \Caret = \Caret[1] 
        Repaint =- 1 
      ElseIf Not Repaint And ToDown(*This)
        \Caret[1] = 0
        \Caret = \Caret[1]
        Repaint =- 1 
      EndIf
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure __ToBack(*This.Widget_S)
    Protected Repaint.b, String.s
    
    With *This
      If \Items()\Text[2]\Len
        If \Line[1] > \Line 
          Swap \Line[1], \Line
        ElseIf \Line > \Line[1] And 
               \Caret[1] > \Caret
          Swap \Caret[1], \Caret
        ElseIf \Caret > \Caret[1] 
          Swap \Caret, \Caret[1]
        EndIf
        
        If \Line <> \Line[1]
          ResetLen(*This)
          \Line = \Line[1]
          Repaint =- 1
        EndIf
      ElseIf \Caret[1] > 0 
        \Caret - 1 
      EndIf
      
      If \Caret[1] <> \Caret
        \Caret[1] = \Caret 
        
        \Items()\Text\String.s = Left(\Items()\Text\String.s, \Caret) + Right(\Items()\Text\String.s, \Items()\Text\Len-\Caret-1)
        \Items()\Text\Len = Len(\Items()\Text\String.s)
        
        Repaint =- 1 
      ElseIf Not Repaint 
        If (\Line[1] > 0 And \Line = \Line[1]) : \Line[1] - 1 : \Line = \Line[1]
          DeleteElement(\Items(), 1)
          SelectElement(\Items(), \Line[1])
          \Caret = \Items()\Text\Len
          \Caret[1] = \Caret
          Repaint =- 1 
        EndIf
      EndIf
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure ToBack(*This.Widget_S)
    Protected Repaint, String.s 
    
    If *This\Canvas\Input : *This\Canvas\Input = 0
      ;ToInput(*This) ; Сбросить Dot&Minus
    EndIf
    
    With *This
      If \Items()\Text[2]\Len
        If \Caret > \Caret[1] 
          Swap \Caret, \Caret[1]
        EndIf  
        Remove(*This)
        
      ElseIf \Caret[1] > 0 
        Debug " "+ListIndex(\Items())+" "+\Items()\Caret+" "+\Items()\Text\String.s; 
        \Text\String.s[1] = Left(\Text\String.s[1], \Items()\Caret+\Caret - 1) + Mid(\Text\String.s[1],  \Items()\Caret+\Caret + 1)
        \Text\String.s = Left(\Text\String.s, \Items()\Caret+\Caret - 1) + Mid(\Text\String.s,  \Items()\Caret+\Caret + 1)
        \Caret - 1 
      Else
          ; Если дошли до начала строки то 
            ; переходим в конец предыдущего итема
        If *This\Line[1] > 0 
          \Text\String.s = RemoveString(\Text\String.s, #LF$, #PB_String_CaseSensitive, \Items()\Caret+\Caret, 1)
          
          ToUp(*This)
          
          *This\Caret = \Items()\Text\Len 
        EndIf
          
      EndIf
      
      If \Caret[1] <> \Caret
        \Text\Len = Len(\Text\String.s)  
        \Caret[1] = \Caret 
        \Text\Change =- 1
        Repaint =- 1 
      EndIf
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure _ToBack(*This.Widget_S)
    Protected Repaint.b, String.s
    
    With *This\Items()
      If *This\Caret[1] >= 0
        
        If \Text[2]\Len ; Если начали виделят с канца строки поэтому не \Text[2]\Len > 0
          If *This\Caret > *This\Caret[1] 
            Swap *This\Caret, *This\Caret[1]
          EndIf      
          
          String = \Text[1]\String.s
          Remove(*This)
          itemSelect(*This\Line[1], *This\Items())
          
          If *This\Line[1] > 0 
            ;If *This\Caret > 0
            If *This\Caret <> \Text[2]\Len ; *This\Caret[1] And \Text[2]\Len < 1
              Debug "ddd "+*This\Caret 
              DeleteElement(*This\Items())
              itemSelect(*This\Line[1], *This\Items())
              
              *This\Caret = Len(String.s)
              \Text[1]\String.s = String.s
              \Text[3]\String.s = \Text\String.s
              \Text\String.s = String.s + \Text\String.s
              \Text\Len = Len(\Text\String.s)
            EndIf
            
            
            ;EndIf
            AddString(*This)
          EndIf
          
          itemSelect(*This\Line[1], *This\Items()) : *This\Line = *This\Line[1]
        Else         
          If *This\Caret = 0
            ; Если дошли до начала строки то 
            ; переходим в конец предыдущего итема
            String = \Text[3]\String.s
            If *This\Line[1] > 0 
              DeleteElement(*This\Items())
              
              ToUp(*This)
              *This\Caret = \Text\Len + 1 ; Len(#LF$)
              \Text[1]\String.s = \Text\String.s
              \Text[3]\String.s = String.s
              \Text\String.s + String
              \Text\Len = Len(\Text\String.s)
              
              AddString(*This)
              
            EndIf
          Else
            ;                       Caret = (FindString(*This\Text\String.s, \Text\String.s) + *This\Caret) - 1
            \Text[2]\String.s[1] = Mid(\Text\String.s, *This\Caret, 1)
            \Text\String.s = Left(\Text\String.s, *This\Caret - 1) + Right(\Text\String.s, \Text\Len-*This\Caret)
            \Text\Len = Len(\Text\String.s)
            
            ;                       *This\Text\String.s = Left(*This\Text\String.s, Caret - 1) + Right(*This\Text\String.s, *This\Text\Len-Caret)
            ;                       *This\Text\Len = Len(*This\Text\String.s)
          EndIf
          
          *This\Caret - 1 
        EndIf
        
        *This\Caret[1] = *This\Caret 
        Repaint =- 1 
      EndIf
      ;Debug *This\Text\String.s
      
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure ToReturn(*This.Widget_S)
    Protected Repaint
    
    With  *This\Items()
      Debug "Return "+ListIndex(*This\Items())
      
      If \Text[2]\Len > 0  ; (*This\Caret[1] <> *This\Caret) Or (*This\Line <> *This\Line[1])
        Remove(*This)
        
        ;*This\Caret = 0
        itemSelect(*This\Line[1], *This\Items())
        
        If *This\Caret = 0
          ; \Text\String.s = #LF$ + \Text\String.s
        ElseIf *This\Caret = \Text\Len
          ; \Text\String.s + #LF$
        Else
          \Text\String.s = \Text[1]\String.s + #LF$ + \Text[3]\String.s
        EndIf
        
        
      Else
        If *This\Caret = 0
          \Text\String.s = #LF$ + \Text\String.s
        ElseIf *This\Caret = \Text\Len
          \Text\String.s + #LF$
        Else
          \Text\String.s = \Text[1]\String.s + #LF$ + \Text[3]\String.s
        EndIf
        
      EndIf
      
      *This\Line[1] + 1
      *This\Line = *This\Line[1]
      
      *This\Caret = 0
      *This\Caret[1] = *This\Caret
      \Text\Len = Len(\Text\String.s)
      
      AddString(*This)
      
      Scroll::SetState(*This\vScroll, *This\vScroll\Max)
      Repaint = #True
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure ToDelete(*This.Widget_S)
    Protected Repaint, String.s
    
    With *This\Items()
      If *This\Caret < \Text\Len
        If \Text[2]\String.s
          RemoveText(*This)
        Else
          \Text[2]\String.s[1] = Mid(\Text\String.s, (*This\Caret+1), 1)
          \Text\String.s = Left(\Text\String.s, *This\Caret) + Right(\Text\String.s, \Text\Len-(*This\Caret+1))
          \Text\String.s[1] = Left(\Text\String.s[1], *This\Caret) + Right(\Text\String.s[1], Len(\Text\String.s[1])-(*This\Caret+1))
        EndIf
        
        If ListSize(*This\Items())
          PushListPosition(*This\Items())
          ForEach *This\Items() 
            If \Text[2]\Len = \Text\Len
              DeleteElement(*This\Items(), 1)
            EndIf
          Next
          PopListPosition(*This\Items())
          
          If *This\Caret = Len(\Text\String.s) : *This\Line[1]+1
            If *This\Line[1]>=0 And *This\Line[1]<ListSize(*This\Items())
              PushListPosition(*This\Items())
              SelectElement(*This\Items(), *This\Line[1])
              String.s = \Text\String.s
              DeleteElement(*This\Items(), 1)
              PopListPosition(*This\Items())
              \Text\String.s + String.s 
              *This\Line[1] - 1
            EndIf
          EndIf
        EndIf
        
        *This\Caret[1] = *This\Caret
        \Text\Len = Len(\Text\String.s)
        
        Repaint = #True
      EndIf
      
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  ;-
  ;- PUBLIC
  Procedure SetAttribute(Gadget.i, Attribute.i, Value.i)
    Protected *This.Widget_S = GetGadgetData(Gadget)
    
    With *This
      
    EndWith
  EndProcedure
  
  Procedure GetAttribute(Gadget.i, Attribute.i)
    Protected Result, *This.Widget_S = GetGadgetData(Gadget)
    
    With *This
      ;       Select Attribute
      ;         Case #PB_ScrollBar_Minimum    : Result = \Scroll\Min
      ;         Case #PB_ScrollBar_Maximum    : Result = \Scroll\Max
      ;         Case #PB_ScrollBar_PageLength : Result = \Scroll\PageLength
      ;       EndSelect
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure SetState(Gadget.i, State.i)
    Protected *This.Widget_S = GetGadgetData(Gadget)
    
    With *This
      
    EndWith
  EndProcedure
  
  Procedure GetState(Gadget.i)
    Protected ScrollPos, *This.Widget_S = GetGadgetData(Gadget)
    
    With *This
      
    EndWith
  EndProcedure
  
  Procedure ClearItems(Gadget.i)
    Protected Result.i, *This.Widget_S
    If IsGadget(Gadget) : *This.Widget_S = GetGadgetData(Gadget) : EndIf
    
    If *This
      With *This
        Result = ClearList(\Items())
        If StartDrawing(CanvasOutput(Gadget))
          Box(0,0,OutputWidth(),OutputHeight(), $FFFFFF)
          StopDrawing()
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i CountItems(Gadget.i, Item.i=-1)
    Protected Result.i, *This.Widget_S, sublevel.i
    If IsGadget(Gadget) : *This.Widget_S = GetGadgetData(Gadget) : EndIf
    
    If *This
      With *This
        If Item.i=-1
          Result = ListSize(\Items())
        Else
          PushListPosition(\Items()) 
          ForEach \Items()
            If \Items()\Item = Item 
              ; Result = \Items()\childrens 
              sublevel = \Items()\sublevel
              PushListPosition(\Items())
              While NextElement(\Items())
                If sublevel = \Items()\sublevel
                  Break
                ElseIf sublevel < \Items()\sublevel 
                  Result+1
                EndIf
              Wend
              PopListPosition(\Items())
              Break
            EndIf
          Next
          PopListPosition(\Items())
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i RemoveItem(Gadget.i, Item.i)
    Protected Result.i, *This.Widget_S, sublevel.i
    If IsGadget(Gadget) : *This.Widget_S = GetGadgetData(Gadget) : EndIf
    
    If *This
      With *This
        PushListPosition(\Items()) 
        ForEach \Items()
          If \Items()\Item = Item 
            sublevel = \Items()\sublevel
            PushListPosition(\Items())
            While NextElement(\Items())
              If sublevel = \Items()\sublevel
                Break
              ElseIf sublevel < \Items()\sublevel 
                Result = DeleteElement(\Items()) 
              EndIf
            Wend
            PopListPosition(\Items())
            Result = DeleteElement(\Items()) 
            Break
          EndIf
        Next
        PopListPosition(\Items())
        
        ReDraw(Gadget)
      EndWith
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i AddItem(Gadget, Item, Text.s,Image.i=-1,Flag.i=0)
    Protected String.s, i.i, *This.Widget_S = GetGadgetData(Gadget)
    
    If Text::AddLine(*This, Item, Text.s) 
      ; ReDraw(*This, *This\Canvas\Gadget)
      ProcedureReturn 1
    EndIf
    
   
    ProcedureReturn Item
  EndProcedure
  
  Procedure.s GetText(Gadget.i)
    Protected *This.Widget_S = GetGadgetData(Gadget)
    ProcedureReturn Text::GetText(*This)
  EndProcedure
  
  Procedure.i SetText(Gadget, Text.s, Item.i=0)
    Protected *This.Widget_S = GetGadgetData(Gadget)
    
    If Text::SetText(*This, Text.s) 
      ReDraw(*This, *This\Canvas\Gadget)
      ProcedureReturn 1
    EndIf
    
  EndProcedure
  
  Procedure.i SetFont(Gadget.i, FontID.i)
    Protected *This.Widget_S = GetGadgetData(Gadget)
    
    If Text::SetFont(*This, FontID)
      ReDraw(*This, *This\Canvas\Gadget)
      ProcedureReturn 1
    EndIf
      
  EndProcedure
  
  Procedure.i Resize(*This.Widget_S, X.i,Y.i,Width.i,Height.i, Canvas.i=-1)
    With *This
      If Text::Resize(*This, X,Y,Width,Height)
        Scroll::Resizes(\vScroll, \hScroll, \x[2],\Y[2],\Width[2],\Height[2])
      EndIf
      ProcedureReturn \Resize
    EndWith
  EndProcedure
  
  ;-
  Procedure _Events(*This.Widget_S, EventType.i)
    Static MoveX, MoveY
    Static Text$, DoubleClickCaret =- 1
    Protected Repaint.b, Caret,Item.i, String.s, StartDrawing, Update_Text_Selected
    
    If *This
      With *This
        If Not \Hide And Not \Disable And \Interact ; And Widget <> Canvas And CanvasModifiers
                                                    ; Get line & caret position
          If  \Canvas\Mouse\Buttons
            If \Canvas\Mouse\Y < \Y
              Item.i =- 1
            Else
              Item.i = ((\Canvas\Mouse\Y-\Y-\Text\Y-\Scroll\Y) / \Text\Height)
            EndIf
          EndIf
          
          Select EventType 
            Case #PB_EventType_LeftButtonDown
              MoveX = \Canvas\Mouse\X 
              MoveY = \Canvas\Mouse\Y
              
              PushListPosition(\Items())
              ForEach \Items() 
                If \Items()\Text[2]\Len <> 0
                  \Items()\Text[2]\Len = 0 
                EndIf
              Next
              PopListPosition(\Items())
              
              If \Items()\Text[2]\Len > 0
                \Text[2]\Len = 1
              Else
                \Caret = Caret(*This, Item) 
                \Line = ListIndex(*This\Items()) 
                \Line[1] = Item
                
                PushListPosition(\Items())
                ForEach \Items() 
                  If \Line[1] <> ListIndex(\Items())
                    \Items()\Text[1]\String = ""
                    \Items()\Text[2]\String = ""
                    \Items()\Text[3]\String = ""
                  EndIf
                Next
                PopListPosition(\Items())
                
              EndIf
              
            Case #PB_EventType_LeftButtonUp
              ;               If \Caret = \Caret[1] ; And \Line = \Line[1] 
              ; ;                 If Not \Drag
              ;                   ; Сбрасываем все виделения.
              ;                   PushListPosition(\Items())
              ;                   ForEach \Items() 
              ;                     If \Items()\Text[2]\Len <> 0
              ;                       \Items()\Text[2]\Len = 0 
              ;                     EndIf
              ;                   Next
              ;                   PopListPosition(\Items())
              ;                   Repaint = 1
              ; ;                 EndIf
              ;                   \Text[2]\Len = 0
              ; ;                 \Drag = 0
              ;               EndIf
              
            Case #PB_EventType_MouseMove  
              If \Canvas\Mouse\Buttons 
                If \Drag = 0 And (Abs((\Canvas\Mouse\X-MoveX)+(\Canvas\Mouse\Y-MoveY)) >= 6) : \Drag=1
                  Debug "DragStart";PostEvent(#PB_Event_Widget, EventWindow(), EventGadget(), #PB_EventType_DragStart)
                EndIf
                
                
                If Not \Text[2]\Len
                  If \Line <> Item And Item =< ListSize(\Items())
                    If isItem(\Line, \Items()) 
                      If \Line <> ListIndex(\Items())
                        SelectElement(\Items(), \Line) 
                      EndIf
                      
                      If \Line > Item
                        \Caret = 0
                      Else
                        \Caret = \Items()\Text\Len
                      EndIf
                      
                      SelectionText(*This)
                    EndIf
                    
                    \Line = Item
                  EndIf
                  
                  \Caret = Caret(*This, Item) 
                  SelectionText(*This)
                EndIf
              EndIf
              
            Default
              itemSelect(\Line[1], \Items())
          EndSelect
        EndIf
      EndWith    
    EndIf
    
    
    If *This
      With *This\Items()
        Select EventType
          Case #PB_EventType_MouseEnter
            SetGadgetAttribute(*This\Canvas\Gadget, #PB_Canvas_Cursor, #PB_Cursor_IBeam)
            ; Debug ""+ *This\Caret +" "+ *This\Caret[1] +" "+ \Text[1]\Width +" "+ \Text[1]\String.s
            
          Case #PB_EventType_LostFocus : Repaint = #True
            If Bool(*This\Type <> #PB_GadgetType_Editor)
              ; StringGadget
              \Text[2]\Len = 0 ; Убыраем выделение
            EndIf
            *This\Caret[1] =- 1 ; Прячем коректор
            
          Case #PB_EventType_Focus : Repaint = #True
            *This\Caret[1] = *This\Caret ; Показываем коректор
            
          Case #PB_EventType_LeftDoubleClick 
            DoubleClickCaret = *This\Caret
            Text::SelectionLimits(*This)
            SelectionText(*This) 
            Repaint = #True
            
            *This\Caret = Caret(*This, *This\Line[1]) 
            
          Case #PB_EventType_LeftButtonDown
            *This\Caret[1] = *This\Caret
            
            If \Text\Numeric 
              \Text\String.s[1] = \Text\String.s 
            EndIf
            
            If *This\Caret = DoubleClickCaret
              DoubleClickCaret =- 1
              *This\Caret[1] = \Text\Len
              *This\Caret = 0
            EndIf 
            
            SelectionText(*This)
            Repaint = #True
            
          Case #PB_EventType_MouseMove
            If *This\Canvas\Mouse\Buttons & #PB_Canvas_LeftButton
              ;                 *This\Caret = Caret(*This)
              ;                 SelectionText(*This)
              Repaint = #True
            EndIf
            
          Case #PB_EventType_Input ;- Input (key)
            If *This\Text\Editable And Not (*This\Canvas\Key[1] & #PB_Canvas_Command)
              Protected Input, Input_2
              
              Select #True
                Case \Text\Lower : Input = Asc(LCase(Chr(*This\Canvas\Input))) : Input_2 = Input
                Case \Text\Upper : Input = Asc(UCase(Chr(*This\Canvas\Input))) : Input_2 = Input
                Case \Text\Pass  : Input = 9679 : Input_2 = *This\Canvas\Input ; "●"
                Case \Text\Numeric
                  ;                     Debug *This\Canvas\Input
                  Static Dot
                  
                  Select *This\Canvas\Input 
                    Case '.','0' To '9' : Input = *This\Canvas\Input : Input_2 = Input
                    Case 'Ю','ю','Б','б',44,47,60,62,63 : Input = '.' : Input_2 = Input
                    Default
                      Input_2 = *This\Canvas\Input
                  EndSelect
                  
                  If Not Dot And Input = '.'
                    Dot = 1
                  ElseIf Input <> '.'
                    Dot = 0
                  Else
                    Input = 0
                  EndIf
                  
                Default
                  Input = *This\Canvas\Input : Input_2 = Input
              EndSelect
              
              If Input_2
                If Input
                  If \Text[2]\String.s
                    RemoveText(*This)
                  EndIf
                  *This\Caret + 1
                  *This\Caret[1] = *This\Caret
                EndIf
                
                If \Text\Numeric And Input = Input_2
                  \Text\String.s[1] = \Text\String.s
                EndIf
                
                ;\Text\String.s = Left(\Text\String.s, *This\Caret-1) + Chr(Input) + Mid(\Text\String.s, *This\Caret)
                \Text\String.s = InsertString(\Text\String.s, Chr(Input), *This\Caret)
                \Text\String.s[1] = InsertString(\Text\String.s[1], Chr(Input_2), *This\Caret)
                
                If Input
                  \Text\Len = Len(\Text\String.s)
                  PostEvent(#PB_Event_Gadget, EventWindow(), EventGadget(), #PB_EventType_Change)
                EndIf
                
                Repaint = #True 
              EndIf
            EndIf
            
          Case #PB_EventType_KeyUp
            If \Text\Numeric
              \Text\String.s[1]=\Text\String.s 
            EndIf
            Repaint = #True 
            
          Case #PB_EventType_KeyDown
            Select *This\Canvas\Key
              Case #PB_Shortcut_Home : \Text[2]\String.s = "" : \Text[2]\Len = 0 : *This\Caret = 0 : *This\Caret[1] = *This\Caret : Repaint =- 1
              Case #PB_Shortcut_End : \Text[2]\String.s = "" : \Text[2]\Len = 0 : *This\Caret = \Text\Len : *This\Caret[1] = *This\Caret : Repaint =- 1 
                
              Case #PB_Shortcut_Up     : Repaint = ToUp(*This)      ; Ok
              Case #PB_Shortcut_Left   : Repaint = ToLeft(*This)    ; Ok
              Case #PB_Shortcut_Right  : Repaint = ToRight(*This)   ; Ok
              Case #PB_Shortcut_Down   : Repaint = ToDown(*This)    ; Ok
              Case #PB_Shortcut_Back   : Repaint = ToBack(*This)
              Case #PB_Shortcut_Return : Repaint = ToReturn(*This) 
              Case #PB_Shortcut_Delete : Repaint = ToDelete(*This)
                
                
              Case #PB_Shortcut_C, #PB_Shortcut_X
                If ((*This\Canvas\Key[1] & #PB_Canvas_Control) Or (*This\Canvas\Key[1] & #PB_Canvas_Command)) 
                  SetClipboardText(Copy(*This))
                  
                  If *This\Canvas\Key = #PB_Shortcut_X
                    Cut(*This)
                    
                    *This\Caret[1] = *This\Caret
                    Repaint = #True 
                  EndIf
                EndIf
                
              Case #PB_Shortcut_V
                If *This\Text\Editable And ((*This\Canvas\Key[1] & #PB_Canvas_Control) Or (*This\Canvas\Key[1] & #PB_Canvas_Command))
                  Protected ClipboardText.s = Trim(GetClipboardText(), #CR$)
                  
                  If ClipboardText.s
                    If \Text[2]\Len > 0
                      RemoveText(*This)
                      
                      If \Text[2]\Len = \Text\Len
                        ;*This\Line[1] = *This\Line
                        ClipboardText.s = Trim(ClipboardText.s, #LF$)
                      EndIf
                      ;                         
                      PushListPosition(*This\Items())
                      ForEach *This\Items()
                        If \Text[2]\Len > 0 
                          If \Text[2]\Len = \Text\Len
                            DeleteElement(*This\Items(), 1) 
                          Else
                            RemoveText(*This)
                          EndIf
                        EndIf
                      Next
                      PopListPosition(*This\Items())
                    EndIf
                    
                    Select #True
                      Case \Text\Lower : ClipboardText.s = LCase(ClipboardText.s)
                      Case \Text\Upper : ClipboardText.s = UCase(ClipboardText.s)
                      Case \Text\Numeric 
                        If Val(ClipboardText.s)
                          ClipboardText.s = Str(Val(ClipboardText.s))
                        EndIf
                    EndSelect
                    
                    \Text\String.s = InsertString( \Text\String.s, ClipboardText.s, *This\Caret + 1)
                    
                    If CountString(\Text\String.s, #LF$)
                      Caret = \Text\Len-*This\Caret
                      String.s = \Text\String.s
                      DeleteElement(*This\Items(), 1)
                      SetText(*This\Canvas\Gadget, String.s, *This\Line[1])
                      *This\Caret = Len(\Text\String.s)-Caret
                      ;                         SelectElement(*This\Items(), *This\Line)
                      ;                        *This\Caret = 0
                    Else
                      *This\Caret + Len(ClipboardText.s)
                    EndIf
                    
                    *This\Caret[1] = *This\Caret
                    \Text\Len = Len(\Text\String.s)
                    
                    Repaint = #True
                  EndIf
                EndIf
                
            EndSelect 
            
        EndSelect
        
        If Repaint
          ;\Text[3]\Change = Bool(Repaint =- 1)
          If Repaint =- 1
            SelectionText(*This) 
          EndIf
          
          If Repaint = 2
            *This\Text[0]\Change = Repaint
            \Text[1]\Change = Repaint
            \Text[2]\Change = Repaint
            \Text[3]\Change = Repaint
          EndIf
          ; *This\CaretLength = \CaretLength
          *This\Text[2]\String.s[1] = \Text[2]\String.s[1]
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure.i Events(*This.Widget_S, EventType.i, Canvas.i=-1, CanvasModifiers.i=-1)
    Static *Focus.Widget_S, *Last.Widget_S, *Widget.Widget_S
    Static Text$, DoubleClick, LastX, LastY, Last, Drag
    Protected.i Repaint, Control, Buttons, Widget
    
    ; widget_events_type
    If *This
      With *This
        If Canvas=-1 
          Widget = *This
          Canvas = EventGadget()
        Else
          Widget = Canvas
        EndIf
        If Canvas <> \Canvas\Gadget Or 
           \Type <> #PB_GadgetType_Editor
        EndIf
        
        ; Get at point widget
        \Canvas\Mouse\From = From(*This)
        
        Select EventType 
          Case #PB_EventType_LeftButtonUp 
            If *Last = *This
              If *Widget <> *Focus
                ProcedureReturn 0 
              EndIf
            EndIf
            
          Case #PB_EventType_LeftClick 
            ; Debug ""+\Canvas\Mouse\Buttons+" Last - "+*Last +" Widget - "+*Widget +" Focus - "+*Focus +" This - "+*This
            If *Last = *This : *Last = *Widget
              If *Widget <> *Focus
                ProcedureReturn 0 
              EndIf
            EndIf
            
            If Not *This\Canvas\Mouse\From 
              ProcedureReturn 0
            EndIf
        EndSelect
        
        If Not \Hide And Not \Disable And \Interact And Widget <> Canvas And CanvasModifiers 
          Select EventType 
            Case #PB_EventType_Focus : ProcedureReturn 0 ; Bug in mac os because it is sent after the mouse left down
            Case #PB_EventType_MouseMove, #PB_EventType_LeftButtonUp
              If Not \Canvas\Mouse\Buttons 
                If \Canvas\Mouse\From
                  If *Last <> *This 
                    If *Last
                      If (*Last\Index > *This\Index)
                        ProcedureReturn 0
                      Else
                        ; Если с нижнего виджета перешли на верхный, 
                        ; то посылаем событие выход для нижнего
                        Events(*Last, #PB_EventType_MouseLeave, Canvas, 0)
                        *Last = *This
                      EndIf
                    Else
                      *Last = *This
                    EndIf
                    
                    EventType = #PB_EventType_MouseEnter
                    *Widget = *Last
                  EndIf
                  
                ElseIf (*Last = *This)
                  If EventType = #PB_EventType_LeftButtonUp 
                    Events(*Widget, #PB_EventType_LeftButtonUp, Canvas, 0)
                  EndIf
                  
                  EventType = #PB_EventType_MouseLeave
                  *Last = *Widget
                  *Widget = 0
                EndIf
              EndIf
              
            Case #PB_EventType_LeftButtonDown
              If (*Last = *This)
                PushListPosition(List())
                ForEach List()
                  If List()\Widget\Focus = List()\Widget And List()\Widget <> *This 
                    
                    List()\Widget\Focus = 0
                    *Last = List()\Widget
                    Events(List()\Widget, #PB_EventType_LostFocus, List()\Widget\Canvas\Gadget, 0)
                    *Last = *Widget 
                    
                    PostEvent(#PB_Event_Gadget, List()\Widget\Canvas\Window, List()\Widget\Canvas\Gadget, #PB_EventType_Repaint)
                    Break 
                  EndIf
                Next
                PopListPosition(List())
                
                If *This <> \Focus : \Focus = *This : *Focus = *This
                  Events(*This, #PB_EventType_Focus, Canvas, 0)
                EndIf
              EndIf
              
          EndSelect
        EndIf
        
        If (*Last = *This) 
          Select EventType
            Case #PB_EventType_MouseLeave
              If CanvasModifiers 
                ; Если перешли на другой виджет
                PushListPosition(List())
                ForEach List()
                  If List()\Widget\Canvas\Gadget = Canvas And List()\Widget\Focus <> List()\Widget And List()\Widget <> *This
                    List()\Widget\Canvas\Mouse\From = From(List()\Widget)
                    
                    If List()\Widget\Canvas\Mouse\From
                      If *Last
                        Events(*Last, #PB_EventType_MouseLeave, Canvas, 0)
                      EndIf     
                      
                      *Last = List()\Widget
                      *Widget = List()\Widget
                      ProcedureReturn Events(*Last, #PB_EventType_MouseEnter, Canvas, 0)
                    EndIf
                  EndIf
                Next
                PopListPosition(List())
              EndIf
              
              If \Cursor[1] <> GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_Cursor)
                SetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_Cursor, \Cursor[1])
                \Cursor[1] = 0
              EndIf
              
            Case #PB_EventType_MouseEnter    
              If Not \Cursor[1] 
                \Cursor[1] = GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_Cursor)
              EndIf
              SetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_Cursor, \Cursor)
              
          EndSelect
        EndIf 
        
      EndWith
    EndIf
    
    ;     If (*Last = *This)
    ;       Select EventType
    ;         Case #PB_EventType_Focus          : Debug "  "+Bool((*Last = *This))+" Focus"          +" "+ *This\Text\String.s
    ;         Case #PB_EventType_LostFocus      : Debug "  "+Bool((*Last = *This))+" LostFocus"      +" "+ *This\Text\String.s
    ;         Case #PB_EventType_MouseEnter     : Debug "  "+Bool((*Last = *This))+" MouseEnter"     +" "+ *This\Text\String.s ;+" Last - "+*Last +" Widget - "+*Widget +" Focus - "+*Focus +" This - "+*This
    ;         Case #PB_EventType_MouseLeave     : Debug "  "+Bool((*Last = *This))+" MouseLeave"     +" "+ *This\Text\String.s
    ;         Case #PB_EventType_LeftButtonDown : Debug "  "+Bool((*Last = *This))+" LeftButtonDown" +" "+ *This\Text\String.s ;+" Last - "+*Last +" Widget - "+*Widget +" Focus - "+*Focus +" This - "+*This
    ;         Case #PB_EventType_LeftButtonUp   : Debug "  "+Bool((*Last = *This))+" LeftButtonUp"   +" "+ *This\Text\String.s
    ;         Case #PB_EventType_LeftClick      : Debug "  "+Bool((*Last = *This))+" LeftClick"      +" "+ *This\Text\String.s
    ;       EndSelect
    ;     EndIf
    
    Static MoveX, MoveY
    Protected Caret,Item.i, String.s
    
    If *This
      With *This
        If Not \Hide And Not \Disable And \Interact ; And Widget <> Canvas And CanvasModifiers
                                                    ; Get line & caret position
          If  \Canvas\Mouse\Buttons
            If \Canvas\Mouse\Y < \Y
              Item.i =- 1
            Else
              Item.i = ((\Canvas\Mouse\Y-\Y-\Text\Y-\Scroll\Y) / \Text\Height)
            EndIf
          EndIf
          
          Select EventType 
            Case #PB_EventType_LeftButtonDown
              MoveX = \Canvas\Mouse\X 
              MoveY = \Canvas\Mouse\Y
              
              PushListPosition(\Items())
              ForEach \Items() 
                If \Items()\Text[2]\Len <> 0
                  \Items()\Text[2]\Len = 0 
                EndIf
              Next
              PopListPosition(\Items())
              
              If \Items()\Text[2]\Len > 0
                \Text[2]\Len = 1
              Else
                \Caret = Caret(*This, Item) 
                \Line = ListIndex(*This\Items()) 
                \Line[1] = Item
                
                PushListPosition(\Items())
                ForEach \Items() 
                  If \Line[1] <> ListIndex(\Items())
                    \Items()\Text[1]\String = ""
                    \Items()\Text[2]\String = ""
                    \Items()\Text[3]\String = ""
                  EndIf
                Next
                PopListPosition(\Items())
                
              EndIf
              
            Case #PB_EventType_LeftButtonUp
              ;               If \Caret = \Caret[1] ; And \Line = \Line[1] 
              ; ;                 If Not \Drag
              ;                   ; Сбрасываем все виделения.
              ;                   PushListPosition(\Items())
              ;                   ForEach \Items() 
              ;                     If \Items()\Text[2]\Len <> 0
              ;                       \Items()\Text[2]\Len = 0 
              ;                     EndIf
              ;                   Next
              ;                   PopListPosition(\Items())
              ;                   Repaint = 1
              ; ;                 EndIf
              ;                   \Text[2]\Len = 0
              ; ;                 \Drag = 0
              ;               EndIf
              
            Case #PB_EventType_MouseMove  
              If \Canvas\Mouse\Buttons 
                If \Drag = 0 And (Abs((\Canvas\Mouse\X-MoveX)+(\Canvas\Mouse\Y-MoveY)) >= 6) : \Drag=1
                  Debug "DragStart";PostEvent(#PB_Event_Widget, EventWindow(), EventGadget(), #PB_EventType_DragStart)
                EndIf
                
                
                If Not \Text[2]\Len
                  If \Line <> Item And Item =< ListSize(\Items())
                    If isItem(\Line, \Items()) 
                      If \Line <> ListIndex(\Items())
                        SelectElement(\Items(), \Line) 
                      EndIf
                      
                      If \Line > Item
                        \Caret = 0
                      Else
                        \Caret = \Items()\Text\Len
                      EndIf
                      
                      SelectionText(*This)
                    EndIf
                    
                    \Line = Item
                  EndIf
                  
                  \Caret = Caret(*This, Item) 
                  SelectionText(*This)
                EndIf
              EndIf
              
            Default
              itemSelect(\Line[1], \Items())
          EndSelect
        EndIf
      EndWith    
    EndIf
    
    With *This\items()
      If ListSize(*This\items())
        If *Last = *This
          Select EventType
            Case #PB_EventType_MouseEnter
              SetGadgetAttribute(*This\Canvas\Gadget, #PB_Canvas_Cursor, #PB_Cursor_IBeam)
              ; Debug ""+ *This\Caret +" "+ *This\Caret[1] +" "+ \Text[1]\Width +" "+ \Text[1]\String.s
              
            Case #PB_EventType_LostFocus : Repaint = #True
              If Bool(*This\Type <> #PB_GadgetType_Editor)
                ; StringGadget
                \Text[2]\Len = 0 ; Убыраем выделение
              EndIf
              *This\Caret[1] =- 1 ; Прячем коректор
              
            Case #PB_EventType_Focus : Repaint = #True
              *This\Caret[1] = *This\Caret ; Показываем коректор
              
            Case #PB_EventType_LeftDoubleClick 
              DoubleClick = *This\Caret
              Text::SelectionLimits(*This)
              SelectionText(*This) 
              Repaint = #True
              
              *This\Caret = Caret(*This, *This\Line[1]) 
              
            Case #PB_EventType_LeftButtonDown
              *This\Caret[1] = *This\Caret
              
              If \Text\Numeric 
                \Text\String.s[1] = \Text\String.s 
              EndIf
              
              If *This\Caret = DoubleClick
                DoubleClick =- 1
                *This\Caret[1] = \Text\Len
                *This\Caret = 0
              EndIf 
              
              SelectionText(*This)
              Repaint = #True
              
            Case #PB_EventType_MouseMove
              If *This\Canvas\Mouse\Buttons & #PB_Canvas_LeftButton
                ;                 *This\Caret = Caret(*This)
                ;                 SelectionText(*This)
                Repaint = #True
              EndIf
              
              
          EndSelect
        EndIf  
        
        If *Focus = *This And *This\Text\Editable
          CompilerIf #PB_Compiler_OS = #PB_OS_MacOS 
            Control = Bool(*This\Canvas\Key[1] & #PB_Canvas_Command)
          CompilerElse
            Control = Bool(*This\Canvas\Key[1] & #PB_Canvas_Control)
          CompilerEndIf
          
          Select EventType
            Case #PB_EventType_Input ;- Input (key)
              If *This\Text\Editable And Not (*This\Canvas\Key[1] & #PB_Canvas_Command)
                Protected Input, Input_2
                
                Select #True
                  Case \Text\Lower : Input = Asc(LCase(Chr(*This\Canvas\Input))) : Input_2 = Input
                  Case \Text\Upper : Input = Asc(UCase(Chr(*This\Canvas\Input))) : Input_2 = Input
                  Case \Text\Pass  : Input = 9679 : Input_2 = *This\Canvas\Input ; "●"
                  Case \Text\Numeric
                    ;                     Debug *This\Canvas\Input
                    Static Dot
                    
                    Select *This\Canvas\Input 
                      Case '.','0' To '9' : Input = *This\Canvas\Input : Input_2 = Input
                      Case 'Ю','ю','Б','б',44,47,60,62,63 : Input = '.' : Input_2 = Input
                      Default
                        Input_2 = *This\Canvas\Input
                    EndSelect
                    
                    If Not Dot And Input = '.'
                      Dot = 1
                    ElseIf Input <> '.'
                      Dot = 0
                    Else
                      Input = 0
                    EndIf
                    
                  Default
                    Input = *This\Canvas\Input : Input_2 = Input
                EndSelect
                
                If Input_2
                  If Input
                    If \Text[2]\String.s
                      RemoveText(*This)
                    EndIf
                    *This\Caret + 1
                    *This\Caret[1] = *This\Caret
                  EndIf
                  
                  If \Text\Numeric And Input = Input_2
                    \Text\String.s[1] = \Text\String.s
                  EndIf
                  
                  ;\Text\String.s = Left(\Text\String.s, *This\Caret-1) + Chr(Input) + Mid(\Text\String.s, *This\Caret)
                  \Text\String.s = InsertString(\Text\String.s, Chr(Input), *This\Caret)
                  \Text\String.s[1] = InsertString(\Text\String.s[1], Chr(Input_2), *This\Caret)
                  
                  If Input
                    \Text\Len = Len(\Text\String.s)
                    PostEvent(#PB_Event_Gadget, EventWindow(), EventGadget(), #PB_EventType_Change)
                  EndIf
                  
                  Repaint = #True 
                EndIf
              EndIf
              
            Case #PB_EventType_KeyUp
              If \Text\Numeric
                \Text\String.s[1]=\Text\String.s 
              EndIf
              Repaint = #True 
              
            Case #PB_EventType_KeyDown
              Select *This\Canvas\Key
                Case #PB_Shortcut_Home : \Text[2]\String.s = "" : \Text[2]\Len = 0 : *This\Caret = 0 : *This\Caret[1] = *This\Caret : Repaint =- 1
                Case #PB_Shortcut_End : \Text[2]\String.s = "" : \Text[2]\Len = 0 : *This\Caret = \Text\Len : *This\Caret[1] = *This\Caret : Repaint =- 1 
                  
                Case #PB_Shortcut_Up     : Repaint = ToUp(*This)      ; Ok
                Case #PB_Shortcut_Left   : Repaint = ToLeft(*This)    ; Ok
                Case #PB_Shortcut_Right  : Repaint = ToRight(*This)   ; Ok
                Case #PB_Shortcut_Down   : Repaint = ToDown(*This)    ; Ok
                Case #PB_Shortcut_Back   : Repaint = ToBack(*This)
                Case #PB_Shortcut_Return : Repaint = ToReturn(*This) 
                Case #PB_Shortcut_Delete : Repaint = ToDelete(*This)
                  
                  
                Case #PB_Shortcut_C, #PB_Shortcut_X
                  If ((*This\Canvas\Key[1] & #PB_Canvas_Control) Or (*This\Canvas\Key[1] & #PB_Canvas_Command)) 
                    SetClipboardText(Copy(*This))
                    
                    If *This\Canvas\Key = #PB_Shortcut_X
                      Cut(*This)
                      
                      *This\Caret[1] = *This\Caret
                      Repaint = #True 
                    EndIf
                  EndIf
                  
                Case #PB_Shortcut_V
                  If *This\Text\Editable And ((*This\Canvas\Key[1] & #PB_Canvas_Control) Or (*This\Canvas\Key[1] & #PB_Canvas_Command))
                    Protected ClipboardText.s = Trim(GetClipboardText(), #CR$)
                    
                    If ClipboardText.s
                      If \Text[2]\Len > 0
                        RemoveText(*This)
                        
                        If \Text[2]\Len = \Text\Len
                          ;*This\Line[1] = *This\Line
                          ClipboardText.s = Trim(ClipboardText.s, #LF$)
                        EndIf
                        ;                         
                        PushListPosition(*This\Items())
                        ForEach *This\Items()
                          If \Text[2]\Len > 0 
                            If \Text[2]\Len = \Text\Len
                              DeleteElement(*This\Items(), 1) 
                            Else
                              RemoveText(*This)
                            EndIf
                          EndIf
                        Next
                        PopListPosition(*This\Items())
                      EndIf
                      
                      Select #True
                        Case \Text\Lower : ClipboardText.s = LCase(ClipboardText.s)
                        Case \Text\Upper : ClipboardText.s = UCase(ClipboardText.s)
                        Case \Text\Numeric 
                          If Val(ClipboardText.s)
                            ClipboardText.s = Str(Val(ClipboardText.s))
                          EndIf
                      EndSelect
                      
                      \Text\String.s = InsertString( \Text\String.s, ClipboardText.s, *This\Caret + 1)
                      
                      If CountString(\Text\String.s, #LF$)
                        Caret = \Text\Len-*This\Caret
                        String.s = \Text\String.s
                        DeleteElement(*This\Items(), 1)
                        SetText(*This\Canvas\Gadget, String.s, *This\Line[1])
                        *This\Caret = Len(\Text\String.s)-Caret
                        ;                         SelectElement(*This\Items(), *This\Line)
                        ;                        *This\Caret = 0
                      Else
                        *This\Caret + Len(ClipboardText.s)
                      EndIf
                      
                      *This\Caret[1] = *This\Caret
                      \Text\Len = Len(\Text\String.s)
                      
                      Repaint = #True
                    EndIf
                  EndIf
                  
              EndSelect 
              
          EndSelect
        EndIf
        
        If Repaint
          ;\Text[3]\Change = Bool(Repaint =- 1)
          If Repaint =- 1
            SelectionText(*This) 
          EndIf
          
          If Repaint = 2
            *This\Text[0]\Change = Repaint
            \Text[1]\Change = Repaint
            \Text[2]\Change = Repaint
            \Text[3]\Change = Repaint
          EndIf
          ; *This\CaretLength = \CaretLength
          *This\Text[2]\String.s[1] = \Text[2]\String.s[1]
        EndIf
      EndIf
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure.i CallBack(*This.Widget_S, EventType.i, Canvas.i=-1, CanvasModifiers.i=-1)
    Protected Repaint
    With *This
      Repaint | Scroll::CallBack(\vScroll, EventType, \Canvas\Mouse\X, \Canvas\Mouse\Y,0, 0)
      Repaint | Scroll::CallBack(\hScroll, EventType, \Canvas\Mouse\X, \Canvas\Mouse\Y,0, 0)
      
      If Not \vScroll\Buttons And Not \hScroll\Buttons
        Repaint | Text::CallBack(@Events(), *This, EventType, Canvas, CanvasModifiers)
      EndIf
    EndWith
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure.i Widget(*This.Widget_S, Canvas.i, X.i, Y.i, Width.i, Height.i, Text.s, Flag.i=0, Radius.i=0)
    If *This
      With *This
        \Type = #PB_GadgetType_Editor
        \Cursor = #PB_Cursor_IBeam
        \DrawingMode = #PB_2DDrawing_Default
        \Canvas\Gadget = Canvas
        \Radius = Radius
        \Alpha = 255
        \Interact = 1
        \Caret[1] =- 1
        \Line =- 1
        
        ; Set the default widget flag
        If Bool(Flag&#PB_Text_WordWrap)
          Flag&~#PB_Text_MultiLine
        EndIf
        
        If Bool(Flag&#PB_Text_MultiLine)
          Flag&~#PB_Text_WordWrap
        EndIf
        
        If Not \Text\FontID
          \Text\FontID = GetGadgetFont(#PB_Default) ; Bug in Mac os
        EndIf
        
        \fSize = Bool(Not Flag&#PB_Widget_BorderLess)+1
        \bSize = \fSize
        
        If Text::Resize(*This, X,Y,Width,Height, Canvas)
          \Text\Vertical = Bool(Flag&#PB_Text_Vertical)
          
          \Text\Editable = Bool(Not Flag&#PB_Text_ReadOnly)
          If Bool(Flag&#PB_Text_WordWrap)
            \Text\MultiLine = 1
          ElseIf Bool(Flag&#PB_Text_MultiLine)
            \Text\MultiLine =- 1
          EndIf
          \Text\Numeric = Bool(Flag&#PB_Text_Numeric)
          \Text\Lower = Bool(Flag&#PB_Text_LowerCase)
          \Text\Upper = Bool(Flag&#PB_Text_UpperCase)
          \Text\Pass = Bool(Flag&#PB_Text_Password)
          
          \Text\Align\Horisontal = Bool(Flag&#PB_Text_Center)
          \Text\Align\Vertical = Bool(Flag&#PB_Text_Middle)
          \Text\Align\Right = Bool(Flag&#PB_Text_Right)
          \Text\Align\Bottom = Bool(Flag&#PB_Text_Bottom)
          
          
          CompilerIf #PB_Compiler_OS = #PB_OS_MacOS 
            If \Text\Vertical
              \Text\X = \fSize 
              \Text\y = \fSize+5
            Else
              \Text\X = \fSize+5
              \Text\y = \fSize
            EndIf
          CompilerElseIf #PB_Compiler_OS = #PB_OS_Windows
            If \Text\Vertical
              \Text\X = \fSize 
              \Text\y = \fSize+1
            Else
              \Text\X = \fSize+1
              \Text\y = \fSize
            EndIf
          CompilerElseIf #PB_Compiler_OS = #PB_OS_Linux
            If \Text\Vertical
              \Text\X = \fSize 
              \Text\y = \fSize+6
            Else
              \Text\X = \fSize+6
              \Text\y = \fSize
            EndIf
          CompilerEndIf 
          
          If \Text\Pass
            Protected i,Len = Len(Text.s)
            Text.s = "" : For i=0 To Len : Text.s + "●" : Next
          EndIf
          
          Select #True
            Case \Text\Lower : \Text\String.s = LCase(Text.s)
            Case \Text\Upper : \Text\String.s = UCase(Text.s)
            Default
              \Text\String.s = Text.s
          EndSelect
          \Text\Change = #True
          \Text\Len = Len(\Text\String.s)
          
          
          If \Text\Editable
            \Color[0]\Back[1] = $FFFFFF 
          Else
            \Color[0]\Back[1] = $F0F0F0  
          EndIf
          
          ;           ; Default frame color
          ;           \Color[0]\Frame[1] = $BABABA
          ;           
          ;           ; Focus frame color
          ;           \Color[0]\Frame[3] = $D5A719
          ; default frame color
          \Color[0]\Frame[1] = Widget_FrameColor_Default ; $FFBABABA
          
          ; focus frame color
          \Color[0]\Frame[3] = Widget_FrameColor_Focus ; $FF24B002 ; $FFD5A719 ; $FFE89C3D ; $FFDE9541 ; $FFFADBB3 ;   
          
          ; default font color
          \Color[0]\Front[1] = Widget_FontColor_Default ; $FF000000 ; $FF0B0B0B
          
          ; focus font color
          \Color[0]\Front[3] = Widget_FontColor_Focus ; ! $FFFFFFFF; Widget_FontColor_Focus ; $FF000000 ; $FF0B0B0B
          
          ; enter frame color
          \Color[0]\Frame[2] = Widget_FrameColor_Enter   
          \Color[0]\Fore[2] = Widget_FontColor_Focus   
          \Color[0]\Back[2] = Widget_Color_Enter   
          
          ResetColor(*This)
        EndIf
        
        Scroll::Widget(\vScroll, #PB_Ignore, #PB_Ignore, 16, #PB_Ignore, 0,0,0, #PB_ScrollBar_Vertical, 7)
        If Not Bool(\Text\MultiLine)
          Scroll::Widget(\hScroll, #PB_Ignore, #PB_Ignore, #PB_Ignore, 16, 0,0,0, 0, 7)
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Create(Canvas.i, Widget, X.i, Y.i, Width.i, Height.i, Text.s, Flag.i=0, Radius.i=0)
    Protected *Widget, *This.Widget_S = AllocateStructure(Widget_S)
    
    If *This
      add_widget(Widget, *Widget)
      
      *This\Index = Widget
      *This\Handle = *Widget
      List()\Widget = *This
      
      Widget(*This, Canvas, x, y, Width, Height, Text.s, Flag, Radius)
    EndIf
    
    ProcedureReturn *This
  EndProcedure
  
  
  Procedure CallBacks()
    Static LastX, LastY
    Protected Repaint, *This.Widget_S = GetGadgetData(EventGadget())
    
    With *This
      \Canvas\Window = EventWindow()
      \Canvas\Input = GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_Input)
      \Canvas\Key = GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_Key)
      \Canvas\Key[1] = GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_Modifiers)
      \Canvas\Mouse\X = GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_MouseX)
      \Canvas\Mouse\Y = GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_MouseY)
      \Canvas\Mouse\Buttons = GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_Buttons)
      
      Select EventType()
        Case #PB_EventType_Resize : ResizeGadget(\Canvas\Gadget, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore) ; Bug (562)
          Repaint | Resize(*This, #PB_Ignore, #PB_Ignore, GadgetWidth(\Canvas\Gadget), GadgetHeight(\Canvas\Gadget))
      EndSelect
      
      Repaint | CallBack(*This, EventType())
      
      If Repaint 
        ReDraw(*This)
      EndIf
      
    EndWith
  EndProcedure
  
  Procedure.i Gadget(Gadget.i, X.i, Y.i, Width.i, Height.i, Flag.i=0)
    Protected *This.Widget_S = AllocateStructure(Widget_S)
    Protected g = CanvasGadget(Gadget, X, Y, Width, Height, #PB_Canvas_Keyboard) : If Gadget=-1 : Gadget=g : EndIf
    
    If *This
      With *This
        Widget(*This, Gadget, 0, 0, Width, Height, "", Flag)
        
        SetGadgetData(Gadget, *This)
        ReDraw(*This)
        
        PostEvent(#PB_Event_Gadget, GetActiveWindow(), Gadget, #PB_EventType_Resize)
        BindGadgetEvent(Gadget, @CallBacks())
      EndWith
    EndIf
    
    ProcedureReturn g
  EndProcedure
  
EndModule


;- EXAMPLE
CompilerIf #PB_Compiler_IsMainFile
  
  Define a,i
  Define g, Text.s
  ; Define m.s=#CRLF$
  Define m.s=#LF$
  
  Text.s = "This is a long line" + m.s +
           "Who should show," + m.s +
           "I have to write the text in the box or not." + m.s +
           "The string must be very long" + m.s +
           "Otherwise it will not work."
  
  Procedure ResizeCallBack()
    ResizeGadget(10, #PB_Ignore, #PB_Ignore, WindowWidth(EventWindow(), #PB_Window_InnerCoordinate)-65, WindowHeight(EventWindow(), #PB_Window_InnerCoordinate)-16)
    CompilerIf #PB_Compiler_Version =< 546
      PostEvent(#PB_Event_Gadget, EventWindow(), 16, #PB_EventType_Resize)
    CompilerEndIf
  EndProcedure
  
  Procedure SplitterCallBack()
    PostEvent(#PB_Event_Gadget, EventWindow(), 16, #PB_EventType_Resize)
  EndProcedure
  
  CompilerIf #PB_Compiler_OS = #PB_OS_MacOS 
    LoadFont(0, "Arial", 16)
  CompilerElse
    LoadFont(0, "Arial", 11)
  CompilerEndIf 
  
  If OpenWindow(0, 0, 0, 422, 490, "EditorGadget", #PB_Window_SystemMenu | #PB_Window_SizeGadget | #PB_Window_ScreenCentered)
    
    EditorGadget(0, 8, 8, 306, 133, #PB_Editor_WordWrap) : SetGadgetText(0, Text.s) 
    For a = 0 To 5
      AddGadgetItem(0, a, "Line "+Str(a))
    Next
    SetGadgetFont(0, FontID(0))
    
    
    g=16
    Editor::Gadget(g, 8, 133+5+8, 306, 133, #PB_Text_WordWrap) : Editor::SetText(g, Text.s) 
    For a = 0 To 5
      Editor::AddItem(g, a, "Line "+Str(a))
    Next
    Editor::SetFont(g, FontID(0))
    
    SplitterGadget(10,8, 8, 306, 276, 0,g)
    CompilerIf #PB_Compiler_Version =< 546
      BindGadgetEvent(10, @SplitterCallBack())
    CompilerEndIf
    PostEvent(#PB_Event_SizeWindow, 0, #PB_Ignore) ; Bug
    BindEvent(#PB_Event_SizeWindow, @ResizeCallBack(), 0)
    
    Repeat 
      Define Event = WaitWindowEvent()
      
      Select Event
        Case #PB_Event_LeftClick  
          SetActiveGadget(0)
        Case #PB_Event_RightClick 
          SetActiveGadget(10)
      EndSelect
    Until Event = #PB_Event_CloseWindow
  EndIf
CompilerEndIf
; IDE Options = PureBasic 5.62 (MacOS X - x64)
; Folding = ggAAAOAAAAAAAKAAAUAAA+OAAAAAAAAAo4MAAICiBAAAAAAAAAAAAAAAAAAAAAAAAACg
; EnableXP