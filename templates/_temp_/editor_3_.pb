﻿
; Выделение с конца сверху в конец вниз
; Выделение с конца внизу в конец сверх

; ++ надо исправить на последней строке ентер дает ошибку
; + если есть вертикальный скроллбар авто прокручивает в конец файла
; + горизонтальный скролл не перемешает текст если строка выбрана
; - при выделении не прокручивает текст
; - при перемещении корета вниз не прокручивается страница
; + если добавить слова в конец текста и нажать ентер есть ошибки
; + если добавить букву в конец текста потом убрать с помошью бекспейс затем нажать ентер то переносится удаленная буква
; + если выделить слова в одной строке и нажать бекспейс затем нажать ентер то переносятся удаленые слова
; + При переходе на предыдущую строку если переходящая строка длинее предыдушего была ошибка перемещения корета на предыдущей строке
; + когда выделяем 2-3 строки затем вырезаем затем ставляем, курсон не перемещается правильно
; + после запуска если шелкнуть в начале строки курсор оказывается в конце строки и строка выделяется полностью
; - если текст веденный спомощью settext() шире ширины виджета то additem() не работает

;fn + Backspace — аналог клавиши Delete в Windows PC
;fn + Up   — аналог клавиши Page Up в Windows PC
;fn + Down — аналог клавиши Page Down в Windows PC
;fn + Left — аналог клавиши Home в Windows PC
;fn + Right — аналог клавиши End в Windows PC

;+ Home - переместить курсор в начало строки.
;+ End - переместить курсор в конец строки.
;+ Ctrl-Home - переместить курсор в начало первой строки
;+ Ctrl-End - переместить курсор в конец последней строки 

;+ Crtl-A - Выбрать все 
;+ Crtl-C - копировать выделенный текст в буфер обмена 
;+ Crtl-V - вставить буфер обмена в позицию курсора 
;+ Crtl-X - вырезать и копировать выделенный текст в буфер обмена 


; Crtl-Up - переместить курсор в начало предыдущего абзаца.
; Ctrl-Down - переместить курсор в начало следующего абзаца 
; Crtl-Left - переместить курсор в начало строки. 
; Crtl-Right - переместить курсор в конец строки. 

; Alt-Up - переместить курсор в начало строки.
; Alt-Down - переместить курсор в конец строки.
; Alt-Left - переместить курсор в начало слова 
; Alt-Right - переместить курсор в конец слова. 



; http://www.hot-keys.ru/comment_1235822771.html
; Использование горячих клавиш для работы с текстом возможно практически в любой программе на вашем компьютере.
; Особенно примечательно то, что именно при работе с текстом, выгодно использовать клавиатуру «по полной программе», поскольку руки уже на ней!
; Для того, что б выделить, вырезать, вставить, удалить или переместить фрагмент текста, совершенно не обязательно каждый раз переносить руку на мышь. И, конечно, эти сочетания работают во всех текстовых редакторах. И в самом простом Notepad, и в профессиональном Word.
; Здесь и сейчас я приведу горячие клавиши для работы с обычным блокнотом – Notepad.
; Вызвать его из командной строки, то есть без помощи мышки можно следующим образом:
; Сначала нажатием клавиш Win+R вызвать командную строку (клавиша Win с логотипом windows – окном, в последней версии окно уже пластиковое :-). Ввести в командную строку слово notepad и нажать клавишу Enter.
; Обязательно сделайте это прямо сейчас!
; Получилось? Теперь скопируйте текст ниже, из этой страницы в блокнот! Запомнить все, сразу применив на практике, легче! Да еще и в самой программе.
; Собственно пройти этот урок вы можете в любое время, если сохраните этот открытый файл .txt со вставленным текстом. Тогда и Интернет отключать не придется :-)
; Урок по использованию горячих клавиш для работы с текстом:
; Перемещение: (< ^ > v этими закорючками обозначены клавиши стрелки, не путаете с символами возле Б и Ю)
; < ^ > v Попробуйте перемещать курсор, при помощи клавиш-стрелок.
; Конечно, этим Вас не удивишь, но все равно попрыгаете по тексту вниз, вправо, влево, вверх и вернитесь назад, нажав Ctrl+Home.
; Ctrl+>< Перемещение курсора на одно слово вправо или влево. Уже веселее! Перемещение по словам, происходит куда быстрее, чем по буквам. Надеюсь, Вы уже пробуете нажимать на стрелки вправо, влево, удерживая Ctrl.
; Попробовали? Опять нажмите Ctrl+Home и попробуйте перемещаться в конец и начало строки, нажимая клавиши:
; End и Home (обычно эти кнопки находятся чуть выше клавиш-стрелок)
; Попробовали? Получается?...
; Ctrl+Home перемещает курсор в начало текста, это Вы уже знаете, а вот
; Ctrl+End переместит курсор в самый конец текста! Тоже нажмите, не забыв вернуться :-)
; Назначение клавиш End и Home понятно из названия, а вот то, что они работают везде и всегда возьмите на заметку. Проверить сможете на любой странице в Интернет...
; Tab добавит 10 пробелов (все знают, никто не считал), соответственно Backspase вернет курсор на десять пробелов назад, а нажатие Enter перенесет курсор к следующей строке, обычно нажатием Enter заканчивают строку.
; А вот если курсор переместить в середину текста и нажать Enter, он тоже перейдет на следующую строку причем вместе с тем текстом, который справа от него. Backspase вернет все на место.
; Попробуйте все это, немного "покалечив" этот текст.
; Выделение:
; Ctrl+A Выделит весь текст, всегда и везде! А именно здесь выделит все, с одновременным переносом курсора в конец текста.
; Нажмите сейчас Ctrl+A, потом Ctrl+C, потом Win+R (в строке должна была сохраниться запись - notepad) если да, жмем Enter (если нет, набираем notepad, потом жмем Enter), потом Ctrl+V, теперь Alt+F4, стрелку (>)вправо и Enter.
; Этим мы выделили весь текст, скопировали его, вызвали блокнот через командную строку, вставили в новый документ весь текст, потом удовлетворенно, закрыли новый документ, не сохранив, ничего.
; Могли и сохранить, конечно, но и так забежали немного вперед.
; Забежали, чтоб понять, в каком случае часто применяется сочетание Ctrl+A (выделить все!).
; Shift+>< Выделение по буквам. Удерживание Shift во время перемещения клавишами стрелками будет выделять текст в зависимости от направления стрелки. Вправо-влево выделение по одной букве, вниз-вверх по одной строке. Попробовать это, чтоб понять, намного легче, чем вникать в любые объяснения. Посему, попробуйте!
; Часто выделить мышью с точностью до одной буквы просто не возможно! С Шифтом такого не бывает!
; Помните, удерживая Ctrl, мы перемещали курсор по словам? Так вот, если "разбавить" эту комбинацию Шифтом, мы будем выделять по словам, соответственно.
; Пробуйте сейчас!
; Так же по аналогии:
; Shift+Home Выделить до начала строки
; Shift+End Выделить до конца строки
; Ctrl+Shift+Home Выделить до начала текста
; Ctrl+Shift+End Выделить до конца текста
; Попробуйте все четыре, в зависимости от места расположения курсора...
; Удаление:
; Delete удаление символа справа от курсора или удаление чего-то выделенного.
; Backspace и Shift+Delete удаление символа слева от курсора.
; Ctrl+Delete удаление символов справа до конца строки.
; Кнопка тоже говорит сама за себя и используется вместе с модификаторами Ctrl и Shift.
; Запомнить не трудно, посему и потренируйтесь на этой строке... удалив ее.
; Группа сочетаний "под левую руку"
; Вырезание:
; Ctrl+X вырезать предварительно выделенное.
; Вырезают понятно для того, что б, куда нибудь вставить. Вырезать можно один раз, а вставить несколько.
; Отмена:
; Ctrl+Z отменить последнее действие. Самое время вспомнить об этом сочетании, поскольку нужда в нем возникает, обычно после удаления или вырезания.
; Благодаря этому сочетанию "отмерять семь раз" совсем не обязательно!
; Это действие дает возможность исправить любую ошибку, просто отменив ошибочное действие и вернув все в исходное состояние. Проверим?
; Нажмите Ctrl+А теперь внимание! Запомнили о Ctrl+Z ? Нажмите Delete, а потом Ctrl+Z !!! Надеюсь, мы снова вместе...
; Копирование, Вставка:
; Ctrl+C копировать! Это мы любим... В Интернет часто работают такие сочетания Ctrl+А плюс Ctrl+C плюс Ctrl+V = плагиат :-)
; Ctrl+V вставить! Эти сочетания, во истину лидеры среди себе подобных. Не использовать их просто грех :-) Насколько я помню, Вы уже делали копи-паст выше по тексту.
; Касается работы с текстом и вставка символа:
; Alt+Число вставить символ! Удерживая Alt, наберите любое число на дополнительной цифровой клавиатуре. Например, у меня при наборе Alt+753 появляется буква ё, хотя её и в помине нет на моей клавиатуре (я нахожусь в Армении)
; А символ "собака" получается нажатием Alt+64. В общем, с этим сочетанием экспериментируйте...
; Сохранение:
; Ctrl+S сохранить!
; Ничего особенного вроде бы нет, но когда после 15 минут (а то и больше) работы с документом отключат свет, Вы вспомните, что Ctrl+S(свет) надо было время от времени нажимать.
; Я, например, нажимаю после каждой записанной законченной мысли. Хотя если вы за ноутбуком, Вам это не грозит, как и при наличии "бесперебойника".
; Во всех других случаях, если Вы творите, а не созерцаете, время от времени прижимайте Ctrl+S(свет), работает почти везде.
; Поиск и замена:
; Ну и напоследок пару слов о поиске текста. Иногда бывает нужно организовать поиск слова или фразы по одному единственному документу. Делается это в две секунды нажатием:
; Ctrl+F найти букву, слово, текст. Попробуйте найти в этом тексте слово Собака (кроме этого)
; Получилось? :-) Внимательно рассмотрите диалоговое окно поиска, авось пригодится.
; Ctrl+H найти и заменить используется редко, но зато находит и заменяет метко! Об этом не мешает знать.

;                                                                              MAC — OS
;                                                              Page Up и Page Down — прокрутка содержимого страницы вверх или вниз.
;                              fn + Backspace — аналог клавиши Delete в Windows PC — удаление символов в тексте, если курсор находится перед словом.
;                                                  Alt + Page Up и Alt + Page Down — прокрутка текста вверх и вниз с шагом в один экран.
;                                     ⌘Cmd + стрелка влево и ⌘Cmd + стрелка вправо — перемещение курсора в начало или конец строки.
;                   ⌥Option (Alt) + стрелка влево и ⌥Option (Alt) + стрелка вправо — перемещение курсора в начало или конец слова.
;                     ⌥Option (Alt) + стрелка вверх и ⌥Option (Alt) + стрелка вниз — перемещение курсора в начало или конец текущего абзаца.
;                                       ⌘Cmd + стрелка вверх и ⌘Cmd + стрелка вниз — перемещение курсора в начало или конец текста.
;                                 ⇧Shift + стрелка влево и ⇧Shift + стрелка вправо — посимвольное выделение текста слева или справа от курсора.
; ⇧Shift + ⌥Option (Alt) + стрелка влево и ⇧Shift + ⌥Option (Alt) + стрелка вправо — выделение текста слева или справа от курсора по словам.
;                   ⇧Shift + ⌘Cmd + стрелка влево и ⇧Shift + ⌘Cmd + стрелка вправо — выделение текста влево или вправо от курсора до конца строки.
;                                   ⇧Shift + стрелка вверх и ⇧Shift + стрелка вниз — выделение текста от курсора вверх или вниз по строчкам.
;   ⇧Shift + ⌥Option (Alt) + стрелка вверх и ⇧Shift + ⌥Option (Alt) + стрелка вниз — выделение текста от курсора вверх или вниз до начала или конца абзаца.
;                     ⇧Shift + ⌘Cmd + стрелка вверх и ⇧Shift + ⌘Cmd + стрелка вниз — выделение текста от курсора вверх или вниз до начала или конца текста.
;                                                           ⌥Option (Alt) + Delete — удаление всех символов слева от курсора в пределах слова.
;                                                                    ⌘Cmd + Delete — удаление всех символов слева от курсора в пределах строки.


;
; 
DeclareModule Macros
  Macro isItem(_item_, _list_)
    Bool(_item_ >= 0 And _item_ < ListSize(_list_))
  EndMacro
  
  Macro itemSelect(_item_, _list_)
    Bool(isItem(_item_, _list_) And _item_ <> ListIndex(_list_) And SelectElement(_list_, _item_))
  EndMacro
  
  Macro add_widget(_widget_, _hande_)
    If _widget_ =- 1 Or _widget_ > ListSize(List()) - 1
      LastElement(List())
      _hande_ = AddElement(List()) 
      _widget_ = ListIndex(List())
    Else
      _hande_ = SelectElement(List(), _widget_)
      ; _hande_ = InsertElement(List())
      PushListPosition(List())
      While NextElement(List())
        List()\widget\index = ListIndex(List())
      Wend
      PopListPosition(List())
    EndIf
  EndMacro
  
  Macro _box_gradient_(_type_, _x_,_y_,_width_,_height_,_color_1_,_color_2_, _round_=0, _alpha_=255)
    BackColor(_color_1_&$FFFFFF|_alpha_<<24)
    FrontColor(_color_2_&$FFFFFF|_alpha_<<24)
    If _type_
      LinearGradient(_x_,_y_, (_x_+_width_), _y_)
    Else
      LinearGradient(_x_,_y_, _x_, (_y_+_height_))
    EndIf
    RoundBox(_x_,_y_,_width_,_height_, _round_,_round_)
    BackColor(#PB_Default) : FrontColor(#PB_Default) ; bug
  EndMacro
  
  Macro _make_open_box_XY_(_this_, _items_, _x_, _y_)
    If (_this_\flag\buttons Or _this_\flag\lines) 
      _items_\box\width = _this_\flag\buttons
      _items_\box\height = _this_\flag\buttons
      _items_\box\x = _x_+_items_\margin\width-(_items_\box\width)/2
      _items_\box\y = (_y_+_items_\height)-(_items_\height+_items_\box\height)/2
    EndIf
  EndMacro
  
  Macro _make_check_box_XY_(_this_, _items_, _x_, _y_)
    If _this_\flag\checkBoxes
      _items_\box\width[1] = _this_\flag\checkBoxes
      _items_\box\height[1] = _this_\flag\checkBoxes
      _items_\box\x[1] = _x_+(_items_\box\width[1])/2
      _items_\box\y[1] = (_y_+_items_\height)-(_items_\height+_items_\box\height[1])/2
    EndIf
  EndMacro
  
  Macro Distance(_mouse_x_, _mouse_y_, _position_x_, _position_y_, _round_)
    Bool(Sqr(Pow(((_position_x_+_round_) - _mouse_x_),2) + Pow(((_position_y_+_round_) - _mouse_y_),2)) =< _round_)
  EndMacro
  
  Macro Max(_a_, _b_)
    ((_a_) * Bool((_a_) > = (_b_)) + (_b_) * Bool((_b_) > (_a_)))
  EndMacro
  
  Macro Min(_a_, _b_)
    ((_a_) * Bool((_a_) < = (_b_)) + (_b_) * Bool((_b_) < (_a_)))
  EndMacro
  
  Macro SetBit(_var_, _bit_) ; Установка бита.
    _var_ | (_bit_)
  EndMacro
  
  Macro ClearBit(_var_, _bit_) ; Обнуление бита.
    _var_ & (~(_bit_))
  EndMacro
  
  Macro InvertBit(_var_, _bit_) ; Инвертирование бита.
    _var_ ! (_bit_)
  EndMacro
  
  Macro TestBit(_var_, _bit_) ; Проверка бита (#True - установлен; #False - обнулен).
    Bool(_var_ & (_bit_))
  EndMacro
  
  Macro NumToBit(_num_) ; Позиция бита по его номеру.
    (1<<(_num_))
  EndMacro
  
  Macro GetBits(_var_, _start_pos_, _end_pos_)
    ((_var_>>(_start_pos_))&(NumToBit((_end_pos_)-(_start_pos_)+1)-1))
  EndMacro
  
  Macro CheckFlag(_mask_, _flag_)
    ((_mask_ & _flag_) = _flag_)
  EndMacro
  
  ; val = %10011110
  ; Debug Bin(GetBits(val, 0, 3))
  
EndDeclareModule 

Module Macros
  
EndModule 

;UseModule Macros


DeclareModule Constants
  #VectorDrawing = 0
  
  ;CompilerIf #VectorDrawing
  ;  UseModule Draw
  ;CompilerEndIf
  
  Enumeration #PB_Event_FirstCustomValue
    #PB_Event_Widget
  EndEnumeration
  
  
  ;- - DECLAREs CONSTANTs
  ;{
  #__round = 7
  #__draw_clip_box = 0
  #__draw_scroll_box = 1
  #__debug_events_tab = 0
  #__padding_text = 5
  #__sOC = SizeOf(Character)
  #__border_scroll = 2
  #__spin_buttonsize2 = 15
  #__spin_buttonsize = 18
  
  Enumeration #PB_Event_FirstCustomValue
    #PB_Event_Widget
  EndEnumeration
  
  Enumeration #PB_EventType_FirstCustomValue
    CompilerIf (#PB_Compiler_Version<547) : #PB_EventType_Resize : CompilerEndIf
    
    #PB_EventType_Free
    #PB_EventType_create
    #PB_EventType_Drop
    
    #PB_EventType_Repaint
    #PB_EventType_ScrollChange
  EndEnumeration
  
  #__Anchors = 9+4
  
  #__A_moved = 9
  #__Arrow_type = 1
  
  ;bar buttons
  Enumeration
    #__b_1 = 1
    #__b_2 = 2
    #__b_3 = 3
  EndEnumeration
  
  ;bar position
  Enumeration
    #__bp_0 = 0
    #__bp_1 = 1
    #__bp_2 = 2
    #__bp_3 = 3
  EndEnumeration
  
  ;element position
  Enumeration
    #last =- 1
    #first = 0
    #prev = 1
    #next = 2
    #__before = 3
    #__After = 4
  EndEnumeration
  
  ;element coordinate 
  Enumeration
    #__c_0 = 0 ; 
    #__c_1 = 1 ; frame
    #__c_2 = 2 ; inner
    #__c_3 = 3 ; container
    #__c_4 = 4 ; clip
  EndEnumeration
  
  ;color state
  Enumeration
    #__s_0
    #__s_1
    #__s_2
    #__s_3
  EndEnumeration
  
  ;color state
  Enumeration
    #Normal
    #Entered
    #__selected
    #__disabled
  EndEnumeration
  
  Enumeration 1
    #__Color_Front
    #__Color_Back
    #__Color_Line
    #__Color_TitleFront
    #__Color_TitleBack
    #__Color_GrayText 
    #__Color_Frame
  EndEnumeration
  
  #PB_GadgetType_Popup =- 10
  #PB_GadgetType_Property = 40
  #PB_GadgetType_Window =- 1
  #PB_GadgetType_Root =- 5
  ;
  #__flag_NoButtons = #PB_Tree_NoButtons                     ; 2 1 Hide the '+' node buttons.
  #__flag_NoLines = #PB_Tree_NoLines                         ; 1 2 Hide the little lines between each nodes.
  #__flag_Checkboxes = #PB_Tree_CheckBoxes                   ; 4 256 Add a checkbox before each Item.
                                                             ; #__flag_ThreeState = #PB_Tree_ThreeState                   ; 8 65535 The checkboxes can have an "in between" state.
  
  EnumerationBinary
    #___Text
    #___Image
    
    #___Center
    #___Right
    #___Left
    #___Top
    #___Bottom
    #___Vertical 
    #___Horizontal
  EndEnumeration
  
  EnumerationBinary WidgetFlags
    #__flag_Center
    #__flag_Right
    #__flag_Left
    #__flag_Top
    #__flag_Bottom
    #__flag_Vertical 
    #__flag_Horizontal
    
    #__flag_AutoSize
    ;#__flag_AutoRight
    ;#__flag_AutoBottom
    
    #__flag_Numeric
    #__flag_ReadOnly
    #__flag_LowerCase 
    #__flag_UpperCase
    #__flag_Password
    #__flag_WordWrap
    #__flag_MultiLine 
    #__flag_InLine
    
    #__flag_BorderLess
    ;         #__flag_Double
    ;         #__flag_Flat
    ;         #__flag_Raised
    ;         #___s_flagingle
    
    #__flag_AnchorsGadget
    
    
    #__flag_OptionBoxes
    #__flag_ThreeState
    #__flag_Collapse
    
    #__flag_GridLines
    #__flag_Invisible
    
    #__flag_MultiSelect
    #__flag_ClickSelect
    
    #__flag_FullSelection
    #__flag_NoGadget
    #__flag_NoActivate
    
    ;#__flag_Default
    #__flag_Inverted
    ;#__flag_Middle
    #__flag_AlwaysSelection ; = 32 ; #PB_Tree_AlwaysShowSelection ; 0 32 Even If the gadget isn't activated, the selection is still visible.
    
    
    #__flag_Limit
  EndEnumeration
  
  EnumerationBinary #__flag_Numeric;1
    #__bar_Minimum 
    #__bar_Maximum 
    #__bar_PageLength 
    
    ;#__bar_ArrowSize 
    #__bar_ButtonSize 
    #___s_barcrollStep
    #__bar_Direction 
    #__bar_Ticks
    #__bar_Reverse
    #__bar_Inverted 
    
    #__bar_Vertical = #__flag_Vertical
  EndEnumeration
  
  If (#__flag_Limit>>1) > 2147483647 ; 8589934592
    Debug "Исчерпан лимит в x32 ("+Str(#__flag_Limit>>1)+")"
  EndIf
  
  #__flag_Full = #__flag_Left|#__flag_Right|#__flag_Top|#__flag_Bottom
  
  ; text
  #__text_left = #__flag_left
  #__text_top = #__flag_top
  #__text_center = #__flag_center
  #__text_right = #__flag_right
  #__text_bottom = #__flag_bottom
  
  #__text_multiline = #__flag_multiline
  #__text_numeric = #__flag_numeric
  #__text_password = #__flag_password
  #__text_readonly = #__flag_readonly
  #__text_lowercase = #__flag_lowercase
  #__text_uppercase = #__flag_uppercase
  #__text_wordwrap = #__flag_wordwrap
  #__text_invert = #__flag_inverted
  #__text_vertical = #__flag_vertical
  
  ; editor
  #__editor_inline = #__flag_InLine
  #__editor_wordwrap = #__flag_wordwrap
  #__editor_numeric = #__flag_numeric
  #__editor_fullselection = #__flag_fullselection
  #__editor_alwaysselection = #__flag_alwaysselection
  #__editor_gridlines = #__flag_gridLines
  #__editor_borderless = #__flag_borderless
  
  ; string
  #__string_right = #__text_right
  #__string_center = #__text_center
  #__string_numeric = #__text_numeric
  #__string_password = #__text_password
  #__string_readonly = #__text_readonly
  #__string_uppercase = #__text_uppercase
  #__string_lowercase = #__text_lowercase
  #__string_borderless = #__flag_borderless
  
  #__string_multiline = #__text_multiline
  
  ;}
  
EndDeclareModule 

Module Constants
  
EndModule 

;UseModule Constants

;-
DeclareModule Structures
  CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
    ; PB Interne Struktur Gadget MacOS
    Structure sdkGadget
      *gadget
      *container
      *vt
      UserData.i
      Window.i
      Type.i
      Flags.i
    EndStructure
  CompilerEndIf
  
  ;- STRUCTURE
  ;- - _s_point
  Structure _s_point
    y.i
    x.i
  EndStructure
  
  ;- - _s_coordinate
  Structure _s_coordinate
    y.i[4]
    x.i[4]
    height.i[4]
    width.i[4]
  EndStructure
  
  ;- - _s_mouse
  Structure _s_mouse
    X.i
    Y.i
    from.i ; at point widget
    Wheel.i; delta
    Buttons.i ; state
    *Delta._s_mouse
  EndStructure
  
  ;- - _s_keyboard
  Structure _s_keyboard
    change.b
    input.c
    key.i[2]
  EndStructure
  
  ;- - _s_align
  Structure _s_align
    Right.b
    Bottom.b
    Vertical.b
    Horizontal.b
  EndStructure
  
  ;- - _s_page
  Structure _s_page
    Pos.i
    len.i
    *end
    ScrollStep.i
  EndStructure
  
  ;- - _s_color
  Structure _s_color
    State.b
    Front.i[4]
    Fore.i[4]
    Back.i[4]
    Line.i[4]
    Frame.i[4]
    Alpha.a[2]
  EndStructure
  
  ;- - _s_flag
  Structure _s_flag
    InLine.b
    Lines.b
    Buttons.b
    GridLines.b
    CheckBoxes.b
    FullSelection.b
    AlwaysSelection.b
    MultiSelect.b
    ClickSelect.b
  EndStructure
  
  ;- - _s_image
  Structure _s_image Extends _s_coordinate
    handle.i[2]
    change.b
    Align._s_align
  EndStructure
  
  ;- - _s_caret
  Structure _s_caret
    x.l
    y.l
    width.l
    height.l
    
    start.l
    stop.l
    time.l
  EndStructure
  
  ;- - _s_text
  Structure _s_text ;Extends _s_coordinate
                    ;     ;     Char.c
    x.l
    y.l
    width.l
    height.l
    
    _scroll_line_index.l
    
    pos.l
    len.l
    
    fontID.i
    string.s[3]
    change.b
    count.l
    
    pass.b
    lower.b
    upper.b
    numeric.b
    editable.b
    multiLine.b
    rotate.f
    padding.l
    
    align._s_align
  EndStructure
  
  ;- - _s_bar
  Structure _s_bar Extends _s_coordinate
    *s._s_scroll
    Type.i
    Widget.i
    round.i
    ArrowSize.b[3]
    ArrowType.b[3]
    
    from.i
    
    Hide.b[2]
    Disable.b[2]
    
    Max.i
    Min.i
    Vertical.b
    Page._s_page
    Area._s_page
    Thumb._s_page
    Button._s_page
    Color._s_color[4]
  EndStructure
  
  ;- - _s_events
  Structure _s_post
    Gadget.i
    Window.i
    Widget.i
    Type.i
    Event.i
    *Function
  EndStructure
  
  ;- - _s_scroll
  Structure _s_scroll Extends _s_coordinate
    Post._s_post
    
    *v._s_bar
    *h._s_bar
  EndStructure
  
  ;- - _s_box
  Structure _s_box
    y.l
    x.l
    height.l
    width.l
    checked.b
  EndStructure
  
  ;- - _s_margin
  Structure _s_margin
    level.l
    
    y.l
    x.l
    height.l
    width.l
    
    color._s_color
  EndStructure
  
  ;- - _s_rows
  Structure _s_rows Extends _s_coordinate
    
    hide.b
    draw.b
    round.a
    
    sublevel.l
    sublevellen.l
    
   ;Font._s_font
    ;fontID.i
    ;len.l ; ширина самого длиного итема
    ;*option_group._s_rows
    ;box._s_box[2]                        ; - tree 
    
    ;l._s_line ; 
    
    childrens.l
    *last._s_rows
    *first._s_rows
    *parent._s_rows
    
    
    index.l  ; Index of new list element
    
    text._s_text[4]
    image._s_image
    color._s_color
    margin._s_text
     
   *data  ; set/get item data
  EndStructure
  
  ;- - _s_row
  Structure _s_row Extends _s_coordinate
    drag.b
    ;resize.l
    
    
    FontID.i
    scrolled.b
    
    ;*tt._s_tt
    
    sublevel.l
    sublevellen.l
    
    ;Font._s_font
    
    *first._s_rows
    ;List *draws._s_rows()
    
    
    
    margin._s_margin
    color._s_color
    caret._s_caret
    
    error.b
    
    count.l
    index.l
    box._s_box          ; выделеный прямоугольник
    *selected._s_rows
    List _s._s_rows()
  EndStructure
  
  ;- - _s_widget
  Structure _s_widget Extends _s_coordinate
    type.l
    handle.i    ; Adress of new list element
    index.l[3]  ; Index[0] of new list element ; inex[1]-entered ; index[2]-selected
    
    *widget._s_widget
    *root._s_root
    
    color._s_color
    text._s_text[4]
    clip._s_coordinate
    scroll._s_scroll
    image._s_image
    flag._s_flag
    
    bs.b
    fs.b[2]
    hide.b[2]
    disable.b[2]
    interact.b ; будет ли взаимодействовать с пользователем?
    cursor.i[2]
    
    countitems.l
    
    focus.i
    
    Drag.b[2]
    Resize.b ; 
    
    *data
    change.b
    round.i
    vertical.b
    sublevellen.i
    
    attribute.i
    
    ;*Default
    row._s_row
    
    Repaint.i ; Будем посылать сообщение что надо перерисовать а после надо сбрасывать переменую
  EndStructure
  
  ;- - _s_root
  Structure _s_root
    canvas.i
    window.i
    
    mouse._s_mouse
    keyboard._s_keyboard
  EndStructure
  
  ;-
  ;- _color_
  ; $FF24B002 ; $FFD5A719 ; $FFE89C3D ; $FFDE9541 ; $FFFADBB3 ;
  Global _color_._s_color
  With _color_                          
    \state = 0
    
    ;     ;- Серые цвета 
    ;         ; Цвета по умолчанию
    ;         \front[0] = $FF000000
    ;         \fore[0] = $FFFCFCFC ; $FFF6F6F6 
    ;         \back[0] = $FFE2E2E2 ; $FFE8E8E8 ; 
    ;         \line[0] = $FFA3A3A3
    ;         \frame[0] = $FFA5A5A5 ; $FFBABABA
    ;         
    ;         ; Цвета если мышь на виджете
    ;         \front[1] = $FF000000
    ;         \fore[1] = $FFF5F5F5 ; $FFF5F5F5 ; $FFEAEAEA
    ;         \back[1] = $FFEAEAEA ; $FFCECECE ; 
    ;         \line[1] = $FF5B5B5B
    ;         \frame[1] = $FFCECECE ; $FF8F8F8F
    ;         
    ;         ; Цвета если нажали на виджет
    ;         \front[2] = $FFFFFFFF
    ;         \fore[2] = $FFE2E2E2
    ;         \back[2] = $FFB4B4B4
    ;         \line[2] = $FFFFFFFF
    ;         \frame[2] = $FF6F6F6F
    
    ;     ;- Зеленые цвета
    ;                 ; Цвета по умолчанию
    ;                 \front[0] = $FF000000
    ;                 \fore[0] = $FFFFFFFF
    ;                 \back[0] = $FFDAFCE1  
    ;                 \frame[0] = $FF6AFF70 
    ;                 
    ;                 ; Цвета если мышь на виджете
    ;                 \front[1] = $FF000000
    ;                 \fore[1] = $FFE7FFEC
    ;                 \back[1] = $FFBCFFC5
    ;                 \frame[1] = $FF46E064 ; $FF51AB50
    ;                 
    ;                 ; Цвета если нажали на виджет
    ;                 \front[2] = $FFFEFEFE
    ;                 \fore[2] = $FFC3FDB7
    ;                 \back[2] = $FF00B002
    ;                 \frame[2] = $FF23BE03
    
    ;- Синие цвета
    ; Цвета по умолчанию
    \front[0] = $80000000
    \fore[0] = $FFF8F8F8 
    \back[0] = $80E2E2E2
    \frame[0] = $80C8C8C8
    
    ; Цвета если мышь на виджете
    \front[1] = $80000000
    \fore[1] = $FFFAF8F8
    \back[1] = $80FCEADA
    \frame[1] = $80FFC288
    
    ; Цвета если нажали на виджет
    \front[2] = $FFFEFEFE
    \fore[2] = $FFE9BA81;$C8FFFCFA
    \back[2] = $FFE89C3D; $80E89C3D
    \frame[2] = $FFDC9338; $80DC9338
    
    ;     ; Цвета если нажали на виджет
    ;     \front[2] = $80000000
    ;     \fore[2] = $FFFDF7EF
    ;     \back[2] = $FFFBD9B7
    ;     \frame[2] = $FFE59B55
    
  EndWith
  
  Global *Focus._s_widget
  Global NewList List._s_widget()
  Global Use_List_Canvas_Gadget
  
EndDeclareModule 

Module Structures 
  
EndModule 

;UseModule Structures

DeclareModule Bar
  EnableExplicit
  UseModule Macros
  UseModule Constants
  UseModule Structures
  
  Structure _struct_bar_ Extends structures::_s_bar : EndStructure
  
  Macro is(_scroll_) : Bool(((_scroll_\v And _scroll_\v\from) Or (_scroll_\h And _scroll_\h\from))) : EndMacro
  ;Macro is(_scroll_) : Bool((((_scroll_\v And Not _scroll_\v\from) Or Not _scroll_\v) And ((_scroll_\h And Not _scroll_\h\from) Or Not _scroll_\h))) : EndMacro
  ;Macro is(_scroll_) : Bool( Bool((_scroll_\v And Not _scroll_\v\from) And (_scroll_\h And Not _scroll_\h\from)) Or Not Bool(_scroll_\v And _scroll_\h)) : EndMacro
  ;   Macro x(_this_) : _this_\x+Bool(_this_\hide[1] Or Not _this_\color\alpha)*_this_\width : EndMacro
  ;   Macro y(_this_) : _this_\y+Bool(_this_\hide[1] Or Not _this_\color\alpha)*_this_\height : EndMacro
  Macro width(_this_) : Bool(Not _this_\hide[1] And _this_\color\alpha)*_this_\width : EndMacro
  Macro height(_this_) : Bool(Not _this_\hide[1] And _this_\color\alpha)*_this_\height : EndMacro
  
  ;- - DECLAREs
  Declare.i Draw(*this)
  Declare.i Y(*this)
  Declare.i X(*this)
  ;   Declare.i Width(*this)
  ;   Declare.i Height(*this)
  Declare.b SetState(*this, ScrollPos.i)
  Declare.i SetAttribute(*this, Attribute.i, Value.i)
  Declare.b CallBack(*this, EventType.i, mouseX=0, mouseY=0)
  Declare.i Draws(*Scroll._s_scroll, ScrollHeight.i, ScrollWidth.i)
  Declare.i SetColor(*this, ColorType.i, Color.i, State.i=0, Item.i=0)
  Declare.b Resize(*this, iX.i,iY.i,iWidth.i,iHeight.i, *that=#Null)
  Declare.i Bar(X.i,Y.i,Width.i,Height.i, Min.i, Max.i, PageLength.i, Flag.i, round.i=0)
  
  Declare.b Resizes(*Scroll._s_scroll, X.i,Y.i,Width.i,Height.i)
  Declare.b Updates(*Scroll._s_scroll, ScrollArea_X, ScrollArea_Y, ScrollArea_Width, ScrollArea_Height)
  ;Declare.i Editor(*Scroll._s_scroll, X.i,Y.i,Width.i,Height.i, Min.i, Max.i, PageLength.i, Flag.i, round.i=0)
  Declare.i Bars(*Scroll._s_scroll, Size.i, round.i, Both.b)
  Declare Arrow(X,Y, Size, Direction, Color, Thickness = 1, Length = 1)
EndDeclareModule

Module Bar
  Macro ThumbLength(_this_)
    Round(_this_\area\len - (_this_\area\len / (_this_\max-_this_\min))*((_this_\max-_this_\min) - _this_\page\len), #PB_Round_Nearest)
  EndMacro
  Macro ThumbPos(_this_, _scroll_pos_)
    (_this_\area\pos + Round((_scroll_pos_-_this_\min) * (_this_\area\len / (_this_\max-_this_\min)), #PB_Round_Nearest)) : If _this_\Vertical : _this_\y[3] = _this_\thumb\pos : _this_\height[3] = _this_\thumb\len : Else : _this_\x[3] = _this_\thumb\pos : _this_\width[3] = _this_\thumb\len : EndIf
  EndMacro
  Macro ScrollEnd(_this_)
    Bool(_this_\page\pos = ((_this_\max-_this_\min)-_this_\page\len))
  EndMacro
  
  Procedure Arrow(X,Y, Size, Direction, Color, Thickness = 1, Length = 1)
    Protected I
    
    If Length=0
      Thickness = - 1
    EndIf
    Length = (Size+2)/2
    
    
    If Direction = 1 ; top
      If Thickness > 0 : x-1 : y+2
        Size / 2
        For i = 0 To Size 
          LineXY((X+1+i)+Size,(Y+i-1)-(Thickness),(X+1+i)+Size,(Y+i-1)+(Thickness),Color)         ; Левая линия
          LineXY(((X+1+(Size))-i),(Y+i-1)-(Thickness),((X+1+(Size))-i),(Y+i-1)+(Thickness),Color) ; правая линия
        Next
      Else : x-1 : y-1
        For i = 1 To Length 
          If Thickness =- 1
            LineXY(x+i, (Size+y), x+Length, y, Color)
            LineXY(x+Length*2-i, (Size+y), x+Length, y, Color)
          Else
            LineXY(x+i, (Size+y)-i/2, x+Length, y, Color)
            LineXY(x+Length*2-i, (Size+y)-i/2, x+Length, y, Color)
          EndIf
        Next 
        i = Bool(Thickness =- 1) 
        LineXY(x, (Size+y)+Bool(i=0), x+Length, y+1, Color) 
        LineXY(x+Length*2, (Size+y)+Bool(i=0), x+Length, y+1, Color) ; bug
      EndIf
    ElseIf Direction = 3 ; bottom
      If Thickness > 0 : x-1 : y+2
        Size / 2
        For i = 0 To Size
          LineXY((X+1+i),(Y+i)-(Thickness),(X+1+i),(Y+i)+(Thickness),Color) ; Левая линия
          LineXY(((X+1+(Size*2))-i),(Y+i)-(Thickness),((X+1+(Size*2))-i),(Y+i)+(Thickness),Color) ; правая линия
        Next
      Else : x-1 : y+1
        For i = 0 To Length 
          If Thickness =- 1
            LineXY(x+i, y, x+Length, (Size+y), Color)
            LineXY(x+Length*2-i, y, x+Length, (Size+y), Color)
          Else
            LineXY(x+i, y+i/2-Bool(i=0), x+Length, (Size+y), Color)
            LineXY(x+Length*2-i, y+i/2-Bool(i=0), x+Length, (Size+y), Color)
          EndIf
        Next
      EndIf
    ElseIf Direction = 0 ; в лево
      If Thickness > 0 : y-1
        Size / 2
        For i = 0 To Size 
          ; в лево
          LineXY(((X+1)+i)-(Thickness),(((Y+1)+(Size))-i),((X+1)+i)+(Thickness),(((Y+1)+(Size))-i),Color) ; правая линия
          LineXY(((X+1)+i)-(Thickness),((Y+1)+i)+Size,((X+1)+i)+(Thickness),((Y+1)+i)+Size,Color)         ; Левая линия
        Next  
      Else : x-1 : y-1
        For i = 1 To Length
          If Thickness =- 1
            LineXY((Size+x), y+i, x, y+Length, Color)
            LineXY((Size+x), y+Length*2-i, x, y+Length, Color)
          Else
            LineXY((Size+x)-i/2, y+i, x, y+Length, Color)
            LineXY((Size+x)-i/2, y+Length*2-i, x, y+Length, Color)
          EndIf
        Next 
        i = Bool(Thickness =- 1) 
        LineXY((Size+x)+Bool(i=0), y, x+1, y+Length, Color) 
        LineXY((Size+x)+Bool(i=0), y+Length*2, x+1, y+Length, Color)
      EndIf
    ElseIf Direction = 2 ; в право
      If Thickness > 0 : y-1
        Size / 2
        For i = 0 To Size 
          ; в право
          LineXY(((X+2)+i)-(Thickness),((Y+1)+i),((X+2)+i)+(Thickness),((Y+1)+i),Color) ; Левая линия
          LineXY(((X+2)+i)-(Thickness),(((Y+1)+(Size*2))-i),((X+2)+i)+(Thickness),(((Y+1)+(Size*2))-i),Color) ; правая линия
        Next
      Else : y-1 : x+1
        For i = 0 To Length 
          If Thickness =- 1
            LineXY(x, y+i, Size+x, y+Length, Color)
            LineXY(x, y+Length*2-i, Size+x, y+Length, Color)
          Else
            LineXY(x+i/2-Bool(i=0), y+i, Size+x, y+Length, Color)
            LineXY(x+i/2-Bool(i=0), y+Length*2-i, Size+x, y+Length, Color)
          EndIf
        Next
      EndIf
    EndIf
    
  EndProcedure
  
  Procedure.i Match(Value.i, Grid.i, Max.i=$7FFFFFFF)
    If Grid 
      Value = Round((Value/Grid), #PB_Round_Nearest) * Grid 
      If Value>Max 
        Value=Max 
      EndIf
    EndIf
    
    ProcedureReturn Value
  EndProcedure
  
  Procedure.i Pos(*this._struct_bar_, ThumbPos.i)
    Protected ScrollPos.i
    
    With *this
      ScrollPos = Match( \min + Round((ThumbPos - \area\pos) / ( \area\len / ( \max-\min)), #PB_Round_Nearest), \page\scrollStep) 
      If ( \Vertical And \type = #PB_GadgetType_TrackBar) : ScrollPos = (( \max-\min)-ScrollPos) : EndIf
    EndWith
    
    ProcedureReturn ScrollPos
  EndProcedure
  
  ;-
  Procedure.i X(*this._struct_bar_)
    Protected Result.l
    
    If *this
      With *this
        If Not \hide[1] And \color\alpha
          Result = \x
        Else
          Result = \x+\width
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i Y(*this._struct_bar_)
    Protected Result.l
    
    If *this
      With *this
        If Not \hide[1] And \color\alpha
          Result = \y ; -(\height-\round/2)+1
        Else
          Result = \y+\height
        EndIf
      EndWith
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i Draw(*this._struct_bar_)
    With *this
      If *this And Not \hide And \color\alpha
        
        ; Draw scroll bar background
        If \color[0]\back[\color[0]\state]<>-1
          DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
          RoundBox( \x[0], \y[0], \width[0], \height[0], \round, \round, \color[0]\back[\color[0]\state]&$FFFFFF|\color\alpha<<24)
        EndIf
        
        ; Draw line
        If \color[0]\line[\color[0]\state]<>-1
          If \s
            If \Vertical
              ; Draw left line
              If Not \s\h\hide
                ; "Это пустое пространство между двумя скроллами тоже закрашиваем если скролл бара кнопки не круглые"
                If Not \round : Box( \x[2], \y[2]+\height[2]+1, \width[2], \height[2], \color[0]\back[\color[0]\state]&$FFFFFF|\color\alpha<<24) : EndIf
                Line( \x[0], \y[0],1, \height[0]-\round/2,\color[0]\line[\color[0]\state]&$FFFFFF|\color\alpha<<24)
              Else
                Line( \x[0], \y[0],1, \height[0],\color[0]\line[\color[0]\state]&$FFFFFF|\color\alpha<<24)
              EndIf
            Else
              ; Draw top line
              If Not \s\v\hide
                Line( \x[0], \y[0], \width[0]-\round/2,1,\color[0]\line[\color[0]\state]&$FFFFFF|\color\alpha<<24)
              Else
                Line( \x[0], \y[0], \width[0],1,\color[0]\line[\color[0]\state]&$FFFFFF|\color\alpha<<24)
              EndIf
            EndIf
          EndIf
        EndIf
        
        If \thumb\len 
          ; Draw thumb  
          If \color[3]\back[\color[3]\state]<>-1
            If \color[3]\fore[\color[3]\state]
              DrawingMode( #PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
            EndIf
            _box_gradient_( \Vertical, \x[3], \y[3], \width[3], \height[3], \color[3]\fore[\color[3]\state], \color[3]\back[\color[3]\state], \round, \color\alpha)
          EndIf
          
          ; Draw thumb frame
          If \color[3]\frame[\color[3]\state] 
            DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
            RoundBox( \x[3], \y[3], \width[3], \height[3], \round, \round, \color[3]\frame[\color[3]\state]&$FFFFFF|\color\alpha<<24)
          EndIf
        EndIf
        
        If \button\len 
          ; Draw buttons
          If \color[1]\back[\color[1]\state]<>-1
            If \color[1]\fore[\color[1]\state]
              DrawingMode( #PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
            EndIf
            _box_gradient_( \Vertical, \x[1], \y[1], \width[1], \height[1], \color[1]\fore[\color[1]\state], \color[1]\back[\color[1]\state], \round, \color\alpha)
            If \color[2]\fore[\color[2]\state]
              DrawingMode( #PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
            EndIf
            _box_gradient_( \Vertical, \x[2], \y[2], \width[2], \height[2], \color[2]\fore[\color[2]\state], \color[2]\back[\color[2]\state], \round, \color\alpha)
          EndIf
          
          ; Draw buttons frame
          If \color[1]\frame[\color[1]\state]
            DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
            RoundBox( \x[1], \y[1], \width[1], \height[1], \round, \round, \color[1]\frame[\color[1]\state]&$FFFFFF|\color\alpha<<24)
          EndIf
          If \color[2]\frame[\color[2]\state]
            DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
            RoundBox( \x[2], \y[2], \width[2], \height[2], \round, \round, \color[2]\frame[\color[2]\state]&$FFFFFF|\color\alpha<<24)
          EndIf
          
          ; Draw arrows
          DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
          Arrow( \x[1]+( \width[1]-\arrowSize[1])/2, \y[1]+( \height[1]-\arrowSize[1])/2, \arrowSize[1], Bool( \Vertical), \color[1]\front[\color[1]\state]&$FFFFFF|\color\alpha<<24, \arrowType[1])
          Arrow( \x[2]+( \width[2]-\arrowSize[2])/2, \y[2]+( \height[2]-\arrowSize[2])/2, \arrowSize[2], Bool( \Vertical)+2, \color[2]\front[\color[2]\state]&$FFFFFF|\color\alpha<<24, \arrowType[2])
        EndIf
        
        If \color[3]\fore[\color[3]\state]  ; Draw thumb lines
          DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
          If \Vertical
            Line( \x[3]+( \width[3]-8)/2, \y[3]+\height[3]/2-3,9,1, \color[3]\front[\color[3]\state]&$FFFFFF|\color\alpha<<24)
            Line( \x[3]+( \width[3]-8)/2, \y[3]+\height[3]/2,9,1, \color[3]\front[\color[3]\state]&$FFFFFF|\color\alpha<<24)
            Line( \x[3]+( \width[3]-8)/2, \y[3]+\height[3]/2+3,9,1, \color[3]\front[\color[3]\state]&$FFFFFF|\color\alpha<<24)
          Else
            Line( \x[3]+\width[3]/2-3, \y[3]+( \height[3]-8)/2,1,9, \color[3]\front[\color[3]\state]&$FFFFFF|\color\alpha<<24)
            Line( \x[3]+\width[3]/2, \y[3]+( \height[3]-8)/2,1,9, \color[3]\front[\color[3]\state]&$FFFFFF|\color\alpha<<24)
            Line( \x[3]+\width[3]/2+3, \y[3]+( \height[3]-8)/2,1,9, \color[3]\front[\color[3]\state]&$FFFFFF|\color\alpha<<24)
          EndIf
        EndIf
      EndIf
    EndWith 
  EndProcedure
  
  Procedure.i Draws(*Scroll._s_scroll, ScrollHeight.i, ScrollWidth.i)
    ;     Protected Repaint
    
    With *Scroll
      UnclipOutput()
      If \v And \v\page\len And \v\max<>ScrollHeight And 
         SetAttribute(\v, #__bar_Maximum, ScrollHeight)
        Resizes(*Scroll, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
      EndIf
      If \h And \h\page\len And \h\max<>ScrollWidth And
         SetAttribute(\h, #__bar_Maximum, ScrollWidth)
        Resizes(*Scroll, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
      EndIf
      
      If \v And Not \v\hide
        Draw(\v)
      EndIf
      If \h And Not \h\hide
        Draw(\h)
      EndIf
    EndWith
    
    ;     ProcedureReturn Repaint
  EndProcedure
  
  Procedure.b SetState(*this._struct_bar_, ScrollPos.i)
    Protected Result.b, Direction.i ; Направление и позиция скролла (вверх,вниз,влево,вправо)
    
    With *this
      If *this
        If ( \Vertical And \type = #PB_GadgetType_TrackBar) : ScrollPos = (( \max-\min)-ScrollPos) : EndIf
        
        If ScrollPos < \min : ScrollPos = \min : EndIf
        If ScrollPos > (\max-\page\len) ; ((\max-\min) - \page\len)
          ScrollPos = (\max-\page\len)
        EndIf
        
        If \page\pos <> ScrollPos 
          If \page\pos > ScrollPos
            Direction =- ScrollPos
          Else
            Direction = ScrollPos
          EndIf
          \page\pos = ScrollPos
          
          \thumb\pos = ThumbPos(*this, ScrollPos)
          
          If \s
            If \Vertical
              \s\y =- \page\pos
            Else
              \s\x =- \page\pos
            EndIf
            
            If \s\post\event
              If \s\post\widget
                PostEvent(\s\post\event, \s\post\window, \s\post\widget, #PB_EventType_ScrollChange, Direction) 
              Else
                PostEvent(\s\post\event, \s\post\window, \s\post\gadget, #PB_EventType_ScrollChange, Direction) 
              EndIf
            EndIf
          EndIf
          
          Result = #True
        EndIf
      EndIf
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i SetAttribute(*this._struct_bar_, Attribute.i, Value.i)
    Protected Result.i
    
    With *this
      If *this
        Select Attribute
          Case #__bar_Minimum
            If \min <> Value 
              \min = Value
              \page\pos = Value
              Result = #True
            EndIf
            
          Case #__bar_Maximum
            If \max <> Value
              If \min > Value
                \max = \min + 1
              Else
                \max = Value
              EndIf
              
              If \s
                If \Vertical
                  \s\height = \max
                Else
                  \s\width = \max
                EndIf
              EndIf
              
              \page\scrollStep = ( \max-\min) / 100
              
              Result = #True
            EndIf
            
          Case #__bar_PageLength
            If \page\len <> Value
              If Value > ( \max-\min) 
                If Not \max 
                  \max = Value ; Если этого page_length вызвать раньше maximum то не правильно работает 
                EndIf
                
                \page\len = ( \max-\min)
              Else
                \page\len = Value
              EndIf
              
              Result = #True
            EndIf
            
        EndSelect
      EndIf
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i SetColor(*this._struct_bar_, ColorType.i, Color.i, State.i=0, Item.i=0)
    Protected Result, Count 
    State =- 1
    If Item < 0 
      Item = 0 
    ElseIf Item > 3 
      Item = 3 
    EndIf
    
    With *this
      If State =- 1
        Count = 2
        \color\state = 0
      Else
        Count = State
        \color\state = State
      EndIf
      
      For State = \color\state To Count
        
        Select ColorType
          Case #__Color_Line
            If \color[Item]\line[State] <> Color 
              \color[Item]\line[State] = Color
              Result = #True
            EndIf
            
          Case #__Color_Back
            If \color[Item]\back[State] <> Color 
              \color[Item]\back[State] = Color
              Result = #True
            EndIf
            
          Case #__Color_Front
            If \color[Item]\front[State] <> Color 
              \color[Item]\front[State] = Color
              Result = #True
            EndIf
            
          Case #__Color_Frame
            If \color[Item]\frame[State] <> Color 
              \color[Item]\frame[State] = Color
              Result = #True
            EndIf
            
        EndSelect
        
      Next
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.b Resize(*this._struct_bar_, X.i,Y.i,Width.i,Height.i, *that._struct_bar_=#Null)
    Protected Lines.i, ScrollPage.i
    
    With *this
      ScrollPage = ((\max-\min) - \page\len)
      Lines = Bool(\type=#PB_GadgetType_ScrollBar)
      
      ;
      If *this <> *that And *that And *that\hide
        If \Vertical
          If Height=#PB_Ignore 
            Height=(*that\y+*that\height)-\y 
          EndIf
        Else
          If Width=#PB_Ignore
            Width=(*that\x+*that\width)-\x 
          EndIf
        EndIf
      EndIf
      
      ;
      If X=#PB_Ignore : X = \x[0] : EndIf 
      If Y=#PB_Ignore : Y = \y[0] : EndIf 
      If Width=#PB_Ignore : Width = \width[0] : EndIf 
      If Height=#PB_Ignore : Height = \height[0] : EndIf
      
      ; 
      \hide[1] = Bool(Not (\page\len And (\max-\min) > \page\len))
      
      If Not \hide[1]
        If \Vertical
          \area\pos = Y+\button\len
          \area\len = (Height-\button\len*2)
        Else
          \area\pos = X+\button\len
          \area\len = (Width-\button\len*2)
        EndIf
        
        If \area\len
          \thumb\len = ThumbLength(*this)
          
          If (\area\len > \button\len)
            If \button\len
              If (\thumb\len < \button\len)
                \area\len = Round( \area\len - ( \button\len-\thumb\len), #PB_Round_Nearest)
                \thumb\len = \button\len 
              EndIf
            Else
              If ( \thumb\len < 7)
                \area\len = Round( \area\len - (7-\thumb\len), #PB_Round_Nearest)
                \thumb\len = 7
              EndIf
            EndIf
          Else
            \thumb\len = \area\len 
          EndIf
          
          If \area\len > 0
            ; Debug " scroll set state "+\max+" "+\page\len+" "+Str( \thumb\pos+\thumb\len) +" "+ Str( \area\len+\button\len)
            If ( \type <> #PB_GadgetType_TrackBar) And (\thumb\pos+\thumb\len) >= (\area\pos+\area\len)
              SetState(*this, ScrollPage)
            EndIf
            
            \thumb\pos = ThumbPos(*this, \page\pos)
          EndIf
        EndIf
      EndIf
      
      \x[0] = X : \y[0] = Y : \width[0] = Width : \height[0] = Height                                          ; Set scroll bar coordinate
      
      If \Vertical
        \x[1] = X + Lines : \y[1] = Y : \width[1] = Width - Lines : \height[1] = \button\len                   ; Top button coordinate on scroll bar
        \x[2] = X + Lines : \width[2] = Width - Lines : \height[2] = \button\len : \y[2] = Y+Height-\height[2] ; Botom button coordinate on scroll bar
        \x[3] = X + Lines : \width[3] = Width - Lines : \y[3] = \thumb\pos : \height[3] = \thumb\len           ; Thumb coordinate on scroll bar
      Else
        \x[1] = X : \y[1] = Y + Lines : \width[1] = \button\len : \height[1] = Height - Lines                  ; Left button coordinate on scroll bar
        \y[2] = Y + Lines : \height[2] = Height - Lines : \width[2] = \button\len : \x[2] = X+Width-\width[2]  ; Right button coordinate on scroll bar
        \y[3] = Y + Lines : \height[3] = Height - Lines : \x[3] = \thumb\pos : \width[3] = \thumb\len          ; Thumb coordinate on scroll bar
      EndIf
      
      ProcedureReturn \hide[1]
    EndWith
  EndProcedure
  
  Procedure.b Updates(*Scroll._s_scroll, ScrollArea_X, ScrollArea_Y, ScrollArea_Width, ScrollArea_Height)
    Protected iWidth = X(*Scroll\v)-(*Scroll\v\width-*Scroll\v\round/2)+1, iHeight = Y(*Scroll\h)-(*Scroll\h\height-*Scroll\h\round/2)+1
    Static hPos, vPos : vPos = *Scroll\v\page\pos : hPos = *Scroll\h\page\pos
    
    ; Вправо работает как надо
    If ScrollArea_Width<*Scroll\h\page\pos+iWidth 
      ScrollArea_Width=*Scroll\h\page\pos+iWidth
      ; Влево работает как надо
    ElseIf ScrollArea_X>*Scroll\h\page\pos And
           ScrollArea_Width=*Scroll\h\page\pos+iWidth 
      ScrollArea_Width = iWidth 
    EndIf
    
    ; Вниз работает как надо
    If ScrollArea_Height<*Scroll\v\page\pos+iHeight
      ScrollArea_Height=*Scroll\v\page\pos+iHeight 
      ; Верх работает как надо
    ElseIf ScrollArea_Y>*Scroll\v\page\pos And
           ScrollArea_Height=*Scroll\v\page\pos+iHeight 
      ScrollArea_Height = iHeight 
    EndIf
    
    If ScrollArea_X>0 : ScrollArea_X=0 : EndIf
    If ScrollArea_Y>0 : ScrollArea_Y=0 : EndIf
    
    If ScrollArea_X<*Scroll\h\page\pos : ScrollArea_Width-ScrollArea_X : EndIf
    If ScrollArea_Y<*Scroll\v\page\pos : ScrollArea_Height-ScrollArea_Y : EndIf
    
    If *Scroll\v\max<>ScrollArea_Height : SetAttribute(*Scroll\v, #__bar_Maximum, ScrollArea_Height) : EndIf
    If *Scroll\h\max<>ScrollArea_Width : SetAttribute(*Scroll\h, #__bar_Maximum, ScrollArea_Width) : EndIf
    
    If *Scroll\v\page\len<>iHeight : SetAttribute(*Scroll\v, #__bar_PageLength, iHeight) : EndIf
    If *Scroll\h\page\len<>iWidth : SetAttribute(*Scroll\h, #__bar_PageLength, iWidth) : EndIf
    
    If ScrollArea_Y<0 : SetState(*Scroll\v, (ScrollArea_Height-ScrollArea_Y)-ScrollArea_Height) : EndIf
    If ScrollArea_X<0 : SetState(*Scroll\h, (ScrollArea_Width-ScrollArea_X)-ScrollArea_Width) : EndIf
    
    *Scroll\v\hide = Resize(*Scroll\v, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *Scroll\h) 
    *Scroll\h\hide = Resize(*Scroll\h, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *Scroll\v)
    
    If *Scroll\v\hide : *Scroll\v\page\pos = 0 : If vPos : *Scroll\v\hide = vPos : EndIf : Else : *Scroll\v\page\pos = vPos : *Scroll\h\width = iWidth+*Scroll\v\width : EndIf
    If *Scroll\h\hide : *Scroll\h\page\pos = 0 : If hPos : *Scroll\h\hide = hPos : EndIf : Else : *Scroll\h\page\pos = hPos : *Scroll\v\height = iHeight+*Scroll\h\height : EndIf
    
    ProcedureReturn Bool(ScrollArea_Height>=iHeight Or ScrollArea_Width>=iWidth)
  EndProcedure
  
  Procedure.b Resizes(*Scroll._s_scroll, X.i,Y.i,Width.i,Height.i)
    If Not Bool(*Scroll\v And *Scroll\h) 
      If *Scroll\v
        If Width<>#PB_Ignore
          X = Width-*Scroll\v\width
        EndIf
        ProcedureReturn Resize(*Scroll\v, X,#PB_Ignore,#PB_Ignore,Height.i)
        
      ElseIf *Scroll\h
        If Height<>#PB_Ignore
          Y = Height-*Scroll\h\height
        EndIf
        ProcedureReturn Resize(*Scroll\h, #PB_Ignore,Y,Width.i,#PB_Ignore)
        
      Else
        *Scroll\width[2] = Width
        *Scroll\height[2] = Height
        ProcedureReturn - 1
      EndIf
    EndIf
    
    If *Scroll\v And Y<>#PB_Ignore And *Scroll\v\max <> *Scroll\height
      SetAttribute(*Scroll\v, #__bar_Maximum, *Scroll\height)
    EndIf
    If *Scroll\h And X<>#PB_Ignore And *Scroll\h\max <> *Scroll\width
      SetAttribute(*Scroll\h, #__bar_Maximum, *Scroll\width)
    EndIf
    
    If Width=#PB_Ignore : Width = *Scroll\v\x : Else : Width+x-*Scroll\v\width : EndIf
    If Height=#PB_Ignore : Height = *Scroll\h\y : Else : Height+y-*Scroll\h\height : EndIf
    
    Protected iWidth = x(*Scroll\v)-*Scroll\h\x, iHeight = y(*Scroll\h)-*Scroll\v\y
    
    If *Scroll\v\width And *Scroll\v\page\len<>iHeight : SetAttribute(*Scroll\v, #__bar_PageLength, iHeight) : EndIf
    If *Scroll\h\height And *Scroll\h\page\len<>iWidth : SetAttribute(*Scroll\h, #__bar_PageLength, iWidth) : EndIf
    
    *Scroll\v\hide = Resize(*Scroll\v, Width, Y, #PB_Ignore, #PB_Ignore, *Scroll\h) : iWidth = x(*Scroll\v)-*Scroll\h\x
    *Scroll\h\hide = Resize(*Scroll\h, X, Height, #PB_Ignore, #PB_Ignore, *Scroll\v) : iHeight = y(*Scroll\h)-*Scroll\v\y
    
    If *Scroll\v\width And *Scroll\v\page\len<>iHeight : SetAttribute(*Scroll\v, #__bar_PageLength, iHeight) : EndIf
    If *Scroll\h\height And *Scroll\h\page\len<>iWidth : SetAttribute(*Scroll\h, #__bar_PageLength, iWidth) : EndIf
    
    If *Scroll\v\width : *Scroll\v\hide = Resize(*Scroll\v, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *Scroll\h) : EndIf
    If *Scroll\h\height : *Scroll\h\hide = Resize(*Scroll\h, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, *Scroll\v) : EndIf
    
    If *Scroll\v\hide : *Scroll\v\page\pos = 0 : *Scroll\y = 0 : Else
      If *Scroll\h\round : Resize(*Scroll\h, #PB_Ignore, #PB_Ignore, (*Scroll\v\x-*Scroll\h\x)+Bool(*Scroll\v\round)*4, #PB_Ignore) : EndIf
    EndIf
    If *Scroll\h\hide : *Scroll\h\page\pos = 0 : *Scroll\x = 0 : Else
      If *Scroll\v\round : Resize(*Scroll\v, #PB_Ignore, #PB_Ignore, #PB_Ignore, (*Scroll\h\y-*Scroll\v\y)+Bool(*Scroll\h\round)*4) : EndIf
    EndIf
    
    *Scroll\h\page\len = x(*Scroll\v)-*Scroll\h\x
    *Scroll\v\page\len = y(*Scroll\h)-*Scroll\v\y
    
    ProcedureReturn Bool(Not Bool(*Scroll\v\hide|*Scroll\h\hide))
  EndProcedure
  
  
  Procedure.i Events(*this._struct_bar_, EventType.i, mouseX.i, mouseY.i, at.i)
    Static delta, cursor
    Protected Repaint.i
    Protected window = EventWindow()
    Protected canvas = EventGadget()
    
    ;Debug EventType
    
    If *this
      With *this
        Select EventType
          Case #PB_EventType_LeftDoubleClick 
            Select at
              Case - 1
                ; If \height > ( \y[2]+\height[2])
                If \Vertical
                  Repaint = SetState(*this, Pos(*this, (mouseY-\thumb\len/2)))
                Else
                  Repaint = SetState(*this, Pos(*this, (mouseX-\thumb\len/2)))
                EndIf
                ; EndIf
            EndSelect
            
          Case #PB_EventType_LeftButtonUp : delta = 0
          Case #PB_EventType_LeftButtonDown 
            Select at
              Case 1 : Repaint = SetState(*this, ( \page\pos - \page\scrollStep))
              Case 2 : Repaint = SetState(*this, ( \page\pos + \page\scrollStep))
              Case 3 
                If \Vertical
                  delta = mouseY - \thumb\pos
                Else
                  delta = mouseX - \thumb\pos
                EndIf
            EndSelect
            
          Case #PB_EventType_MouseMove
            If delta
              If \Vertical
                Repaint = SetState(*this, Pos(*this, (mouseY-delta)))
              Else
                Repaint = SetState(*this, Pos(*this, (mouseX-delta)))
              EndIf
            EndIf
        EndSelect
        
        Select EventType
          Case #PB_EventType_MouseLeave
            If at > 0
              \color[at]\state = 0
            Else
              ; Debug ""+*this +" "+ EventType +" "+ at
              
              If cursor <> GetGadgetAttribute(canvas, #PB_Canvas_Cursor)
                SetGadgetAttribute(canvas, #PB_Canvas_Cursor, cursor)
              EndIf
              
              \color[1]\state = 0
              \color[2]\state = 0
              \color[3]\state = 0
            EndIf
            Repaint = #True
            
          Case #PB_EventType_LeftButtonDown, #PB_EventType_LeftButtonUp, #PB_EventType_MouseEnter
            If at>0
              \color[at]\state = 1+Bool(EventType=#PB_EventType_LeftButtonDown)
              
              Repaint = #True
            Else
              ; Debug ""+*this +" "+ EventType +" "+ at
              
              If Not cursor
                cursor = GetGadgetAttribute(canvas, #PB_Canvas_Cursor)
              EndIf
              SetGadgetAttribute(canvas, #PB_Canvas_Cursor, #PB_Cursor_Default)
              
            EndIf
        EndSelect
      EndWith
    EndIf  
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure.b CallBack(*this._struct_bar_, EventType.i, mouseX=0, mouseY=0)
    Protected repaint
    Static Last, Down, *Scroll._struct_bar_, *Last._struct_bar_, mouseB, mouseat
    
    With *this
      If *this And Not \hide And \color\alpha And \type = #PB_GadgetType_ScrollBar
        If Not mouseX
          mouseX = GetGadgetAttribute(EventGadget(), #PB_Canvas_MouseX)
        EndIf
        If Not mouseY
          mouseY = GetGadgetAttribute(EventGadget(), #PB_Canvas_MouseY)
        EndIf
        
        ; get at point buttons
        If mouseB
        ElseIf (mouseX>=\x And mouseX<\x+\width And mouseY>\y And mouseY=<\y+\height) 
          If (mouseX>\x[1] And mouseX=<\x[1]+\width[1] And  mouseY>\y[1] And mouseY=<\y[1]+\height[1])
            \from = 1
          ElseIf (mouseX>\x[3] And mouseX=<\x[3]+\width[3] And mouseY>\y[3] And mouseY=<\y[3]+\height[3])
            \from = 3
          ElseIf (mouseX>\x[2] And mouseX=<\x[2]+\width[2] And mouseY>\y[2] And mouseY=<\y[2]+\height[2])
            \from = 2
          Else
            \from =- 1
          EndIf 
          
          Select EventType 
            Case #PB_EventType_MouseEnter : EventType = #PB_EventType_MouseMove
            Case #PB_EventType_MouseLeave : EventType = #PB_EventType_MouseMove
          EndSelect
          
          mouseat = *this
        Else
          \from = 0
          
          Select EventType 
            Case #PB_EventType_MouseEnter, #PB_EventType_MouseLeave
              If \Vertical
                If \s And \s\h And \s\h\from
                  If \s\h\from > 0
                    repaint | Events(\s\h, EventType, mouseX, mouseY, \s\h\from)
                  EndIf
                  repaint | Events(\s\h, EventType, mouseX, mouseY, - 1)
                  If EventType = #PB_EventType_MouseLeave
                    *Scroll = 0
                  EndIf
                  
                  \s\h\from = 0
                EndIf
              EndIf     
              
              EventType = #PB_EventType_MouseMove
          EndSelect
          
          If \Vertical
            If \s And \s\h And \s\h\from
              If \color[2]\state
                repaint | Events(*this, #PB_EventType_MouseLeave, mouseX, mouseY, \from)
                ;                   repaint | Events(*this, #PB_EventType_MouseLeave, - 1)
                ;                   repaint | Events(\s\h, #PB_EventType_MouseEnter, - 1)
                repaint | Events(\s\h, #PB_EventType_MouseEnter, mouseX, mouseY, \s\h\from)
                \color[2]\state = 0
              EndIf
            Else
              mouseat = 0
            EndIf
          Else
            If \s And \s\v And \s\v\from
              If \color[2]\state
                repaint | Events(*this, #PB_EventType_MouseLeave, mouseX, mouseY, \from)
                ;                   repaint | Events(*this, #PB_EventType_MouseLeave, - 1)
                ;                   repaint | Events(\s\v, #PB_EventType_MouseEnter, - 1)
                repaint | Events(\s\v, #PB_EventType_MouseEnter, mouseX, mouseY, \s\v\from)
                \color[2]\state = 0
              EndIf
            Else
              mouseat = 0
            EndIf
          EndIf
          
        EndIf
        
        If *Scroll <> mouseat And 
           *this = mouseat
          *Last = *Scroll
          *Scroll = mouseat
        EndIf
        
        If *Scroll = *this
          If Last <> \from
            ;
            ; Debug ""+Last +" "+ *this\from +" "+ *this +" "+ *Last
            If Last > 0 Or (Last = 2 And \from =- 1 And *Last)
              repaint | Events(*this, #PB_EventType_MouseLeave, mouseX, mouseY, Last) : *Last = 0
            EndIf
            If Not \from Or (Last = 2 And \from =- 1 And *Last)
              repaint | Events(*this, #PB_EventType_MouseLeave, mouseX, mouseY, - 1) : *Last = 0
            EndIf
            
            If Not last ; Or (Last =- 1 And \from = 2 And *Last)
              repaint | Events(*this, #PB_EventType_MouseEnter, mouseX, mouseY, - 1)
            EndIf
            If \from > 0
              repaint | Events(*this, #PB_EventType_MouseEnter, mouseX, mouseY, \from)
            EndIf
            
            Last = \from
          EndIf
          
          Select EventType 
            Case #PB_EventType_LeftButtonDown
              mouseB = 1
              If \from
                Down = \from
                repaint | Events(*this, EventType, mouseX, mouseY, \from)
              EndIf
              
            Case #PB_EventType_LeftButtonUp 
              mouseB = 0
              If Down
                repaint | Events(*this, EventType, mouseX, mouseY, Down)
                Down = 0
              EndIf
              
            Case #PB_EventType_LeftDoubleClick, 
                 #PB_EventType_LeftButtonDown, 
                 #PB_EventType_MouseMove
              
              If \from
                repaint | Events(*this, EventType, mouseX, mouseY, \from)
              EndIf
          EndSelect
        EndIf
        
        ; ; ;           If AutoHide =- 1 : *Scroll = 0
        ; ; ;             AutoHide = Bool(EventType() = #PB_EventType_MouseLeave)
        ; ; ;           EndIf
        ; ; ;           
        ; ; ;           ; Auto hides
        ; ; ;           If (AutoHide And Not Drag And Not at) 
        ; ; ;             If \color\alpha <> \color\alpha[1] : \color\alpha = \color\alpha[1] 
        ; ; ;               repaint =- 1
        ; ; ;             EndIf 
        ; ; ;           EndIf
        ; ; ;           If EventType = #PB_EventType_MouseEnter And (*thisis = *this Or Not *Scroll)
        ; ; ;             If \color\alpha < 255 : \color\alpha = 255
        ; ; ;               
        ; ; ;               If *Scroll
        ; ; ;                 If \Vertical
        ; ; ;                   Resize(*this, #PB_Ignore, #PB_Ignore, #PB_Ignore, (*Scroll\y+*Scroll\height)-\y) 
        ; ; ;                 Else
        ; ; ;                   Resize(*this, #PB_Ignore, #PB_Ignore, (*Scroll\x+*Scroll\width)-\x, #PB_Ignore) 
        ; ; ;                 EndIf
        ; ; ;               EndIf
        ; ; ;               
        ; ; ;               repaint =- 2
        ; ; ;             EndIf 
        ; ; ;           EndIf
        
      EndIf
    EndWith
    
    ProcedureReturn repaint
  EndProcedure
  
  Procedure.i Bar(X.i,Y.i,Width.i,Height.i, Min.i, Max.i, PageLength.i, Flag.i, round.i=0)
    Protected *this._struct_bar_ = AllocateStructure(_struct_bar_)
    
    With *this
      \x =- 1
      \y =- 1
      \round = round
      \Vertical = Bool(Flag=#__bar_Vertical)
      \type = #PB_GadgetType_ScrollBar
      
      \arrowSize[1] = 4
      \arrowSize[2] = 4
      \arrowType[1] =- 1 ; -1 0 1
      \arrowType[2] =- 1 ; -1 0 1
      
      ; Цвет фона скролла
      \color\alpha = 255
      \color\alpha[1] = 0
      \color[0]\state = 0
      \color[0]\back[0] = $FFF9F9F9
      \color[0]\frame[0] = \color\back[0]
      \color[0]\line[0] = $FFFFFFFF
      
      \color[1] = _color_
      \color[2] = _color_
      \color[3] = _color_
      
      If \Vertical
        If width < 21
          \button\len = width - 1
        Else
          \button\len = 17
        EndIf
      Else
        If height < 21
          \button\len = height - 1
        Else
          \button\len = 17
        EndIf
      EndIf
      
      If \min <> Min : SetAttribute(*this, #__bar_Minimum, Min) : EndIf
      If \max <> Max : SetAttribute(*this, #__bar_Maximum, Max) : EndIf
      If \page\len <> Pagelength : SetAttribute(*this, #__bar_PageLength, Pagelength) : EndIf
    EndWith
    
    Resize(*this, X,Y,Width,Height)
    ProcedureReturn *this
  EndProcedure
  
  Procedure.i Bars(*Scroll._s_scroll, Size.i, round.i, Both.b)
    *Scroll\v = Bar(#PB_Ignore,#PB_Ignore,Size,#PB_Ignore, 0,0,0, #__bar_Vertical, round)
    *Scroll\v\hide = *Scroll\v\hide[1]
    *Scroll\v\s = *Scroll
    
    If Both
      *Scroll\h = Bar(#PB_Ignore,#PB_Ignore,#PB_Ignore,Size, 0,0,0, 0, round)
      *Scroll\h\hide = *Scroll\h\hide[1]
    Else
      *Scroll\h._s_bar = AllocateStructure(_s_bar)
      *Scroll\h\hide = 1
    EndIf
    *Scroll\h\s = *Scroll
    
    With *Scroll     
      If \post\function And \post\event
        UnbindEvent(\post\event, \post\function, \post\window, \post\gadget)
        BindEvent(\post\event, \post\function, \post\window, \post\gadget)
      EndIf
    EndWith
    
    ProcedureReturn *Scroll
  EndProcedure
EndModule

;-
DeclareModule Editor
  EnableExplicit
  UseModule Macros
  UseModule Constants
  UseModule Structures
  
  Macro _const_
    constants::#__
  EndMacro
  
;   Macro _struct_
;     structures::_s_widget
;   EndMacro
  
  Structure _struct_ Extends structures::_s_widget : EndStructure
  
  ;- - DECLAREs MACROs
  ;Declare.i Update(*this)
  
  ;- DECLARE
  Declare.i SetItemState(*this, Item.i, State.i)
  Declare   GetState(*this)
  Declare.s GetText(*this)
  Declare.i ClearItems(*this)
  Declare.i CountItems(*this)
  Declare.i RemoveItem(*this, Item.i)
  Declare   SetState(*this, State.i)
  Declare   GetAttribute(*this, Attribute.i)
  Declare   SetAttribute(*this, Attribute.i, Value.i)
  Declare   SetText(*this, Text.s, Item.i=0)
  Declare   SetFont(*this, FontID.i)
  Declare.i AddItem(*this, Item.i,Text.s,Image.i=-1,Flag.i=0)
  
  ;Declare.i Make(*this)
  Declare.i CallBack(*this, EventType.i, Canvas.i=-1, CanvasModifiers.i=-1)
  Declare.i Create(Canvas.i, Widget, X.l, Y.l, Width.l, Height.l, Text.s="", Flag.i=0, round.i=0)
  Declare.i Gadget(Gadget.i, X.l, Y.l, Width.l, Height.l, Flag.i=0)
  Declare.i ReDraw(*this)
  Declare.i Draw(*this)
EndDeclareModule

Module Editor
  ;   Global *Buffer = AllocateMemory(10000000)
  ;   Global *Pointer = *Buffer
  ;   
  ;   Procedure.i Update(*this._struct_)
  ;     *this\text\string.s = PeekS(*Buffer)
  ;     *this\text\change = 1
  ;   EndProcedure
  ; ;   UseModule Constant
  ;- PROCEDURE
  ;-
  
  Declare.i Canvas_CallBack()
  
  Macro _from_X_(_mouse_x_, _mouse_y_, _type_, _mode_=)
    Bool(_mouse_x_ > _type_\x#_mode_ And _mouse_x_ < (_type_\x#_mode_+_type_\width#_mode_))
  EndMacro
  
  Macro _from_Y_(_mouse_x_, _mouse_y_, _type_, _mode_=)
    Bool(_mouse_y_ > _type_\y#_mode_ And _mouse_y_ < (_type_\y#_mode_+_type_\height#_mode_))
  EndMacro
  
  Macro _from_point_(_mouse_x_, _mouse_y_, _type_, _mode_=)
    Bool(_from_X_(_mouse_x_, _mouse_y_, _type_, _mode_) And _from_Y_(_mouse_x_, _mouse_y_, _type_, _mode_))
  EndMacro
  
  
  Macro _set_content_Y_(_this_)
    If _this_\image\handle
      If _this_\flag\inLine
        Text_Y=((Height-(_this_\text\height*_this_\countitems))/2)
        Image_Y=((Height-_this_\image\height)/2)
      Else
        If _this_\text\align\bottom
          Text_Y=((Height-_this_\image\height-(_this_\text\height*_this_\countitems))/2)-Indent/2
          Image_Y=(Height-_this_\image\height+(_this_\text\height*_this_\countitems))/2+Indent/2
        Else
          Text_Y=((Height-(_this_\text\height*_this_\countitems)+_this_\image\height)/2)+Indent/2
          Image_Y=(Height-(_this_\text\height*_this_\countitems)-_this_\image\height)/2-Indent/2
        EndIf
      EndIf
    Else
      If _this_\text\align\bottom
        Text_Y=(Height-(_this_\text\height*_this_\countitems)-Text_Y-Image_Y) 
      ElseIf _this_\text\align\Vertical
        Text_Y=((Height-(_this_\text\height*_this_\countitems))/2)
      EndIf
    EndIf
  EndMacro
  
  Macro _set_content_X_(_this_)
    If _this_\image\handle
      If _this_\flag\inLine
        If _this_\text\align\right
          Text_X=((Width-_this_\image\width-_this_\row\_s()\text\width)/2)-Indent/2
          Image_X=(Width-_this_\image\width+_this_\row\_s()\text\width)/2+Indent
        Else
          Text_X=((Width-_this_\row\_s()\text\width+_this_\image\width)/2)+Indent
          Image_X=(Width-_this_\row\_s()\text\width-_this_\image\width)/2-Indent
        EndIf
      Else
        Image_X=(Width-_this_\image\width)/2 
        Text_X=(Width-_this_\row\_s()\text\width)/2 
      EndIf
    Else
      If _this_\text\align\right
        Text_X=(Width-_this_\row\_s()\text\width)
      ElseIf _this_\text\align\horizontal
        Text_X=(Width-_this_\row\_s()\text\width-Bool(_this_\row\_s()\text\width % 2))/2 
      Else
        Text_X=_this_\row\margin\width
      EndIf
    EndIf
  EndMacro
  
  Macro _line_resize_X_(_this_)
    _this_\row\_s()\x = _this_\x[2]+_this_\text\x
    _this_\row\_s()\width = Width
    _this_\row\_s()\text\x = _this_\row\_s()\x+Text_X
    
    _this_\image\x = _this_\x[2]+_this_\text\x+Image_X
    _this_\row\_s()\image\x = _this_\row\_s()\x+Image_X-4
  EndMacro
  
  Macro _line_resize_Y_(_this_)
    _this_\row\_s()\y = _this_\y[1]+_this_\text\y+_this_\scroll\height+Text_Y
    _this_\row\_s()\height = _this_\text\height - Bool(_this_\countitems<>1 And _this_\flag\gridLines)
    _this_\row\_s()\text\y = _this_\row\_s()\y + (_this_\row\_s()\height-_this_\text\height)/2 - Bool(#PB_Compiler_OS <> #PB_OS_MacOS And _this_\countitems<>1)
    _this_\row\_s()\text\height = _this_\text\height
    
    _this_\image\y = _this_\y[1]+_this_\text\y+Image_Y
    _this_\row\_s()\image\y = _this_\row\_s()\y + (_this_\text\height-_this_\row\_s()\image\height)/2 + Image_Y
  EndMacro
  
  Macro _make_line_pos_(_this_)
    _this_\row\_s()\text\pos = _this_\text\pos
    _this_\row\_s()\text\len = Len(_this_\row\_s()\text\string.s)
    _this_\text\pos + _this_\row\_s()\text\len + 1 ; Len(#LF$)
  EndMacro
  
  Macro _make_scroll_height_(_this_)
    _this_\scroll\height + _this_\text\height
  EndMacro
  
  Macro _make_scroll_width_(_this_)
    If Not _this_\row\_s()\hide And
       _this_\scroll\width < (_this_\row\_s()\text\x+_this_\row\_s()\text\width)-_this_\x
      _this_\scroll\width = (_this_\row\_s()\text\x+_this_\row\_s()\text\width)-_this_\x
      
      _this_\text\_scroll_line_index = _this_\row\_s()\index ; Позиция в тексте самой длинной строки
    EndIf
  EndMacro
  
  Macro _repaint_(_this_)
    If _this_\root And Not _this_\repaint : _this_\repaint = 1
      PostEvent(#PB_Event_Gadget, _this_\root\window, _this_\root\canvas, #PB_EventType_Repaint);, _this_)
    EndIf
  EndMacro 
  
  Macro _repaint_items_(_this_)
    If _this_\countitems = 0 Or 
       (Not _this_\hide And _this_\row\count And 
        (_this_\countitems % _this_\row\count) = 0)
      
      _this_\change = 1
      _this_\row\count = _this_\countitems
      _repaint_(_this_)
    EndIf  
  EndMacro
  
  
  
  ;-
  ;- PUBLIC
  Global _caret_last_len_ 
  
  
  Procedure _start_drawing_(*this._struct_)
    If StartDrawing(CanvasOutput(*this\root\canvas)) 
      
      If *this\text\fontID
        DrawingFont(*this\text\fontID) 
      EndIf
      
      ProcedureReturn #True
    EndIf    
  EndProcedure
  
  Macro _bar_scrolled_(_this_, _pos_, _len_=0)
    Bool(Bool(((_pos_)-_this_\page\pos) < 0 And Bar::SetState(_this_, (_pos_))) Or
         Bool(((_pos_)-_this_\page\pos) > (_this_\page\len-_len_) And Bar::SetState(_this_, (_pos_)-(_this_\page\len-_len_))))
  EndMacro
  
  ;-
  Macro _text_scroll_x_(_this_)
    If _this_\row\caret\x And (_this_\scroll\h\page\pos+_this_\text\x+_this_\row\margin\width) > _this_\row\caret\x
      ; to left 
      _bar_scrolled_(_this_\scroll\h, _this_\row\caret\x-(_this_\scroll\h\x+_this_\text\x+_this_\row\margin\width), 0)
    ElseIf _this_\scroll\h\page\pos < (_this_\row\caret\x-_this_\scroll\h\width)
      ; to right 
      _bar_scrolled_(_this_\scroll\h, (_this_\row\caret\x+_this_\bs)-_this_\scroll\h\x, 0)
    EndIf
  EndMacro
  
  Macro _text_sel_reset_(_this_)
    _this_\text[1]\len = 0 
    _this_\text[2]\len = 0 
    _this_\text[3]\len = 0 
    
    _this_\text[1]\pos = 0 
    _this_\text[2]\pos = 0 
    _this_\text[3]\pos = 0 
    
    _this_\text[1]\width = 0 
    _this_\text[2]\width = 0 
    _this_\text[3]\width = 0 
    
    _this_\text[1]\string = ""
    _this_\text[2]\string = "" 
    _this_\text[3]\string = ""
  EndMacro
  
  Macro _text_is_sel_line_(_this_)
    Bool(_this_\row\_s()\text[2]\width And 
         _this_\root\mouse\x > _this_\row\_s()\text[2]\x-*this\scroll\h\page\pos And
         _this_\root\mouse\y > _this_\row\_s()\text\y-*this\scroll\v\page\pos And 
         _this_\root\mouse\y < (_this_\row\_s()\text\y+_this_\row\_s()\text\height)-*this\scroll\v\page\pos And
         _this_\root\mouse\x < (_this_\row\_s()\text[2]\x+_this_\row\_s()\text[2]\width)-*this\scroll\h\page\pos)
  EndMacro
  
  Procedure.l _text_caret_(*this._struct_)
    Protected i.l, X.l, Position.l =- 1,  
              MouseX.l, Distance.f, MinDistance.f = Infinity()
    
    MouseX = *this\root\mouse\x - (*this\row\_s()\text\x-*this\scroll\h\page\pos)
    
    ; Get caret pos
    For i = 0 To *this\row\_s()\text\len
      X = TextWidth(Left(*this\row\_s()\text\string, i))
      Distance = (MouseX-X)*(MouseX-X)
      
      If MinDistance > Distance 
        MinDistance = Distance
        Position = i
      EndIf
    Next 
    
    ProcedureReturn Position
  EndProcedure
  
  Procedure _text_sel_(*this._struct_, _pos_, _len_)
    If _pos_ < 0 : _pos_ = 0 : EndIf
    If _len_ < 0 : _len_ = 0 : EndIf
    
    If _pos_ > *this\row\_s()\text\len
      _pos_ = *this\row\_s()\text\len
    EndIf
    
    If _len_ > *this\row\_s()\text\len
      _len_ = *this\row\_s()\text\len
    EndIf
    
    *this\row\_s()\text[1]\pos = 0 
    *this\row\_s()\text[1]\len = _pos_ 
    
    *this\row\_s()\text[2]\pos = *this\row\_s()\text[1]\len
    *this\row\_s()\text[2]\len = _len_
    
    *this\row\_s()\text[3]\pos = *this\row\_s()\text[2]\pos+*this\row\_s()\text[2]\len 
    *this\row\_s()\text[3]\len = *this\row\_s()\text\len-*this\row\_s()\text[3]\pos
    
    ; Get string left;selected;right
    If *this\row\_s()\text[1]\len > 0
      *this\row\_s()\text[1]\string = Left(*this\row\_s()\text\string, *this\row\_s()\text[1]\len)
      *this\row\_s()\text[1]\width = TextWidth(*this\row\_s()\text[1]\string) 
    Else
      *this\row\_s()\text[1]\string = ""
      *this\row\_s()\text[1]\width = 0
    EndIf
    If *this\row\_s()\text[2]\len > 0
      *this\row\_s()\text[2]\string = Mid(*this\row\_s()\text\string, 1 + *this\row\_s()\text[2]\pos, *this\row\_s()\text[2]\len)
      *this\row\_s()\text[2]\width = TextWidth(*this\row\_s()\text[2]\string) + _caret_last_len_
    Else
      *this\row\_s()\text[2]\string = ""
      *this\row\_s()\text[2]\width = _caret_last_len_
    EndIf
    If *this\row\_s()\text[3]\len > 0
      *this\row\_s()\text[3]\string = Right(*this\row\_s()\text\string, *this\row\_s()\text[3]\len)
      *this\row\_s()\text[3]\width = TextWidth(*this\row\_s()\text[3]\string)  
    Else
      *this\row\_s()\text[3]\string = ""
      *this\row\_s()\text[3]\width = 0
    EndIf
    
    ; text/pos/len/state
    If *this\index[2] >= *this\row\_s()\index
      *this\text[1]\len = (*this\row\_s()\text\pos+*this\row\_s()\text[2]\pos)
      *this\text[2]\pos = *this\text[1]\len
    EndIf
    
    If *this\index[2] =< *this\row\_s()\index
      *this\text[3]\pos = (*this\row\_s()\text\pos+*this\row\_s()\text[3]\pos)
      *this\text[3]\len = (*this\text\len-*this\text[3]\pos)
    EndIf
    
    If *this\text[2]\len <> (*this\text[3]\pos-*this\text[2]\pos)
      *this\text[2]\len = (*this\text[3]\pos-*this\text[2]\pos)
    EndIf
    
    ; Get text left;selected;right
    If *this\text[1]\len > 0
      *this\text[1]\string = Left(*this\text\string.s, *this\text[1]\len) 
    Else
      *this\text[1]\string = ""
    EndIf
    If *this\text[2]\len > 0
      *this\text[2]\string = Mid(*this\text\string.s, 1 + *this\text[2]\pos, *this\text[2]\len) 
    Else
      *this\text[2]\string = ""
    EndIf
    If *this\text[3]\len > 0
      *this\text[3]\string = Right(*this\text\string.s, *this\text[3]\len)
    Else
      *this\text[3]\string = ""
    EndIf
    
    CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
      ; because bug in mac os
      If *this\row\_s()\text[2]\width And Not (*this\index[1] = *this\index[2] And *this\row\caret\stop > *this\row\caret\start) And
         *this\row\_s()\text[2]\width <> *this\row\_s()\text\width - (*this\row\_s()\text[1]\width+*this\row\_s()\text[3]\width) + _caret_last_len_
        *this\row\_s()\text[2]\width = *this\row\_s()\text\width - (*this\row\_s()\text[1]\width+*this\row\_s()\text[3]\width) + _caret_last_len_
      EndIf
    CompilerEndIf
    
    *this\row\_s()\text[1]\x = *this\row\_s()\text\x 
    *this\row\_s()\text[2]\x = (*this\row\_s()\text[1]\x+*this\row\_s()\text[1]\width) 
    *this\row\_s()\text[3]\x = (*this\row\_s()\text[2]\x+*this\row\_s()\text[2]\width)
    
    ; set cursor pos
    *this\row\caret\y = *this\row\_s()\text\y
    *this\row\caret\height = *this\row\_s()\text\height - 1
    
    If *this\index[1] > *this\index[2] Or
       (*this\index[1] = *this\index[2] And *this\row\caret\stop > *this\row\caret\start)
      *this\row\caret\x = *this\row\_s()\text[3]\x
    Else
      *this\row\caret\x = *this\row\_s()\text[2]\x
    EndIf
    
    ;     ClearDebugOutput()
    ;     Debug *this\text[1]\len
    ;     Debug *this\text[1]\string.s
    
    _caret_last_len_ = 0
    
  EndProcedure
  
  Procedure _text_sel_set_(*this._struct_, _line_, _caret_) ; Ok
    Protected Repaint.l, Pos.l, Len.l, _last_line_
    
    If *this\row\caret\stop <> _caret_
      *this\row\caret\stop = _caret_
      Repaint =- 1
    EndIf
    
    If *this\index[1] <> _line_ 
      
      If *this\index[2] = *this\index[1]
        PushListPosition(*this\row\_s())
        SelectElement(*this\row\_s(), *this\index[2]) 
        
        If *this\index[2] > _line_
          ; to top
          Pos = 0
          Len = *this\row\caret\start    
        Else
          ; to bottom
          Pos = *this\row\caret\start
          Len = (*this\row\_s()\text\len-Pos)
          _caret_last_len_ = *this\flag\fullSelection   
        EndIf
        
        _text_sel_(*this, Pos, Len)
        PopListPosition(*this\row\_s())
        ; SelectElement(*this\row\_s(), _line_) 
      EndIf
      
      *this\index[1] = _line_
      Repaint = 1
    EndIf
    
    If Repaint
      If *this\index[2] = _line_
        If *this\row\caret\start = *this\row\caret\stop 
          Pos = *this\row\caret\start
          ; Если выделяем справо на лево
        ElseIf *this\row\caret\start > *this\row\caret\stop 
          ; |<<<<<< to left
          Pos = *this\row\caret\stop 
          Len = (*this\row\caret\start-Pos)
        Else 
          ; >>>>>>| to right
          Pos = *this\row\caret\start
          Len = (*this\row\caret\stop-Pos)
        EndIf
        
        ; Если выделяем снизу вверх
      ElseIf *this\index[2] > _line_
        ; to top
        Pos = *this\row\caret\stop
        Len = (*this\row\_s()\text\len-Pos)
        _caret_last_len_ = *this\flag\fullSelection
        
      Else
        ; to bottom
        Pos = 0
        Len = *this\row\caret\stop
      EndIf
      
      _text_sel_(*this, Pos, Len)
      
      
      If Repaint > 0
        ;Debug "    "+#PB_Compiler_Procedure
        
        *this\change = _bar_scrolled_(*this\scroll\v, *this\row\_s()\y-*this\scroll\v\y, *this\row\_s()\height)
        
        PushListPosition(*this\row\_s()) 
        ForEach *this\row\_s()
          If Bool((*this\index[2] > *this\row\_s()\index And _line_ < *this\row\_s()\index) Or   ; верх
                  (*this\index[2] < *this\row\_s()\index And _line_ > *this\row\_s()\index))     ; вниз
            
            ; Выделения целых строк
            *this\row\_s()\text[1]\len = 0 
            *this\row\_s()\text[3]\len = 0 
            
            ;*this\row\_s()\text[1]\pos = 0 
            *this\row\_s()\text[2]\pos = 0
            *this\row\_s()\text[3]\pos = 0 
            
            *this\row\_s()\text[1]\string = ""
            *this\row\_s()\text[2]\string = *this\row\_s()\text\string 
            *this\row\_s()\text[3]\string = ""
            
            *this\row\_s()\text[1]\width = 0 
            If *this\row\_s()\text[2]\string
              *this\row\_s()\text[2]\len = *this\row\_s()\text\len
              *this\row\_s()\text[2]\width = TextWidth(*this\row\_s()\text[2]\string) + *this\flag\fullSelection
            Else
              ;  *this\row\_s()\text[2]\len =- 1
              *this\row\_s()\text[2]\width = *this\flag\fullSelection
            EndIf
            *this\row\_s()\text[3]\width = 0 
            
            *this\row\_s()\text[1]\x = *this\row\_s()\text\x 
            *this\row\_s()\text[2]\x = *this\row\_s()\text\x  
            *this\row\_s()\text[3]\x = *this\row\_s()\text\x  
            
          ElseIf (*this\row\_s()\text[2]\width <> 0 And *this\index[2] <> *this\row\_s()\index And _line_ <> *this\row\_s()\index)
            
            ; Сброс выделения целых строк
            _text_sel_reset_(*this\row\_s())
            
          EndIf
        Next
        PopListPosition(*this\row\_s()) 
        
      ElseIf Repaint < 0
        _text_scroll_x_(*this)
      EndIf
    EndIf 
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure _text_set_selector_(*this._struct_, _line_, _caret_=-1)
    Protected Repaint.b
    
    With *this
      ; select enter mouse item
      If _line_ >= 0 And 
         _line_ < *this\countitems And 
         _line_ <> *this\row\_s()\index And
         SelectElement(*this\row\_s(), _line_) 
      EndIf
      
      If _start_drawing_(*this)
        
        If _caret_ =- 1
          _caret_ = _text_caret_(*this) 
        EndIf
        
        ; если перемещаем выделеный текст
        If *this\row\box\checked 
          If *this\index[1] <> _line_
            *this\index[1] = _line_
            Repaint = 1
          EndIf
          
          If _text_is_sel_line_(*this)
            If *this\row\caret\start <> *this\row\_s()\text[1]\len
              *this\row\caret\start = *this\row\_s()\text[1]\len
              *this\row\caret\stop = *this\row\_s()\text[1]\len+*this\row\_s()\text[2]\len
              
              If _caret_ < *this\row\_s()\text[1]\len+*this\row\_s()\text[2]\len/2
                _caret_ = *this\row\_s()\text[1]\len
              Else
                _caret_ = *this\row\_s()\text[1]\len+*this\row\_s()\text[2]\len
              EndIf
              
              Repaint =- 1
            EndIf
          Else
            If *this\row\caret\start <> _caret_
              *this\row\caret\start = _caret_
              *this\row\caret\stop = _caret_
              Repaint =- 1
            EndIf
          EndIf
          
          If Repaint 
            ; set cursor pos
            *this\row\caret\y = *this\row\_s()\text\y
            *this\row\caret\height = *this\row\_s()\text\height - 1
            *this\row\caret\x = *this\row\_s()\text\x + TextWidth(Left(*this\row\_s()\text\string, _caret_))
            _text_scroll_x_(*this)
          EndIf
          
        Else
          Repaint = _text_sel_set_(*this, _line_, _caret_)
        EndIf
        
        StopDrawing() 
      EndIf
    EndWith
    
    ProcedureReturn Bool(Repaint)
  EndProcedure
  
  Macro _text_sel_end_(_char_)
    Bool((_char_ > = ' ' And _char_ = < '/') Or 
         (_char_ > = ':' And _char_ = < '@') Or 
         (_char_ > = '[' And _char_ = < 96) Or 
         (_char_ > = '{' And _char_ = < '~'))
  EndMacro
  
  Procedure.i _text_sel_start_(*this._struct_)
    Protected result.i, i.i, char.i
    
    With *this
      ; |<<<<<< left edge of the word 
      If \row\caret\stop > 0 
        For i = \row\caret\stop - 1 To 1 Step - 1
          char = Asc(Mid(\row\_s()\text\string.s, i, 1))
          If _text_sel_end_(char)
            Break
          EndIf
        Next 
        
        result = i
      EndIf
    EndWith  
    
    ProcedureReturn result
  EndProcedure
  
  Procedure.i _text_sel_stop_(*this._struct_)
    Protected result.i, i.i, char.i
    
    With *this
      ; >>>>>>| right edge of the word
      For i = \row\caret\stop + 2 To \row\_s()\text\len
        char = Asc(Mid(\row\_s()\text\string.s, i, 1))
        If _text_sel_end_(char)
          Break
        EndIf
      Next 
      
      result = i - 1
    EndWith  
    
    ProcedureReturn result
  EndProcedure
  
  Procedure.s text_insert_make(*this._struct_, Text.s)
    Protected String.s, i.i, Len.i
    
    With *this
      If \text\numeric And Text.s <> #LF$
        Static Dot, Minus
        Protected Chr.s, Input.i, left.s, count.i
        
        Len = Len(Text.s) 
        For i = 1 To Len 
          Chr = Mid(Text.s, i, 1)
          Input = Asc(Chr)
          
          Select Input
            Case '0' To '9', '.','-'
            Case 'Ю','ю','Б','б',44,47,60,62,63 : Input = '.' : Chr = Chr(Input)
            Default
              Input = 0
          EndSelect
          
          If Input
            If \type = #PB_GadgetType_IPAddress
              left.s = Left(\text\string, \row\caret\stop )
              Select CountString(left.s, ".")
                Case 0 : left.s = StringField(left.s, 1, ".")
                Case 1 : left.s = StringField(left.s, 2, ".")
                Case 2 : left.s = StringField(left.s, 3, ".")
                Case 3 : left.s = StringField(left.s, 4, ".")
              EndSelect                                           
              count = Len(left.s+Trim(StringField(Mid(\text\string, \row\caret\stop +1), 1, "."), #LF$))
              If count < 3 And (Val(left.s) > 25 Or Val(left.s+Chr.s) > 255)
                Continue
                ;               ElseIf Mid(\text\string, \row\caret\stop + 1, 1) = "."
                ;                 \row\caret\stop + 1 : \row\caret\start=\row\caret\stop 
              EndIf
            EndIf
            
            If Not Dot And Input = '.' And Mid(\text\string, \row\caret\stop + 1, 1) <> "."
              Dot = 1
            ElseIf Input <> '.' And count < 3
              Dot = 0
            Else
              Continue
            EndIf
            
            If Not Minus And Input = '-' And Mid(\text\string, \row\caret\stop + 1, 1) <> "-"
              Minus = 1
            ElseIf Input <> '-'
              Minus = 0
            Else
              Continue
            EndIf
            
            String.s + Chr
          EndIf
        Next
        
      ElseIf \text\pass
        Len = Len(Text.s) 
        For i = 1 To Len : String.s + "●" : Next
        
      Else
        Select #True
          Case \text\lower : String.s = LCase(Text.s)
          Case \text\upper : String.s = UCase(Text.s)
          Default
            String.s = Text.s
        EndSelect
      EndIf
    EndWith
    
    ProcedureReturn String.s
  EndProcedure
  
  Procedure.s text_wrap(Text.s, Width.i, Mode.i=-1, nl$=#LF$, DelimList$=" "+Chr(9))
    Protected.i CountString, i, start, ii, found, length
    Protected line$, ret$="", LineRet$=""
    
    ;     Text.s = ReplaceString(Text.s, #LFCR$, #LF$)
    ;     Text.s = ReplaceString(Text.s, #CRLF$, #LF$)
    ;     Text.s = ReplaceString(Text.s, #CR$, #LF$)
    ;     Text.s + #LF$
    ;     
    CountString = CountString(Text.s, #LF$) ;+ 1
    
    For i = 1 To CountString
      line$ = StringField(Text.s, i, #LF$)
      start = Len(line$)
      length = start
      
      ; Get text len
      While length > 1
        If width > TextWidth(RTrim(Left(line$, length)))
          Break
        Else
          length - 1 
        EndIf
      Wend
      
      While start > length 
        If mode
          For ii = length To 0 Step - 1
            If mode = 2 And CountString(Left(line$,ii), " ") > 1     And width > 71 ; button
              found + FindString(delimList$, Mid(RTrim(line$),ii,1))
              If found <> 2
                Continue
              EndIf
            Else
              found = FindString(delimList$, Mid(line$,ii,1))
            EndIf
            
            If found
              start = ii
              Break
            EndIf
          Next
        EndIf
        
        If found
          found = 0
        Else
          start = length
        EndIf
        
        LineRet$ + Left(line$, start) + nl$
        line$ = LTrim(Mid(line$, start+1))
        start = Len(line$)
        length = start
        
        ; Get text len
        While length > 1
          If width > TextWidth(RTrim(Left(line$, length)))
            Break
          Else
            length - 1 
          EndIf
        Wend
      Wend
      
      ret$ + LineRet$ + line$ + nl$
      LineRet$=""
    Next
    
    If Width > 1
      ProcedureReturn ret$ ; ReplaceString(ret$, " ", "*")
    EndIf
  EndProcedure
  
  Procedure.i text_multiline_make(*this._struct_)
    Static string_out.s
    Protected Repaint, String.s, text_width
    Protected IT,Text_Y,Text_X,Width,Height, Image_Y, Image_X, Indent=4
    
    With *this
      If \vertical
        Width = \height[2]
        Height = \width[2]
      Else
        width = \width[2]-\text\x  ; -\row\margin\width
        height = \height[2]
      EndIf
      
      If \text\multiLine > 0
        String.s = text_wrap(\text\string.s+#LF$, Width, \text\multiLine)
      Else
        String.s = \text\string.s
      EndIf
      
      
      If string_out <> String.s 
        string_out = String.s
        \countitems = CountString(String.s, #LF$)
        
        If \row\margin\level
          \row\margin\width = TextWidth(Str(\countitems))+11
        EndIf
          
        ; reset 
        \text\pos = 0
        \scroll\width = 0
        _set_content_Y_(*this)
        
        ; 
        If ListSize(\row\_s()) 
          _text_sel_(*this, *this\row\caret\stop, 0)
          _text_scroll_x_(*this)
        EndIf
        
        If \text\count <> \countitems 
          \text\count = \countitems
          
          ; Scroll hight reset 
          \scroll\height = 0
          ClearList(\row\_s())
          
          
          Protected *Sta.Character = @string_out, *End.Character = @string_out 
          ;Protected *Sta.Character = @string, *End.Character = @string 
          Protected time = ElapsedMilliseconds()
          ; ;           While *End\c : If *End\c = #LF : String = PeekS (*Sta, (*End-*Sta)/#__sOC)
          
          If CreateRegularExpression(0, ~".*\n?")
            ; If CreateRegularExpression(0, ~"^.*", #PB_RegularExpression_MultiLine)
            If ExamineRegularExpression(0, string_out)
              While NextRegularExpressionMatch(0)  ; 239
                String.s = Trim(RegularExpressionMatchString(0), #LF$)
                
                
                If AddElement(\row\_s())
                  If \type = #PB_GadgetType_Button
                    \row\_s()\text\width = TextWidth(RTrim(String.s))
                  Else
                    \row\_s()\text\width = TextWidth(String.s)
                  EndIf
                  
                  \row\_s()\draw = 1
                  
                  \row\_s()\color\state = 1 ; Set line default colors
                  ;\row\_s()\round = \round
                  \row\_s()\text\string.s = String.s
                  \row\_s()\index = ListIndex(\row\_s())
                  
                  ; Update line pos in the text
                  _make_line_pos_(*this)
                  
                  ; Debug "f - "+String.s +" "+ CountString(String, #CR$) +" "+ CountString(String, #LF$) +" - "+ \row\_s()\text\pos +" "+ \row\_s()\text\len
                  
                  _set_content_X_(*this)
                  _line_resize_X_(*this)
                  _line_resize_Y_(*this)
                  
                  ; Scroll width length
                  _make_scroll_width_(*this)
                  
                  ; Scroll hight length
                  _make_scroll_height_(*this)
                  
                  *this\row\_s()\margin\padding = 3
                  *this\row\_s()\margin\string = Str(\row\_s()\index)
                  *this\row\_s()\margin\x = *this\x[2] + *this\row\margin\width - TextWidth(*this\row\_s()\margin\string) - *this\row\_s()\margin\padding
                  *this\row\_s()\margin\y = \row\_s()\text\y
                EndIf
                
              Wend
            EndIf
            
            FreeRegularExpression(0)
          Else
            Debug RegularExpressionError()
          EndIf
          
          
          ; ;           *Sta = *End + #__sOC : EndIf : *End + #__sOC : Wend
          
          ;  MessageRequester("", Str(ElapsedMilliseconds()-time) + " text parse time ")
          Debug Str(ElapsedMilliseconds()-time) + " text parse time "
          
        Else
          Protected time2 = ElapsedMilliseconds()
          
          ; If CreateRegularExpression(0, ~".*\n?\r?")
          If CreateRegularExpression(0, ~".*\n?")
            ; If CreateRegularExpression(0, ~"^.*", #PB_RegularExpression_MultiLine)
            If ExamineRegularExpression(0, string_out)
              While NextRegularExpressionMatch(0)
                String.s = Trim(RegularExpressionMatchString(0), #LF$)
                
                ;         Debug "    Position: " + Str(RegularExpressionMatchPosition(0))
                ;         Debug "    Length: " + Str(RegularExpressionMatchLength(0))
                IT+1
                If SelectElement(\row\_s(), IT-1)
                  If \row\_s()\text\string.s <> String.s Or \row\_s()\text\change
                    \row\_s()\text\string.s = String.s
                    
                    If \type = #PB_GadgetType_Button
                      \row\_s()\text\width = TextWidth(RTrim(String.s))
                    Else
                      \row\_s()\text\width = TextWidth(String.s)
                    EndIf
                  EndIf
                  
                  ; Update line pos in the text
                  _make_line_pos_(*this)
                  
                  Protected Left = (*this\row\_s()\text[1]\width+*this\row\_s()\text[2]\width+*this\text\x) - *this\width[2]
                  
                  ; Resize item
                  If (Left And Not  Bool(\scroll\x = Left))
                    _set_content_X_(*this)
                  EndIf
                  
                  _line_resize_X_(*this)
                  
                  ; Set scroll width length
                  _make_scroll_width_(*this)
                EndIf
                
              Wend
            EndIf
            
            FreeRegularExpression(0)
          Else
            Debug RegularExpressionError()
          EndIf
          
          Debug Str(ElapsedMilliseconds()-time2) + " text parse time2 "
          
        EndIf
      Else
        ; Scroll hight reset 
        \scroll\height = 0
        _set_content_Y_(*this)
        
        ForEach \row\_s()
          If Not \row\_s()\hide
            _set_content_X_(*this)
            _line_resize_X_(*this)
            _line_resize_Y_(*this)
            
            ; Scroll hight length
            _make_scroll_height_(*this)
          EndIf
        Next
      EndIf
      
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  ;-
  ;- - KEYBOARDs
  Procedure.b text_paste(*this._struct_, Chr.s, Count.l=0)
    Protected Repaint.b
    
    With *this
      If \index[1] <> \index[2] ; Это значить строки выделени
        If \index[2] > \index[1] : Swap \index[2], \index[1] : EndIf
        
        If Count
          \index[2] + Count
          \row\caret\stop = Len(StringField(Chr.s, 1 + Count, #LF$))
        ElseIf Chr.s = #LF$ ; to return
          \index[2] + 1
          \row\caret\stop = 0
        Else
          SelectElement(\row\_s(), \index[2])
          ;Debug " sss "+\index[2]+" "+\row\_s()\text\string
          \row\caret\stop = \row\_s()\text[1]\len + Len(Chr.s)
        EndIf
        
        ; reset items selection
        PushListPosition(*this\row\_s())
        ForEach *this\row\_s()
          If *this\row\_s()\text[2]\width <> 0 
            _text_sel_reset_(*this\row\_s())
          EndIf
        Next
        PopListPosition(*this\row\_s())
        
        \row\caret\start = \row\caret\stop 
        \index[1] = \index[2]
        \text\change =- 1 ; - 1 post event change widget
        Repaint = #True 
      EndIf
      
      \text\string.s = \text[1]\string + Chr.s + \text[3]\string
    EndWith
    
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure.b text_insert(*this._struct_, Chr.s)
    Static Dot, Minus, Color.i
    Protected Repaint.b, Input, Input_2, String.s, Count.i
    
    With *this
      Chr.s = text_insert_make(*this, Chr.s)
      
      If Chr.s
        Count = CountString(Chr.s, #LF$)
        
        If Not text_paste(*this, Chr.s, Count)
          If \row\_s()\text[2]\len 
            If \row\caret\stop > \row\caret\start : \row\caret\stop = \row\caret\start : EndIf
            \row\_s()\text[2]\len = 0 : \row\_s()\text[2]\string.s = "" : \row\_s()\text[2]\change = 1
          EndIf
          
          \row\_s()\text[1]\change = 1
          \row\_s()\text[1]\string.s + Chr.s
          \row\_s()\text[1]\len = Len(\row\_s()\text[1]\string.s)
          
          \row\_s()\text\string.s = \row\_s()\text[1]\string.s + \row\_s()\text[3]\string.s
          \row\_s()\text\len = \row\_s()\text[1]\len + \row\_s()\text[3]\len : \row\_s()\text\change = 1
          
          If Count
            \index[2] + Count
            \index[1] = \index[2] 
            \row\caret\stop = Len(StringField(Chr.s, 1 + Count, #LF$))
          Else
            \row\caret\stop + Len(Chr.s) 
          EndIf
          
          \text\string.s = \text[1]\string + Chr.s + \text[3]\string
          \row\caret\start = \row\caret\stop 
          ;; \countitems = CountString(\text\string.s, #LF$)
          \text\change =- 1 ; - 1 post event change widget
        EndIf
        
        SelectElement(\row\_s(), \index[2]) 
        Repaint = 1 
      EndIf
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure.b text_cut(*this._struct_)
    ProcedureReturn text_paste(*this._struct_, "")
  EndProcedure
  
  
  ;-
  ;- - DRAWINGs
  Procedure.i Draw(*this._struct_)
    Protected String.s, StringWidth, ix, iy, iwidth, iheight
    Protected IT,Text_Y,Text_X, X,Y, Width,Height, Drawing
    Protected angle.f
    
    If Not *this\hide
      
      With *this
        If \text\fontID 
          DrawingFont(\text\fontID) 
        EndIf
        
        
        ; Then changed text
        If \text\change
          \text\height = TextHeight("A") + Bool(\countitems<>1 And \flag\gridLines)
          \text\width = TextWidth(\text\string.s)
        EndIf
        
        ; Make output multi line text
        If (\text\change Or \resize)
          text_multiline_make(*this)
          
          ;This is for the caret and scroll when entering the key - (enter & beckspace)
          If \text\change And \index[2] >= 0 And \index[2] < ListSize(\row\_s())
            SelectElement(\row\_s(), \index[2])
            
            If \scroll\v And \scroll\v\max <> \scroll\height And 
               Bar::SetAttribute(\scroll\v, #__bar_Maximum, \scroll\height - Bool(\flag\gridLines)) 
              Bar::Resizes(\scroll, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
              \scroll\v\page\scrollStep = \text\height
            EndIf
            
            If \scroll\h And \scroll\h\max<>\scroll\width And 
               Bar::SetAttribute(\scroll\h, #__bar_Maximum, \scroll\width)
              Bar::Resizes(\scroll, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
            EndIf
            
            ; При вводе enter перемещаем ползунок
            If (\row\_s()\y+\row\_s()\height >= \height[2])
              ; This is for the editor widget when you enter the key - (enter & backspace)
              Bar::SetState(\scroll\v, ((\row\_s()\y+\row\_s()\height)-(\height[2]+\text\y)))
            EndIf
          EndIf
        EndIf 
        
        ;
        If \text\editable And \countitems
          If \text\change =- 1
            \text[1]\change = 1
            \text[3]\change = 1
            \text\len = Len(\text\string.s)
            
            ;             ClearDebugOutput()
            ;             Debug "draw - \text\change =- 1"
            
            _text_sel_(*this, \row\caret\stop , 0)
            
            ; ; Посылаем сообщение об изменении содержимого 
            ; PostEvent(#PB_Event_Widget, \root\window, *this, #PB_EventType_Change)
          EndIf
          
;           If (\focus = *this And \root\mouse\buttons And (Not \scroll\v\from And Not \scroll\h\from)) 
;             _text_scroll_x_(*this)
;           EndIf
        EndIf
        
        ; Widget inner coordinate
        iX=\x[2] + \row\margin\width 
        iY=\y[2]
        iwidth = \width[2]
        iheight = \height[2]
        
        
        
        ; Draw back color
        If \color\fore[\color\state]
          DrawingMode(#PB_2DDrawing_Gradient)
          _box_gradient_(\Vertical,\x[1],\y[1],\width[1],\height[1],\color\fore[\color\state],\color\back[\color\state],\round)
        Else
          DrawingMode(#PB_2DDrawing_Default)
          RoundBox(\x[1],\y[1],\width[1],\height[1],\round,\round,\color\back[\color\state])
        EndIf
        
        ; Draw margin back color
        If \row\margin\width > 0
          If (\text\change Or \resize)
            \row\margin\x = \x[2]
            \row\margin\y = \y[2]
            \row\margin\height = \height[2]
          EndIf
          
          DrawingMode(#PB_2DDrawing_Default)
          Box(\row\margin\x, \row\margin\y, \row\margin\width, \row\margin\height, \row\margin\color\back)
        EndIf
        
        ; Draw Lines text
        If \countitems
          PushListPosition(\row\_s())
          ForEach \row\_s()
            ; Is visible lines ---
            Drawing = Bool(Not \row\_s()\hide And \row\_s()\y+\row\_s()\height-*this\scroll\v\page\pos>*this\y[2] And (\row\_s()\y-*this\y[2])-*this\scroll\v\page\pos<iheight)
            
            Height = \row\_s()\height
            Y = \row\_s()\y-*this\scroll\v\page\pos
            Text_X = \row\_s()\text\x-*this\scroll\h\page\pos
            Text_Y = \row\_s()\text\y-*this\scroll\v\page\pos
            
            ; Draw selections
            If Drawing 
              ; Draw lines
              If (\row\_s()\index=*this\index[1] Or \row\_s()\index=\row\index) ; \color\state;
                If *this\row\color\back[\row\_s()\color\state]<>-1                                                     ; no draw transparent
                  If *this\row\color\fore[\row\_s()\color\state]
                    DrawingMode(#PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
                    _box_gradient_(*this\vertical,iX-\row\margin\width,Y,iwidth+ \row\margin\width ,\row\_s()\height, *this\row\color\fore[*this\row\_s()\color\state], *this\row\color\back[*this\row\_s()\color\state], \row\_s()\round)
                  Else
                    DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                    RoundBox(iX-\row\margin\width,Y,iwidth+ \row\margin\width ,\row\_s()\height,\row\_s()\round,\row\_s()\round, *this\row\color\back[*this\row\_s()\color\state] )
                  EndIf
                EndIf
                
                If *this\row\color\frame[\row\_s()\color\state]<>-1 ; no draw transparent
                  DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
                  RoundBox(iX-\row\margin\width,Y,iwidth+ \row\margin\width ,\row\_s()\height,\row\_s()\round,\row\_s()\round, *this\row\color\frame[*this\row\_s()\color\state] )
                EndIf
              EndIf
              
              ; Draw text
              Angle = Bool(*this\vertical)**this\text\rotate
              
              ; Draw string
              If *this\text\editable And \row\_s()\text[2]\width And *this\color\front <> *this\row\color\front[2]
                
                CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
                  ; to right
                  If (*this\index[1] > *this\index[2] Or 
                      (*this\index[1] = *this\index[2] And *this\row\caret\stop > *this\row\caret\start))
                    
                    DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                    DrawRotatedText(Text_X, Text_Y, \row\_s()\text\string.s, angle, *this\row\color\front[*this\row\color\state])
                    
                    If *this\row\color\fore[2]
                      DrawingMode(#PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
                      _box_gradient_(*this\vertical,\row\_s()\text[2]\x-*this\scroll\h\page\pos, Y, \row\_s()\text[2]\width, Height, *this\row\color\fore[2], *this\row\color\back[2], \row\_s()\round)
                    Else
                      DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                      Box(\row\_s()\text[2]\x-*this\scroll\h\page\pos, Y, \row\_s()\text[2]\width, Height, *this\row\color\back[2])
                    EndIf
                    
                    If \row\_s()\text[2]\string.s
                      DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                      DrawRotatedText(\row\_s()\text[2]\x-*this\scroll\h\page\pos, Text_Y, \row\_s()\text[2]\string.s, angle, *this\row\color\front[2])
                    EndIf
                    
                  Else
                    If *this\row\color\fore[2]
                      DrawingMode(#PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
                      _box_gradient_(*this\vertical,\row\_s()\text[2]\x-*this\scroll\h\page\pos, Y, \row\_s()\text[2]\width, Height,*this\row\color\fore[2], *this\row\color\back[2], \row\_s()\round)
                    Else
                      DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                      Box(\row\_s()\text[2]\x-*this\scroll\h\page\pos, Y, \row\_s()\text[2]\width, Height, *this\row\color\back[2] )
                    EndIf
                    
                    If \row\_s()\text[3]\string.s
                      DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                      DrawRotatedText(\row\_s()\text[3]\x-*this\scroll\h\page\pos, Text_Y, \row\_s()\text[3]\string.s, angle, *this\row\color\front[*this\row\color\state])
                    EndIf
                    
                    If \row\_s()\text[2]\string.s
                      DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                      DrawRotatedText(Text_X, Text_Y, \row\_s()\text[1]\string.s+\row\_s()\text[2]\string.s, angle, *this\row\color\front[2])
                    EndIf
                    
                    If \row\_s()\text[1]\string.s
                      DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                      DrawRotatedText(Text_X, Text_Y, \row\_s()\text[1]\string.s, angle, *this\row\color\front[*this\row\color\state])
                    EndIf
                  EndIf
                  
                CompilerElse
                  If *this\row\color\fore[2]
                    DrawingMode(#PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
                    _box_gradient_(*this\vertical,\row\_s()\text[2]\x-*this\scroll\h\page\pos, Y, \row\_s()\text[2]\width, Height, *this\row\color\fore[2], *this\row\color\back[2], \row\_s()\round)
                  Else
                    DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                    Box(\row\_s()\text[2]\x-*this\scroll\h\page\pos, Y, \row\_s()\text[2]\width, Height, *this\row\color\back[2])
                  EndIf
                  
                  DrawingMode(#PB_2DDrawing_Transparent)
                  
                  If \row\_s()\text[1]\string.s
                    DrawRotatedText(\row\_s()\text[1]\x-*this\scroll\h\page\pos, \row\_s()\text\y-*this\scroll\v\page\pos, \row\_s()\text[1]\string.s, angle, *this\row\color\front[*this\row\color\state])
                  EndIf
                  If \row\_s()\text[2]\string.s
                    DrawRotatedText(\row\_s()\text[2]\x-*this\scroll\h\page\pos, \row\_s()\text\y-*this\scroll\v\page\pos, \row\_s()\text[2]\string.s, angle, *this\row\color\front[2])
                  EndIf
                  If \row\_s()\text[3]\string.s
                    DrawRotatedText(\row\_s()\text[3]\x-*this\scroll\h\page\pos, \row\_s()\text\y-*this\scroll\v\page\pos, \row\_s()\text[3]\string.s, angle, *this\row\color\front[*this\row\color\state])
                  EndIf
                CompilerEndIf
                
              Else
                If \row\_s()\text[2]\width
                  DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                  Box(\row\_s()\text[2]\x-*this\scroll\h\page\pos, Y, \row\_s()\text[2]\width, Height, $FFFBD9B7);*this\row\color\back[2])
                EndIf
                
                If \color\state = 2
                  DrawingMode(#PB_2DDrawing_Transparent)
                  DrawRotatedText(Text_X, Text_Y, \row\_s()\text[0]\string.s, angle, *this\row\color\front[2])
                Else
                  DrawingMode(#PB_2DDrawing_Transparent)
                  DrawRotatedText(Text_X, Text_Y, \row\_s()\text[0]\string.s, angle, *this\row\color\front[*this\row\color\state])
                EndIf
              EndIf
              
              ; Draw margin
              If *this\row\margin\width > 0
                DrawingMode(#PB_2DDrawing_Transparent)
                DrawText(*this\row\_s()\margin\x, *this\row\_s()\margin\y-*this\scroll\v\page\pos, *this\row\_s()\margin\string, *this\row\margin\color\front)
              EndIf
            EndIf
          Next
          PopListPosition(*this\row\_s()) ; 
        EndIf
        
        ; Draw caret
        If *this\text\editable ; And *this\color\state
          DrawingMode(#PB_2DDrawing_XOr)             
          Line(*this\row\caret\x-*this\scroll\h\page\pos, *this\row\caret\y-*this\scroll\v\page\pos, 1, *this\row\caret\height, $FFFFFFFF)
        EndIf
        
        ; Draw scroll bars
        Bar::Draw(\scroll\v)
        Bar::Draw(\scroll\h)
        
        ; Draw frames
        If \row\error
          DrawingMode(#PB_2DDrawing_Outlined)
          RoundBox(\x[1],\y[1],\width[1],\height[1],\round,\round, $FF0000FF)
          If \round : RoundBox(\x[1],\y[1]-1,\width[1],\height[1]+2,\round,\round, $FF0000FF) : EndIf  ; Сглаживание краев )))
        Else
          DrawingMode(#PB_2DDrawing_Outlined)
          RoundBox(\x[1],\y[1],\width[1],\height[1],\round,\round,\color\frame[\color\state])
          If \round : RoundBox(\x[1],\y[1]-1,\width[1],\height[1]+2,\round,\round,\color\front[\color\state]) : EndIf  ; Сглаживание краев )))
        EndIf
        
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        ; Scroll area coordinate
        ;Box(-\scroll\h\page\pos, -\scroll\v\page\pos, \scroll\width, \scroll\height, $FFFF0000)
        ; Debug ""+\scroll\x +" "+ \scroll\y +" "+ \scroll\width +" "+ \scroll\height
        Box(\scroll\h\x-\scroll\h\page\pos, \scroll\v\y-\scroll\v\page\pos, \scroll\h\max, \scroll\v\max, $FFFF0000)
        
        ; page coordinate
        Box(\scroll\h\x, \scroll\v\y, \scroll\h\page\len, \scroll\v\page\len, $FF00FF00)
        
        
        
        If \text\change : \text\change = 0 : EndIf
        If \resize : \resize = 0 : EndIf
      EndWith
    EndIf
    
  EndProcedure
  
  Procedure.i ReDraw(*this._struct_)
    If *this
      With *this
        If StartDrawing(CanvasOutput(\root\canvas))
          Draw(*this)
          StopDrawing()
        EndIf
      EndWith
    EndIf
  EndProcedure
  
  ;-
  ;- - (SET&GET)s
  Procedure Editor_addLine(*this._s_widget, Line.i, String.s) ;,Image.i=-1,Sublevel.i=0)
    Protected Image_Y, Image_X, Text_X, Text_Y, Height, Width, Indent = 4
    
    With *this
      \countitems = ListSize(\row\_s())
      
      Width = \width[#__c_2] - (Bool(Not \scroll\v\hide) * \scroll\v\width) - \row\margin\width
      Height = \height[#__c_2] - Bool(Not \scroll\h\hide) * \scroll\h\height
      
      ;\row\_s()\index[#__s_1] =- 1
      ;\row\_s()\color\state =- 1
      \row\_s()\index = Line
      \row\_s()\round = \round
      \row\_s()\text\string.s = String.s
      
      ; Set line default color state           
      \row\_s()\color\state = 1
      
      ; Update line pos in the text
      _make_line_pos_(*this)
      
      _set_content_X_(*this)
      _line_resize_X_(*this)
      _line_resize_Y_(*this)
      
      ;       ; Is visible lines
      ;       \row\_s()\hide = Bool(Not Bool(\row\_s()\y>=\y[#__c_2] And (\row\_s()\y-\y[#__c_2])+\row\_s()\height=<\height[#__c_2]))
      
      ; Scroll width length
      _make_scroll_width_(*this)
      
      ; Scroll hight length
      _make_scroll_height_(*this)
      
      If \index[#__s_2] = ListIndex(\row\_s())
        ;Debug " string "+String.s
        \row\_s()\text[1]\string.s = Left(\row\_s()\text\string.s, \row\caret\stop) : \row\_s()\text[1]\change = #True
        \row\_s()\text[3]\string.s = Right(\row\_s()\text\string.s, \row\_s()\text\len-(\row\caret\stop + \row\_s()\text[2]\len)) : \row\_s()\text[3]\change = #True
      EndIf
    EndWith
    
    ProcedureReturn Line
  EndProcedure
  
  Procedure.i _AddItem(*this._struct_, position.l, Text.s, Image.i=-1, subLevel.i=0)
    Protected handle, *parent._s_rows
    
    With *this
      If *this
;         If sublevel =- 1
;           *parent = *this
;           \flag\option_group = 12
;           \flag\checkBoxes = \flag\option_group
;         EndIf
        
;         If \flag\option_group
;           If subLevel > 1
;             subLevel = 1
;           EndIf
;         EndIf
        
        ;{ Генерируем идентификатор
        If (0 > position Or position > ListSize(\row\_s()) - 1)
          LastElement(\row\_s())
          handle = AddElement(\row\_s()) 
          position = ListIndex(\row\_s())
        Else
          handle = SelectElement(\row\_s(), position)
          
          If sublevel < \row\_s()\sublevel
            sublevel = \row\_s()\sublevel  
          EndIf
          
          handle = InsertElement(\row\_s())
          
          ; Исправляем идентификатор итема  
          PushListPosition(\row\_s())
          While NextElement(\row\_s())
            \row\_s()\index = ListIndex(\row\_s())
          Wend
          PopListPosition(\row\_s())
        EndIf
        ;}
        
        If handle
          If \row\sublevellen
            If Not position
              \row\first = \row\_s()
            EndIf
            
            If subLevel
              If sublevel>position
                sublevel=position
              EndIf
              
              PushListPosition(\row\_s())
              While PreviousElement(\row\_s()) 
                If subLevel = \row\_s()\sublevel
                  *parent = \row\_s()\parent
                  Break
                ElseIf subLevel > \row\_s()\sublevel
                  *parent = \row\_s()
                  Break
                EndIf
              Wend 
              PopListPosition(\row\_s())
              
              If *parent
                If subLevel > *parent\sublevel
                  sublevel = *parent\sublevel + 1
                  *parent\childrens + 1
                  
;                   If \flag\collapse
;                     *parent\box[0]\checked = 1 
;                     \row\_s()\hide = 1
;                   EndIf
                EndIf
                \row\_s()\parent = *parent
              EndIf
              
              \row\_s()\sublevel = sublevel
            EndIf
          EndIf
          
;           ; set option group
;           If \flag\option_group 
;             If \row\_s()\parent
;               \row\_s()\option_group = \row\_s()\parent
;             Else
;               \row\_s()\option_group = *this
;             EndIf
;           EndIf
          
          ; add lines
          \row\_s()\index = position
          
          \row\_s()\color = _color_
          \row\_s()\color\state = 0
          
          \row\_s()\color\back = 0;\color\back 
          \row\_s()\color\frame = 0;\color\back 
          
          \row\_s()\color\fore[0] = 0 
          \row\_s()\color\fore[1] = 0
          \row\_s()\color\fore[2] = 0
          \row\_s()\color\fore[3] = 0
          
          If Text
            \row\_s()\text\string = StringField(Text.s, 1, #LF$)
            \row\_s()\text\change = 1
          EndIf
          
;           _set_item_image_(*this, \row\_s(), Image)
          
;           If \flag\buttons
;             \row\_s()\box[0]\width = \flag\buttons
;             \row\_s()\box[0]\height = \flag\buttons
;           EndIf
          
;           If \flag\checkBoxes Or \flag\option_group
;             \row\_s()\box[1]\width = \flag\checkBoxes
;             \row\_s()\box[1]\height = \flag\checkBoxes
;           EndIf
          
;           If \row\sublevellen 
;             If (\flag\buttons Or \flag\lines)
;               \row\_s()\sublevellen = \row\_s()\sublevel * \row\sublevellen + Bool(\flag\buttons) * 19 + Bool(\flag\checkBoxes) * 18
;             Else
;               \row\_s()\sublevellen =  Bool(\flag\checkBoxes) * 18 
;             EndIf
;           EndIf
          
;           If *this\row\selected 
;             *this\row\selected\color\state = 0
;             *this\row\selected = *this\row\_s() 
;             *this\row\selected\color\state = 2 + Bool(*event\active<>*this)
;           EndIf
          
          _repaint_(*this)
          \countitems + 1
        EndIf
      EndIf
    EndWith
    
    ProcedureReturn handle
  EndProcedure
  
  Procedure.i AddItem(*this._struct_, Item.i,Text.s,Image.i=-1,Flag.i=0)
;     With  *this
;       ;{ Генерируем идентификатор
;         If Item < 0 Or Item > ListSize(\row\_s()) - 1
;           LastElement(\row\_s())
;           AddElement(\row\_s()) 
;           Item = ListIndex(\row\_s())
;         Else
;           SelectElement(\row\_s(), Item)
;           InsertElement(\row\_s())
;           
;           ; Исправляем идентификатор итема  
;           PushListPosition(\row\_s())
;           While NextElement(\row\_s())
;             \row\_s()\index = ListIndex(\row\_s())
;           Wend
;           PopListPosition(\row\_s())
;         EndIf
;         ;}
;       EndWith
;       
;         ProcedureReturn Editor_addLine(*this, item, text.s)
    
    Static len
    Protected l, i, String.s
    
    If *this
      With *this
        If \text\string = #LF$ 
          _AddItem(*this, Item,Text.s,Image,Flag)
        Else
          
          If (Item > 0 And Item < \countitems - 1)
            String.s = StringField(\text\string, item+1, #LF$)
            len = Len(String)
            
            For i = item - 1 To 0 Step - 1
              String = StringField(\text\string, i+1, #LF$) + String
            Next
            
            len = Len(String)+Item-len
          EndIf
          
          \text\string = InsertString(\text\string, Text.s+#LF$, len+1)
          l = Len(Text.s) + 1
          \text\change = 1
          \text\len + l 
          Len + l
        EndIf
      
        _repaint_items_(*this)
        \countitems + 1
        
      EndWith
    EndIf
    
    ProcedureReturn *this\countitems
  EndProcedure
  
  Procedure SetAttribute(*this._struct_, Attribute.i, Value.i)
    With *this
      
    EndWith
  EndProcedure
  
  Procedure GetAttribute(*this._struct_, Attribute.i)
    Protected Result
    
    With *this
      ;       Select Attribute
      ;         Case #__bar_Minimum    : Result = \scroll\min
      ;         Case #__bar_Maximum    : Result = \scroll\max
      ;         Case #__bar_PageLength : Result = \scroll\pageLength
      ;       EndSelect
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i SetItemState(*this._struct_, Item.i, State.i)
    Protected Result
    
    With *this
      PushListPosition(\row\_s())
      Result = SelectElement(\row\_s(), Item) 
      If Result 
        \row\index = \row\_s()\index
        \row\caret\stop = State
        \row\caret\start = \row\caret\stop 
      EndIf
      PopListPosition(\row\_s())
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i SetState(*this._struct_, State.i)
    Protected String.s, *Line
    
    With *this
      PushListPosition(\row\_s())
      ForEach \row\_s()
        If String.s
          String.s +#LF$+ \row\_s()\text\string.s 
        Else
          String.s + \row\_s()\text\string.s
        EndIf
      Next : String.s+#LF$
      PopListPosition(\row\_s())
      
      If \text\string.s <> String.s
        \text\string.s = String.s
        \text\len = Len(String.s)
        Redraw(*this)
      EndIf
      
      If State <> #PB_Ignore
        \focus = *this
        If GetActiveGadget() <> \root\canvas
          SetActiveGadget(\root\canvas)
        EndIf
        
        PushListPosition(\row\_s())
        If State =- 1
          \index[1] = \countitems - 1
          *Line = LastElement(\row\_s())
          \row\caret\stop = \row\_s()\text\len
        Else
          \index[1] = CountString(Left(String, State), #LF$)
          *Line = SelectElement(\row\_s(), \index[1])
          If *Line
            \row\caret\stop = State-\row\_s()\text\pos
          EndIf
        EndIf
        
        ;If *Line
        ;         \index[2] = \index[1]
        ;         \text[1]\change = 1
        ;         \text[3]\change = 1
        ;         _text_sel_(*this, \row\caret\stop , 0)
        
        \row\_s()\text[1]\string = Left(\row\_s()\text\string, \row\caret\stop )
        \row\_s()\text[1]\change = 1
        \row\caret\start = \row\caret\stop 
        
        \row\index = \row\_s()\index 
        Bar::SetState(\scroll\v, (\row\_s()\y-((\scroll\height[2]+\text\y)-\row\_s()\height))) ;((\index[1] * \text\height)-\scroll\v\height) + \text\height)
        
        ;_repaint_(*this)
        Redraw(*this)
        ;EndIf
        PopListPosition(\row\_s())
        
        ; Debug \index[2]
        
      EndIf
    EndWith
  EndProcedure
  
  Procedure GetState(*this._struct_)
    Protected Result
    
    With *this
      PushListPosition(\row\_s())
      ForEach \row\_s()
        If \row\index = \row\_s()\index
          Result = \row\_s()\text\pos + \row\caret\stop 
        EndIf
      Next
      PopListPosition(\row\_s())
      
      ; Debug \text[1]\len
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure ClearItems(*this._struct_)
    *this\countitems = 0
    *this\text\change = 1 
    If *this\text\editable
      *this\text\string = #LF$
    EndIf
    
    _repaint_(*this)
    
    ProcedureReturn 1
  EndProcedure
  
  Procedure.i CountItems(*this._struct_)
    ProcedureReturn   *this\countitems
  EndProcedure
  
  Procedure.i RemoveItem(*this._struct_, Item.i)
    *this\countitems - 1
    *this\text\change = 1
    
    If *this\countitems =- 1 
      *this\countitems = 0 
      *this\text\string = #LF$
      
      _repaint_(*this)
    
    Else
      *this\text\string = RemoveString(*this\text\string, StringField(*this\text\string, item+1, #LF$) + #LF$)
    EndIf
  EndProcedure
  
  Procedure.s GetText(*this._struct_)
    With *this
      If \text\pass
        ProcedureReturn \text\string.s[1]
      Else
        ProcedureReturn \text\string
      EndIf
    EndWith
  EndProcedure
  
  Procedure.i text_setText(*this._struct_, Text.s)
    Protected Result.i, Len.i, String.s, i.i
    If Text.s="" : Text.s=#LF$ : EndIf
    
    With *this
      If \text\string.s <> Text.s
        \text\string.s = text_insert_make(*this, Text.s)
        
        If \text\string.s
          \text\string.s[1] = Text.s
          
          If \text\multiLine
            Text.s = ReplaceString(Text.s, #LFCR$, #LF$)
            Text.s = ReplaceString(Text.s, #CRLF$, #LF$)
            Text.s = ReplaceString(Text.s, #CR$, #LF$)
            
            \text\string.s = Text.s
            \countitems = CountString(\text\string.s, #LF$)
          Else
            \text\string.s = RemoveString(\text\string.s, #LF$) + #LF$
            ; \text\string.s = RTrim(ReplaceString(\text\string.s, #LF$, " ")) + #LF$
          EndIf
          
          \text\len = Len(\text\string.s)
          \text\change = #True
          Result = #True
        EndIf
      EndIf
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i SetText(*this._struct_, Text.s, Item.i=0)
    Protected i
    
    With *this
      If text_setText(*this, Text.s)
        _repaint_(*this)
    
        ProcedureReturn 1
      EndIf
    EndWith
    
  EndProcedure
  
  Procedure.i SetFont(*this._struct_, FontID.i)
    
    With *this
      If \text\fontID <> FontID 
        \text\fontID = FontID
        \text\change = 1
        
        If Not Bool(\text\count And \text\count <> \countitems)
          Redraw(*this)
        EndIf
        ProcedureReturn 1
      EndIf
    EndWith
    
  EndProcedure
  
  Procedure.i Resize(*this._struct_, X.i,Y.i,Width.i,Height.i)
    With *this
      If X<>#PB_Ignore And 
         \x[0] <> X
        \x[0] = X 
        \x[2]=\x[0]+\bs
        \x[1]=\x[2]-\fs
        \resize = 1<<1
      EndIf
      If Y<>#PB_Ignore And 
         \y[0] <> Y
        \y[0] = Y
        \y[2]=\y[0]+\bs
        \y[1]=\y[2]-\fs
        \resize = 1<<2
      EndIf
      If Width<>#PB_Ignore And
         \width[0] <> Width 
        \width[0] = Width 
        \width[2] = \width[0]-\bs*2
        \width[1] = \width[2]+\fs*2
        \resize = 1<<3
      EndIf
      If Height<>#PB_Ignore And 
         \height[0] <> Height
        \height[0] = Height 
        \height[2] = \height[0]-\bs*2
        \height[1] = \height[2]+\fs*2
        \resize = 1<<4
      EndIf
      
      ; Then resized widget
      If \resize
        ; Посылаем сообщение об изменении размера 
        ; PostEvent(#PB_Event_Widget, \root\window, *this, #PB_EventType_Resize, \resize)
        
        ;  Bar::Resizes(\scroll, \x[2]+\row\margin\width,\y[2],\width[2]-\row\margin\width,\height[2])
        Bar::Resizes(\scroll, \x[2],\y[2],\width[2],\height[2])
        
        \width[2] = \scroll\h\page\len - \row\margin\width 
        \height[2] = \scroll\v\page\len
        
      EndIf
      
        
      ProcedureReturn \resize
    EndWith
  EndProcedure
  
  ;-
  Procedure.i events_key_editor(*this._struct_, eventtype.l, mouse_x.l, mouse_y.l) ; Editable(*this._struct_, EventType.i)
    Static _caret_last_pos_, DoubleClick.i
    Protected Repaint.i, _key_control_.i, _key_shift_.i, Caret.i, Item.i, String.s
    Protected _line_, _step_ = 1, _caret_min_ = 0, _caret_max_ = *this\row\_s()\text\len, _line_first_ = 0, _line_last_ = *this\countitems - 1
    
    With *this
      _key_shift_ = Bool(*this\root\keyboard\key[1] & #PB_Canvas_Shift)
      
      CompilerIf #PB_Compiler_OS = #PB_OS_MacOS 
        _key_control_ = Bool((\root\keyboard\key[1] & #PB_Canvas_Control) Or (\root\keyboard\key[1] & #PB_Canvas_Command)) * #PB_Canvas_Control
      CompilerElse
        _key_control_ = Bool(*this\root\keyboard\key[1] & #PB_Canvas_Control) * #PB_Canvas_Control
      CompilerEndIf
      
      Select EventType
        Case #PB_EventType_Input ; - Input (key)
          If Not _key_control_   ; And Not _key_shift_
            If *this\root\keyboard\input
              
              If Not \row\error
                If text_insert(*this, Chr(*this\root\keyboard\input))
                  Repaint = #True
                Else
                  *this\row\error = 1
                  ProcedureReturn - 1
                EndIf
              EndIf
            
            EndIf
          EndIf
          
        Case #PB_EventType_KeyUp
          ; Чтобы перерисовать 
          ; рамку вокруг едитора 
          If \row\error
            \row\error = 0
            ProcedureReturn - 1
          EndIf
        
        Case #PB_EventType_KeyDown
          Select *this\root\keyboard\key
            Case #PB_Shortcut_Home : *this\row\caret\start = 0
              If _key_control_
                *this\index[2] = 0 
              EndIf
              Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)
              
            Case #PB_Shortcut_End : *this\row\caret\start = *this\text\len
              If _key_control_
                *this\index[2] = *this\countitems - 1 
              EndIf
              Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)
              
            Case #PB_Shortcut_PageUp   ;: Repaint = ToPos(*this, 1, 1)
              
            Case #PB_Shortcut_PageDown ;: Repaint = ToPos(*this, - 1, 1)
              
            Case #PB_Shortcut_A
              If _key_control_ And
                 \text[2]\len <> \text\len
                ; select first item
                \index[2] = 0 
                \index[1] = 0
                
                ; set caret to begin
                \row\caret\start = 0 
                \row\caret\stop = 0 
                
                Repaint = _text_set_selector_(*this, \countitems - 1, \text\len)
              EndIf
              
            Case #PB_Shortcut_Up     ; Ok
              If *this\index[1] > _line_first_
                If _caret_last_pos_
                  If Not *this\root\keyboard\key[1] & #PB_Canvas_Alt 
                    *this\row\caret\stop = _caret_last_pos_
                    *this\row\caret\start = _caret_last_pos_
                  EndIf
                  _caret_last_pos_ = 0
                EndIf
                
                If _key_shift_
                  If _key_control_
                    Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)  
                    Repaint = _text_set_selector_(*this, 0, 0)  
                  Else
                    Repaint = _text_set_selector_(*this, *this\index[1] - _step_, *this\row\caret\stop)  
                  EndIf
                ElseIf *this\root\keyboard\key[1] & #PB_Canvas_Alt 
                  If *this\row\caret\stop <> _caret_min_ 
                    *this\row\caret\start = _caret_min_
                  Else
                    *this\index[2] - _step_ 
                  EndIf
                  
                  Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)  
                  
                Else
                  If _key_control_
                    *this\index[2] = 0
                    *this\row\caret\start = 0
                  Else
                    *this\index[2] - _step_
                  EndIf
                  
                  Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)
                EndIf
              ElseIf *this\index[1] = _line_first_
                
                If *this\row\caret\stop <> _caret_min_ : *this\row\caret\start = _caret_min_ : _caret_last_pos_ = *this\row\caret\stop
                  Repaint = _text_set_selector_(*this, _line_first_, *this\row\caret\start)  
                EndIf
                
              EndIf
              
            Case #PB_Shortcut_Down   ; Ok
              If *this\index[1] < _line_last_
                If _caret_last_pos_
                  If Not *this\root\keyboard\key[1] & #PB_Canvas_Alt And Not _key_control_
                    *this\row\caret\stop = _caret_last_pos_
                    *this\row\caret\start = _caret_last_pos_
                  EndIf
                  _caret_last_pos_ = 0
                EndIf
                
                If _key_shift_
                  If _key_control_
                    Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)  
                    Repaint = _text_set_selector_(*this, \countitems - 1, *this\text\len)  
                  Else
                    Repaint = _text_set_selector_(*this, *this\index[1] + _step_, *this\row\caret\stop)  
                  EndIf
                ElseIf *this\root\keyboard\key[1] & #PB_Canvas_Alt 
                  If *this\row\caret\stop <> _caret_max_ 
                    *this\row\caret\start = _caret_max_
                  Else
                    *this\index[2] + _step_ 
                    
                    If SelectElement(*this\row\_s(), *this\index[2]) 
                      _caret_max_ = *this\row\_s()\text\len
                      
                      If *this\row\caret\stop <> _caret_max_
                        *this\row\caret\start = _caret_max_
                        
                        Debug ""+#PB_Compiler_Procedure + "*this\row\caret\stop <> _caret_max_"
                      EndIf
                    EndIf
                  EndIf
                  
                  Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)  
                  
                Else
                  If _key_control_
                    *this\index[2] = \countitems - 1
                    *this\row\caret\start = *this\text\len
                  Else
                    *this\index[2] + _step_
                  EndIf
                  
                  Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)  
                EndIf
              ElseIf *this\index[1] = _line_last_
                
                If *this\row\_s()\index <> _line_last_ And
                   SelectElement(*this\row\_s(), _line_last_) 
                  _caret_max_ = *this\row\_s()\text\len
                  Debug ""+#PB_Compiler_Procedure + "*this\row\_s()\index <> _line_last_"
                EndIf
                
                If *this\row\caret\stop <> _caret_max_ : *this\row\caret\start = _caret_max_ : _caret_last_pos_ = *this\row\caret\stop
                  Repaint = _text_set_selector_(*this, _line_last_, *this\row\caret\start)  
                EndIf
                
              EndIf
              
            Case #PB_Shortcut_Left   ; Ok
              If _key_shift_        
                If _key_control_
                  Repaint = _text_set_selector_(*this, *this\index[2], 0)  
                Else
                  _line_ = *this\index[1] - Bool(*this\index[1] > _line_first_ And *this\row\caret\stop = _caret_min_) * _step_
                  
                  ; коректируем позицию коректора
                  If *this\row\_s()\index <> _line_ And
                     SelectElement(*this\row\_s(), _line_) 
                  EndIf
                  If *this\row\caret\stop > *this\row\_s()\text\len
                    *this\row\caret\stop = *this\row\_s()\text\len
                  EndIf
                  
                  If *this\index[1] <> _line_
                    Repaint = _text_set_selector_(*this, _line_, *this\row\_s()\text\len)  
                  ElseIf *this\row\caret\stop > _caret_min_
                    Repaint = _text_set_selector_(*this, _line_, *this\row\caret\stop - _step_)  
                  EndIf
                EndIf
                
              ElseIf *this\index[1] > _line_first_
                If *this\root\keyboard\key[1] & #PB_Canvas_Alt 
                  *this\row\caret\start = _text_sel_start_(*this)
                  
                  Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)  
                Else
                  If _key_control_
                    *this\row\caret\start = 0
                  Else
                    If *this\row\caret\start = *this\row\caret\stop
                      *this\row\caret\start - _step_
                    Else
                      *this\row\caret\start = *this\row\caret\stop - _step_ 
                    EndIf
                    
                    If *this\row\caret\stop = _caret_min_
                      *this\index[2] - _step_
                      
                      If SelectElement(*this\row\_s(), *this\index[2]) 
                        *this\row\caret\stop = *this\row\_s()\text\len
                        *this\row\caret\start = *this\row\_s()\text\len
                      EndIf
                    EndIf
                  EndIf
                  
                  Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)  
                EndIf
                
              ElseIf *this\index[1] = _line_first_
                
                If *this\row\caret\stop > _caret_min_ 
                  *this\row\caret\start - _step_
                  Repaint = _text_set_selector_(*this, _line_first_, *this\row\caret\start)  
                EndIf
                
              EndIf
              
            Case #PB_Shortcut_Right  ; Ok
              If _key_shift_       
                If _key_control_
                  Repaint = _text_set_selector_(*this, *this\index[2], *this\text\len)  
                Else
                  If *this\row\_s()\index <> *this\index[1] And
                     SelectElement(*this\row\_s(), *this\index[1]) 
                    _caret_max_ = *this\row\_s()\text\len
                  EndIf
                  
                  If *this\row\caret\stop > _caret_max_
                    *this\row\caret\stop = _caret_max_
                  EndIf
                  
                  _line_ = *this\index[1] + Bool(*this\index[1] < _line_last_ And *this\row\caret\stop = _caret_max_) * _step_
                  
                  ; если дошли в конец строки,
                  ; то переходим в начало
                  If *this\index[1] <> _line_ 
                    Repaint = _text_set_selector_(*this, _line_, 0)  
                  ElseIf *this\row\caret\stop < _caret_max_
                    Repaint = _text_set_selector_(*this, _line_, *this\row\caret\stop + _step_)  
                  EndIf
                EndIf
                
              ElseIf *this\index[1] < _line_last_
                If *this\root\keyboard\key[1] & #PB_Canvas_Alt 
                  *this\row\caret\start = _text_sel_stop_(*this)
                  
                  Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)  
                Else
                  If _key_control_
                    *this\row\caret\start = *this\text\len
                  Else
                    If *this\row\caret\start = *this\row\caret\stop
                      *this\row\caret\start + _step_
                    Else
                      *this\row\caret\start = *this\row\caret\stop + _step_ 
                    EndIf
                    
                    If *this\row\caret\stop = _caret_max_
                      *this\index[2] + _step_
                      
                      If SelectElement(*this\row\_s(), *this\index[2]) 
                        *this\row\caret\stop = 0
                        *this\row\caret\start = 0
                      EndIf
                    EndIf
                  EndIf
                  
                  Repaint = _text_set_selector_(*this, *this\index[2], *this\row\caret\start)  
                EndIf
                
              ElseIf *this\index[1] = _line_last_
                
                If *this\row\caret\stop < _caret_max_ 
                  *this\row\caret\start + _step_
                  
                    
                  Repaint = _text_set_selector_(*this, _line_last_, *this\row\caret\start)  
                EndIf
                
              EndIf
              
            Case #PB_Shortcut_Back   
;               ; Сбросить Dot&Minus
;               If *this\root\keyboard\input
;                 *this\root\keyboard\input = 0
;                 
;                 If Not \row\error
;                   If text_insert(*this, Chr(\root\keyboard\input))
;                     ProcedureReturn #True
;                   Else
;                     \row\error = 1
;                     ProcedureReturn - 1
;                   EndIf
;                 EndIf
;                 
;               EndIf
              
              If Not \row\error
                *this\root\keyboard\input = 65535
                
                If Not text_cut(*this)
                  If \row\_s()\text[2]\len
                    
                    If \row\caret\stop > \row\caret\start : \row\caret\stop = \row\caret\start : EndIf
                    \row\_s()\text[2]\len = 0 : \row\_s()\text[2]\string.s = "" : \row\_s()\text[2]\change = 1
                    
                    \row\_s()\text\string.s = \row\_s()\text[1]\string.s + \row\_s()\text[3]\string.s
                    \row\_s()\text\len = \row\_s()\text[1]\len + \row\_s()\text[3]\len : \row\_s()\text\change = 1
                    
                    \text\string.s = \text[1]\string + \text[3]\string
                    \text\change =- 1 ; - 1 post event change widget
                    
                  ElseIf \row\caret\start > 0 : \row\caret\stop - 1 
                    \row\_s()\text[1]\string.s = Left(\row\_s()\text\string.s, \row\caret\stop )
                    \row\_s()\text[1]\len = Len(\row\_s()\text[1]\string.s) : \row\_s()\text[1]\change = 1
                    
                    \row\_s()\text\string.s = \row\_s()\text[1]\string.s + \row\_s()\text[3]\string.s
                    \row\_s()\text\len = \row\_s()\text[1]\len + \row\_s()\text[3]\len : \row\_s()\text\change = 1
                    
                    \text\string.s = Left(\text\string.s, \row\_s()\text\pos+\row\caret\stop ) + \text[3]\string
                    \text\change =- 1 ; - 1 post event change widget
                  Else
                    ; Если дошли до начала строки то 
                    ; переходим в конец предыдущего итема
                    If \index[1] > _line_first_ 
                      \text\string.s = RemoveString(\text\string.s, #LF$, #PB_String_CaseSensitive, \row\_s()\text\pos+\row\caret\stop, 1)
                      
                      ;to up
                      \index[1] - 1
                      \index[2] - 1
                      
                      If *this\row\_s()\index <> \index[2] And
                         SelectElement(*this\row\_s(), \index[2]) 
                      EndIf
                      ;: _text_set_selector_(*this, \index[2], \text\len)
                      
                      \row\caret\stop = \row\_s()\text\len
                      \text\change =- 1 ; - 1 post event change widget
                      
                    Else
                      \row\error = 1
                      ProcedureReturn - 1
                    EndIf
                    
                  EndIf
                EndIf
                
                If \text\change
                  \row\caret\start = \row\caret\stop 
                  Repaint =- 1 
                EndIf
              EndIf
            
            Case #PB_Shortcut_Delete 
              If Not text_cut(*this)
                If \row\_s()\text[2]\len
                  If \row\caret\stop > \row\caret\start : \row\caret\stop = \row\caret\start : EndIf
                  \row\_s()\text[2]\len = 0 : \row\_s()\text[2]\string.s = "" : \row\_s()\text[2]\change = 1
                  
                  \row\_s()\text\string.s = \row\_s()\text[1]\string.s + \row\_s()\text[3]\string.s
                  \row\_s()\text\len = \row\_s()\text[1]\len + \row\_s()\text[3]\len : \row\_s()\text\change = 1
                  
                  \text\string.s = \text[1]\string + \text[3]\string
                  \text\change =- 1 ; - 1 post event change widget
                  
                ElseIf \row\caret\start < \row\_s()\text\len 
                  \row\_s()\text[3]\string.s = Right(\row\_s()\text\string.s, \row\_s()\text\len - \row\caret\stop - 1)
                  \row\_s()\text[3]\len = Len(\row\_s()\text[3]\string.s) : \row\_s()\text[3]\change = 1
                  
                  \row\_s()\text\string.s = \row\_s()\text[1]\string.s + \row\_s()\text[3]\string.s
                  \row\_s()\text\len = \row\_s()\text[1]\len + \row\_s()\text[3]\len : \row\_s()\text\change = 1
                  
                  \text[3]\string = Right(\text\string.s, \text\len - (\row\_s()\text\pos + \row\caret\stop ) - 1)
                  \text[3]\len = Len(\text[3]\string.s)
                  
                  \text\string.s = \text[1]\string + \text[3]\string
                  \text\change =- 1 ; - 1 post event change widget
                Else
                  If \index[2] < \countitems - 1
                    \text\string.s = RemoveString(\text\string.s, #LF$, #PB_String_CaseSensitive, \row\_s()\text\pos+\row\caret\stop , 1)
                    \text\change =- 1 ; - 1 post event change widget
                  EndIf
                EndIf
              EndIf
              
              If \text\change
                \row\caret\start = \row\caret\stop 
                Repaint =- 1 
              EndIf
              
            Case #PB_Shortcut_Return 
              If Not text_paste(*this, #LF$)
                \index[2] + 1
                \index[1] = \index[2]
                \row\caret\start = 0
                \row\caret\stop = 0
                \text\change =- 1 ; - 1 post event change widget
                Repaint = 1
              EndIf
              
            Case #PB_Shortcut_C, #PB_Shortcut_X
              If _key_control_
                SetClipboardText(\text[2]\string)
                
                If \root\keyboard\key = #PB_Shortcut_X
                  Repaint = text_cut(*this)
                EndIf
              EndIf
              
            Case #PB_Shortcut_V
              If \text\editable And _key_control_
                Repaint = text_insert(*this, GetClipboardText())
              EndIf
              
          EndSelect 
          
      EndSelect
      
      ;       If Repaint =- 1
      ;         _start_drawing_(*this)
      ;         
      ;         If \row\caret\stop < \row\caret\start
      ;           ; Debug \row\caret\start-\row\caret\stop 
      ;           _text_sel_(*this, \row\caret\stop , \row\caret\start-\row\caret\stop )
      ;         Else
      ;           ; Debug \row\caret\stop -\row\caret\start
      ;           _text_sel_(*this, \row\caret\start, \row\caret\stop-\row\caret\start)
      ;         EndIf
      ;         
      ;         StopDrawing() 
      ;       EndIf                                                  
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure.i events_editor(*this._struct_, eventtype.l, mouse_x.l, mouse_y.l)
    Static DoubleClick.i=-1
    Protected Repaint.i, _key_control_.i, Caret.i, _line_.l, String.s
    
    With *this
      Repaint | Bar::CallBack(\scroll\v, EventType, \root\mouse\x, \root\mouse\y)
      Repaint | Bar::CallBack(\scroll\h, EventType, \root\mouse\x, \root\mouse\y)
      
      If *this And (Not *this\scroll\v\from And Not *this\scroll\h\from)
        If ListSize(*this\row\_s())
          If Not \hide And Not \Disable And \interact
            ; Get line position
            ;If \root\mouse\buttons ; сним двойной клик не работает
            If \root\mouse\y < \y
              _line_ =- 1
            Else
              _line_ = ((\root\mouse\y-\y-\text\y+\scroll\v\page\pos) / \text\height)
            EndIf
            ;EndIf
            
            Select EventType 
              Case #PB_EventType_LeftDoubleClick 
                  ; bug pb
                  ; в мак ос в editorgadget ошибка
                  ; при двойном клике на слове выделяет правильно 
                  ; но стирает вместе с предшествующим пробелом
                  ; в окнах выделяет уще и пробелл но стирает то что выделено
                  
                  ; Событие двойной клик происходит по разному
                  ; - mac os -
                  ; LeftButtonDown 
                  ; LeftButtonUp 
                  ; LeftClick 
                  ; LeftDoubleClick 
                  
                  ; - windows & linux -
                  ; LeftButtonDown
                  ; LeftDoubleClick
                  ; LeftButtonUp
                  ; LeftClick
                  
                  *this\index[2] = _line_
                  
                  Caret = _text_sel_stop_(*this)
                  *this\row\caret\time = ElapsedMilliseconds()
                  *this\row\caret\start = _text_sel_start_(*this)
                  Repaint = _text_set_selector_(*this, *this\index[2], Caret)
                  *this\row\selected = \row\_s() ; *this\index[2]
                  
              Case #PB_EventType_LeftButtonDown
                
                If _line_ >= 0 And 
                   _line_ < \countitems And 
                   _line_ <> \row\_s()\index And 
                   SelectElement(\row\_s(), _line_) 
                EndIf
                
                If *this\row\selected And 
                   *this\row\selected = \row\_s() And
                   (ElapsedMilliseconds() - *this\row\caret\time) < 500
                  
                  *this\row\caret\start = 0
                    *this\row\box\checked = #False
                    *this\row\selected = #Null
                  Repaint = _text_set_selector_(*this, _line_, \row\_s()\text\len)
                  
                Else
                  _start_drawing_(*this)
                  *this\row\selected = \row\_s()
                  
                  If *this\text\editable And _text_is_sel_line_(*this)
                    ; Отмечаем что кликнули
                    ; по выделеному тексту
                    *this\row\box\checked = 1
                    
                    Debug "sel - "+\row\_s()\text[2]\width
                    SetGadgetAttribute(*this\root\canvas, #PB_Canvas_Cursor, #PB_Cursor_Default)
                  Else
                    ; reset items selection
                    PushListPosition(*this\row\_s())
                    ForEach *this\row\_s()
                      If *this\row\_s()\text[2]\width <> 0 
                        _text_sel_reset_(*this\row\_s())
                      EndIf
                    Next
                    PopListPosition(*this\row\_s())
                    
                    Caret = _text_caret_(*this)
                    
                    \index[2] = \row\_s()\index 
                    
                    \row\caret\start = Caret 
                    
                    Repaint = Bool(_text_sel_set_(*this, _line_, Caret))
                  EndIf
                  
                  StopDrawing() 
                EndIf
                
                
              Case #PB_EventType_MouseMove  
                If \root\mouse\buttons & #PB_Canvas_LeftButton 
                  Repaint = _text_set_selector_(*this, _line_)
                EndIf
                
              Case #PB_EventType_LeftButtonUp  
                If *this\text\editable And *this\row\box\checked
;                   
;                   If _line_ >= 0 And 
;                      _line_ < \countitems And 
;                      _line_ <> \row\_s()\index And 
;                      SelectElement(\row\_s(), _line_) 
;                   EndIf
;                    
                  _start_drawing_(*this)
                  
                  ; на одной линии работает
                  ; теперь надо сделать чтоб и на другие линии можно было бросать
                  If *this\row\caret\start = *this\row\caret\stop 
                    
                    ; Если бросили на правую сторону от выделеного текста.
                    If *this\index[2] = *this\index[1] And *this\row\caret\start > *this\row\selected\text[2]\pos + *this\row\selected\text[2]\len
                      *this\row\caret\start - *this\row\selected\text[2]\len
                    EndIf
                    ; Debug ""+*this\row\caret\start +" "+ *this\row\selected\text[2]\pos
                    
                    *this\row\selected\text\string = RemoveString(*this\row\selected\text\string, *this\row\selected\text[2]\string, #PB_String_CaseSensitive, *this\row\selected\text[2]\pos, 1)
                    *this\text\string = RemoveString(*this\text\string, *this\row\selected\text[2]\string, #PB_String_CaseSensitive, *this\row\selected\text\pos+*this\row\selected\text[2]\pos, 1)
                    
                    *this\row\_s()\text\string = InsertString(*this\row\_s()\text\string, *this\row\selected\text[2]\string, *this\row\caret\start+1)
                    *this\text\string = InsertString(*this\text\string, *this\row\selected\text[2]\string, *this\row\_s()\text\pos+*this\row\caret\start+1)
                    
;                     text_insert(*this, *this\row\selected\text[2]\string)
                    
                    Debug *this\row\selected\index
;                     *this\index[1] = *this\row\selected\index
;                     *this\index[2] = *this\row\selected\index
;                     Protected len = *this\row\selected\text[2]\len
;                     ;
;                     _line_ = *this\row\selected\index
;                     If _line_ >= 0 And 
;                      _line_ < \countitems And 
;                      _line_ <> \row\_s()\index And 
;                      SelectElement(\row\_s(), _line_) 
;                   EndIf
;                           
                    Debug *this\row\selected\text\string
                    
                    If *this\index[2] <> *this\index[1]
                    ; *this\text\change =- 1
                      _text_sel_reset_(*this\row\selected)
                      *this\index[2] = *this\index[1]
                      
;                          *this\text\change =- 1
;                       text_multiline_make(*this)
;                        *this\text\change = 0
;                     
                    EndIf
                    
                    *this\row\caret\stop = *this\row\selected\text[2]\len
                    
                    ;Swap *this\row\caret\stop, *this\row\caret\start
                      *this\row\selected = #Null
                    
                     Repaint = _text_sel_(*this, *this\row\caret\start, *this\row\caret\stop)
                    ;Repaint = _text_sel_set_(*this, *this\index[1], *this\row\caret\start); + *this\row\selected\text[2]\len)
                     
                    SetGadgetAttribute(*this\root\canvas, #PB_Canvas_Cursor, #PB_Cursor_IBeam)
                  Else
                    *this\row\caret\start = _text_caret_(*this)
                    *this\row\_s()\text[2]\len = 0
                    *this\index[2] = _line_
                    Repaint = _text_sel_set_(*this, _line_, *this\row\caret\start + *this\row\selected\text[2]\len)
                  EndIf
                  
                  StopDrawing() 
                  *this\row\box\checked = #False
                  *this\row\selected = #Null
                  Repaint = 1
                EndIf
                  
              Default
                itemSelect(\index[2], \row\_s())
            EndSelect
          EndIf
          
          ; edit events
          If *Focus = *this And (*this\text\editable Or \text\editable)
            Repaint | events_key_editor(*this, EventType, \root\mouse\x, \root\mouse\y)
          EndIf
        EndIf
      EndIf
    EndWith
    
    ProcedureReturn Repaint
  EndProcedure
  
  
  Procedure.i Text_Events(*Function, *this._struct_, EventType.i, Canvas.i=-1, CanvasModifiers.i=-1)
    Static *Last._struct_, *Widget._struct_    ; *Focus._struct_, 
    Static Text$, DoubleClick, LastX, LastY, Last, Drag
    Protected.i Result, Repaint, _key_control_, Buttons, Widget
    
    ; widget_events_type
    If *this
      With *this
        If Canvas=-1 
          Widget = *this
          Canvas = EventGadget()
        Else
          Widget = Canvas
        EndIf
        ;         If Canvas <> \root\canvas
        ;           ProcedureReturn 
        ;         EndIf
        ;         Macro From(_this_, _buttons_=0)
        ;     Bool(_this_\root\mouse\x>=_this_\x[_buttons_] And _this_\root\mouse\x<_this_\x[_buttons_]+_this_\width[_buttons_] And 
        ;          _this_\root\mouse\y>=_this_\y[_buttons_] And _this_\root\mouse\y<_this_\y[_buttons_]+_this_\height[_buttons_])
        ;   EndMacro
        
        
        ; Get at point widget
        ;\root\mouse\from = From(*this)
        \root\mouse\from = _from_point_(\root\mouse\x, \root\mouse\y, *this)
        
        Select EventType 
          Case #PB_EventType_LeftButtonUp 
            If *Last = *this
              If *Widget <> *Focus
                ProcedureReturn 0 
              EndIf
            EndIf
            
          Case #PB_EventType_LeftClick 
            ; Debug ""+\root\mouse\buttons+" Last - "+*Last +" Widget - "+*Widget +" Focus - "+*Focus +" This - "+*this
            If *Last = *this : *Last = *Widget
              If *Widget <> *Focus
                ProcedureReturn 0 
              EndIf
            EndIf
            
            If Not *this\root\mouse\from 
              ProcedureReturn 0
            EndIf
        EndSelect
        
        If Not \hide And Not \Disable And \interact And Widget <> Canvas And CanvasModifiers 
          Select EventType 
            Case #PB_EventType_Focus : ProcedureReturn 0 ; Bug in mac os because it is sent after the mouse left down
            Case #PB_EventType_MouseMove, #PB_EventType_LeftButtonUp
              If Not \root\mouse\buttons 
                If \root\mouse\from
                  If *Last <> *this 
                    If *Last
                      If (*Last\index > *this\index)
                        ProcedureReturn 0
                      Else
                        ; Если с нижнего виджета перешли на верхный, 
                        ; то посылаем событие выход для нижнего
                        Text_Events(*Function, *Last, #PB_EventType_MouseLeave, Canvas, 0)
                        *Last = *this
                      EndIf
                    Else
                      *Last = *this
                    EndIf
                    
                    EventType = #PB_EventType_MouseEnter
                    *Widget = *Last
                  EndIf
                  
                ElseIf (*Last = *this)
                  If EventType = #PB_EventType_LeftButtonUp 
                    Text_Events(*Function, *Widget, #PB_EventType_LeftButtonUp, Canvas, 0)
                  EndIf
                  
                  EventType = #PB_EventType_MouseLeave
                  *Last = *Widget
                  *Widget = 0
                EndIf
              EndIf
              
            Case #PB_EventType_LostFocus
              If (*Focus = *this)
                *Last = *Focus
                Text_Events(*Function, *Focus, #PB_EventType_LostFocus, Canvas, 0)
                *Last = *Widget
              EndIf
              
            Case #PB_EventType_LeftButtonDown
              If (*Last = *this)
                PushListPosition(List())
                ForEach List()
                  If List()\widget\focus = List()\widget And List()\widget <> *this 
                    
                    List()\widget\focus = 0
                    *Last = List()\widget
                    Text_Events(*Function, List()\widget, #PB_EventType_LostFocus, List()\widget\root\canvas, 0)
                    *Last = *Widget 
                    
                    ; 
                    _repaint_(List()\widget)
                    Break 
                  EndIf
                Next
                PopListPosition(List())
                
                If *this <> \focus : \focus = *this : *Focus = *this
                  Text_Events(*Function, *this, #PB_EventType_Focus, Canvas, 0)
                EndIf
              EndIf
              
          EndSelect
        EndIf
        
        If (*Last = *this) 
          Select EventType
            Case #PB_EventType_LeftButtonDown
              If Not \root\mouse\Delta
                \root\mouse\Delta = AllocateStructure(_s_mouse)
                \root\mouse\Delta\x = \root\mouse\x
                \root\mouse\Delta\y = \root\mouse\y
                \root\mouse\delta\from = \root\mouse\from
                \root\mouse\Delta\buttons = \root\mouse\buttons
              EndIf
              
            Case #PB_EventType_LeftButtonUp : \Drag = 0
              FreeStructure(\root\mouse\Delta) : \root\mouse\Delta = 0
              ; ResetStructure(\root\mouse\Delta, _s_mouse)
              
            Case #PB_EventType_MouseMove
              If \Drag = 0 And \root\mouse\buttons And \root\mouse\Delta And 
                 (Abs((\root\mouse\x-\root\mouse\Delta\x)+(\root\mouse\y-\root\mouse\Delta\y)) >= 6) : \Drag=1
                ; PostEvent(#PB_Event_Widget, \root\window, \root\canvas, #PB_EventType_DragStart)
              EndIf
              
            Case #PB_EventType_MouseLeave
              If CanvasModifiers 
                ; Если перешли на другой виджет
                PushListPosition(List())
                ForEach List()
                  If List()\widget\root\canvas = Canvas And List()\widget\focus <> List()\widget And List()\widget <> *this
                    List()\widget\root\mouse\from = _from_point_(List()\widget\root\mouse\x, List()\widget\root\mouse\y, List()\widget)
                    
                    If List()\widget\root\mouse\from
                      If *Last
                        Text_Events(*Function, *Last, #PB_EventType_MouseLeave, Canvas, 0)
                      EndIf     
                      
                      *Last = List()\widget
                      *Widget = List()\widget
                      ProcedureReturn Text_Events(*Function, *Last, #PB_EventType_MouseEnter, Canvas, 0)
                    EndIf
                  EndIf
                Next
                PopListPosition(List())
              EndIf
              
              If \cursor[1] <> GetGadgetAttribute(\root\canvas, #PB_Canvas_Cursor)
                SetGadgetAttribute(\root\canvas, #PB_Canvas_Cursor, \cursor[1])
                \cursor[1] = 0
              EndIf
              
            Case #PB_EventType_MouseEnter    
              If Not \cursor[1] 
                \cursor[1] = GetGadgetAttribute(\root\canvas, #PB_Canvas_Cursor)
              EndIf
              SetGadgetAttribute(\root\canvas, #PB_Canvas_Cursor, \cursor)
              
            Case #PB_EventType_MouseMove ; bug mac os
              If \root\mouse\buttons And #PB_Compiler_OS = #PB_OS_MacOS ; And \cursor <> GetGadgetAttribute(\root\canvas, #PB_Canvas_Cursor)
                                                                        ; Debug 555
                SetGadgetAttribute(\root\canvas, #PB_Canvas_Cursor, \cursor)
              EndIf
              
          EndSelect
        EndIf 
        
      EndWith
    EndIf
    
    If (*Last = *this) Or (*Focus = *this And *this\text\editable); Or (*Last = *Focus)
      CompilerIf #PB_Compiler_OS = #PB_OS_Windows
        Result | CallFunctionFast(*Function, *this, eventtype, *this\root\mouse\x, *this\root\mouse\y)
      CompilerElse
        Result | CallCFunctionFast(*Function, *this, eventtype, *this\root\mouse\x, *this\root\mouse\y)
      CompilerEndIf
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i Text_CallBack(*Function, *this._struct_, EventType.i, Canvas.i=-1, CanvasModifiers.i=-1)
    ; Canvas events bug fix
    Protected Result.b
    Static MouseLeave.b
    Protected EventGadget.i = EventGadget()
    
    Protected Width = GadgetWidth(EventGadget)
    Protected Height = GadgetHeight(EventGadget)
    Protected MouseX = GetGadgetAttribute(EventGadget, #PB_Canvas_MouseX)
    Protected MouseY = GetGadgetAttribute(EventGadget, #PB_Canvas_MouseY)
    
    If Canvas =- 1
      With *this
        Select EventType
          Case #PB_EventType_Repaint
            Debug " -- Canvas repaint -- "
          Case #PB_EventType_Input 
            \root\keyboard\input = GetGadgetAttribute(\root\canvas, #PB_Canvas_Input)
            \root\keyboard\key[1] = GetGadgetAttribute(\root\canvas, #PB_Canvas_Modifiers)
          Case #PB_EventType_KeyDown, #PB_EventType_KeyUp
            \root\keyboard\key = GetGadgetAttribute(\root\canvas, #PB_Canvas_Key)
            \root\keyboard\key[1] = GetGadgetAttribute(\root\canvas, #PB_Canvas_Modifiers)
          Case #PB_EventType_MouseEnter, #PB_EventType_MouseMove, #PB_EventType_MouseLeave
            \root\mouse\x = GetGadgetAttribute(\root\canvas, #PB_Canvas_MouseX)
            \root\mouse\y = GetGadgetAttribute(\root\canvas, #PB_Canvas_MouseY)
          Case #PB_EventType_LeftButtonDown, #PB_EventType_LeftButtonUp, 
               #PB_EventType_MiddleButtonDown, #PB_EventType_MiddleButtonUp, 
               #PB_EventType_RightButtonDown, #PB_EventType_RightButtonUp
            
            CompilerIf #PB_Compiler_OS = #PB_OS_Linux
              \root\mouse\buttons = (Bool(EventType = #PB_EventType_LeftButtonDown) * #PB_Canvas_LeftButton) |
                                    (Bool(EventType = #PB_EventType_MiddleButtonDown) * #PB_Canvas_MiddleButton) |
                                    (Bool(EventType = #PB_EventType_RightButtonDown) * #PB_Canvas_RightButton) 
            CompilerElse
              \root\mouse\buttons = GetGadgetAttribute(\root\canvas, #PB_Canvas_Buttons)
            CompilerEndIf
        EndSelect
      EndWith
    EndIf
    
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
              Result | Text_Events(*Function, *this, #PB_EventType_LeftButtonUp, Canvas, CanvasModifiers)
              EventType = #PB_EventType_MouseLeave
            CompilerEndIf
          Else
            MouseLeave =- 1
            Result | Text_Events(*Function, *this, #PB_EventType_LeftButtonUp, Canvas, CanvasModifiers)
            EventType = #PB_EventType_LeftClick
          EndIf
          
        Case #PB_EventType_LeftClick : ProcedureReturn 0
      EndSelect
    CompilerEndIf
    
    Result | Text_Events(*Function, *this, EventType, Canvas, CanvasModifiers)
    
    ProcedureReturn Result
  EndProcedure
  
  
  Procedure.i CallBack(*this._struct_, EventType.i, Canvas.i=-1, CanvasModifiers.i=-1)
    ProcedureReturn Text_CallBack(@events_editor(), *this, EventType, Canvas, CanvasModifiers)
  EndProcedure
  
  Procedure.i Editor(X.l, Y.l, Width.l, Height.l, Text.s, Flag.i=0, round.i=0)
    Protected *this._struct_ = AllocateStructure(_struct_)
    
    If *this
      With *this
        \type = #PB_GadgetType_Editor
        \cursor = #PB_Cursor_IBeam
        ;\DrawingMode = #PB_2DDrawing_Default
        \round = round
        \color\alpha = 255
        \interact = 1
        
        \row\caret\start =- 1
        \row\caret\stop =- 1
        \row\index =- 1
        
        \index[1] =- 1
        \x =- 1
        \y =- 1
        
        If Not \text\fontID
          \text\fontID = GetGadgetFont(#PB_Default) ; Bug in Mac os
        EndIf
        
        \fs = Bool(Not Flag&#__flag_BorderLess)+1
        \bs = \fs
        
        ;\flag\checkBoxes = Bool(flag&#__flag_CheckBoxes)*12 ; Это еще будет размер чек бокса
        ;\flag\buttons = Bool(flag&#__flag_NoButtons)
        ;\flag\lines = Bool(flag&#__flag_NoLines)
        
        \vertical = Bool(Flag&#__flag_Vertical)
        
        \flag\fullSelection = Bool(Not flag&#__flag_FullSelection)*7
        \flag\alwaysSelection = Bool(flag&#__flag_AlwaysSelection)
        \flag\gridLines = Bool(flag&#__flag_GridLines)
        
        \flag\multiSelect = 1
        \row\caret\width = 7
        
        \text\editable = Bool(Not Flag&#__text_ReadOnly)
        \text\numeric = Bool(Flag&#__text_Numeric)
        \text\lower = Bool(Flag&#__text_LowerCase)
        \text\upper = Bool(Flag&#__text_UpperCase)
        \text\pass = Bool(Flag&#__text_Password)
        
        \row\margin\level = \text\numeric
        \row\margin\color\front = $C8000000 ; \color\back[0] 
        \row\margin\color\back = $C8F0F0F0 ; \color\back[0] 
        \text\numeric = 0
        
        If Not Flag&#__editor_inline
          If Flag&#__text_WordWrap
            \text\multiLine = 1
          ElseIf Bool(Flag&#__text_MultiLine)
            \text\multiLine = 2
          Else
            \text\multiLine =- 1
          EndIf
        EndIf
        
        \text\align\horizontal = Bool(Flag&#__text_Center)
        ;\text\align\Vertical = Bool(Flag&#__text_Middle)
        \text\align\right = Bool(Flag&#__text_Right)
        \text\align\bottom = Bool(Flag&#__text_Bottom)
        
        If \vertical
          \text\x = \fs 
          \text\y = \fs+2
        Else
          \text\x = \fs+2
          \text\y = \fs
        EndIf
        
        \color = _color_
        \color\fore = 0
        
        \row\color = _color_
        \row\color\fore[0] = 0
        \row\color\fore[1] = 0
        \row\color\fore[2] = 0
        \row\color\back[0] = \row\color\back[1]
        \row\color\frame[0] = \row\color\frame[1]
        ;\color\back[1] = \color\back[0]
        
        If \text\editable
          \color\back[0] = $FFFFFFFF 
        Else
          \color\back[0] = $FFF0F0F0  
        EndIf
      EndIf
      
      ; create scrollbars
      Bar::Bars(\scroll, 16, 7, Bool(\text\multiLine <> 1))
      
      Resize(*this, X,Y,Width,Height)
      
      ; set text
      If Text
        SetText(*this, Text.s)
      Else
        \repaint = #True
        \text\change = #True
        \text\string = #LF$
        \countitems = 1
        \text\len = 1
      EndIf
    EndWith
    
    ProcedureReturn *this
  EndProcedure
  
  Procedure.i Create(Canvas.i, Widget, X.l, Y.l, Width.l, Height.l, Text.s="", Flag.i=0, round.i=0)
    Protected *Widget, *this._struct_ = AllocateStructure(_struct_)
    
    If *this
      add_widget(Widget, *Widget)
      
      
      *this = Editor(x, y, Width, Height, Text.s, Flag, round)
      *this\index = Widget
      *this\handle = *Widget
      List()\widget = *this
      
      *this\root = AllocateStructure(_s_root)
      *this\root\canvas = Canvas
      If Not *this\root\window
        *this\root\window = GetActiveWindow() ; GetGadgetData(Canvas)
      EndIf
      
      _repaint_(*this)
      ;       PostEvent(#PB_Event_Widget, *this\root\window, *this, #PB_EventType_Create)
      ;       BindEvent(#PB_Event_Widget, @Widget_CallBack(), *this\root\window, *this, #PB_EventType_Create)
      ;       SetGadgetData(Canvas, *this)
      ;       BindGadgetEvent(Canvas, @Canvas_CallBack())
    EndIf
    
    ProcedureReturn *this
  EndProcedure
  
  Procedure Canvas_CallBack()
    Protected Repaint, *this._struct_ = GetGadgetData(EventGadget())
    
    With *this
      Select EventType()
        Case #PB_EventType_Repaint 
          \row\count = \countitems
          
          If *this\repaint 
            *this\repaint = 0
            Repaint = 1
          EndIf
          
        Case #PB_EventType_Resize : ResizeGadget(\root\canvas, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore) ; Bug (562)
          Repaint | Resize(*this, #PB_Ignore, #PB_Ignore, GadgetWidth(\root\canvas), GadgetHeight(\root\canvas))
      EndSelect
      
      Repaint | CallBack(*this, EventType())
      
      If Repaint 
        ReDraw(*this)
      EndIf
      
    EndWith
  EndProcedure
  
  Procedure.i Gadget(Gadget.i, X.l, Y.l, Width.l, Height.l, Flag.i=0)
    Protected g = CanvasGadget(Gadget, X, Y, Width, Height, #PB_Canvas_Keyboard) : If Gadget=-1 : Gadget=g : EndIf
    Protected *this._struct_ = Editor(0, 0, Width, Height, "", Flag)
    
    If *this
      With *this
        *this\root = AllocateStructure(_s_root)
        *this\root\window = GetActiveWindow()
        *this\root\canvas = Gadget
        
        ;
        If *this\repaint
          PostEvent(#PB_Event_Gadget, *this\root\window, *this\root\canvas, Constants::#PB_EventType_Repaint)
        EndIf
        
        SetGadgetData(Gadget, *this)
        BindGadgetEvent(Gadget, @Canvas_CallBack())
        
        ; z-order
        CompilerIf #PB_Compiler_OS = #PB_OS_Windows
          SetWindowLongPtr_( GadgetID(Gadget), #GWL_STYLE, GetWindowLongPtr_( GadgetID(Gadget), #GWL_STYLE ) | #WS_CLIPSIBLINGS )
          SetWindowPos_( GadgetID(Gadget), #GW_HWNDFIRST, 0,0,0,0, #SWP_NOMOVE|#SWP_NOSIZE )
        CompilerEndIf
      EndWith
    EndIf
    
    ProcedureReturn Gadget
  EndProcedure
  
EndModule



;- EXAMPLE
CompilerIf #PB_Compiler_IsMainFile
  
  Define a,i, *g.Editor::_struct_
  Define g, Text.s
  ; Define m.s=#CRLF$
  Define m.s=#LF$
  
  Text.s = "This is a long line" + m.s +
           "Who should show," + m.s +
           "I have to write the text in the box or not." + m.s +
           "The string must be very long" + m.s +
           "Otherwise it will not work."
  
  Procedure ResizeCallBack()
    ResizeGadget(10, #PB_Ignore, #PB_Ignore, WindowWidth(EventWindow(), #PB_Window_InnerCoordinate)-16, WindowHeight(EventWindow(), #PB_Window_InnerCoordinate)-16-25-5-10)
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
  
  
  Text.s = "This is a long line." + m.s +
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
  
  
  If OpenWindow(0, 0, 0, 422, 491, "EditorGadget", #PB_Window_SystemMenu | #PB_Window_SizeGadget | #PB_Window_ScreenCentered)
    ButtonGadget(100, 8,8,67,25,"gettext")
    ButtonGadget(101, 8+70,8,67,25,"wrap")
    
    g=166
    Editor::Gadget(g, 8+70+70, 5, 422-156, 40, _const_flag_GridLines|_const_flag_Numeric) 
    *g=GetGadgetData(g)
    *g\text\multiLine = 0
    Editor::SetText(*g, Text.s) 
    
    
    EditorGadget(0, 8, 8, 306, 133, #PB_Editor_WordWrap) 
    SetGadgetText(0, Text.s) 
    For a = 0 To 2
      AddGadgetItem(0, a, "Line "+Str(a))
    Next
    AddGadgetItem(0, 7+a, "_")
    For a = 4 To 6
      AddGadgetItem(0, a, "Line "+Str(a))
    Next
    
    
    g=16
    Editor::Gadget(g, 8, 133+5+8, 306, 133, _const_flag_GridLines|_const_flag_Numeric|_const_text_WordWrap) 
    *g=GetGadgetData(g)
    Editor::SetText(*g, Text.s) 
    
    For a = 0 To 2
      Editor::AddItem(*g, a, "Line "+Str(a))
    Next
    Editor::AddItem(*g, 7+a, "_")
    For a = 4 To 6
      Editor::AddItem(*g, a, "Line "+Str(a))
    Next
    
    ;SetGadgetFont(0, FontID(0))
    ;Editor::SetFont(*g, FontID(0))
    
    SplitterGadget(10,8, 8+25+5+10, 306, 491-16-10 , 0,g)
    CompilerIf #PB_Compiler_Version =< 546
      BindGadgetEvent(10, @SplitterCallBack())
    CompilerEndIf
    PostEvent(#PB_Event_SizeWindow, 0, #PB_Ignore) ; Bug
    BindEvent(#PB_Event_SizeWindow, @ResizeCallBack(), 0)
    
    Debug ""+GadgetHeight(0) +" "+ GadgetHeight(g)
    Repeat 
      Define Event = WaitWindowEvent()
      
      Select Event
        Case #PB_Event_Gadget
          Select EventType()
            Case #PB_EventType_LeftClick
              Define *E.Editor::_struct_ = GetGadgetData(g)
              
              If EventGadget() = 100
                ClearDebugOutput()
                If *E\text[1]\string
                  Debug "1) -----left------"
                  Debug *E\text[1]\string 
                EndIf
                If *E\text[2]\string
                  Debug "2) -----selected-----"
                  Debug *E\text[2]\string
                EndIf
                If *E\text[3]\string
                  Debug "3) -----right------"
                  Debug *E\text[3]\string
                EndIf
                Debug "------end------"
                
                Debug ""
                Debug "-----lines-----"
                ; Выделение конца строки
                PushListPosition(*E\row\_s()) 
                ForEach *E\row\_s()
                  If *E\row\_s()\text[2]\width
                    Debug ""+*E\row\_s()\index +" - "+ *E\row\_s()\text[2]\string
                  EndIf
                Next
                PopListPosition(*E\row\_s()) 
                Debug "-----endlines-----"
                
              ElseIf EventGadget() = 101
                *E\text\multiLine ! 1
                
                If  *E\text\multiLine <> 0
                  SetGadgetText(101,"wrap")
                Else
                  SetGadgetText(101,"~wrap")
                EndIf
                
                CompilerSelect #PB_Compiler_OS
                  CompilerCase #PB_OS_Linux
                    If  *E\text\multiLine = 1
                      gtk_text_view_set_wrap_mode_(GadgetID(0), #GTK_WRAP_WORD)
                    Else
                      gtk_text_view_set_wrap_mode_(GadgetID(0), #GTK_WRAP_NONE)
                    EndIf
                    
                  CompilerCase #PB_OS_MacOS
                    
                    If  *E\text\multiLine <> 0
                      SetGadgetAttribute(0, #PB_Editor_WordWrap, 1) 
                    Else
                      SetGadgetAttribute(0, #PB_Editor_WordWrap, 0)
                    EndIf
                    
;                     SetGadgetText(0, Text.s) 
;                     For a = 0 To 5
;                       AddGadgetItem(0, a, "Line "+Str(a))
;                     Next
;                     ;SetGadgetFont(0, FontID(0))
;                     
;                     SplitterGadget(10,8, 8+25+5+10, 306, 491-16-10 , 0,g)
;                     
;                     CompilerIf #PB_Compiler_Version =< 546
;                       BindGadgetEvent(10, @SplitterCallBack())
;                     CompilerEndIf
;                     PostEvent(#PB_Event_SizeWindow, 0, #PB_Ignore) ; Bug
;                     BindEvent(#PB_Event_SizeWindow, @ResizeCallBack(), 0)
                    
                    ; ;                     ImportC ""
                    ; ;                       GetControlProperty(Control, PropertyCreator, PropertyTag, BufferSize, *ActualSize, *PropertyBuffer)
                    ; ;                       TXNSetTXNObjectControls(TXNObject, ClearAll, ControlCount, ControlTags, ControlData)
                    ; ;                     EndImport
                    ; ;                     
                    ; ;                     Define TXNObject.i
                    ; ;                     Dim ControlTag.i(0)
                    ; ;                     Dim ControlData.i(0)
                    ; ;                     
                    ; ;                     ControlTag(0) = 'wwrs' ; kTXNWordWrapStateTag
                    ; ;                     ControlData(0) = 0     ; kTXNAutoWrap
                    ; ;                     
                    ; ;                     If GetControlProperty(GadgetID(0), 'PURE', 'TXOB', 4, 0, @TXNObject) = 0
                    ; ;                       TXNSetTXNObjectControls(TXNObject, #False, 1, @ControlTag(0), @ControlData(0))
                    ; ;                     EndIf
                  CompilerCase #PB_OS_Windows
                    SendMessage_(GadgetID(0), #EM_SETTARGETDEVICE, 0, 0)
                    ; SendMessage_ (GadgetID (0), #EM_SETTARGETDEVICE, #NULL, $FFFFFF); чтобы снова отключить перенос слов (используйте просто огромное значение, 
                CompilerEndSelect
                
              EndIf
              
          EndSelect
          
        Case #PB_Event_LeftClick  
          SetActiveGadget(0)
        Case #PB_Event_RightClick 
          SetActiveGadget(10)
      EndSelect
    Until Event = #PB_Event_CloseWindow
  EndIf
CompilerEndIf
; IDE Options = PureBasic 5.71 LTS (MacOS X - x64)
; Folding = ---------------------------------------------------------------------------------------------------------
; EnableXP