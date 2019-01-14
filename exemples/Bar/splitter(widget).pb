﻿IncludePath "../../"
XIncludeFile "module_bar.pbi"

;
; Module name   : Splitter
; Author        : mestnyi
; Last updated  : Dec 29, 2018
; Forum link    : https://www.purebasic.fr/english/viewtopic.php?f=12&t=70663
; 

DeclareModule Splitter
  EnableExplicit
  
  ;- STRUCTURE
  Structure Canvas
    Gadget.i
    Window.i
  EndStructure
  
  Structure Gadget Extends Bar::Coordinate_S
    Canvas.Canvas
    *Bar.Bar::Bar_S
  EndStructure
  
  ;- DECLARE
  Declare GetState(Gadget.i)
  Declare SetState(Gadget.i, State.i)
  Declare GetAttribute(Gadget.i, Attribute.i)
  Declare SetAttribute(Gadget.i, Attribute.i, Value.i)
  Declare Gadget(Gadget, X.i, Y.i, Width.i, Height.i, Gadget_1.i, Gadget_2.i, Flag.i=0)
  
EndDeclareModule

Module Splitter
  
  ;- PROCEDURE
  Procedure Draw(*This.Gadget)
    With *This\Bar
      If StartDrawing(CanvasOutput(*This\Canvas\Gadget))
        ; Draw scroll bar background
        DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
        RoundBox( \X, \Y, \Width, \Height, \Radius, \Radius, \Color\Back&$FFFFFF|\color\alpha<<24)
        
        Bar::Draw(*This\Bar)
        StopDrawing()
      EndIf
    EndWith 
    
  EndProcedure
  
  Procedure Canvas_Events(EventGadget.i, EventType.i)
    Protected Repaint.i, Mouse_X.i, Mouse_Y.i, *This.Gadget = GetGadgetData(EventGadget)
    
    If *This 
      With *This
        \Canvas\Window = EventWindow()
        Mouse_X = GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_MouseX)
        Mouse_Y = GetGadgetAttribute(\Canvas\Gadget, #PB_Canvas_MouseY)
        
        Select EventType
          Case #PB_EventType_Resize ;: ResizeGadget(\Canvas\Gadget, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore) ; Bug (562)
           Bar::Resize(*This\Bar, #PB_Ignore, #PB_Ignore, GadgetWidth(\Canvas\Gadget), GadgetHeight(\Canvas\Gadget))
           Repaint = 1
       EndSelect
        
        Repaint | Bar::CallBack(\Bar, EventType, Mouse_X, Mouse_Y)
        
        If \Bar\Focus
          \Bar\Color[3]\State = 2
        Else
          \Bar\Color[3]\State = 0
        EndIf
        
        If Repaint 
          If (\Bar\Change Or \Bar\Resize)
            Protected *fir.Gadget = GetGadgetData(\Bar\First)
            Protected *sec.Gadget = GetGadgetData(\Bar\Second)
            
            CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
              ResizeGadget(\Bar\First, \Bar\x[1], (\Bar\height-\Bar\height[1])-\Bar\y[1]-Bool(Not *fir), \Bar\width[1], \Bar\height[1]+Bool(Not *fir))
              ResizeGadget(\Bar\Second, \Bar\x[2], \Bar\y[1]-Bool(Not *sec), \Bar\width[2], \Bar\height[2]+Bool(Not *sec))
            CompilerElse
              ResizeGadget(\Bar\First, \Bar\x[1], \Bar\y[1], \Bar\width[1], \Bar\height[1]+Bool(Not *fir))
              ResizeGadget(\Bar\Second, \Bar\x[2], \Bar\y[2], \Bar\width[2], \Bar\height[2]+Bool(Not *sec))
            CompilerEndIf
            
;             If *sec
;               Bar::Resize(*sec\Bar, #PB_Ignore, #PB_Ignore, \Bar\width[2], \Bar\height[2])
;               
;             CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
;               ResizeGadget(*sec\Bar\First, *sec\Bar\x[1], (*sec\Bar\height-*sec\Bar\height[1])-*sec\Bar\y[1]-Bool(Not *fir), *sec\Bar\width[1], *sec\Bar\height[1]+Bool(Not *fir))
;               ResizeGadget(*sec\Bar\Second, *sec\Bar\x[2], *sec\Bar\y[1]-Bool(Not *sec), *sec\Bar\width[2], *sec\Bar\height[2]+Bool(Not *sec))
;             CompilerElse
;               ResizeGadget(\Bar\First, \Bar\x[1], \Bar\y[1], \Bar\width[1], \Bar\height[1]+Bool(Not *fir))
;               ResizeGadget(\Bar\Second, \Bar\x[2], \Bar\y[2], \Bar\width[2], \Bar\height[2]+Bool(Not *sec))
;             CompilerEndIf
;             EndIf
          EndIf
          
          If \Bar\Change 
            PostEvent(#PB_Event_Gadget, \Canvas\Window, \Canvas\Gadget, #PB_EventType_Change) 
          EndIf
          
          Draw(*This)
        EndIf
      EndWith
    EndIf
  EndProcedure
  
  Procedure Canvas_CallBack()
    ; Canvas events bug fix
    Protected Result.b
    Static MouseLeave.b
    Protected EventGadget.i = EventGadget()
    Protected EventType.i = EventType()
    Protected Width = GadgetWidth(EventGadget)
    Protected Height = GadgetHeight(EventGadget)
    Protected MouseX = GetGadgetAttribute(EventGadget, #PB_Canvas_MouseX)
    Protected MouseY = GetGadgetAttribute(EventGadget, #PB_Canvas_MouseY)
    
    ; Это из за ошибки в мак ос и линукс
    CompilerIf #PB_Compiler_OS = #PB_OS_MacOS Or #PB_Compiler_OS = #PB_OS_Linux
      Select EventType 
        Case #PB_EventType_MouseEnter 
          If GetGadgetAttribute(EventGadget, #PB_Canvas_Buttons) Or MouseLeave =- 1
            EventType = #PB_EventType_MouseMove
            MouseLeave = 0
          EndIf
          
        Case #PB_EventType_MouseLeave 
          If GetGadgetAttribute(EventGadget, #PB_Canvas_Buttons)
            EventType = #PB_EventType_MouseMove
            MouseLeave = 1
          EndIf
          
        Case #PB_EventType_LeftButtonDown
          If GetActiveGadget()<>EventGadget
            SetActiveGadget(EventGadget)
          EndIf
          
        Case #PB_EventType_LeftButtonUp
          If MouseLeave = 1 And Not Bool((MouseX>=0 And MouseX<Width) And (MouseY>=0 And MouseY<Height))
            MouseLeave = 0
            CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
              Result | Canvas_Events(EventGadget, #PB_EventType_LeftButtonUp)
              EventType = #PB_EventType_MouseLeave
            CompilerEndIf
          Else
            MouseLeave =- 1
            Result | Canvas_Events(EventGadget, #PB_EventType_LeftButtonUp)
            EventType = #PB_EventType_LeftClick
          EndIf
          
        Case #PB_EventType_LeftClick : ProcedureReturn 0
      EndSelect
    CompilerEndIf
    
    Result | Canvas_Events(EventGadget, EventType)
    
    ProcedureReturn Result
  EndProcedure
  
  ;- PUBLIC
  Procedure SetAttribute(Gadget.i, Attribute.i, Value.i)
    Protected *This.Gadget = GetGadgetData(Gadget)
    
    With *This\Bar
      Select Attribute
        Case #PB_Splitter_FirstMinimumSize : \ButtonLen[1] = Value
        Case #PB_Splitter_SecondMinimumSize : \ButtonLen[2] = Value
      EndSelect 
      
      If \Vertical
        \Area\Pos = \Y+\ButtonLen[1]
        \Area\len = (\Height-\ButtonLen[1]-\ButtonLen[2])
      Else
        \Area\Pos = \X+\ButtonLen[1]
        \Area\len = (\Width-\ButtonLen[1]-\ButtonLen[2])
      EndIf
      Draw(*This)
      ProcedureReturn 1
    EndWith
  EndProcedure
  
  Procedure GetAttribute(Gadget.i, Attribute.i)
    Protected Result, *This.Gadget = GetGadgetData(Gadget)
    
    With *This
;       Select Attribute
;         Case #PB_Splitter_Minimum : Attribute = #PB_ScrollBar_Minimum
;         Case #PB_Splitter_Maximum : Attribute = #PB_ScrollBar_Maximum
;       EndSelect
      
      Result = Bar::GetAttribute(*This\Bar, Attribute)
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure SetState(Gadget.i, State.i)
    Protected *This.Gadget = GetGadgetData(Gadget)
    
    With *This
      If Bar::SetState(*This\Bar, State)
        PostEvent(#PB_Event_Gadget, \Canvas\Window, \Canvas\Gadget, #PB_EventType_Change) 
        Draw(*This)
      EndIf
    EndWith
  EndProcedure
  
  Procedure GetState(Gadget.i)
    Protected *This.Gadget = GetGadgetData(Gadget)
    ProcedureReturn Bar::GetState(*This\Bar)
  EndProcedure
  
  Procedure Gadget(Gadget, X.i, Y.i, Width.i, Height.i, Gadget_1.i, Gadget_2.i, Flag.i=0)
    Protected *This.Gadget=AllocateStructure(Gadget)
    Protected g = CanvasGadget(Gadget, X, Y, Width, Height, #PB_Canvas_Keyboard|#PB_Canvas_Container) : If Gadget=-1 : Gadget=g : EndIf
    CloseGadgetList()
    
    ;CocoaMessage(0,GadgetID(Gadget), "setParent", GadgetID(Gadget_1)); NSWindowAbove = 1
    CompilerIf #PB_Compiler_OS = #PB_OS_Linux
      gtk_widget_reparent_( GadgetID(Gadget_1), GadgetID(Gadget) )
      gtk_widget_reparent_( GadgetID(Gadget_2), GadgetID(Gadget) )
    CompilerElseIf #PB_Compiler_OS = #PB_OS_MacOS
      CocoaMessage (0, GadgetID (Gadget), "addSubview:", GadgetID (Gadget_1)) 
      CocoaMessage (0, GadgetID (Gadget), "addSubview:", GadgetID (Gadget_2)) 
    CompilerEndIf
    
    If *This
      With *This
        \Canvas\Gadget = Gadget
        \Bar = Bar::Splitter(0,0, Width, Height, Gadget_1, Gadget_2, Flag)
        
        Draw(*This)
        SetGadgetData(Gadget, *This)
        BindGadgetEvent(Gadget, @Canvas_CallBack())
      EndIf
    EndWith
    
    ProcedureReturn Gadget
  EndProcedure
EndModule


;- EXAMPLE
CompilerIf #PB_Compiler_IsMainFile
      #Button1  = 3
      #Button2  = 4
      #Button3  = 5
      
      #Splitter1 = 6
      #Splitter2 = 7
      
      Global.i gEvent, gQuit, value, direction, x=10,y=10
  
  Procedure v_GadgetCallBack()
    SetWindowTitle(EventWindow(), Str(GetGadgetState(EventGadget())))
    Splitter::SetState(12, GetGadgetState(EventGadget()))
  EndProcedure
  
  Procedure v_CallBack()
    SetWindowTitle(EventWindow(), Str(Splitter::GetState(EventGadget())))
    SetGadgetState(2, Splitter::GetState(EventGadget()))
  EndProcedure
  
  Procedure h_GadgetCallBack()
    Splitter::SetState(11, GetGadgetState(EventGadget()))
  EndProcedure
  
  Procedure h_CallBack()
    SetGadgetState(1, Splitter::GetState(EventGadget()))
  EndProcedure
  
  Procedure Window_0_Resize()
    ResizeGadget(#Splitter1, #PB_Ignore, #PB_Ignore, WindowWidth(EventWindow(), #PB_Window_InnerCoordinate)-20, WindowHeight(EventWindow(), #PB_Window_InnerCoordinate)-50)
    ResizeGadget(0, #PB_Ignore, WindowHeight(EventWindow(), #PB_Window_InnerCoordinate)-35, WindowWidth(EventWindow(), #PB_Window_InnerCoordinate)-10, #PB_Ignore)
  EndProcedure
  
  Procedure Window_0()
    If OpenWindow(0, 0, 0, 400, 400, "Demo inverted scrollbar direction", #PB_Window_SystemMenu | #PB_Window_ScreenCentered | #PB_Window_SizeGadget)
      ButtonGadget   (0,    5,   365, 390,  30, "start change scrollbar", #PB_Button_Toggle)
      
;       CanvasGadget(1, 10,10, 380, 350, #PB_Canvas_Keyboard|#PB_Canvas_Container)
;       SetGadgetAttribute(1, #PB_Canvas_Cursor, #PB_Cursor_Hand)
      
      ButtonGadget(#Button1, 0, 0, 0, 0, "Button 1") ; No need to specify size or coordinates
      ButtonGadget(#Button2, 0, 0, 0, 0, "Button 2") ; as they will be sized automatically
      ButtonGadget(#Button3, 0, 0, 0, 0, "Button 3") ; as they will be sized automatically
      
      Splitter::Gadget(#Splitter1, 10, 10, 360,  330, #Button1, #Button2)
      Splitter::Gadget(#Splitter2, 10, 10, 360,  330, #Button3, #Splitter1, #PB_Splitter_Vertical)
      
;       SetAttribute(*Bar_1, #PB_Splitter_FirstFixed, 120)
;       SetAttribute(*Bar_1, #PB_Splitter_SecondFixed, 80)
;       
;       SetAttribute(*Bar_1, #PB_Splitter_FirstMinimumSize, 120)
;       SetAttribute(*Bar_1, #PB_Splitter_SecondMinimumSize, 80)
;       
;       SetAttribute(*Bar_0, #PB_Splitter_FirstMinimumSize, 100)
;       SetAttribute(*Bar_0, #PB_Splitter_SecondMinimumSize, 50)
      
;       SetState(*Bar_0, 25)
      
     ; BindGadgetEvent(1, @Canvas_CallBack())
      
;       CloseGadgetList()
      
     ; ReDraw(1)
      
      BindEvent(#PB_Event_SizeWindow, @Window_0_Resize(), 0)
    EndIf
  EndProcedure
  
  Window_0()
      
;     BindGadgetEvent(1,@h_GadgetCallBack())
;     BindGadgetEvent(11,@h_CallBack(), #PB_EventType_Change)
;     BindGadgetEvent(2,@v_GadgetCallBack())
;     BindGadgetEvent(12,@v_CallBack(), #PB_EventType_Change)
    Repeat : Until WaitWindowEvent() = #PB_Event_CloseWindow
 CompilerEndIf
; IDE Options = PureBasic 5.62 (MacOS X - x64)
; Folding = --8----
; EnableXP