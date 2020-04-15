﻿IncludePath "../../"
XIncludeFile "widgets.pbi"

;-
CompilerIf #PB_Compiler_IsMainFile
  EnableExplicit
  Uselib(widget)
  
  Procedure.i _SetAlignment(*this._s_widget, Mode.l, Type.l=1)
      
      With *this
        Select Type
          Case 1 ; widget
            If \parent
              If Not \align
                \align.structures::_s_align = AllocateStructure(structures::_s_align)
              EndIf
              
              ; Auto dock
                Static y2,x2,y1,x1
                Protected width = #PB_Ignore
                Protected height = #PB_Ignore
                
                
              If Bool(Mode&#__flag_autoSize=#__flag_autoSize)
                \align\top = Bool(Not Mode&#__align_bottom)
                \align\left = Bool(Not Mode&#__align_right)
                \align\right = Bool(Not Mode&#__align_left)
                \align\bottom = Bool(Not Mode&#__align_top)
                \align\autoSize = 0
                
                If \align\left And \align\right
                  \x = x2
                  width = \parent\width[#__c_2] - x1 - x2
                EndIf
                If \align\top And \align\bottom 
                  \y = y2
                  height = \parent\height[#__c_2] - y1 - y2
                EndIf
                
                If \align\left And Not \align\right
                  \x = x2
                  \y = y2
                  x2 + \width
                  height = \parent\height[#__c_2] - y1 - y2
                EndIf
                If \align\right And Not \align\left
                  \x = \parent\width[#__c_2] - \width - x1
                  \y = y2
                  x1 + \width
                  height = \parent\height[#__c_2] - y1 - y2
                EndIf
                
                If \align\top And Not \align\bottom 
                  \x = 0
                  \y = y2
                  y2 + \height
                  width = \parent\width[#__c_2] - x1 - x2
                EndIf
                If \align\bottom And Not \align\top
                  \x = 0
                  \y = \parent\height[#__c_2] - \height - y1
                  y1 + \height
                  width = \parent\width[#__c_2] - x1 - x2
                EndIf
                
                
                Resize(*this, \x, \y, width, height)
                
              ElseIf Bool(Mode&#__align_auto=#__align_auto)
                \align\top = Bool(Mode&#__align_top=#__align_top)
                \align\left = Bool(Mode&#__align_left=#__align_left)
                \align\right = Bool(Mode&#__align_right=#__align_right)
                \align\bottom = Bool(Mode&#__align_bottom=#__align_bottom)
                
                \align\vertical = Bool(Not \align\bottom And Not \align\top)
                \align\horizontal = Bool(Not \align\right And Not \align\left)
                
                Protected p = 2
                \y = 0
                \x = 0
                
                If \align\bottom
                  \y = (\parent\height[2] - \height)
                  
                ElseIf \align\vertical
                  \y = (\parent\height[p] - \height)/2
                  
                EndIf
                
                If \align\right
                  If \align\left
                    width = \parent\width[2]
                  Else
                    \x = (\parent\width[2] - \width)
                  EndIf
                  
                ElseIf \align\horizontal
                  \x = (\parent\width[p] - \width)/2
                EndIf
                
                
                
              If \align\right
                If \align\left
                  \align\width = \parent\width[#__c_2] - \width
                Else
                  \align\width = (\parent\width[#__c_2]-\x[#__c_3])
                EndIf
              EndIf
              
              If \align\bottom
                If \align\top
                  \align\height = \parent\height[#__c_2] - \height
                Else
                  \align\height = (\parent\height[#__c_2]-\y[#__c_3])
                EndIf
              EndIf
                
                Resize(*this, \x, \y, width, height)
                
              Else
                \align\top = Bool(Mode&#__align_top=#__align_top)
                \align\left = Bool(Mode&#__align_left=#__align_left)
                \align\right = Bool(Mode&#__align_right=#__align_right)
                \align\bottom = Bool(Mode&#__align_bottom=#__align_bottom)
                
                If Bool(Mode&#__align_center=#__align_center)
                  \align\horizontal = Bool(Not \align\right And Not \align\left)
                  \align\vertical = Bool(Not \align\bottom And Not \align\top)
                EndIf
              EndIf
              
              If \align\right
                If \align\left
                  \align\width = \parent\width[#__c_2] - \width
                Else
                  \align\width = (\parent\width[#__c_2]-\x[#__c_3])
                EndIf
              EndIf
              
              If \align\bottom
                If \align\top
                  \align\height = \parent\height[#__c_2] - \height
                Else
                  \align\height = (\parent\height[#__c_2]-\y[#__c_3])
                EndIf
              EndIf
              
              ; update parent childrens coordinate
              Resize(\parent, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
            EndIf
          Case 2 ; text
          Case 3 ; image
        EndSelect
      EndWith
    EndProcedure
    
    
  Procedure.s get_text(m.s=#LF$)
    Protected Text.s = "This is a long line." + m.s +
                       "Who should show." + 
                       m.s +
                       m.s +
                       m.s +
                       m.s +
                       "I have to write the text in the box or not." + 
                       m.s +
                       m.s +
                       m.s +
                       m.s +
                       "The string must be very long." + m.s +
                       "Otherwise it will not work." ;+ m.s; +
    
    ProcedureReturn Text
  EndProcedure
  
  Define cr.s = #LF$, text.s = "Vertical & Horizontal" + cr + "   Centered   Text in   " + cr + "Multiline StringGadget"
  Global *w, Button_0, Button_1, Button_2, Button_3, Button_4, Button_5, Splitter_0, Splitter_1, Splitter_2, Splitter_3, Splitter_4
  
  Global *l,*t,*r,*b , *lt,*rt,*rb,*lb, *ce
  
  Global *demo
  Procedure events_widgets()
    SetData(*event\widget, (GetData(*event\widget) ! 1))
    ;Debug  GetData(*event\widget)
    
    Select *event\widget
      Case *t
        _SetAlignment(*demo, #__align_Center|#__align_top|#__align_auto)
        
      Case *l
;         If GetData(*r)
;           _SetAlignment(*demo, #__align_Center|#__align_left|#__align_right|#__align_auto)
;         Else
          _SetAlignment(*demo, #__align_Center|#__align_left|#__align_auto)
;         EndIf
        
      Case *r
;         If GetData(*l)
;           _SetAlignment(*demo, #__align_Center|#__align_left|#__align_right|#__align_auto)
;         Else
          _SetAlignment(*demo, #__align_Center|#__align_right|#__align_auto)
;         EndIf
        
      Case *b
        _SetAlignment(*demo, #__align_Center|#__align_bottom|#__align_auto)
        
        
      Case *ce
        _SetAlignment(*demo, #__align_center|#__align_auto)
        
        
      Case *lt
        _SetAlignment(*demo, #__align_left|#__align_top|#__align_auto)
        
      Case *rt
        _SetAlignment(*demo, #__align_right|#__align_top|#__align_auto)
        
      Case *rb
        _SetAlignment(*demo, #__align_right|#__align_bottom|#__align_auto)
        
      Case *lb
        _SetAlignment(*demo, #__align_left|#__align_bottom|#__align_auto)
      
  EndSelect    
  EndProcedure
  
  If Open(OpenWindow(#PB_Any, 0, 0, 605+30, 140+200+140+140, "ScrollBarGadget", #PB_Window_SystemMenu | #PB_Window_ScreenCentered))
    ButtonGadget   (0,    5,   600-35, 590,  30, "resize", #PB_Button_Toggle)
    
    Define *cont = Container(15,15,100,100)
    Define s2=10+6, s = s2+6, r2 = 4+3, r = r2+3-1, o=1, o2 = 1
     *lt = Button(o,o,s,s,"",0,0,r)
     *rt = Button(98-s-o*2,o,s,s,"",0,0,r)
     *rb = Button(98-s-o*2,98-s-o*2,s,s,"",0,0,r)
     *lb = Button(o,98-s-o*2,s,s,"",0,0,r)
    
     *t = Button(o2,o2,s2,s2,"",0,0,r2)
     *l = Button(o2,o2,s2,s2,"",0,0,r2)
     *r = Button(98-s2-o2*2,o2,s2,s2,"",0,0,r2)
     *b = Button(o2,98-s2-o2*2,s2,s2,"",0,0,r2)
    
    Define *c._s_widget = Container(s2+o2*3-1,s2+o2*3-1,(98-s2*2-o2*6+1),(98-s2*2-o2*6+1))
    *c\round = 9
    
    *demo = Button(o,o,s,s,"",0,0, r)
     *ce = Button(o2,o2,s2,s2,"",0,0, r2)
    CloseList()
    
;     SetClass(*t, "t_anchor")
;     SetClass(*l, "l_anchor")
;     SetClass(*r, "r_anchor")
;     SetClass(*b, "b_anchor")
;     
;     SetClass(*lt, "lt_anchor")
;     SetClass(*rt, "rt_anchor")
;     SetClass(*rb, "rb_anchor")
;     SetClass(*lb, "lb_anchor")
;     SetClass(*ce, "ce_anchor")
    
    _SetAlignment(*t, #__align_Center|#__align_top)
    _SetAlignment(*b, #__align_Center|#__align_bottom)
    _SetAlignment(*l, #__align_Center|#__align_left)
    _SetAlignment(*r, #__align_Center|#__align_right)
    
    
    _SetAlignment(*lt, #__align_left|#__align_top)
    _SetAlignment(*rt, #__align_right|#__align_top)
    _SetAlignment(*rb, #__align_right|#__align_bottom)
    _SetAlignment(*lb, #__align_left|#__align_bottom)
    _SetAlignment(*ce, #__align_center)
    
    _SetAlignment(*c, #__align_Center|#__align_full)
    CloseList()
    
    Bind(*t, @events_widgets())
    Bind(*l, @events_widgets())
    Bind(*r, @events_widgets())
    Bind(*b, @events_widgets())
    
    Bind(*lt, @events_widgets())
    Bind(*rt, @events_widgets())
    Bind(*rb, @events_widgets())
    Bind(*lb, @events_widgets())
    Bind(*ce, @events_widgets())
    
    Define direction = 1
  Define Width, Height
  
    Repeat
   Define  gEvent= WaitWindowEvent()
    
    Select gEvent
      Case #PB_Event_CloseWindow
        Define gQuit= #True
        
      Case #PB_Event_Timer
        If Width = 100
           direction = 1
        EndIf
        If Width = Width(Root())-100
          direction =- 1
        EndIf
;         
        Width + direction
        Height + direction
        
        If Resize(*cont, #PB_Ignore, #PB_Ignore, Width, Height)
          ; SetWindowTitle(0, "Change scroll direction "+ Str(GetAttribute(*Bar_0, #PB_Bar_Direction)))
        EndIf
        ReDraw(Root())
    
      Case #PB_Event_Gadget
        
        Select EventGadget()
          Case 0
            Width = Width(*cont)
            Height = Height(*cont)
            
            If GetGadgetState(0)
              AddWindowTimer(GetWindow(Root()), 1, 200)
            Else
              RemoveWindowTimer(GetWindow(Root()), 1)
            EndIf
        EndSelect
        
    EndSelect
    
  Until gQuit
  EndIf
CompilerEndIf
; IDE Options = PureBasic 5.71 LTS (MacOS X - x64)
; Folding = ----Ow
; EnableXP