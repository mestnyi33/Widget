﻿;IncludePath "/Users/as/Documents/GitHub/Widget/"
XIncludeFile "_module_tree_12.pb"
;XIncludeFile "_module_tree_10_2.pb"
;XIncludeFile "_module_tree_7_1_0.pb"

UseModule Tree
LN=50000 ; количесвто итемов 
Global *w._S_widget

If OpenWindow(0, 100, 50, 530, 700, "ListViewGadget", #PB_Window_SystemMenu)
  TreeGadget(0, 10, 10, 250, 680, #PB_Tree_NoLines|#PB_Tree_NoButtons)
  *w=Gadget(1, 270, 10, 250, 680, #PB_Flag_GridLines|#PB_Tree_NoLines|#PB_Tree_NoButtons); 
  
  Define time = ElapsedMilliseconds()
  For a = 0 To LN
    AddItem (*w, -1, "Item "+Str(a), - 1);, Random(5)+1)
    If A & $f=$f:WindowEvent() ; это нужно чтобы раздет немного обновлялся
    EndIf
    If A & $8ff=$8ff:WindowEvent() ; это позволяет показывать скоко циклов пройшло
      Debug a
    EndIf
  Next
  Debug Str(ElapsedMilliseconds()-time) + " - add widget items time count - " + CountItems(*w)
  
  ;*w\change = 1
  Define time = ElapsedMilliseconds()
  Redraw(*w)
  Debug Str(ElapsedMilliseconds()-time) + " - items draw times"
  
;   ; HideGadget(0, 1)
;   Define time = ElapsedMilliseconds()
;   For a = 0 To LN
;     AddGadgetItem (0, -1, "Item "+Str(a), 0);, Random(5)+1)
;     If A & $f=$f:WindowEvent() ; это нужно чтобы раздет немного обновлялся
;     EndIf
;     If A & $8ff=$8ff:WindowEvent() ; это позволяет показывать скоко циклов пройшло
;       Debug a
;     EndIf
;   Next
;   Debug Str(ElapsedMilliseconds()-time) + " - add gadget items time count - " + CountGadgetItems(0)
;   ; HideGadget(0, 0)
  
  Repeat : Event=WaitWindowEvent()
  Until  Event= #PB_Event_CloseWindow
EndIf
; IDE Options = PureBasic 5.70 LTS (MacOS X - x64)
; Folding = -
; EnableXP