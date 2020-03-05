﻿CompilerIf #PB_Compiler_OS = #PB_OS_MacOS 
  IncludePath "/Users/as/Documents/GitHub/Widget/widgets()"
  XIncludeFile "../fixme(mac).pbi"
CompilerElseIf #PB_Compiler_OS = #PB_OS_Linux 
  IncludePath "/media/sf_as/Documents/GitHub/Widget/widgets()"
CompilerElse
  IncludePath ""
CompilerEndIf


CompilerIf Not Defined(constants, #PB_Module)
  XIncludeFile "../constants.pbi"
CompilerEndIf

CompilerIf Not Defined(structures, #PB_Module)
  XIncludeFile "../structures.pbi"
CompilerEndIf

CompilerIf Not Defined(colors, #PB_Module)
  XIncludeFile "../colors.pbi"
CompilerEndIf


CompilerIf Not Defined(Splitter, #PB_Module)
  ;- >>>
  DeclareModule Splitter
    EnableExplicit
    UseModule constants
    UseModule structures
    
    
    Macro _get_colors_()
      colors::*this\grey
    EndMacro
    
    Macro width(_this_)
      (Bool(Not _this_\hide) * _this_\width)
    EndMacro
    
    Macro height(_this_)
      (Bool(Not _this_\hide) * _this_\height)
    EndMacro
    
    ; Inverted scroll bar position
    Macro _invert_(_bar_, _scroll_pos_, _inverted_=#True)
      (Bool(_inverted_) * ((_bar_\min + _bar_\page\end) - (_scroll_pos_)) + Bool(Not _inverted_) * (_scroll_pos_))
    EndMacro
    
    Macro _page_pos_(_bar_, _thumb_pos_)
      (_bar_\min + Round(((_thumb_pos_) - _bar_\area\pos) / _bar_\scroll_increment, #PB_Round_Nearest)) 
    EndMacro
    
    Macro _thumb_pos_(_bar_, _scroll_pos_)
      (_bar_\area\pos + Round(((_scroll_pos_) - _bar_\min) * _bar_\scroll_increment, #PB_Round_Nearest)) 
    EndMacro
    
    Macro _from_point_(_mouse_x_, _mouse_y_, _type_, _mode_=)
      Bool (_mouse_x_ > _type_\x#_mode_ And _mouse_x_ < (_type_\x#_mode_+_type_\width#_mode_) And 
            _mouse_y_ > _type_\y#_mode_ And _mouse_y_ < (_type_\y#_mode_+_type_\height#_mode_))
    EndMacro
    
    ;   ;- GLOBALs
    Declare.b Draw(*this)
    
    Declare.f GetState(*this)
    Declare.b SetState(*this, ScrollPos.f)
    Declare.l SetAttribute(*this, Attribute.l, Value.l)
    Declare.b Resize(*this, iX.l,iY.l,iWidth.l,iHeight.l)
    Declare.b Update(*this)
    
    Declare.i Button(X.l,Y.l,Width.l,Height.l, Text.s, Flag.i=0, round.l=0)
    
    Declare.b Events(*this, EventType.l, mouse_x.l, mouse_y.l, wheel_x.b=0, wheel_y.b=0)
    Declare.b SetPos(*this, ThumbPos.f)
    
    ;- DECLARE
    Declare _GetState(Gadget.i)
    Declare _SetState(Gadget.i, State.l)
    Declare _GetAttribute(Gadget.i, Attribute.l)
    Declare _SetAttribute(Gadget.i, Attribute.l, Value.l)
    
    Declare  Widget(X.l,Y.l,Width.l,Height.l, First.i, Second.i, Flag.i=0)
    Declare  Gadget(Gadget.i, X.l, Y.l, Width.l, Height.l, First.i, Second.i, Flag.i=0)
    
  EndDeclareModule
  
  Module Splitter
    ;-
    ; SPLITTERBAR
    Procedure.b Update(*this._s_widget)
      If *this\type = #PB_GadgetType_Splitter And *this\Splitter 
        If Bool(*this\resize & #__resize_change)
          If *this\bar\vertical
            *this\bar\area\pos = *this\y + *this\bar\button[#__b_1]\len
            *this\bar\area\len = *this\height - (*this\bar\button[#__b_1]\len + *this\bar\button[#__b_2]\len)
          Else
            *this\bar\area\pos = *this\x + *this\bar\button[#__b_1]\len
            *this\bar\area\len = *this\width - (*this\bar\button[#__b_1]\len + *this\bar\button[#__b_2]\len)
          EndIf
          
          If *this\bar\area\len < *this\bar\thumb\len 
            *this\bar\area\len = *this\bar\thumb\len 
          Else
            ; if SetState(height-value or width-value)
            If *this\bar\button[#__b_3]\fixed < 0 
              *this\bar\page\pos = *this\bar\area\len + *this\bar\button[#__b_3]\fixed
              *this\bar\button[3]\fixed = 0
            EndIf
          EndIf
          
          ; one
          If Not *this\bar\max And *this\width And *this\height
            If Not *this\bar\page\pos
              *this\bar\page\pos = (*this\bar\area\len-*this\bar\thumb\len)/2
            EndIf
            
            If *this\bar\fixed And *this\bar\button[#__b_1]\len
              *this\bar\max = *this\bar\area\len + *this\bar\button[#__b_1]\len*2 + Bool(*this\bar\fixed = #__b_1) * 4
            Else
              *this\bar\max = *this\bar\area\len - 2
            EndIf
            
            
            ;if splitter fixed set splitter pos to center
            If *this\bar\fixed = #__b_1
              *this\bar\button[*this\bar\fixed]\fixed = *this\bar\page\pos
            EndIf
            If *this\bar\fixed = #__b_2
              *this\bar\button[*this\bar\fixed]\fixed = *this\bar\area\len-*this\bar\page\pos-*this\bar\thumb\len
            EndIf
          EndIf
          
          *this\bar\page\end = (*this\bar\max - *this\bar\page\len)
          *this\bar\area\end = (*this\bar\area\pos + (*this\bar\area\len - *this\bar\thumb\len)) ; - *this\bar\button[#__b_1]\len)
          *this\bar\scroll_increment = (*this\bar\area\len / (*this\bar\max - *this\bar\min))
         ;  *this\bar\scroll_increment = ((*this\bar\area\len - *this\bar\thumb\len) / ((*this\bar\max-*this\bar\min) - *this\bar\page\len)) 
        ;*this\bar\scroll_increment = ((*this\bar\area\end-*this\bar\area\pos) / ((*this\bar\max-*this\bar\min) - *this\bar\page\len)) 
      EndIf
        
        If *this\bar\fixed And Not *this\bar\page\change
          If *this\bar\button[*this\bar\fixed]\fixed > *this\bar\area\len - *this\bar\thumb\len
            *this\bar\button[*this\bar\fixed]\fixed = *this\bar\area\len - *this\bar\thumb\len
          EndIf
          
          If *this\bar\button[*this\bar\fixed]\fixed < 0
            *this\bar\button[*this\bar\fixed]\fixed = 0
          EndIf
          
          If *this\bar\fixed = #__b_1
            *this\bar\page\pos = 0
          Else
            *this\bar\page\pos = *this\bar\page\end
          EndIf
          
          *this\bar\thumb\pos = _thumb_pos_(*this\bar, *this\bar\page\pos)
          
          If *this\bar\thumb\pos < *this\bar\area\pos + *this\bar\button[#__b_1]\fixed  
            *this\bar\thumb\pos = *this\bar\area\pos + *this\bar\button[#__b_1]\fixed 
          EndIf
          
          If *this\bar\thumb\pos > *this\bar\area\end - *this\bar\button[#__b_2]\fixed 
            *this\bar\thumb\pos = *this\bar\area\end - *this\bar\button[#__b_2]\fixed 
          EndIf
        Else
          *this\bar\thumb\pos = _thumb_pos_(*this\bar, *this\bar\page\pos)
        
          If *this\bar\thumb\pos < *this\bar\area\pos 
            *this\bar\thumb\pos = *this\bar\area\pos
          EndIf
          
          If *this\bar\thumb\pos > *this\bar\area\end
            *this\bar\thumb\pos = *this\bar\area\end
          EndIf
        EndIf
        
        ; 
        If *this\bar\vertical
          *this\bar\button[#__b_1]\width    = *this\width
          *this\bar\button[#__b_1]\height   = *this\bar\thumb\pos - *this\y 
          
          *this\bar\button[#__b_1]\x        = *this\x + (Bool(*this\splitter\g_first)**this\x)
          *this\bar\button[#__b_2]\x        = *this\x + (Bool(*this\splitter\g_second)**this\x)
          If Not ((#PB_Compiler_OS = #PB_OS_MacOS) And *this\splitter\g_first And Not *this\parent)
            *this\bar\button[#__b_1]\y      = *this\y + (Bool(*this\splitter\g_first)**this\y)
            *this\bar\button[#__b_2]\y      = (*this\bar\thumb\pos + *this\bar\thumb\len) + (Bool(*this\splitter\g_second)**this\y)
          Else
            *this\bar\button[#__b_1]\y      = *this\height - *this\bar\button[#__b_1]\height
          EndIf
          
          *this\bar\button[#__b_2]\height   = *this\height - (*this\bar\button[#__b_1]\height + *this\bar\thumb\len)
          *this\bar\button[#__b_2]\width    = *this\width
          
          If *this\bar\thumb\len
            *this\bar\button[#__b_3]\x      = *this\x
            *this\bar\button[#__b_3]\y      = *this\bar\thumb\pos
            *this\bar\button[#__b_3]\height = *this\bar\thumb\len                              
            *this\bar\button[#__b_3]\width  = *this\width 
            
            *this\bar\button[#__b_3]\y[1]   = (*this\bar\button[#__b_3]\y + *this\bar\button[#__b_3]\height/2)
            *this\bar\button[#__b_3]\X[1]   = *this\x + (*this\width-*this\bar\button[#__b_3]\round)/2 + Bool(*this\width%2)
          EndIf
        Else
          *this\bar\button[#__b_1]\width    = *this\bar\thumb\pos - *this\x 
          *this\bar\button[#__b_1]\height   = *this\height
          
          *this\bar\button[#__b_1]\y        = *this\y + (Bool(*this\splitter\g_first)**this\y)
          *this\bar\button[#__b_2]\y        = *this\y + (Bool(*this\splitter\g_second)**this\y)
          *this\bar\button[#__b_1]\x        = *this\x + (Bool(*this\splitter\g_first)**this\x)
          *this\bar\button[#__b_2]\x        = (*this\bar\thumb\pos + *this\bar\thumb\len) + (Bool(*this\splitter\g_second)**this\x)
          
          *this\bar\button[#__b_2]\width    = *this\width - (*this\bar\button[#__b_1]\width + *this\bar\thumb\len)
          *this\bar\button[#__b_2]\height   = *this\height
          
          If *this\bar\thumb\len
            *this\bar\button[#__b_3]\y      = *this\y
            *this\bar\button[#__b_3]\x      = *this\bar\thumb\pos
            *this\bar\button[#__b_3]\width  = *this\bar\thumb\len                                  
            *this\bar\button[#__b_3]\height = *this\height
            
            *this\bar\button[#__b_3]\x[1]   = (*this\bar\button[#__b_3]\x + *this\bar\button[#__b_3]\width/2) ; - *this\x
            *this\bar\button[#__b_3]\y[1]   = *this\y + (*this\height-*this\bar\button[#__b_3]\round)/2 + Bool(*this\height%2)
          EndIf
        EndIf
        
        ; 
        If *this\bar\fixed And *this\bar\page\change
          If *this\bar\vertical
            *this\bar\button[*this\bar\fixed]\fixed = *this\bar\button[*this\bar\fixed]\height - *this\bar\button[*this\bar\fixed]\len
          Else
            *this\bar\button[*this\bar\fixed]\fixed = *this\bar\button[*this\bar\fixed]\width - *this\bar\button[*this\bar\fixed]\len
          EndIf
        EndIf
        
        ; Splitter childrens auto resize       
        If *this\splitter\first
          If *this\splitter\g_first
            ResizeGadget(*this\splitter\first, *this\bar\button[#__b_1]\x-*this\x, *this\bar\button[#__b_1]\y-*this\y, *this\bar\button[#__b_1]\width, *this\bar\button[#__b_1]\height)
          Else
            Resize(*this\splitter\first, *this\bar\button[#__b_1]\x-*this\x, *this\bar\button[#__b_1]\y-*this\y, *this\bar\button[#__b_1]\width, *this\bar\button[#__b_1]\height)
          EndIf
        EndIf
        
        If *this\splitter\second
          If *this\splitter\g_second
            ResizeGadget(*this\splitter\second, *this\bar\button[#__b_2]\x-*this\x, *this\bar\button[#__b_2]\y-*this\y, *this\bar\button[#__b_2]\width, *this\bar\button[#__b_2]\height)
          Else
            Resize(*this\splitter\second, *this\bar\button[#__b_2]\x-*this\x, *this\bar\button[#__b_2]\y-*this\y, *this\bar\button[#__b_2]\width, *this\bar\button[#__b_2]\height)
          EndIf   
        EndIf   
        
      EndIf
      
      ProcedureReturn Bool(*this\resize & #__resize_change)
    EndProcedure
    
    Procedure.b Change(*bar._s_bar, ScrollPos.f)
      With *bar
        If ScrollPos < \min 
          ; if SetState(height-value or width-value)
          \button[#__b_3]\fixed = ScrollPos
          ScrollPos = \min 
          
        ElseIf \max And ScrollPos > \max-\page\len
          If \max > \page\len 
            ScrollPos = \max-\page\len
          Else
            ScrollPos = \min 
          EndIf
        EndIf
        
        If \page\pos <> ScrollPos
          \page\change = \page\pos - ScrollPos
          
          If \page\pos > ScrollPos
            \direction =- ScrollPos
            
            If ScrollPos = \min Or \mode = #PB_TrackBar_Ticks 
              \button[#__b_3]\arrow\direction = Bool(Not \vertical) + Bool(\vertical = \inverted) * 2
            Else
              \button[#__b_3]\arrow\direction = Bool(\vertical) + Bool(\inverted) * 2
            EndIf
          Else
            \direction = ScrollPos
            
            If ScrollPos = \page\end Or \mode = #PB_TrackBar_Ticks
              \button[#__b_3]\arrow\direction = Bool(Not \vertical) + Bool(\vertical = \inverted) * 2
            Else
              \button[#__b_3]\arrow\direction = Bool(\vertical) + Bool(Not \inverted ) * 2
            EndIf
          EndIf
          
          \page\pos = ScrollPos
          ProcedureReturn #True
        EndIf
      EndWith
    EndProcedure
    
    Procedure.b SetPos(*this._s_widget, ThumbPos.f)
      With *this
        If ThumbPos < \bar\area\pos : ThumbPos = \bar\area\pos : EndIf
        If ThumbPos > \bar\area\end : ThumbPos = \bar\area\end : EndIf
        
        If \bar\thumb\end <> ThumbPos 
          \bar\thumb\end = ThumbPos
          
          If \bar\area\end <> ThumbPos
            ProcedureReturn SetState(*this, _invert_(\bar, _page_pos_(\bar, ThumbPos), \bar\inverted))
          Else
            ProcedureReturn SetState(*this, _invert_(\bar, \bar\page\end, \bar\inverted))
          EndIf
        EndIf
      EndWith
    EndProcedure
    
    Procedure.f GetState(*this._s_widget)
      ProcedureReturn *this\bar\page\pos
    EndProcedure
    
    Procedure.b SetState(*this._s_widget, ScrollPos.f)
      
      If Change(*this\bar, ScrollPos)
        Update(*this)
        
        *this\bar\change = #True
        *this\bar\page\change = #False
        ProcedureReturn #True
      EndIf
      
    EndProcedure
    
    Procedure.l SetAttribute(*this._s_widget, Attribute.l, Value.l)
      Protected Result.l
      
      With *this
        If \splitter
          Select Attribute
            Case #PB_Splitter_FirstMinimumSize
              \bar\button[#__b_1]\len = Value
              Result = Bool(\bar\max)
              
            Case #PB_Splitter_SecondMinimumSize
              \bar\button[#__b_2]\len = Value
              Result = Bool(\bar\max)
              
              
          EndSelect
        EndIf
        
        If Result
          \hide = Update(*this)
        EndIf
      EndWith
      
      ProcedureReturn Result
    EndProcedure
    
    ;-
    Procedure SetParent(*this._s_widget, *Parent._s_widget, parent_item.l=0)
      CompilerIf Defined(widget, #PB_Module)
        ProcedureReturn widget::SetParent(*this, *Parent, parent_item)
      CompilerElse
        *event\widget = *this
        *this\parent = *Parent
        
        If *this\parent
          *this\root = *this\parent\root
          *this\window = *this\parent\window
        EndIf
      CompilerEndIf
    EndProcedure
    
    Procedure.b Resize(*this._s_widget, X.l,Y.l,Width.l,Height.l)
      CompilerIf Defined(widget, #PB_Module)
        ProcedureReturn widget::Resize(*this, X,Y,Width,Height)
      CompilerElse
        Protected.l Change_x, Change_y, Change_width, Change_height
        
        With *this
          ;       If X <> #PB_Ignore : \x = X : EndIf 
          ;       If Y <> #PB_Ignore : \y = Y : EndIf 
          ;       If Width <> #PB_Ignore : \width = Width : EndIf 
          ;       If Height <> #PB_Ignore : \height = height : EndIf
          
          ; Set widget coordinate
          If X<>#PB_Ignore 
            If \parent 
              \x[#__c_3] = X 
              X+\parent\x[#__c_2] 
            EndIf 
            
            If \x <> X 
              Change_x = x-\x 
              \x = X 
              \x[#__c_2] = \x+\bs 
              \x[#__c_1] = \x[#__c_2]-\fs 
              \resize | #__resize_x | #__resize_change
              *this\text\change = 1
            EndIf 
          EndIf  
          
          If Y<>#PB_Ignore 
            If \parent 
              \y[#__c_3] = y 
              y+\parent\y[#__c_2] 
            EndIf 
            
            If \y <> y 
              Change_y = y-\y 
              \y = y 
              \y[#__c_1] = \y+\bs-\fs 
              \y[#__c_2] = \y+\bs+\__height
              \resize | #__resize_y | #__resize_change
              *this\text\change = 1
            EndIf 
          EndIf  
          
          If width <> #PB_Ignore 
            If width < 0 : width = 0 : EndIf
            
            If \width <> width 
              Change_width = width-\width 
              \width = width 
              \width[#__c_2] = \width-\bs*2 
              \width[#__c_1] = \width[#__c_2]+\fs*2 
              If \width[#__c_1] < 0 : \width[#__c_1] = 0 : EndIf
              If \width[#__c_2] < 0 : \width[#__c_2] = 0 : EndIf
              \resize | #__resize_width | #__resize_change
              *this\text\change = 1
            EndIf 
          EndIf  
          
          If Height <> #PB_Ignore 
            If Height < 0 : Height = 0 : EndIf
            
            If \height <> Height 
              Change_height = height-\height 
              \height = Height 
              \height[#__c_1] = \height-\bs*2+\fs*2 
              \height[#__c_2] = \height-\bs*2-\__height
              If \height[#__c_1] < 0 : \height[#__c_1] = 0 : EndIf
              If \height[#__c_2] < 0 : \height[#__c_2] = 0 : EndIf
              \resize | #__resize_height | #__resize_change
              *this\text\change = 1
            EndIf 
          EndIf 
          
          ProcedureReturn Update(*this)
        EndWith
      CompilerEndIf
    EndProcedure
    
    
    ;-
    Procedure ReDraw(*This._s_widget)
      With *This
        If StartDrawing(CanvasOutput(\root\canvas\gadget))
          FillMemory( DrawingBuffer(), DrawingBufferPitch() * OutputHeight(), $F0)
          
          Splitter::Draw(*This)
          StopDrawing()
        EndIf
      EndWith  
    EndProcedure
    
    Procedure.b Draw(*this._s_widget)
      Macro _text_change_(_this_, _x_, _y_, _width_, _height_)
        ;If _this_\text\vertical
        If _this_\text\rotate = 90
          If _this_\y<>_y_
            _this_\text\x = _x_ + _this_\y
          Else
            _this_\text\x = _x_ + (_width_-_this_\text\height)/2
          EndIf
          
          If _this_\text\align\right
            _this_\text\y = _y_ +_this_\text\align\height+ _this_\text\_padding+_this_\text\width
          ElseIf _this_\text\align\horizontal
            _this_\text\y = _y_ + (_height_+_this_\text\align\height+_this_\text\width)/2
          Else
            _this_\text\y = _y_ + _height_-_this_\text\_padding
          EndIf
          
        ElseIf _this_\text\rotate = 270
          _this_\text\x = _x_ + (_width_-_this_\y)
          
          If _this_\text\align\right
            _this_\text\y = _y_ + (_height_-_this_\text\width-_this_\text\_padding) 
          ElseIf _this_\text\align\horizontal
            _this_\text\y = _y_ + (_height_-_this_\text\width)/2 
          Else
            _this_\text\y = _y_ + _this_\text\_padding 
          EndIf
          
        EndIf
        
        ;Else
        If _this_\text\rotate = 0
          If _this_\x<>_x_
            _this_\text\y = _y_ + _this_\y
          Else
            _this_\text\y = _y_ + (_height_-_this_\text\height)/2
          EndIf
          
          If _this_\text\align\right
            _this_\text\x = _x_ + (_width_-_this_\text\align\width-_this_\text\width-_this_\text\_padding) 
          ElseIf _this_\text\align\horizontal
            _this_\text\x = _x_ + (_width_-_this_\text\align\width-_this_\text\width)/2
          Else
            _this_\text\x = _x_ + _this_\text\_padding
          EndIf
          
        ElseIf _this_\text\rotate = 180
          _this_\text\y = _y_ + (_height_-_this_\y)
          
          If _this_\text\align\right
            _this_\text\x = _x_ + _this_\text\_padding+_this_\text\width
          ElseIf _this_\text\align\horizontal
            _this_\text\x = _x_ + (_width_+_this_\text\width)/2 
          Else
            _this_\text\x = _x_ + _width_-_this_\text\_padding 
          EndIf
          
        EndIf
        ;EndIf
      EndMacro
      
      Protected Pos, Size, round.d = 2
      
      With *this
        If *this
          Select \type
            Case #PB_GadgetType_Splitter    
              ; SetOrigin(*this\x, *this\y)
              
              If *this > 0
                DrawingMode(#PB_2DDrawing_Outlined);|#PB_2DDrawing_AlphaBlend)
                
                If \bar\mode
                  
                  If Not \splitter\g_first And (Not \splitter\first Or (\splitter\first And Not \splitter\first\splitter))
                    Box(\bar\button[#__b_1]\x, \bar\button[#__b_1]\y,\bar\button[#__b_1]\width,\bar\button[#__b_1]\height,\bar\button\color\frame[\bar\button[#__b_1]\Color\state])
                  EndIf
                  If Not \splitter\g_second And (Not \splitter\second Or (\splitter\second And Not \splitter\second\splitter))
                    Box(\bar\button[#__b_2]\x, \bar\button[#__b_2]\y,\bar\button[#__b_2]\width,\bar\button[#__b_2]\height,\bar\button\color\frame[\bar\button[#__b_2]\Color\state])
                  EndIf
                  
                EndIf
                
                If \bar\mode = #PB_Splitter_Separator
                  ;Size = \bar\thumb\len/2
                  
                  If \bar\vertical ; horisontal
                    If \bar\button[#__b_3]\width > 40
                      Circle(\bar\button[#__b_3]\X[1]-(\bar\button[#__b_3]\round*2+2)*2-2, \bar\button[#__b_3]\y[1],\bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                      Circle(\bar\button[#__b_3]\X[1]+(\bar\button[#__b_3]\round*2+2)*2+2, \bar\button[#__b_3]\y[1],\bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                    EndIf
                    If \bar\button[#__b_3]\width > 30
                      Circle(\bar\button[#__b_3]\X[1]-(\bar\button[#__b_3]\round*2+2), \bar\button[#__b_3]\y[1],\bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                      Circle(\bar\button[#__b_3]\X[1]+(\bar\button[#__b_3]\round*2+2), \bar\button[#__b_3]\y[1],\bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                    EndIf
                    Circle(\bar\button[#__b_3]\X[1], \bar\button[#__b_3]\y[1],\bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                  Else
                    
                    If \bar\button[#__b_3]\Height > 40
                      Circle(\bar\button[#__b_3]\x[1],\bar\button[#__b_3]\Y[1]-(\bar\button[#__b_3]\round*2+2)*2-2, \bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                      Circle(\bar\button[#__b_3]\x[1],\bar\button[#__b_3]\Y[1]+(\bar\button[#__b_3]\round*2+2)*2+2, \bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                    EndIf
                    If \bar\button[#__b_3]\Height > 30
                      Circle(\bar\button[#__b_3]\x[1],\bar\button[#__b_3]\Y[1]-(\bar\button[#__b_3]\round*2+2), \bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                      Circle(\bar\button[#__b_3]\x[1],\bar\button[#__b_3]\Y[1]+(\bar\button[#__b_3]\round*2+2), \bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                    EndIf
                    Circle(\bar\button[#__b_3]\x[1],\bar\button[#__b_3]\Y[1], \bar\button[#__b_3]\round,\bar\button[#__b_3]\Color\Frame[#__s_2])
                  EndIf
                EndIf
              EndIf
              
              ; SetOrigin(0, 0)
              
            Case #PB_GadgetType_Button 
              If \text 
                If \text\fontID 
                  DrawingFont(\text\fontID)
                EndIf
                
                If \text\change
                  *this\text\string = Str(*this\width)
                  *this\text\height = TextHeight("A")
                  *this\text\width = TextWidth(*this\text\string)
                  
                  _text_change_(*this, *this\x, *this\y, *this\width, *this\height)
                EndIf
              EndIf
              
              DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
              Box(*this\x,*this\y,*this\width,*this\height,*this\color\back[*this\interact * *this\color\state])
              
              DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
              Box(*this\x,*this\y,*this\width,*this\height,*this\color\frame[*this\interact * *this\color\state])
              
              ; Draw string
              If *this\text And *this\text\string
                DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                DrawRotatedText(*this\text\x, *this\text\y, *this\text\string, *this\text\rotate, *this\bar\button[#__b_3]\color\frame[*this\bar\button[#__b_3]\color\state])
              EndIf
          EndSelect
          
          DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
          ; Scroll area coordinate
          ;Box(\x, \y, \width, \height, $FF0000FF)
          
          If *this\text\change <> 0
            *this\text\change = 0
          EndIf
        EndIf
      EndWith
    EndProcedure
    
    ;-
    Procedure.b Events(*this._s_widget, EventType.l, mouse_x.l, mouse_y.l, Wheel_X.b=0, Wheel_Y.b=0)
      Protected Result, from =- 1 
      Static cursor_change, LastX, LastY, Last, *leave._s_widget, Down
      
      Macro _callback_(_this_, _type_)
        Select _type_
          Case #__Event_MouseLeave ; : Debug ""+#PB_Compiler_Line +" Мышь находится снаружи итема " + _this_ +" "+ _this_\from
            _this_\bar\button[_this_\from]\color\state = #__s_0 
            
            If _this_\cursor And cursor_change
              SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, #PB_Cursor_Default) ; cursor_change - 1)
              cursor_change = 0
            EndIf
            
          Case #__Event_MouseEnter ; : Debug ""+#PB_Compiler_Line +" Мышь находится внутри итема " + _this_ +" "+ _this_\from
            _this_\bar\button[_this_\from]\color\state = #__s_1 
            
            ; Set splitter cursor
            If _this_\from = #__b_3 And _this_\type = #PB_GadgetType_Splitter And _this_\cursor
              cursor_change = 1;GetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor) + 1
              SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, _this_\cursor)
            EndIf
            
          Case #__Event_LeftButtonUp ; : Debug ""+#PB_Compiler_Line +" отпустили " + _this_ +" "+ _this_\from
            _this_\bar\button[_this_\from]\color\state = #__s_1 
            
        EndSelect
      EndMacro
      
      With *this
        ; from the very beginning we'll process 
        ; the splitter children’s widget
        If \splitter And \from <> #__b_3
          If \splitter\first And Not \splitter\g_first
            If events(\splitter\first, EventType, mouse_x, mouse_y)
              ProcedureReturn 1
            EndIf
          EndIf
          If \splitter\second And Not \splitter\g_second
            If events(\splitter\second, EventType, mouse_x, mouse_y)
              ProcedureReturn 1
            EndIf
          EndIf
        EndIf
        
        ; get at point buttons
        If Not \hide And (_from_point_(mouse_x, mouse_y, *this) Or Down)
          If \bar\button 
            If \bar\button[#__b_3]\len And _from_point_(mouse_x, mouse_y, \bar\button[#__b_3])
              from = #__b_3
            ElseIf \bar\button[#__b_2]\len And _from_point_(mouse_x, mouse_y, \bar\button[#__b_2])
              from = #__b_2
            ElseIf \bar\button[#__b_1]\len And _from_point_(mouse_x, mouse_y, \bar\button[#__b_1])
              from = #__b_1
            ElseIf _from_point_(mouse_x, mouse_y, \bar\button[0])
              from = 0
            EndIf
            
            If \type = #PB_GadgetType_TrackBar ;Or \type = #PB_GadgetType_ProgressBar
              Select from
                Case #__b_1, #__b_2
                  from = 0
                  
              EndSelect
              ; ElseIf \type = #PB_GadgetType_ProgressBar
              ;  
            EndIf
          Else
            from =- 1; 0
          EndIf 
          
          If \from <> from And Not Down
            If *leave > 0 And *leave\from >= 0 And *leave\bar\button[*leave\from]\interact And 
               Not _from_point_(mouse_x, mouse_y, *leave\bar\button[*leave\from])
              
              _callback_(*leave, #__Event_MouseLeave)
              *leave\from =- 1; 0
              
              Result = #True
            EndIf
            
            ; If from > 0
            \from = from
            *leave = *this
            ; EndIf
            
            If \from >= 0 And \bar\button[\from]\interact
              _callback_(*this, #__Event_MouseEnter)
              
              Result = #True
            EndIf
          EndIf
          
        Else
          If \from >= 0 And \bar\button[\from]\interact
            If EventType = #__Event_LeftButtonUp
              ; Debug ""+#PB_Compiler_Line +" Мышь up"
              _callback_(*this, #__Event_LeftButtonUp)
            EndIf
            
            ; Debug ""+#PB_Compiler_Line +" Мышь покинул итем"
            _callback_(*this, #__Event_MouseLeave)
            
            Result = #True
          EndIf 
          
          \from =- 1
          
          If *leave = *this
            *leave = 0
          EndIf
        EndIf
        
        ; get
        Select EventType
          Case #__Event_MouseWheel
            If *This = *event\active
              If \bar\vertical
                Result = SetState(*This, (\bar\page\pos + Wheel_Y))
              Else
                Result = SetState(*This, (\bar\page\pos + Wheel_X))
              EndIf
            EndIf
            
          Case #__Event_MouseLeave 
            If Not Down : \from =- 1 : from =- 1 : LastX = 0 : LastY = 0 : EndIf
            
          Case #__Event_LeftButtonUp : Down = 0 : LastX = 0 : LastY = 0
            
            If \from >= 0 And \bar\button[\from]\interact
              _callback_(*this, #__Event_LeftButtonUp)
              
              If from =- 1
                _callback_(*this, #__Event_MouseLeave)
                \from =- 1
              EndIf
              
              Result = #True
            EndIf
            
          Case #__Event_LeftButtonDown
            If from = 0 And \bar\button[#__b_3]\interact 
              If \bar\vertical
                Result = SetPos(*this, (mouse_y-\bar\thumb\len/2))
              Else
                Result = SetPos(*this, (mouse_x-\bar\thumb\len/2))
              EndIf
              
              from = 3
            EndIf
            
            If from >= 0 And *this = *leave
              Down = *this
              \from = from 
              ; Debug "  "+*this +"  "+ *this\parent +" - get parent bar()"
              
              If \bar\button[from]\interact
                \bar\button[\from]\color\state = #__s_2
                
                Select \from
                  Case #__b_1 
                    If \bar\inverted
                      Result = SetState(*this, _invert_(*this\bar, (\bar\page\pos + \bar\scroll_step), Bool(\type <> #PB_GadgetType_Spin And \bar\inverted)))
                    Else
                      Result = SetState(*this, _invert_(*this\bar, (\bar\page\pos - \bar\scroll_step), \bar\inverted))
                    EndIf
                    
                  Case #__b_2 
                    If \bar\inverted
                      Result = SetState(*this, _invert_(*this\bar, (\bar\page\pos - \bar\scroll_step), Bool(\type <> #PB_GadgetType_Spin And \bar\inverted)))
                    Else
                      Result = SetState(*this, _invert_(*this\bar, (\bar\page\pos + \bar\scroll_step), \bar\inverted))
                    EndIf
                    
                  Case #__b_3 
                    LastX = mouse_x - \bar\thumb\pos 
                    LastY = mouse_y - \bar\thumb\pos
                    Result = #True
                    
                EndSelect
                
              Else
                Result = #True
              EndIf
            EndIf
            
          Case #__Event_MouseMove
            If Down And *leave = *this And Bool(LastX|LastY) 
              If \bar\vertical
                Result = SetPos(*this, (mouse_y-LastY))
              Else
                Result = SetPos(*this, (mouse_x-LastX))
              EndIf
            EndIf
            
        EndSelect
      EndWith
      
      ProcedureReturn Result
    EndProcedure
    
    Procedure CallBack()
      Protected WheelDelta.i, Mouse_X.l, Mouse_Y.l, *This._s_widget = GetGadgetData(EventGadget())
      
      With *This
        \root\Window = EventWindow()
        Mouse_X = GetGadgetAttribute(\root\canvas\gadget, #PB_Canvas_MouseX)
        Mouse_Y = GetGadgetAttribute(\root\canvas\gadget, #PB_Canvas_MouseY)
        
        Select EventType()
          Case #PB_EventType_Resize : ResizeGadget(\root\canvas\gadget, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore) ; Bug (562)
            If Splitter::Resize(*This, 0, 0, GadgetWidth(\root\canvas\gadget), GadgetHeight(\root\canvas\gadget)) 
              ReDraw(*This)
            EndIf
        EndSelect
        
        If Splitter::Events(*This, EventType(), Mouse_X, Mouse_Y)
          ReDraw(*This)
        EndIf
      EndWith
      
    EndProcedure
    
    ;-
    Procedure   Button(X.l,Y.l,Width.l,Height.l, Text.s, Flag.i=0, round.l=0)
      Protected *this._s_widget = AllocateStructure(_s_widget)
      *this\type = #PB_GadgetType_Button
      *event\widget = *this
      *this\x =- 1
      *this\y =- 1
      
      *this\color\frame = $FFa0a0a0
      *this\color\back = $FFFFFFFF
      
      ;_set_last_parameters_(*this, *this\type, Flag, Root()\opened) 
      *this\text\string = Text
      *this\text\change = 1
      
      *this\text\align\vertical = 1
      *this\text\align\horizontal = 1
      
      Resize(*this, X,Y,Width,Height)
      ProcedureReturn *this
    EndProcedure
    
    Procedure   Widget(X.l,Y.l,Width.l,Height.l, First.i, Second.i, Flag.i=0)
      Protected *this._s_widget = AllocateStructure(_s_widget)
      
      With *this
        \adress = *this
        \type = #PB_GadgetType_Splitter
        \index[#__s_1] =- 1
        \index[#__s_2] = 0
        
        CompilerIf Defined(widget, #PB_Module)
          widget::_set_last_parameters_(*this, \type, Flag, *event\root\opened)
        CompilerElse
          SetParent(*this, *event\root\opened)
        CompilerEndIf
        
        
        \x =- 1
        \y =- 1
        
        \round = 0
        \bar\scroll_step = 1.0
        
        ; ???? ???? ???????
        \color\alpha = 255
        \color\alpha[1] = 0
        \color\state = 0
        \color\back = $FFF9F9F9
        \color\frame = \color\back
        \color\line = $FFFFFFFF
        \color\front = $FFFFFFFF
        
        \bar\button[#__b_1]\color = _get_colors_()
        \bar\button[#__b_2]\color = _get_colors_()
        \bar\button[#__b_3]\color = _get_colors_()
        
        \container = #PB_GadgetType_Splitter
        \bar\vertical = Bool(Not Flag & #PB_Splitter_Vertical = #PB_Splitter_Vertical)
        \vertical = \bar\vertical
        
        \bar\button[#__b_3]\len = 7
        \bar\thumb\len = \bar\button[#__b_3]\len
        
        \bar\button[#__b_1]\interact = #False
        \bar\button[#__b_2]\interact = #False
        \bar\button[#__b_3]\interact = #True
        \bar\button[#__b_3]\round = 2
        
        \bar\mode = #PB_Splitter_Separator
        
        If Flag & #PB_Splitter_FirstFixed 
          \bar\fixed = #__b_1 
        ElseIf Flag & #PB_Splitter_SecondFixed 
          \bar\fixed = #__b_2 
        EndIf
        
        \splitter = AllocateStructure(_s_splitter)
        \splitter\first = First
        \splitter\second = Second
        
        \splitter\g_first = Bool(IsGadget(First))
        \splitter\g_second = Bool(IsGadget(Second))
        
        If \splitter\first And Not \splitter\g_first
          SetParent(\splitter\first, *this)
        EndIf
        
        If \splitter\second And Not \splitter\g_second
          SetParent(\splitter\second, *this)
        EndIf
        
        If \bar\vertical
          \cursor = #PB_Cursor_UpDown
        Else
          \cursor = #PB_Cursor_LeftRight
        EndIf
        
        Resize(*this, X,Y,Width,Height)
      EndWith
      
      ProcedureReturn *this
    EndProcedure
    
    Procedure   Gadget(Gadget.i, X.l, Y.l, Width.l, Height.l, First.i, Second.i, Flag.i=0)
      Protected g = CanvasGadget(Gadget, X, Y, Width, Height, #PB_Canvas_Keyboard|#PB_Canvas_Container) : CloseGadgetList() : If Gadget=-1 : Gadget=g : EndIf
      Protected *This._s_widget = Splitter::Widget(0, 0, Width, Height, First, Second, Flag)
      
      If *this
        With *this
          *this\root = AllocateStructure(_s_root)
          *this\root\window = GetActiveWindow()
          *this\root\canvas\gadget = Gadget
          *event\active = *this\root
          *event\active\root = *this\root
          
          ;
          If *this\repaint
            PostEvent(#PB_Event_Gadget, *this\root\window, *this\root\canvas\gadget, constants::#__Event_Repaint)
          EndIf
          
          SetGadgetData(Gadget, *this)
          BindGadgetEvent(Gadget, @callback())
          
          CompilerIf #PB_Compiler_OS = #PB_OS_Linux
            gtk_widget_reparent_( GadgetID(First), GadgetID(Gadget) )
            gtk_widget_reparent_( GadgetID(Second), GadgetID(Gadget) )
            
          CompilerElseIf #PB_Compiler_OS = #PB_OS_Windows
            SetParent_( GadgetID(First), GadgetID(Gadget) )
            SetParent_( GadgetID(Second), GadgetID(Gadget) )
            
            ; z-order
            ;CompilerIf #PB_Compiler_OS = #PB_OS_Windows
            SetWindowLongPtr_( GadgetID(Gadget), #GWL_STYLE, GetWindowLongPtr_( GadgetID(Gadget), #GWL_STYLE ) | #WS_CLIPSIBLINGS )
            SetWindowPos_( GadgetID(Gadget), #GW_HWNDFIRST, 0,0,0,0, #SWP_NOMOVE|#SWP_NOSIZE )
            ;CompilerEndIf
            
          CompilerElseIf #PB_Compiler_OS = #PB_OS_MacOS
            If *this\splitter\g_first
              ;CocoaMessage(0,GadgetID(Gadget), "setParent", GadgetID(Gadget_1)); NSWindowAbove = 1
              CocoaMessage (0, GadgetID (Gadget), "addSubview:", GadgetID (First)) 
            EndIf
            If *this\splitter\g_second
              CocoaMessage (0, GadgetID (Gadget), "addSubview:", GadgetID (Second)) 
            EndIf  
            ;       Protected Point.NSPoint
            ;       Point\x = 100
            ;       Point\y = 100
            ;       CocoaMessage (0, WindowID (0), "center")
            ;       CocoaMessage (0, WindowID (0), "setFrameTopLeftPoint:@", @Point) ; Установить верхнюю левую координату окна
            ;       CocoaMessage (0, WindowID (0), "setFrameOrigin:@", @Point) ; Установить нижнюю левую координату окна
          CompilerEndIf
          
          ReDraw(*This)
        EndWith
      EndIf
      
      ProcedureReturn Gadget
    EndProcedure
    
    ;-
    ;- PROCEDURE
    ;- PUBLIC
    Procedure _SetAttribute(Gadget.i, Attribute.l, Value.l)
      Protected *This._s_widget = GetGadgetData(Gadget)
      
      With *This
        If Splitter::SetAttribute(*This, Attribute, Value)
          ReDraw(*This)
        EndIf
      EndWith
    EndProcedure
    
    Procedure _GetAttribute(Gadget.i, Attribute.l)
      Protected Result, *This._s_widget = GetGadgetData(Gadget)
      
      With *This
        Select Attribute
          Case #PB_Splitter_FirstGadget         : Result = \splitter\first
          Case #PB_Splitter_SecondGadget        : Result = \splitter\second
          Case #PB_Splitter_FirstMinimumSize    : Result = \bar\button[#__b_1]\len
          Case #PB_Splitter_SecondMinimumSize   : Result = \bar\button[#__b_2]\len
        EndSelect
      EndWith
      
      ProcedureReturn Result
    EndProcedure
    
    Procedure _SetState(Gadget.i, State.l)
      Protected *This._s_widget = GetGadgetData(Gadget)
      
      With *This
        If Splitter::SetState(*This, State) 
          ReDraw(*This)
          PostEvent(#PB_Event_Gadget, \root\Window, \root\canvas\gadget, #PB_EventType_Change)
        EndIf
      EndWith
    EndProcedure
    
    Procedure _GetState(Gadget.i)
      Protected *This._s_widget = GetGadgetData(Gadget)
      ProcedureReturn *This\bar\Page\Pos
    EndProcedure
    
  EndModule
  ;- <<< 
CompilerEndIf


CompilerIf #PB_Compiler_IsMainFile
  UseModule Splitter
  UseModule Constants
  UseModule Structures
  
  Global g_Canvas, NewList *List._s_widget()
  Global Button_0, Button_1, Button_2, Button_3, Button_4, Button_5
  Global Splitter_0, Splitter_1, Splitter_2, Splitter_3, Splitter_4
  
  Procedure _ReDraw(Canvas)
    If StartDrawing(CanvasOutput(Canvas))
      FillMemory( DrawingBuffer(), DrawingBufferPitch() * OutputHeight(), $F6)
      Protected *event._s_event = GetGadgetData(Canvas)
      
      ; PushListPosition(*List())
      ForEach *List()
        ;If *List()\root And *List()\root\canvas\gadget = *event\root\canvas\gadget
        If Not *List()\hide
          Draw(*List())
        EndIf
        ; EndIf
      Next
      ; PopListPosition(*List())
      
      StopDrawing()
    EndIf
  EndProcedure
  
  Procedure Events_CanvasWindow()
    Protected Canvas.i = EventGadget()
    Protected EventType.i = EventType()
    Protected Repaint
    Protected Width = GadgetWidth(Canvas)
    Protected Height = GadgetHeight(Canvas)
    Protected MouseX = GetGadgetAttribute(Canvas, #PB_Canvas_MouseX)
    Protected MouseY = GetGadgetAttribute(Canvas, #PB_Canvas_MouseY)
    ;      MouseX = DesktopMouseX()-GadgetX(Canvas, #PB_Gadget_ScreenCoordinate)
    ;      MouseY = DesktopMouseY()-GadgetY(Canvas, #PB_Gadget_ScreenCoordinate)
    Protected WheelDelta ; = GetGadgetAttribute(EventGadget(), #PB_Canvas_WheelDelta)
    Protected *event = GetGadgetData(Canvas)
    ;     Protected *this._s_widget = GetGadgetData(Canvas)
    
    Select EventType
      Case #__Event_Resize ; : ResizeGadget(Canvas, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
                           ;          ForEach *List()
                           ;            Resize(*List(), #PB_Ignore, #PB_Ignore, Width, Height)  
                           ;          Next
        Repaint = 1
        
      Case #__Event_LeftButtonDown
        SetActiveGadget(Canvas)
        
    EndSelect
    
    ForEach *List()
      Repaint | events(*List(), EventType, MouseX, MouseY, wheel_X, wheel_Y)
      
      If *List()\bar\change
        SetWindowTitle(EventWindow(), Str(*List()\bar\page\pos)+" - Splitter demo")
        
        *List()\bar\change = 0
      EndIf
    Next
    
    If Repaint 
      _ReDraw(Canvas)
    EndIf
  EndProcedure
  
  Procedure Resize_CanvasWindow()
    ResizeGadget(GetWindowData(EventWindow()), #PB_Ignore, #PB_Ignore, WindowWidth(EventWindow()), WindowHeight(EventWindow()))
  EndProcedure
  
  Procedure Open_CanvasWindow(Window, X.l, Y.l, Width.l, Height.l, Title.s, Flag.i, ParentID.i)
    Protected w = OpenWindow(Window, X, Y, Width, Height, Title, Flag, ParentID) : If Window =- 1 : Window = w : EndIf
    Protected g_Canvas = CanvasGadget(#PB_Any, X, Y, Width, Height, #PB_Canvas_Container) ;: CloseGadgetList()
    BindGadgetEvent(g_Canvas, @Events_CanvasWindow())
    PostEvent(#PB_Event_Gadget, Window, g_Canvas, #__Event_Resize)
    
    *event\root = AllocateStructure(_s_root)
    *event\root\window = Window
    *event\root\canvas\gadget = g_Canvas
    *event\active = *event\root
    *event\active\root = *event\root
    
    SetGadgetData(g_Canvas, *event)
    SetWindowData(Window, g_Canvas)
    BindEvent(#PB_Event_SizeWindow, @Resize_CanvasWindow(), Window);, g_Canvas)
    ProcedureReturn g_Canvas
  EndProcedure
  
  Macro OpenWindow(Window, X, Y, Width, Height, Title, Flag=0, ParentID=0)
    Open_CanvasWindow(Window, X, Y, Width, Height, Title, Flag, ParentID)
  EndMacro
  
  If OpenWindow(0, 0, 0, 430+420, 450, "Splitter demo", #PB_Window_SystemMenu | #PB_Window_ScreenCentered | #PB_Window_SizeGadget)
    ;{
    Button_0 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 0") ; as they will be sized automatically
    Button_1 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 1") ; as they will be sized automatically
    
    Button_2 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 2") ; No need to specify size or coordinates
    Button_3 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 3") ; as they will be sized automatically
    Button_4 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 4") ; No need to specify size or coordinates
    Button_5 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 5") ; as they will be sized automatically
    
    Splitter_0 = SplitterGadget(#PB_Any, 0, 0, 0, 0, Button_0, Button_1, #PB_Splitter_Vertical|#PB_Splitter_Separator|#PB_Splitter_FirstFixed)
    Splitter_1 = SplitterGadget(#PB_Any, 0, 0, 0, 0, Button_3, Button_4, #PB_Splitter_Vertical|#PB_Splitter_Separator|#PB_Splitter_SecondFixed)
    ;SetGadgetAttribute(Splitter_0, #PB_Splitter_FirstMinimumSize, 20)
    ; SetGadgetAttribute(Splitter_0, #PB_Splitter_SecondMinimumSize, 20)
    SetGadgetAttribute(Splitter_1, #PB_Splitter_FirstMinimumSize, 20)
    SetGadgetAttribute(Splitter_1, #PB_Splitter_SecondMinimumSize, 20)
    Splitter_2 = SplitterGadget(#PB_Any, 0, 0, 0, 0, Splitter_1, Button_5, #PB_Splitter_Separator)
    Splitter_3 = SplitterGadget(#PB_Any, 0, 0, 0, 0, Button_2, Splitter_2, #PB_Splitter_Separator)
    Splitter_4 = SplitterGadget(#PB_Any, 10, 10, 410, 210, Splitter_0, Splitter_3, #PB_Splitter_Vertical|#PB_Splitter_Separator)
    ;   SetGadgetState(Splitter_1, 20)
    
    SetGadgetState(Splitter_0, GadgetWidth(Splitter_0)/2-5)
    SetGadgetState(Splitter_1, GadgetWidth(Splitter_1)/2-5)
    
    ;TextGadget(#PB_Any, 110, 235, 210, 40, "Above GUI part shows two automatically resizing buttons inside the 220x120 SplitterGadget area.",#PB_Text_Center )
    ;}
    
    ;{
    Button_0 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 0") ; as they will be sized automatically
    Button_1 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 1") ; as they will be sized automatically
    
    Button_2 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 2") ; No need to specify size or coordinates
    Button_3 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 3") ; as they will be sized automatically
    Button_4 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 4") ; No need to specify size or coordinates
    Button_5 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 5") ; as they will be sized automatically
    
    Splitter_0 = Splitter::Gadget(#PB_Any, 0, 0, 0, 0, Button_0, Button_1, #PB_Splitter_Vertical|#PB_Splitter_Separator|#PB_Splitter_FirstFixed)
    Splitter_1 = Splitter::Gadget(#PB_Any, 0, 0, 0, 0, Button_3, Button_4, #PB_Splitter_Vertical|#PB_Splitter_Separator|#PB_Splitter_SecondFixed)
    ;     Splitter::SetAttribute(Splitter_1, #PB_Splitter_FirstMinimumSize, 20)
    ;     Splitter::SetAttribute(Splitter_1, #PB_Splitter_SecondMinimumSize, 20)
    Splitter_2 = Splitter::Gadget(#PB_Any, 0, 0, 0, 0, Splitter_1, Button_5, #PB_Splitter_Separator)
    Splitter_3 = Splitter::Gadget(#PB_Any, 0, 0, 0, 0, Button_2, Splitter_2, #PB_Splitter_Separator)
    Splitter_4 = Splitter::Gadget(#PB_Any, 430, 10, 410, 210, Splitter_0, Splitter_3, #PB_Splitter_Vertical|#PB_Splitter_Separator)
    ;  Splitter::SetState(Splitter_1, 20)
    
    ;TextGadget(#PB_Any, 530, 235, 210, 40, "Above GUI part shows two automatically resizing buttons inside the 220x120 SplitterGadget area.",#PB_Text_Center )
    ;}
    
    ;{
    
    ;OpenGadgetList(g_Canvas)
    Button_0 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 0") ; as they will be sized automatically
    Button_1 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 1") ; as they will be sized automatically
    
    Button_2 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 2") ; No need to specify size or coordinates
    Button_3 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 3") ; as they will be sized automatically
    Button_4 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 4") ; No need to specify size or coordinates
    Button_5 = ButtonGadget(#PB_Any, 0, 0, 0, 0, "Button 5") ; as they will be sized automatically
                                                             ;CloseGadgetList()
    
    Splitter_0 = Splitter::Widget(0, 0, 0, 0, Button_0, Button_1, #PB_Splitter_Vertical|#PB_Splitter_Separator|#PB_Splitter_FirstFixed)
    Splitter_1 = Splitter::Widget(0, 0, 0, 0, Button_3, Button_4, #PB_Splitter_Vertical|#PB_Splitter_Separator|#PB_Splitter_SecondFixed)
    Splitter::SetAttribute(Splitter_0, #PB_Splitter_FirstMinimumSize, 20)
    ; Splitter::SetAttribute(Splitter_0, #PB_Splitter_SecondMinimumSize, 20)
    Splitter::SetAttribute(Splitter_1, #PB_Splitter_FirstMinimumSize, 20)
    Splitter::SetAttribute(Splitter_1, #PB_Splitter_SecondMinimumSize, 20)
    Splitter_2 = Splitter::Widget(0, 0, 0, 0, Splitter_1, Button_5, #PB_Splitter_Separator)
    Splitter_3 = Splitter::Widget(0, 0, 0, 0, Button_2, Splitter_2, #PB_Splitter_Separator)
    Splitter_4 = Splitter::Widget(10, 230, 410, 210, Splitter_0, Splitter_3, #PB_Splitter_Vertical|#PB_Splitter_Separator)
    ; Splitter::SetState(Splitter_1, 20)
    ; Splitter::SetState(Splitter_0, 10)
    ; Splitter::SetState(Splitter_4, 14)
    
    AddElement(*List()) : *List() = Splitter_0
    Splitter::SetState(Splitter_0, Splitter::Width(*List())/2-5)
    AddElement(*List()) : *List() = Splitter_1
    Splitter::SetState(Splitter_1, Splitter::Width(*List())/2-5)
    
    AddElement(*List()) : *List() = Splitter_2
    AddElement(*List()) : *List() = Splitter_3
    AddElement(*List()) : *List() = Splitter_4
    ;}
    
    ;g_Canvas = Gadget_Open(0, 10, 450+200, 410, 210)
    
    Button_0 = Splitter::Button(0, 0, 0, 0, "Button 0") ; as they will be sized automatically
    Button_1 = Splitter::Button(0, 0, 0, 0, "Button 1") ; as they will be sized automatically
    
    Button_2 = Splitter::Button(0, 0, 0, 0, "Button 2") ; No need to specify size or coordinates
    Button_3 = Splitter::Button(0, 0, 0, 0, "Button 3") ; as they will be sized automatically
    Button_4 = Splitter::Button(0, 0, 0, 0, "Button 4") ; No need to specify size or coordinates
    Button_5 = Splitter::Button(0, 0, 0, 0, "Button 5") ; as they will be sized automatically
    
    Splitter_0 = Splitter::Widget(0, 0, 0, 0, Button_0, Button_1, #PB_Splitter_Vertical|#PB_Splitter_Separator|#PB_Splitter_FirstFixed)
    Splitter_1 = Splitter::Widget(0, 0, 0, 0, Button_3, Button_4, #PB_Splitter_Vertical|#PB_Splitter_Separator|#PB_Splitter_SecondFixed)
    Splitter::SetAttribute(Splitter_0, #PB_Splitter_FirstMinimumSize, 20)
    ; Splitter::SetAttribute(Splitter_0, #PB_Splitter_SecondMinimumSize, 20)
    Splitter::SetAttribute(Splitter_1, #PB_Splitter_FirstMinimumSize, 20)
    Splitter::SetAttribute(Splitter_1, #PB_Splitter_SecondMinimumSize, 20)
    Splitter_2 = Splitter::Widget(0, 0, 0, 0, Splitter_1, Button_5, #PB_Splitter_Separator)
    Splitter_3 = Splitter::Widget(0, 0, 0, 0, Button_2, Splitter_2, #PB_Splitter_Separator)
    Splitter_4 = Splitter::Widget(430, 230, 410, 210, Splitter_0, Splitter_3, #PB_Splitter_Vertical|#PB_Splitter_Separator)
    ; Splitter::SetState(Splitter_1, 20)
    ; Splitter::SetState(Splitter_0, 10)
    ; Splitter::SetState(Splitter_4, 14)
    
    AddElement(*List()) : *List() = Button_0
    AddElement(*List()) : *List() = Button_1
    AddElement(*List()) : *List() = Button_2
    AddElement(*List()) : *List() = Button_3
    AddElement(*List()) : *List() = Button_4
    AddElement(*List()) : *List() = Button_5
    
    AddElement(*List()) : *List() = Splitter_0
    Splitter::SetState(Splitter_0, Splitter::Width(*List())/2-5)
    AddElement(*List()) : *List() = Splitter_1
    Splitter::SetState(Splitter_1, Splitter::Width(*List())/2-5)
    
    AddElement(*List()) : *List() = Splitter_2
    AddElement(*List()) : *List() = Splitter_3
    AddElement(*List()) : *List() = Splitter_4
    
    Repeat : Until WaitWindowEvent() = #PB_Event_CloseWindow
  EndIf
  
CompilerEndIf
; IDE Options = PureBasic 5.71 LTS (MacOS X - x64)
; Folding = -------086----8-----------fvb-
; EnableXP