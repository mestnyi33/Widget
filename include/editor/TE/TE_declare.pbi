﻿;-
	;- ------------ DECLARE -----------
	;-
	
	Declare Editor_New(window, x, y, width, height, languageFile.s = "")
	
	Declare View_Add(*te.TE_STRUCT, x, y, width, height, *parent.TE_VIEW, *view.TE_VIEW = #Null)
	Declare View_Split(*te.TE_STRUCT, x, y, splitMode = #TE_View_SplitHorizontal)
	Declare View_Unsplit(*te.TE_STRUCT, x, y)
	Declare View_FromMouse(*te.TE_STRUCT, *view.TE_VIEW, x, y)
	
	Declare Max(a, b)
	Declare Min(a, b)
	Declare Clamp(value, min, max)
	Declare.s TokenName(*token.TE_TOKEN)
	Declare.s TokenText(*token.TE_TOKEN)
	Declare LineNr_from_VisibleLineNr(*te.TE_STRUCT, visibleLineNr)
	Declare LineNr_to_VisibleLineNr(*te.TE_STRUCT, lineNr)
	Declare BorderSize(*te.TE_STRUCT)
	Declare Position_InsideRange(*pos.TE_POSITION, *range.TE_RANGE, includeBorder = #True)
	Declare Position_Equal(*pos1.TE_POSITION, *pos2.TE_POSITION)
	Declare Position_Changed(*pos1.TE_POSITION, *pos2.TE_POSITION)
	
	Declare.s Text_Get(*te.TE_STRUCT, startLineNr, startCharNr, endLineNr, endCharNr)
	
	Declare Undo_Start(*undo.TE_UNDO)
	Declare Undo_Add(*undo.TE_UNDO, action, startLineNr = 0, startCharNr = 0, endLineNr = 0, endCharNr = 0, text.s = "")
	Declare Undo_Do(*te.TE_STRUCT, *undo.TE_UNDO, *redo.TE_UNDO)
	Declare Undo_Update(*te.TE_STRUCT)
	Declare Undo_Clear(*undo.TE_UNDO)
	
	Declare Syntax_Add(*te.TE_STRUCT, text.s, flags = #TE_Flag_Multiline)
	
	Declare Style_Textline(*te.TE_STRUCT, *textLine.TE_TEXTLINE, flags = 0)
	Declare Style_LoadFont(*te.TE_STRUCT, *font.TE_FONT, fontName.s, fontSize, fontStyle = 0)
	Declare Style_SetFont(*te.TE_STRUCT, fontName.s, fontSize, fontStyle = 0)
	Declare Style_Set(*te.TE_STRUCT, styleNr, fontNr, color, bColor = #TE_Ignore, underlined = #False)
	Declare Style_SetDefaultStyle(*te.TE_STRUCT)
	Declare Style_FromCharNr(*textLine.TE_TEXTLINE, charNr, scanWholeLine = #False)
	
	Declare Parser_Initialize(*parser.TE_PARSER)
	Declare Parser_Clear(*parser.TE_PARSER)
	Declare Parser_TokenAtCharNr(*te.TE_STRUCT, *textLine.TE_TEXTLINE, charNr, testBounds = #False, startIndex = 1)
	Declare Parser_NextToken(*te.TE_STRUCT, direction, flags = #TE_Flag_NoWhiteSpace)
	
	Declare KeyWord_Add(*te.TE_STRUCT, key.s, style = #TE_Ignore, caseCorrection = #TE_Ignore)
	Declare KeyWord_LineContinuation(*te.TE_STRUCT, key.s)
	Declare KeyWord_Folding(*te.TE_STRUCT, key.s, foldState)
	Declare KeyWord_Indentation(*te.TE_STRUCT, key.s, indentationBefore, indentationAfter)
	
	Declare Folding_Update(*te.TE_STRUCT, firstLine, lastLine)
	Declare Folding_UnfoldTextline(*te.TE_STRUCT, lineNr)
	Declare Folding_GetTextBlock(*te.TE_STRUCT, lineNr)
	
	Declare.s Indentation_Clear(*textLine.TE_TEXTLINE)
	
	Declare Textline_Add(*te.TE_STRUCT)
	Declare Textline_FromLine(*te.TE_STRUCT, lineNr)
	Declare Textline_FromVisibleLineNr(*te.TE_STRUCT, visibleLineNr)
	Declare Textline_TopLine(*te.TE_STRUCT)
	Declare Textline_BottomLine(*te.TE_STRUCT)
	Declare Textline_AddChar(*te.TE_STRUCT, *cursor.TE_CURSOR, c.c, overwrite, styleFlags = #TE_Styling_All, *undo.TE_UNDO = #Null)
	Declare Textline_AddText(*te.TE_STRUCT, *cursor.TE_CURSOR, *c.Character, textLength, styleFlags = #TE_Styling_All, *undo.TE_UNDO = #Null)
	Declare Textline_SetText(*te.TE_STRUCT, *textLine.TE_TEXTLINE, text.s, styleFlags = #TE_Styling_All, *undo.TE_UNDO = #Null)
	Declare Texlint_IsEmpty(*textline.TE_TEXTLINE)
	Declare Textline_LineNr(*te.TE_STRUCT, *textline.TE_TEXTLINE)
	Declare Textline_LineNrFromScreenPos(*te.TE_STRUCT, *view.TE_VIEW, screenY)
	Declare Textline_Length(*textLine.TE_TEXTLINE)
	Declare Textline_LastCharNr(*te.TE_STRUCT, lineNr)
	Declare Textline_NextTabSize(*te, *textline.TE_TEXTLINE, charNr)
	Declare Textline_Width(*te.TE_STRUCT, *textLine.TE_TEXTLINE)
	Declare Textline_CharNrFromScreenPos(*te.TE_STRUCT, *textLine.TE_TEXTLINE, screenX)
	Declare Textline_ColumnFromCharNr(*te.TE_STRUCT, *view.TE_VIEW, *textLine.TE_TEXTLINE, charNr)
	Declare Textline_CharNrToScreenPos(*te.TE_STRUCT, *textLine.TE_TEXTLINE, charNr)
	Declare Textline_FindText(*textline.TE_TEXTLINE, find.s, *result.TE_RANGE, ignoreWhiteSpace = #False)
	Declare Textline_HasLineContinuation(*te.TE_STRUCT, *textline.TE_TEXTLINE)
	
	Declare SyntaxHighlight_Clear(*te.TE_STRUCT)
	Declare SyntaxHighlight_Update(*te.TE_STRUCT)
	
	Declare Selection_Get(*cursor.TE_CURSOR, *range.TE_RANGE)
	Declare Selection_SetRange(*te.TE_STRUCT, *cursor.TE_CURSOR, lineNr, charNr, highLight = #True, checkOverlap = #True)
	Declare Selection_SelectAll(*te.TE_STRUCT)
	Declare Selection_Clear(*te.TE_STRUCT, *cursor.TE_CURSOR)
	Declare Selection_ClearAll(*te.TE_STRUCT, deleteCursors = #False)
	Declare Selection_Delete(*te.TE_STRUCT, *cursor.TE_CURSOR, *undo.TE_UNDO = #Null)
	Declare.s Selection_Text(*te.TE_STRUCT, delimiter.s = "")
	Declare Selection_Unfold(*te.TE_STRUCT, startLine, endLine)
	Declare Selection_IsAnythingSelected(*te.TE_STRUCT)
	Declare Selection_Overlap(*sel1.TE_RANGE, *sel2.TE_RANGE)
	Declare Selection_HighlightClear(*te.TE_STRUCT)
	
	Declare Cursor_Add(*te.TE_STRUCT, lineNr, charNr, checkOverlap = #True, startSelection = #True)
	Declare Cursor_Delete(*te.TE_STRUCT, *cursor.TE_CURSOR)
	Declare Cursor_Update(*te.TE_STRUCT, *cursor.TE_CURSOR, updateLastX)
	Declare Cursor_DeleteOverlapping(*te.TE_STRUCT, *cursor.TE_CURSOR, joinSelections = #False)
	Declare Cursor_Clear(*te.TE_STRUCT, *maincursor.TE_CURSOR)
	Declare Cursor_Sort(*te.TE_STRUCT, sortOrder = #PB_Sort_Ascending)
	Declare Cursor_Move(*te.TE_STRUCT, *cursor.TE_CURSOR, dirY, dirX)
	Declare Cursor_MoveMulti(*te.TE_STRUCT, *cursor.TE_CURSOR, previousLineNr, dirY, dirX)
	Declare Cursor_Position(*te.TE_STRUCT, *cursor.TE_CURSOR, lineNr, charNr, ensureVisible = #True, updateLastX = #True)
	Declare Cursor_HasSelection(*cursor.TE_CURSOR)
	Declare Cursor_FromScreenPos(*te.TE_STRUCT, *view.TE_VIEW, *cursor.TE_CURSOR, x, y, addCursor = #False)
	Declare Cursor_InsideComment(*te.TE_STRUCT, *cursor.TE_CURSOR)
	
	Declare Scroll_Line(*te.TE_STRUCT, *view.TE_VIEW, *cursor.TE_CURSOR, visibleLineNr, keepCursor = #True, updateGadget = #True)
	Declare Scroll_Char(*te.TE_STRUCT, *view.TE_VIEW, charX)
	Declare Scroll_Update(*te.TE_STRUCT, *view.TE_VIEW, *cursor.TE_CURSOR, previousVisibleLineNr, previousCharNr, updateNeeded = #True)
	Declare Scroll_UpdateAllViews(*te.TE_STRUCT, *view.TE_VIEW, *currentView.TE_VIEW, *cursor.TE_CURSOR)
	Declare Scroll_HideScrollBarH(*te.TE_STRUCT, *view.TE_VIEW, isHidden)
	Declare Scroll_HideScrollBarV(*te.TE_STRUCT, *view.TE_VIEW, isHidden)
	
	Declare Draw(*te.TE_STRUCT, *view.TE_VIEW, cursorBlinkState = -1, redrawMode = 0)
	Declare Draw_Textline(*te.TE_STRUCT, *view.TE_VIEW, *textLine.TE_TEXTLINE, lineNr, x.d, y.d, backgroundColor, *cursor.TE_CURSOR)
	
	Declare Marker_Add(*te.TE_STRUCT, *textline.TE_TEXTLINE, style)
	
	Declare Find_Next(*te.TE_STRUCT, lineNr, charNr, endLineNr, endCharNr, flags)
	Declare Find_Flags(*te.TE_STRUCT)
	Declare Find_Close(*te.TE_STRUCT)
	Declare Find_SetSelectionCheckbox(*te.TE_STRUCT)
	
	Declare Autocomplete_Hide(*te.TE_STRUCT)
	
	Declare Event_Gadget()
	Declare Event_Keyboard(*te.TE_STRUCT, *view.TE_VIEW, eventType)
	Declare Event_Mouse(*te.TE_STRUCT, *view.TE_VIEW, event_type)
	Declare Event_MouseWheel(*te.TE_STRUCT, *view.TE_VIEW, eventType)
	Declare Event_ScrollBar()
	Declare Event_Timer()
	Declare Event_Autocomplete()
	Declare Event_FindReplace()
	Declare Event_Resize(*te.TE_STRUCT, x, y, width, height)
	Declare Event_Window()
	Declare Event_Menu()
	Declare Event_Drop()
	; 	Declare		Event_DropCallback(TargetHandle, State, Format, Action, x, y)
	
	Declare Tokenizer_All(*te.TE_STRUCT)
	Declare Tokenizer_Textline(*te, *textline)
	
	Declare Settings_OpenXml(*te.TE_STRUCT, fileName.s)
	Declare Styling_OpenXml(*te.TE_STRUCT, fileName.s)
; IDE Options = PureBasic 5.72 (MacOS X - x64)
; EnableXP