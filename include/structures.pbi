﻿XIncludeFile "constants.pbi"

;-
CompilerIf Not Defined(structures, #PB_Module)
  DeclareModule structures
    Prototype pFunc( )
    
    ;{ 
    ;- - _s_value
    Structure _s_VALUE
      s.s
      i.i
    EndStructure
    
    ;- - _s_point
    Structure _s_POINT
      y.l[5] ; убрать 
      x.l[constants::#__c]
    EndStructure
    
    ;- - _s_coordinate
    Structure _s_coordinate ;Extends _s_point
      y.l
      x.l
      width.l
      height.l
    EndStructure
    
    ;- - _s_padding
    Structure _s_padding
      left.l
      top.l
      right.l
      bottom.l
    EndStructure
    
    ;- - _s_color
    Structure _s_color
      state.b; entered; selected; disabled;
      front.i[4]
      line.i[4]
      fore.i[4]
      back.i[4]
      frame.i[4]
      alpha.a[2]
    EndStructure
    
    ;- - _s_align
    Structure _s_align
      delta._s_coordinate
      _left.l
      _top.l
      _right.l
      _bottom.l
      
      left.b
      top.b
      right.b
      bottom.b
      
      ; proportional.b
      autosize.b
      v.b
      h.b
    EndStructure
    
    ;- - _s_arrow
    Structure _s_arrow
      size.a
      type.b
      direction.b
    EndStructure
    
    ;- - _s_page
    Structure _s_page
      pos.l
      len.l
      *end
      change.f
    EndStructure
    
    ;- - _s_caret
    Structure _s_caret Extends _s_coordinate
      pos.l[3]
      time.l
    EndStructure
    
    ;- - _s_edit
    Structure _s_edit Extends _s_coordinate
      pos.l
      len.l
      
      string.s
      change.b
      
      *color._s_color
    EndStructure
    
    ;- - _s_syntax
    Structure _s_syntax
      List *word._s_edit( )
    EndStructure
    
    ;- - _s_text
    Structure _s_text Extends _s_edit
      ;     ;     Char.c
      fontID.i[2]
      
      StructureUnion
        pass.b
        lower.b
        upper.b
        numeric.b
      EndStructureUnion
      
      editable.b
      multiline.b
      
      invert.b
      
      edit._s_edit[4]
      caret._s_caret
      syntax._s_syntax
      
      ; short._s_text ; сокращенный текст
      
      rotate.f
      align._s_align
      padding._s_point
    EndStructure
    
    ;- - _s_image
    Structure _s_image Extends _s_coordinate
      *id  ; - ImageID( ) 
      *img ; - Image( )
      
      change.b
      size.w  ; icon small/large
      
      ;;rotate.f
      align._s_align
      padding._s_point
;       
;       
;       *pressed._s_image
;       *released._s_image
;       *background._s_image
    EndStructure
    
    ;- - _s_buttons
    Structure _s_buttons Extends _s_coordinate 
      ;;index.l
      
      size.l ; len >> size.l
      _state.l ; normal; entered; selected; disabled
      state.l ; temp
      
      ; [3]fixed = thumb delta pos 
      ; [1..2]fixed = splitter\bar\fixed
      fixed.l 
      
      hide.b
      round.a
      interact.b
      
      arrow._s_arrow
      color._s_color
    EndStructure
    
;     ;- - _s_button
;     Structure _s_button 
;       pushed.l
;       entered.l
;       id._s_buttons[3]
;     EndStructure
    
    ;- - _s_margin
    Structure _s_margin Extends _s_coordinate
      color._s_color
      hide.b
    EndStructure
    
    ;- - _s_tabs
    Structure _s_tabs ;Extends _s_coordinate
      y.l[constants::#__c]
      x.l[constants::#__c]
      height.l[constants::#__c]
      width.l[constants::#__c]
      
      index.l  ; Index of new list element
      hide.b
      draw.b
      round.a
      text._s_text
      image._s_image
      color._s_color
    EndStructure
    
    ;- - _s_rows
    Structure _s_rows Extends _s_tabs
      ; list view
      _state.l
      sublevel.w
      sublevelsize.a
      childrens.b
      
               ;;len.l ; ?????? ?????? ??????? ?????
      
;       verticallines._s_coordinate  ; temp
;       horizontallines._s_coordinate ; temp
      
      box._s_buttons[2]
      *option_group._s_rows
      
      *parent._s_rows
      *last._s_rows
;                *first._s_rows ; temp
;                *after._s_rows ; temp
;                *before._s_rows ; temp
               
      ; edit
      margin._s_edit
      
      *data  ; set/get item data
    EndStructure
    
    ;- - _s_row
    Structure _s_row
      ; list view
      ; drag.b
      sublevel.w
      sublevelsize.a
      
      *_tt._s_tt
      
      *first._s_rows           ; first elemnt in the list 
      *first_visible._s_rows   ; first draw elemnt in the list 
      
      *last._s_rows            ; last elemnt in the list 
      *last_visible._s_rows    ; last draw elemnt in the list 
      *last_add._s_rows        ; last added last element
      
      *selected._s_rows        ; at point pushed item
         *leaved._s_rows         ; pushed last entered item
       *entered._s_rows         ; pushed last entered item
      
      List *draws._s_rows( )
      
      ; edit
      ;caret._s_caret
      ;color._s_color
      margin._s_margin
      
      ;
      count.l
      index.l
      box._s_buttons           ; editor - edit rectangle
      
      List _s._s_rows( )
    EndStructure
    
    ;- - _s_column
    Structure _s_column Extends _s_coordinate
      
    EndStructure
    
    ;- - _s_bar
    Structure _s_bar
      ; splitter - fixed button index 
      ; tab - setstate( ) button index 
      fixed.l  
      mode.i
      
      index.l ; current added index 
      from.l  ; entered button index
      
      *selected._s_buttons
      button._s_buttons[4]
      ;;  *leaved._s_buttons         ; pushed last entered item
       
      max.l
      min.l
      hide.b
      
      change.b ; tab items to redraw
      percent.f
      increment.f
      vertical.b
      inverted.b
      direction.l
      
      page._s_page
      area._s_page
      thumb._s_page  
      
      List *_s._s_tabs( )
    EndStructure
    
    ;     ;- - _s_tab
    ;     Structure _s_tab
    ;       bar._s_bar
    ;       ;List *_s._s_tabs( )
    ;     EndStructure
    
    ;- - _s_dotted
    Structure _s_dotted
      ;draw.b
      dot.l
      line.l
      space.l
    EndStructure
    
    ;- - _s_grid
    Structure _s_grid
      *WIDGET
      *image
      size.l
      type.l
    EndStructure
    
    ; multi group
    Structure _s_group Extends _s_coordinate
      ;*id._s_widget
      *WIDGET._s_WIDGET
    EndStructure
    
    ;- - _s_anchor
    Structure _s_anchor Extends _s_coordinate
      round.a
      cursor.l
      color._s_color[4]
    EndStructure
    
    ;- - _s_transform
    Structure _s_transform
      color._s_color
      
      *main._s_WIDGET
      *WIDGET._s_WIDGET
      List *group._s_group( )
      
      *type
      *grab ; grab image handle
      
      pos.l
      size.l
      index.l
      
      ;;text._s_text
      grid._s_grid
      dotted._s_dotted
      id._s_anchor[constants::#__a_count+1]
    EndStructure
    
    ;- - _s_mode
    Structure _s_mode
;       SystemMenu.b     ; 13107200   - #PB_Window_SystemMenu      ; Enables the system menu on the Window Title bar (Default).
;       MinimizeGadget.b ; 13238272   - #PB_Window_minimizeGadget  ; Adds the minimize Gadget To the Window Title bar. #PB_Window_SystemMenu is automatically added.
;       MaximizeGadget.b ; 13172736   - #PB_Window_maximizeGadget  ; Adds the maximize Gadget To the Window Title bar. #PB_Window_SystemMenu is automatically added.
;       SizeGadget.b     ; 12845056   - #PB_Window_SizeGadget      ; Adds the sizeable feature To a Window.
;       Invisible.b      ; 268435456  - #PB_Window_invisible       ; creates the Window but don't display.
;       TitleBar.b       ; 12582912   - #PB_Window_titleBar        ; creates a Window With a titlebar.
;       Tool.b           ; 4          - #PB_Window_tool            ; creates a Window With a smaller titlebar And no taskbar entry. 
;       Borderless.b     ; 2147483648 - #PB_Window_borderless      ; creates a Window without any borders.
;       ScreenCentered.b ; 1          - #PB_Window_ScreenCentered  ; Centers the Window in the middle of the screen. X,Y parameters are ignored.
;       WindowCentered.b ; 2          - #PB_Window_windowCentered  ; Centers the Window in the middle of the Parent Window ('ParentWindowID' must be specified).
;                        ;                X,Y parameters are ignored.
;       Maximize.b       ; 16777216   - #PB_Window_maximize        ; Opens the Window maximized. (Note  ; on Linux, Not all Windowmanagers support this)
;       Minimize.b       ; 536870912  - #PB_Window_minimize        ; Opens the Window minimized.
;       NoGadgets.b      ; 8          - #PB_Window_noGadgets       ; Prevents the creation of a GadgetList. UseGadgetList( ) can be used To do this later.
;       NoActivate.b     ; 33554432   - #PB_Window_noActivate      ; Don't activate the window after opening.
      
      ;inline.b
      lines.b
      buttons.b
      gridlines.b
      
      check.b  
      
      fullselection.b
      alwaysselection.b
      
      collapse.b
      
      threestate.b
      
      
    EndStructure
    
    ;- - _s_caption
    Structure _s_caption
      y.l[5]
      x.l[5]
      height.l[5]
      width.l[5]
      
      text._s_text
      button._s_buttons[4]
      color._s_color
      
      interact.b
      hide.b
      round.b
      _padding.b
    EndStructure
    
    ;- - _s_line_
    Structure _s_line_
      v._s_coordinate
      h._s_coordinate
    EndStructure
    
    ;- - _s_tt
    Structure _s_tt Extends _s_coordinate
      window.i
      gadget.i
      
      visible.b
      
      text._s_text
      image._s_image
      color._s_color
    EndStructure
    
    ;- - _s_scroll
    Structure _s_scroll Extends _s_coordinate
      align._s_align
      ;padding.b
      
      *v._s_WIDGET     ; vertical scrollbar
      *h._s_WIDGET     ; horizontal scrollbar
    EndStructure
    
    ;- - _s_popup
    Structure _s_popup
      gadget.i
      window.i
      
      ; *Widget._s_widget
    EndStructure
    
    ;- - _s_count
    Structure _s_count
      index.l
      type.l
      items.l
      events.l
      childrens.l
    EndStructure
    
    
;     ;- - _s_items
;     Structure _s_items Extends _s_coordinate
;       index.l
;       *parent._s_items
;       draw.b
;       hide.b
;       
;       image._s_image
;       text._s_text[4]
;       box._s_buttons[2]
;       color._s_color
;       
;       ;state.b
;       round.a
;       
;       sublevel.w
;       childrens.l
;       sublevelsize.l
;       
;       *data      ; set/get item data
;     EndStructure
;     
    ;- - _s_dd
    Structure _S_DD Extends _s_coordinate
      ;*widget._s_widget
      ;cursorimage.i
      ;_state.l
      
      type.i
      format.i
      actions.i
      
      *value
      string.s
    EndStructure
    
    ;- - _s_drag
    Structure _s_DRAG
      start.b
      *address._S_DD
    EndStructure
    
    ;- - _s_post
    Structure _s_post
      *type ; EventType( )
      *item ; EventItem( )
      *data ; EventData( )
    EndStructure
    
  ;- - _s_bind 
    Structure _s_bind 
      *type
      *call.pFunc
      
      List *callback( )
    EndStructure
    
    ;-
    ;- - _s_widget
    Structure _s_WIDGET
   ;       *_drawing ; drawing_mode
;       *_drawing_alpha
   ;       Map *_first._s_widget( )
;       Map *_last._s_widget( )
   
      ; side.l[4] ; sidebar сторона 
      ;       *v._s_WIDGET     ; vertical scrollbar
      ;       *h._s_WIDGET     ; horizontal scrollbar
      *drop._s_DD
      
      fs.a ; frame size
      bs.a ; border size
      __width.a ; bar v size
      __height.a ; bar h size
      
      y.l[constants::#__c]
      x.l[constants::#__c]
      height.l[constants::#__c]
      width.l[constants::#__c]
      
      ; placing layout
      *first._s_WIDGET
      *last._s_WIDGET
      *after._s_WIDGET
      *before._s_WIDGET
      
      *address          ; widgets list address
      *container        ; 
      *root._s_root     ; this root
      
      *parent._s_WIDGET; this parent
      *window._s_WIDGET; this parent window       ; root( )\active\window
      
      StructureUnion
        *_owner._s_WIDGET; this window owner parent
        *_tab._s_WIDGET; = panel( ) tabbar gadget
        *_group._s_WIDGET; = option( ) groupbar gadget  
        *_tt._s_tt
      EndStructureUnion
      
      *gadget._s_WIDGET[3] 
      ; \root\gadget[0] - active gadget
      ; \gadget[0] - active child gadget 
      ; \gadget[1] - splitter( ) first gadget
      ; \gadget[2] - splitter( ) second gadget
      
      *index[3]  
      ; \index[0] - widget index 
      ; \index[1] - panel opened item index
      ; \index[2] - panel selected item index
      ; \index[1] - tab entered item index
      ; \index[2] - tab selected item index
      
      image._s_image[4]       
      ; \image[0] - draw image
      ; \image[1] - released image
      ; \image[2] - pressed image
      ; \image[3] - background image
      
      *flag
      *data
      
      _state.w ; #__s_ (entered; selected; disabled; focused; toggled; scrolled)
      __state.w ; #__ss_ (font; back; frame; fore; line)
      _tabindex.l ; parent panel tab index
      
      
      child.b ; is the widget composite?
      transform.b ; add anchors on the widget (to size and move)
      
      level.l 
      class.s  
      change.l
      vertical.b
      __draw.b
      type.b
      hide.b[2] 
      cursor.l[2]
      round.a
      repaint.i
      resize.b
      
      *errors
      notify.l ; оповестить об изменении
      interact.i 
      
      mode._s_mode
      count._s_count
      combo_box._s_buttons
      caption._s_caption
      color._s_color[4]
      
      row._s_row
      text._s_text 
      
      bar._s_bar
      scroll._s_scroll 
      button._s_buttons ; checkbox; optionbox
      
      *align._s_align
      
      *time_click
      *time_down
      
      ; event_queue ; очередь событий
      List *bind._s_bind( )
      List *post._s_post( )
      
      List *column._s_column( )
    EndStructure
    
    ;- - _s_mouse
    Structure _s_mouse Extends _s_point
      interact.b ; determines the behavior of the mouse in a clamped (pushed) state
      ;*behavior
      *row._s_rows[2]         ; at point element item
      *button._s_buttons[2]   ; at point element button
      *widget._s_WIDGET[2]    ; at point element
                  ;  *selected._s_WIDGET  ; at point pushed element
      
      *grid
      buttons.l 
      
      wheel._s_POINT
      delta._s_POINT
      
      ;drag._s_DRAG
      *_drop._s_widget
      *_drag._S_DD
    
      ;change.b
      ;move._s_point
    EndStructure
    
    ;- - _s_keyboard
    Structure _s_keyboard
      *widget._s_WIDGET   ; keyboard focused element
      change.b
      input.c
      key.i[2]
    EndStructure
    
    ;- - _s_canvas
    Structure _s_canvas
      *address            ; roots list address
      *widget._s_WIDGET   ; opened list element
      
      container.i
      window.i
      gadget.i
      repaint.b
    EndStructure
    
    ;- - _s_sticky
    Structure _s_sticky
      *window._s_WIDGET
      *message._s_WIDGET
    EndStructure
    
    ;- - _s_root
    Structure _s_root Extends _s_WIDGET
      canvas._s_canvas
      *_transform._s_transform
    EndStructure
    
    ;- - _s_events
    Structure _s_events
      mouse._s_mouse               ; mouse( )\
      keyboard._s_keyboard         ; keyboard( )\
      
      List *_root._s_root( )        ; 
      *active._s_WIDGET          ; GetActiveWindow( )\
      sticky._s_sticky            ; top level
      
      *WIDGET._s_WIDGET          ; EventWidget( )\
      ;;*type                        ; EventType( )
      *event                       ; EventType( )
      *item                        ; EventItem( )
      *data                        ; EventData( )
      
      ;;List *_post._s_post( )        ; posted( )\
      List *_childrens._s_WIDGET( ) ; widget( )\
    EndStructure
    
    ;Global *event._s_events = AllocateStructure(_s_events)
    ;}
    
  EndDeclareModule 
  
  Module structures 
    
  EndModule 
CompilerEndIf
; IDE Options = PureBasic 5.72 (MacOS X - x64)
; Folding = --------
; EnableXP