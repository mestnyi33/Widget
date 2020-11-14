﻿IncludePath "../../"
XIncludeFile "widgets.pbi"

Uselib( Widget )

#Window = 0

Enumeration   1 ; Images
  #ImageSource
  #ImageTarget
EndEnumeration

Global SourceText,
       SourceImage,
       SourceFiles,
       SourcePrivate,
       TargetText,
       TargetImage,
       TargetFiles,
       TargetPrivate1,
       TargetPrivate2

Global i, Event

Procedure Events( )
  Protected EventWidget.i = this( )\widget,
            EventType.i = this( )\event,
            EventItem.i = this( )\item, 
            EventData.i = this( )\data
  
  Protected i, Text$, Files$, Count
  
  ; DragStart event on the source s, initiate a drag & drop
  ;
  Select EventType
    Case #PB_EventType_DragStart
      Debug  "Drag " + EventWidget
      
      Select EventWidget
          
        Case SourceText
          Debug GetState( SourceText ) 
          Text$ = GetItemText( SourceText, GetState( SourceText ) )
          DraggedText( Text$ )
          
        Case SourceImage
          DraggedImage( ( #ImageSource ) )
          
        Case SourceFiles
; ;           Files$ = ""       
; ; ;           For i = 0 To CountItems( SourceFiles )-1
; ; ;             If GetItemState( SourceFiles, i ) & #PB_Explorer_Selected
; ;           i = GetState( SourceFiles )
; ;           Files$ + GetText( SourceFiles ) + GetItemText( SourceFiles, i ) ; + Chr( 10 )
; ; ;             EndIf
; ; ;           Next i 
; ;           
; ;           If Files$ <> ""
; ;             DragFiles( Files$ )
; ;           EndIf
; ;           
; ;           ; "Private" Drags only work within the program, everything else
; ;           ; also works with other applications ( Explorer, Word, etc )
; ;           ;
        Case SourcePrivate
          If GetState( SourcePrivate ) = 0
            DraggedPrivate( 1 )
          Else
            DraggedPrivate( 2 )
          EndIf
          
      EndSelect
      
      ; Drop event on the target gadgets, receive the dropped data
      ;
    Case #PB_EventType_Drop
      Debug  "Drop - " + EventWidget
      
      Select EventWidget
          
        Case TargetText
          AddItem( TargetText, -1, DroppedText( ) )
          
        Case TargetImage
          If DroppedImage( #ImageTarget )
            SetState( TargetImage, ( #ImageTarget ) )
          EndIf
          
        Case TargetFiles
; ;           Files$ = DroppedFiles( )
; ;           Count  = CountString( Files$, Chr( 10 ) ) + 1
; ;           For i = 1 To Count
; ;             AddItem( TargetFiles, -1, StringField( Files$, i, Chr( 10 ) ) )
; ;           Next i
          
        Case TargetPrivate1
          AddItem( TargetPrivate1, -1, "Private type 1 dropped" )
          
        Case TargetPrivate2
          AddItem( TargetPrivate2, -1, "Private type 2 dropped" )
          
      EndSelect
      
  EndSelect
  
EndProcedure

font = LoadFont( 0, "Aria", 13 )

If Open( #Window, 0, 0, 760, 310, "Drag & Drop", #PB_Window_SystemMenu|#PB_Window_ScreenCentered )       
  ;
  ; Create some images for the image demonstration
  ; 
  CreateImage( #ImageSource, 136, 136 )
  If StartDrawing( ImageOutput( #ImageSource ) )
    DrawingFont( font )
    
    Box( 0, 0, 136, 136, $FFFFFF )
    DrawText( 5, 5, "Drag this image", $000000, $FFFFFF )        
    For i = 45 To 1 Step -1
      Circle( 70, 80, i, Random( $FFFFFF ) )
    Next i        
    
    StopDrawing( )
  EndIf  
  
  CreateImage( #ImageTarget, 136, 136 )
  If StartDrawing( ImageOutput( #ImageTarget ) )
    DrawingFont( font )
    
    Box( 0, 0, 136, 136, $FFFFFF )
    DrawText( 5, 5, "Drop images here", $000000, $FFFFFF )
    StopDrawing( )
  EndIf  
  
  ; Create and fill the source s
  ;
  SourceText = ListIcon( 10, 10, 140, 140, "Drag Text here", 130 )   
  SourceImage = Image( 160, 10, 140, 140, ( #ImageSource ), #PB_Image_Border ) 
  SourceFiles = ExplorerList( 310, 10, 290, 140, GetHomeDirectory( ), #PB_Explorer_MultiSelect )
  SourcePrivate = ListIcon( 610, 10, 140, 140, "Drag private stuff here", 260 )
  
  AddItem( SourceText, -1, "hello world" )
  AddItem( SourceText, -1, "The quick brown fox jumped over the lazy dog" )
  AddItem( SourceText, -1, "abcdefg" )
  AddItem( SourceText, -1, "123456789" )
  
  AddItem( SourcePrivate, -1, "Private type 1" )
  AddItem( SourcePrivate, -1, "Private type 2" )
  
  
  ; Create the target s
  ;
  TargetText = ListIcon( 10, 160, 140, 140, "Drop Text here", 130 )
  TargetImage = Image( 160, 160, 140, 140, ( #ImageTarget ), #PB_Image_Border ) 
  TargetFiles = ListIcon( 310, 160, 140, 140, "Drop Files here", 130 )
  TargetPrivate1 = ListIcon( 460, 160, 140, 140, "Drop Private Type 1 here", 130 )
  TargetPrivate2 = ListIcon( 610, 160, 140, 140, "Drop Private Type 2 here", 130 )
  
  ; Now enable the dropping on the target s
  ;
  EnableDrop( TargetText,     #PB_Drop_Text,    #PB_Drag_Copy )
  EnableDrop( TargetImage,    #PB_Drop_Image,   #PB_Drag_Copy )
  EnableDrop( TargetFiles,    #PB_Drop_Files,   #PB_Drag_Copy )
  EnableDrop( TargetPrivate1, #PB_Drop_Private, #PB_Drag_Copy, 1 )
  EnableDrop( TargetPrivate2, #PB_Drop_Private, #PB_Drag_Copy, 2 )
  
  ; Bind( -1, @Events( ) )
  
  Bind( SourceImage, @Events( ), #PB_EventType_DragStart )
  Bind( TargetImage, @Events( ), #PB_EventType_Drop )
  
  Bind( SourceText, @Events( ), #PB_EventType_DragStart )
  Bind( TargetText, @Events( ), #PB_EventType_Drop )
  
  Bind( SourcePrivate, @Events( ), #PB_EventType_DragStart )
  Bind( TargetPrivate1, @Events( ), #PB_EventType_Drop )
  Bind( TargetPrivate2, @Events( ), #PB_EventType_Drop )
  
  ReDraw( Root( ) )
  
  Repeat
    Event = WaitWindowEvent( )
  Until Event = #PB_Event_CloseWindow
EndIf

End
; IDE Options = PureBasic 5.72 (MacOS X - x64)
; Folding = --
; EnableXP