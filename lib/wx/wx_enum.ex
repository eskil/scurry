defmodule Scurry.WxEnum do
  @vsn "0.0.2"
  @moduledoc false

  # Commented out to preserve credits but fix compiler warnings.
  # @author "Onorio Catenacci"
  # @author "Dominic Letz"
  # @last_revision_date "22 May 2019"

  # Elixir version of the constants found in the wx.hrl file
  # From https://gist.github.com/dominicletz/5da3637275d81a421bc6aa72ae5c31c7

  import Bitwise
  require Record

  def const(name) do
    :wxe_util.get_const(name)
  end

  Record.defrecord(:wx, Record.extract(:wx, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxNavigationKey,
    Record.extract(:wxNavigationKey, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxSash, Record.extract(:wxSash, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxList, Record.extract(:wxList, from_lib: "wx/include/wx.hrl"))
  # Record.defrecord(:wxNotebook, Record.extract(:wxNotebook, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxDisplayChanged,
    Record.extract(:wxDisplayChanged, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxKey, Record.extract(:wxKey, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxWindowDestroy,
    Record.extract(:wxWindowDestroy, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxCalendar, Record.extract(:wxCalendar, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxSplitter, Record.extract(:wxSplitter, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxScroll, Record.extract(:wxScroll, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxMenu, Record.extract(:wxMenu, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxContextMenu, Record.extract(:wxContextMenu, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxShow, Record.extract(:wxShow, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxSpin, Record.extract(:wxSpin, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxSetCursor, Record.extract(:wxSetCursor, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxFontPicker, Record.extract(:wxFontPicker, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxScrollWin, Record.extract(:wxScrollWin, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxPaint, Record.extract(:wxPaint, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxChildFocus, Record.extract(:wxChildFocus, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxMaximize, Record.extract(:wxMaximize, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxFileDirPicker,
    Record.extract(:wxFileDirPicker, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxFocus, Record.extract(:wxFocus, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxDate, Record.extract(:wxDate, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxHtmlLink, Record.extract(:wxHtmlLink, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxHelp, Record.extract(:wxHelp, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxActivate, Record.extract(:wxActivate, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxStyledText, Record.extract(:wxStyledText, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxSysColourChanged,
    Record.extract(:wxSysColourChanged, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxGrid, Record.extract(:wxGrid, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxPaletteChanged,
    Record.extract(:wxPaletteChanged, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxUpdateUI, Record.extract(:wxUpdateUI, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxSize, Record.extract(:wxSize, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxIconize, Record.extract(:wxIconize, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxAuiNotebook, Record.extract(:wxAuiNotebook, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxClose, Record.extract(:wxClose, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxMouseCaptureChanged,
    Record.extract(:wxMouseCaptureChanged, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxMouse, Record.extract(:wxMouse, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxClipboardText,
    Record.extract(:wxClipboardText, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(
    :wxWindowCreate,
    Record.extract(:wxWindowCreate, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxAuiManager, Record.extract(:wxAuiManager, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxInitDialog, Record.extract(:wxInitDialog, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxCommand, Record.extract(:wxCommand, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxJoystick, Record.extract(:wxJoystick, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxQueryNewPalette,
    Record.extract(:wxQueryNewPalette, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxMove, Record.extract(:wxMove, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxIdle, Record.extract(:wxIdle, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxColourPicker,
    Record.extract(:wxColourPicker, from_lib: "wx/include/wx.hrl")
  )

  Record.defrecord(:wxTaskBarIcon, Record.extract(:wxTaskBarIcon, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxTree, Record.extract(:wxTree, from_lib: "wx/include/wx.hrl"))
  Record.defrecord(:wxMouseState, Record.extract(:wxMouseState, from_lib: "wx/include/wx.hrl"))

  Record.defrecord(
    :wxHtmlLinkInfo,
    Record.extract(:wxHtmlLinkInfo, from_lib: "wx/include/wx.hrl")
  )

  ## Enum and defines
  # From class wxAuiManager
  def wxAuiManager_actionNone, do: 0
  def wxAuiManager_actionResize, do: 1
  def wxAuiManager_actionClickButton, do: 2
  def wxAuiManager_actionClickCaption, do: 3
  def wxAuiManager_actionDragToolbarPane, do: 4
  def wxAuiManager_actionDragFloatingPane, do: 5
  # From class wxAuiPaneInfo::wxAuiPaneState
  def wxAuiPaneInfo_optionFloating, do: 1
  def wxAuiPaneInfo_optionHidden, do: 2
  def wxAuiPaneInfo_optionLeftDockable, do: 4
  def wxAuiPaneInfo_optionRightDockable, do: 8
  def wxAuiPaneInfo_optionTopDockable, do: 16
  def wxAuiPaneInfo_optionBottomDockable, do: 32
  def wxAuiPaneInfo_optionFloatable, do: 64
  def wxAuiPaneInfo_optionMovable, do: 128
  def wxAuiPaneInfo_optionResizable, do: 256
  def wxAuiPaneInfo_optionPaneBorder, do: 512
  def wxAuiPaneInfo_optionCaption, do: 1024
  def wxAuiPaneInfo_optionGripper, do: 2048
  def wxAuiPaneInfo_optionDestroyOnClose, do: 4096
  def wxAuiPaneInfo_optionToolbar, do: 8192
  def wxAuiPaneInfo_optionActive, do: 16384
  def wxAuiPaneInfo_optionGripperTop, do: 32768
  def wxAuiPaneInfo_optionMaximized, do: 65536
  def wxAuiPaneInfo_optionDockFixed, do: 131_072
  def wxAuiPaneInfo_buttonClose, do: 2_097_152
  def wxAuiPaneInfo_buttonMaximize, do: 4_194_304
  def wxAuiPaneInfo_buttonMinimize, do: 8_388_608
  def wxAuiPaneInfo_buttonPin, do: 16_777_216
  def wxAuiPaneInfo_buttonCustom1, do: 67_108_864
  def wxAuiPaneInfo_buttonCustom2, do: 134_217_728
  def wxAuiPaneInfo_buttonCustom3, do: 268_435_456
  def wxAuiPaneInfo_savedHiddenState, do: 1_073_741_824
  def wxAuiPaneInfo_actionPane, do: 2_147_483_648
  # From class wxBitmap::Representation
  def wxBitmap_Pixmap, do: 0
  def wxBitmap_Pixbuf, do: 1
  # From class wxChoicebook
  def wxChoicebook_SetSelection_SendEvent, do: 1
  # From class wxDateTime::Calendar
  def wxDateTime_Gregorian, do: 0
  def wxDateTime_Julian, do: 1
  # From class wxDateTime::Country
  def wxDateTime_Country_Unknown, do: 0
  def wxDateTime_Country_Default, do: 1
  def wxDateTime_Country_WesternEurope_Start, do: 2
  def wxDateTime_Country_EEC, do: wxDateTime_Country_WesternEurope_Start()
  def wxDateTime_France, do: wxDateTime_Country_WesternEurope_Start() + 1
  def wxDateTime_Germany, do: wxDateTime_Country_WesternEurope_Start() + 2
  def wxDateTime_UK, do: wxDateTime_Country_WesternEurope_Start() + 3
  def wxDateTime_Country_WesternEurope_End, do: wxDateTime_UK()
  def wxDateTime_Russia, do: wxDateTime_UK() + 1
  def wxDateTime_USA, do: wxDateTime_UK() + 2
  # From class wxDateTime::GregorianAdoption
  def wxDateTime_Gr_Unknown, do: 0
  def wxDateTime_Gr_Standard, do: 1
  def wxDateTime_Gr_Alaska, do: 2
  def wxDateTime_Gr_Albania, do: 3
  def wxDateTime_Gr_Austria, do: wxDateTime_Gr_Unknown()
  def wxDateTime_Gr_Austria_Brixen, do: wxDateTime_Gr_Unknown() + 1
  def wxDateTime_Gr_Austria_Salzburg, do: wxDateTime_Gr_Austria_Brixen()
  def wxDateTime_Gr_Austria_Tyrol, do: wxDateTime_Gr_Austria_Brixen()
  def wxDateTime_Gr_Austria_Carinthia, do: wxDateTime_Gr_Austria_Brixen() + 1
  def wxDateTime_Gr_Austria_Styria, do: wxDateTime_Gr_Austria_Carinthia()
  def wxDateTime_Gr_Belgium, do: wxDateTime_Gr_Austria_Carinthia() + 1
  def wxDateTime_Gr_Bulgaria, do: wxDateTime_Gr_Unknown()
  def wxDateTime_Gr_Bulgaria_1, do: wxDateTime_Gr_Unknown() + 1
  def wxDateTime_Gr_Bulgaria_2, do: wxDateTime_Gr_Unknown() + 2
  def wxDateTime_Gr_Bulgaria_3, do: wxDateTime_Gr_Unknown() + 3
  def wxDateTime_Gr_Canada, do: wxDateTime_Gr_Unknown()
  def wxDateTime_Gr_China, do: wxDateTime_Gr_Unknown()
  def wxDateTime_Gr_China_1, do: wxDateTime_Gr_Unknown() + 1
  def wxDateTime_Gr_China_2, do: wxDateTime_Gr_Unknown() + 2
  def wxDateTime_Gr_Czechoslovakia, do: wxDateTime_Gr_Unknown() + 3
  def wxDateTime_Gr_Denmark, do: wxDateTime_Gr_Unknown() + 4
  def wxDateTime_Gr_Egypt, do: wxDateTime_Gr_Unknown() + 5
  def wxDateTime_Gr_Estonia, do: wxDateTime_Gr_Unknown() + 6
  def wxDateTime_Gr_Finland, do: wxDateTime_Gr_Unknown() + 7
  def wxDateTime_Gr_France, do: wxDateTime_Gr_Unknown() + 8
  def wxDateTime_Gr_France_Alsace, do: wxDateTime_Gr_Unknown() + 9
  def wxDateTime_Gr_France_Lorraine, do: wxDateTime_Gr_Unknown() + 10
  def wxDateTime_Gr_France_Strasbourg, do: wxDateTime_Gr_Unknown() + 11
  def wxDateTime_Gr_Germany, do: wxDateTime_Gr_Unknown()
  def wxDateTime_Gr_Germany_Catholic, do: wxDateTime_Gr_Unknown() + 1
  def wxDateTime_Gr_Germany_Prussia, do: wxDateTime_Gr_Unknown() + 2
  def wxDateTime_Gr_Germany_Protestant, do: wxDateTime_Gr_Unknown() + 3
  def wxDateTime_Gr_GreatBritain, do: wxDateTime_Gr_Unknown() + 4
  def wxDateTime_Gr_Greece, do: wxDateTime_Gr_Unknown() + 5
  def wxDateTime_Gr_Hungary, do: wxDateTime_Gr_Unknown() + 6
  def wxDateTime_Gr_Ireland, do: wxDateTime_Gr_GreatBritain()
  def wxDateTime_Gr_Italy, do: wxDateTime_Gr_Standard()
  def wxDateTime_Gr_Japan, do: wxDateTime_Gr_Unknown()
  def wxDateTime_Gr_Japan_1, do: wxDateTime_Gr_Unknown() + 1
  def wxDateTime_Gr_Japan_2, do: wxDateTime_Gr_Unknown() + 2
  def wxDateTime_Gr_Japan_3, do: wxDateTime_Gr_Unknown() + 3
  def wxDateTime_Gr_Latvia, do: wxDateTime_Gr_Unknown() + 4
  def wxDateTime_Gr_Lithuania, do: wxDateTime_Gr_Unknown() + 5
  def wxDateTime_Gr_Luxemburg, do: wxDateTime_Gr_Unknown() + 6
  def wxDateTime_Gr_Netherlands, do: wxDateTime_Gr_Belgium()
  def wxDateTime_Gr_Netherlands_Groningen, do: wxDateTime_Gr_Belgium() + 1
  def wxDateTime_Gr_Netherlands_Gelderland, do: wxDateTime_Gr_Belgium() + 2
  def wxDateTime_Gr_Netherlands_Utrecht, do: wxDateTime_Gr_Belgium() + 3
  def wxDateTime_Gr_Netherlands_Friesland, do: wxDateTime_Gr_Belgium() + 4
  def wxDateTime_Gr_Norway, do: wxDateTime_Gr_Denmark()
  def wxDateTime_Gr_Poland, do: wxDateTime_Gr_Standard()
  def wxDateTime_Gr_Portugal, do: wxDateTime_Gr_Standard()
  def wxDateTime_Gr_Romania, do: wxDateTime_Gr_Standard() + 1
  def wxDateTime_Gr_Russia, do: wxDateTime_Gr_Standard() + 2
  def wxDateTime_Gr_Scotland, do: wxDateTime_Gr_GreatBritain()
  def wxDateTime_Gr_Spain, do: wxDateTime_Gr_Standard()
  def wxDateTime_Gr_Sweden, do: wxDateTime_Gr_Finland()
  def wxDateTime_Gr_Switzerland, do: wxDateTime_Gr_Unknown()
  def wxDateTime_Gr_Switzerland_Catholic, do: wxDateTime_Gr_Unknown() + 1
  def wxDateTime_Gr_Switzerland_Protestant, do: wxDateTime_Gr_Unknown() + 2
  def wxDateTime_Gr_Turkey, do: wxDateTime_Gr_Unknown() + 3
  def wxDateTime_Gr_USA, do: wxDateTime_Gr_GreatBritain()
  def wxDateTime_Gr_Wales, do: wxDateTime_Gr_GreatBritain()
  def wxDateTime_Gr_Yugoslavia, do: wxDateTime_Gr_GreatBritain() + 1
  # From class wxDateTime::Month
  def wxDateTime_Jan, do: 0
  def wxDateTime_Feb, do: 1
  def wxDateTime_Mar, do: 2
  def wxDateTime_Apr, do: 3
  def wxDateTime_May, do: 4
  def wxDateTime_Jun, do: 5
  def wxDateTime_Jul, do: 6
  def wxDateTime_Aug, do: 7
  def wxDateTime_Sep, do: 8
  def wxDateTime_Oct, do: 9
  def wxDateTime_Nov, do: 10
  def wxDateTime_Dec, do: 11
  def wxDateTime_Inv_Month, do: 12
  # From class wxDateTime::NameFlags
  def wxDateTime_Name_Full, do: 1
  def wxDateTime_Name_Abbr, do: 2
  # From class wxDateTime::TZ
  def wxDateTime_Local, do: 0
  def wxDateTime_GMT_12, do: 1
  def wxDateTime_GMT_11, do: 2
  def wxDateTime_GMT_10, do: 3
  def wxDateTime_GMT_9, do: 4
  def wxDateTime_GMT_8, do: 5
  def wxDateTime_GMT_7, do: 6
  def wxDateTime_GMT_6, do: 7
  def wxDateTime_GMT_5, do: 8
  def wxDateTime_GMT_4, do: 9
  def wxDateTime_GMT_3, do: 10
  def wxDateTime_GMT_2, do: 11
  def wxDateTime_GMT_1, do: 12
  def wxDateTime_GMT0, do: 13
  def wxDateTime_GMT1, do: 14
  def wxDateTime_GMT2, do: 15
  def wxDateTime_GMT3, do: 16
  def wxDateTime_GMT4, do: 17
  def wxDateTime_GMT5, do: 18
  def wxDateTime_GMT6, do: 19
  def wxDateTime_GMT7, do: 20
  def wxDateTime_GMT8, do: 21
  def wxDateTime_GMT9, do: 22
  def wxDateTime_GMT10, do: 23
  def wxDateTime_GMT11, do: 24
  def wxDateTime_GMT12, do: 25
  def wxDateTime_GMT13, do: 26
  def wxDateTime_WET, do: wxDateTime_GMT0()
  def wxDateTime_WEST, do: wxDateTime_GMT1()
  def wxDateTime_CET, do: wxDateTime_GMT1()
  def wxDateTime_CEST, do: wxDateTime_GMT2()
  def wxDateTime_EET, do: wxDateTime_GMT2()
  def wxDateTime_EEST, do: wxDateTime_GMT3()
  def wxDateTime_MSK, do: wxDateTime_GMT3()
  def wxDateTime_MSD, do: wxDateTime_GMT4()
  def wxDateTime_AST, do: wxDateTime_GMT_4()
  def wxDateTime_ADT, do: wxDateTime_GMT_3()
  def wxDateTime_EST, do: wxDateTime_GMT_5()
  def wxDateTime_EDT, do: wxDateTime_GMT_4()
  def wxDateTime_CST, do: wxDateTime_GMT_6()
  def wxDateTime_CDT, do: wxDateTime_GMT_5()
  def wxDateTime_MST, do: wxDateTime_GMT_7()
  def wxDateTime_MDT, do: wxDateTime_GMT_6()
  def wxDateTime_PST, do: wxDateTime_GMT_8()
  def wxDateTime_PDT, do: wxDateTime_GMT_7()
  def wxDateTime_HST, do: wxDateTime_GMT_10()
  def wxDateTime_AKST, do: wxDateTime_GMT_9()
  def wxDateTime_AKDT, do: wxDateTime_GMT_8()
  def wxDateTime_A_WST, do: wxDateTime_GMT8()
  def wxDateTime_A_CST, do: wxDateTime_GMT13() + 1
  def wxDateTime_A_EST, do: wxDateTime_GMT10()
  def wxDateTime_A_ESST, do: wxDateTime_GMT11()
  def wxDateTime_NZST, do: wxDateTime_GMT12()
  def wxDateTime_NZDT, do: wxDateTime_GMT13()
  def wxDateTime_UTC, do: wxDateTime_GMT0()
  # From class wxDateTime::WeekDay
  def wxDateTime_Sun, do: 0
  def wxDateTime_Mon, do: 1
  def wxDateTime_Tue, do: 2
  def wxDateTime_Wed, do: 3
  def wxDateTime_Thu, do: 4
  def wxDateTime_Fri, do: 5
  def wxDateTime_Sat, do: 6
  def wxDateTime_Inv_WeekDay, do: 7
  # From class wxDateTime::WeekFlags
  def wxDateTime_Default_First, do: 0
  def wxDateTime_Monday_First, do: 1
  def wxDateTime_Sunday_First, do: 2
  # From class wxDateTime::Year
  # From class wxDialog
  def wxDialog_ButtonSizerFlags,
    do:
      wxOK()
      |> bor(wxCANCEL() |> bor(wxYES() |> bor(wxNO() |> bor(wxHELP() |> bor(wxNO_DEFAULT())))))

  # From class wxGrid
  def wxGrid_wxGRID_CELLCTRL, do: 2000
  def wxGrid_wxGRID_TOPCTRL, do: 2001
  # From class wxGrid
  def wxGrid_wxGRID_TEXTCTRL, do: 2100
  def wxGrid_wxGRID_CHECKBOX, do: 2101
  def wxGrid_wxGRID_CHOICE, do: 2102
  def wxGrid_wxGRID_COMBOBOX, do: 2103
  # From class wxGrid::CursorMode
  def wxGrid_WXGRID_CURSOR_SELECT_CELL, do: 0
  def wxGrid_WXGRID_CURSOR_RESIZE_ROW, do: 1
  def wxGrid_WXGRID_CURSOR_RESIZE_COL, do: 2
  def wxGrid_WXGRID_CURSOR_SELECT_ROW, do: 3
  def wxGrid_WXGRID_CURSOR_SELECT_COL, do: 4
  def wxGrid_WXGRID_CURSOR_MOVE_COL, do: 5
  # From class wxGrid::wxGridSelectionModes
  def wxGrid_wxGridSelectCells, do: 0
  def wxGrid_wxGridSelectRows, do: 1
  def wxGrid_wxGridSelectColumns, do: 2
  # From class wxGridCellAttr::wxAttrKind
  def wxGridCellAttr_Any, do: 0
  def wxGridCellAttr_Default, do: 1
  def wxGridCellAttr_Cell, do: 2
  def wxGridCellAttr_Row, do: 3
  def wxGridCellAttr_Col, do: 4
  def wxGridCellAttr_Merged, do: 5
  # From class wxGridCellAttr::wxAttrOverflowMode
  def wxGridCellAttr_UnsetOverflow, do: -1
  def wxGridCellAttr_Overflow, do: 0
  def wxGridCellAttr_SingleCell, do: 1
  # From class wxGridCellAttr::wxAttrReadMode
  def wxGridCellAttr_Unset, do: -1
  def wxGridCellAttr_ReadWrite, do: 0
  def wxGridCellAttr_ReadOnly, do: 1
  # From class wxHelpEvent::Origin
  def wxHelpEvent_Origin_Unknown, do: 0
  def wxHelpEvent_Origin_Keyboard, do: 1
  def wxHelpEvent_Origin_HelpButton, do: 2
  # From class wxHtmlEasyPrinting::FontMode
  def wxHtmlEasyPrinting_FontMode_Explicit, do: 0
  def wxHtmlEasyPrinting_FontMode_Standard, do: 1
  # From class wxHtmlWindow::ClipboardType
  def wxHtmlWindow_Primary, do: 0
  def wxHtmlWindow_Secondary, do: 1
  # From class wxListbook
  def wxListbook_SetSelection_SendEvent, do: 1
  # From class wxNavigationKeyEvent
  def wxNavigationKeyEvent_IsBackward, do: 0
  def wxNavigationKeyEvent_IsForward, do: 1
  def wxNavigationKeyEvent_WinChange, do: 2
  def wxNavigationKeyEvent_FromTab, do: 4
  # From class wxNotebook
  def wxNotebook_SetSelection_SendEvent, do: 1
  # From class wxProgressDialog
  def wxProgressDialog_Uncancelable, do: -1
  def wxProgressDialog_Canceled, do: 0
  def wxProgressDialog_Continue, do: 1
  def wxProgressDialog_Finished, do: 2
  # From class wxSizerItem
  def wxSizerItem_Item_None, do: 0
  def wxSizerItem_Item_Window, do: 1
  def wxSizerItem_Item_Sizer, do: 2
  def wxSizerItem_Item_Spacer, do: 3
  def wxSizerItem_Item_Max, do: 4
  # From class wxTextCtrl
  def wxTextCtrl_SetValue_SendEvent, do: 1
  def wxTextCtrl_SetValue_SelectionOnly, do: 2
  # From class wxToolbook
  def wxToolbook_SetSelection_SendEvent, do: 1
  # From class wxTreebook
  def wxTreebook_SetSelection_SendEvent, do: 1
  # From class wxWindow::MoveKind
  def wxWindow_MoveBefore, do: 0
  def wxWindow_MoveAfter, do: 1
  # From class wxWindowGTK::ScrollDir
  def wxWindowGTK_ScrollDir_Horz, do: 0
  def wxWindowGTK_ScrollDir_Vert, do: 1
  def wxWindowGTK_ScrollDir_Max, do: 2
  # From class wxWindowGTK::ScrollUnit
  def wxWindowGTK_ScrollUnit_Line, do: 0
  def wxWindowGTK_ScrollUnit_Page, do: 1
  def wxWindowGTK_ScrollUnit_Max, do: 2
  # From "accel.h"
  def wxACCEL_NORMAL, do: 0
  def wxACCEL_ALT, do: 1
  def wxACCEL_CTRL, do: 2
  def wxACCEL_SHIFT, do: 4
  def wxACCEL_CMD, do: wxACCEL_CTRL()
  # From "app.h"
  def wxPRINT_WINDOWS, do: 1
  def wxPRINT_POSTSCRIPT, do: 2
  # From "auibook.h": wxAuiNotebookOption
  def wxAUI_NB_TOP, do: 1
  def wxAUI_NB_LEFT, do: 2
  def wxAUI_NB_RIGHT, do: 4
  def wxAUI_NB_BOTTOM, do: 8
  def wxAUI_NB_TAB_SPLIT, do: 16
  def wxAUI_NB_TAB_MOVE, do: 32
  def wxAUI_NB_TAB_EXTERNAL_MOVE, do: 64
  def wxAUI_NB_TAB_FIXED_WIDTH, do: 128
  def wxAUI_NB_SCROLL_BUTTONS, do: 256
  def wxAUI_NB_WINDOWLIST_BUTTON, do: 512
  def wxAUI_NB_CLOSE_BUTTON, do: 1024
  def wxAUI_NB_CLOSE_ON_ACTIVE_TAB, do: 2048
  def wxAUI_NB_CLOSE_ON_ALL_TABS, do: 4096
  def wxAUI_NB_MIDDLE_CLICK_CLOSE, do: 8192

  def wxAUI_NB_DEFAULT_STYLE,
    do:
      wxAUI_NB_TOP()
      |> bor(
        wxAUI_NB_TAB_SPLIT()
        |> bor(
          wxAUI_NB_TAB_MOVE()
          |> bor(
            wxAUI_NB_SCROLL_BUTTONS()
            |> bor(wxAUI_NB_CLOSE_ON_ACTIVE_TAB() |> bor(wxAUI_NB_MIDDLE_CLICK_CLOSE()))
          )
        )
      )

  # From "bookctrl.h"
  def wxBK_HITTEST_NOWHERE, do: 1
  def wxBK_HITTEST_ONICON, do: 2
  def wxBK_HITTEST_ONLABEL, do: 4
  def wxBK_HITTEST_ONITEM, do: wxBK_HITTEST_ONICON() |> bor(wxBK_HITTEST_ONLABEL())
  def wxBK_HITTEST_ONPAGE, do: 8
  # From "bookctrl.h"
  def wxBK_ALIGN_MASK,
    do: wxBK_TOP() |> bor(wxBK_BOTTOM() |> bor(wxBK_LEFT() |> bor(wxBK_RIGHT())))

  def wxBK_RIGHT, do: 128
  def wxBK_LEFT, do: 64
  def wxBK_BOTTOM, do: 32
  def wxBK_TOP, do: 16
  def wxBK_DEFAULT, do: 0
  # From "bugs.h": wxSashDragStatus
  def wxSASH_STATUS_OK, do: 0
  def wxSASH_STATUS_OUT_OF_RANGE, do: 1
  # From "button.h"
  def wxBU_EXACTFIT, do: 1
  def wxBU_AUTODRAW, do: 4
  def wxBU_NOAUTODRAW, do: 0

  def wxBU_ALIGN_MASK,
    do: wxBU_LEFT() |> bor(wxBU_TOP() |> bor(wxBU_RIGHT() |> bor(wxBU_BOTTOM())))

  def wxBU_BOTTOM, do: 512
  def wxBU_RIGHT, do: 256
  def wxBU_TOP, do: 128
  def wxBU_LEFT, do: 64
  # From "calctrl.h"
  def wxCAL_SUNDAY_FIRST, do: 0
  def wxCAL_MONDAY_FIRST, do: 1
  def wxCAL_SHOW_HOLIDAYS, do: 2
  def wxCAL_NO_YEAR_CHANGE, do: 4
  def wxCAL_NO_MONTH_CHANGE, do: 12
  def wxCAL_SEQUENTIAL_MONTH_SELECTION, do: 16
  def wxCAL_SHOW_SURROUNDING_WEEKS, do: 32
  # From "calctrl.h": wxCalendarDateBorder
  def wxCAL_BORDER_NONE, do: 0
  def wxCAL_BORDER_SQUARE, do: 1
  def wxCAL_BORDER_ROUND, do: 2
  # From "calctrl.h": wxCalendarHitTestResult
  def wxCAL_HITTEST_NOWHERE, do: 0
  def wxCAL_HITTEST_HEADER, do: 1
  def wxCAL_HITTEST_DAY, do: 2
  def wxCAL_HITTEST_INCMONTH, do: 3
  def wxCAL_HITTEST_DECMONTH, do: 4
  def wxCAL_HITTEST_SURROUNDING_WEEK, do: 5
  # From "checkbox.h"
  def wxCHK_ALLOW_3RD_STATE_FOR_USER, do: 8192
  def wxCHK_3STATE, do: 4096
  def wxCHK_2STATE, do: 0
  # From "checkbox.h": wxCheckBoxState
  def wxCHK_UNCHECKED, do: 0
  def wxCHK_CHECKED, do: 1
  def wxCHK_UNDETERMINED, do: 2
  # From "choicdgg.h"
  def wxCHOICEDLG_STYLE,
    do:
      wxDEFAULT_DIALOG_STYLE()
      |> bor(wxRESIZE_BORDER() |> bor(wxOK() |> bor(wxCANCEL() |> bor(wxCENTRE()))))

  def wxCHOICE_WIDTH, do: 200
  def wxCHOICE_HEIGHT, do: 150
  # From "choicebk.h"
  def wxCHB_ALIGN_MASK, do: wxBK_ALIGN_MASK()
  def wxCHB_RIGHT, do: wxBK_RIGHT()
  def wxCHB_LEFT, do: wxBK_LEFT()
  def wxCHB_BOTTOM, do: wxBK_BOTTOM()
  def wxCHB_TOP, do: wxBK_TOP()
  def wxCHB_DEFAULT, do: wxBK_DEFAULT()
  # From "clntdata.h": wxClientDataType
  def wxClientData_None, do: 0
  def wxClientData_Object, do: 1
  def wxClientData_Void, do: 2
  # From "clrpicker.h"
  def wxCLRP_DEFAULT_STYLE, do: 0
  def wxCLRP_USE_TEXTCTRL, do: wxPB_USE_TEXTCTRL()
  def wxCLRP_SHOW_LABEL, do: 8
  # From "cmndata.h"
  # From "cmndata.h": wxPrintBin
  def wxPRINTBIN_DEFAULT, do: 0
  def wxPRINTBIN_ONLYONE, do: 1
  def wxPRINTBIN_LOWER, do: 2
  def wxPRINTBIN_MIDDLE, do: 3
  def wxPRINTBIN_MANUAL, do: 4
  def wxPRINTBIN_ENVELOPE, do: 5
  def wxPRINTBIN_ENVMANUAL, do: 6
  def wxPRINTBIN_AUTO, do: 7
  def wxPRINTBIN_TRACTOR, do: 8
  def wxPRINTBIN_SMALLFMT, do: 9
  def wxPRINTBIN_LARGEFMT, do: 10
  def wxPRINTBIN_LARGECAPACITY, do: 11
  def wxPRINTBIN_CASSETTE, do: 12
  def wxPRINTBIN_FORMSOURCE, do: 13
  def wxPRINTBIN_USER, do: 14
  # From "colour.h"
  def wxC2S_HTML_SYNTAX, do: 4
  def wxC2S_CSS_SYNTAX, do: 2
  def wxC2S_NAME, do: 1
  # From "confbase.h"
  def wxCONFIG_CASE_SENSITIVE, do: 0
  # From "cpp.h"
  # def wxEMPTY_PARAMETER_VALUE, do: ()
  # From "datectrl.h"
  def wxDP_DEFAULT, do: 0
  def wxDP_SPIN, do: 1
  def wxDP_DROPDOWN, do: 2
  def wxDP_SHOWCENTURY, do: 4
  def wxDP_ALLOWNONE, do: 8
  # From "datetime.h"
  # From "dcbuffer.h"
  def wxBUFFER_CLIENT_AREA, do: 2
  def wxBUFFER_VIRTUAL_AREA, do: 1
  def wxALWAYS_NATIVE_DOUBLE_BUFFER, do: :wxe_util.get_const(wxALWAYS_NATIVE_DOUBLE_BUFFER())
  # From "defs.h"
  def wxDefaultCoord, do: -1
  # From "defs.h"
  def wxID_NONE, do: -3
  def wxID_SEPARATOR, do: -2
  def wxID_ANY, do: -1
  def wxID_LOWEST, do: 4999
  def wxID_OPEN, do: 5000
  def wxID_CLOSE, do: 5001
  def wxID_NEW, do: 5002
  def wxID_SAVE, do: 5003
  def wxID_SAVEAS, do: 5004
  def wxID_REVERT, do: 5005
  def wxID_EXIT, do: 5006
  def wxID_UNDO, do: 5007
  def wxID_REDO, do: 5008
  def wxID_HELP, do: 5009
  def wxID_PRINT, do: 5010
  def wxID_PRINT_SETUP, do: 5011
  def wxID_PAGE_SETUP, do: 5012
  def wxID_PREVIEW, do: 5013
  def wxID_ABOUT, do: 5014
  def wxID_HELP_CONTENTS, do: 5015
  def wxID_HELP_INDEX, do: 5016
  def wxID_HELP_SEARCH, do: 5017
  def wxID_HELP_COMMANDS, do: 5018
  def wxID_HELP_PROCEDURES, do: 5019
  def wxID_HELP_CONTEXT, do: 5020
  def wxID_CLOSE_ALL, do: 5021
  def wxID_PREFERENCES, do: 5022
  def wxID_EDIT, do: 5030
  def wxID_CUT, do: 5031
  def wxID_COPY, do: 5032
  def wxID_PASTE, do: 5033
  def wxID_CLEAR, do: 5034
  def wxID_FIND, do: 5035
  def wxID_DUPLICATE, do: 5036
  def wxID_SELECTALL, do: 5037
  def wxID_DELETE, do: 5038
  def wxID_REPLACE, do: 5039
  def wxID_REPLACE_ALL, do: 5040
  def wxID_PROPERTIES, do: 5041
  def wxID_VIEW_DETAILS, do: 5042
  def wxID_VIEW_LARGEICONS, do: 5043
  def wxID_VIEW_SMALLICONS, do: 5044
  def wxID_VIEW_LIST, do: 5045
  def wxID_VIEW_SORTDATE, do: 5046
  def wxID_VIEW_SORTNAME, do: 5047
  def wxID_VIEW_SORTSIZE, do: 5048
  def wxID_VIEW_SORTTYPE, do: 5049
  def wxID_FILE, do: 5050
  def wxID_FILE1, do: 5051
  def wxID_FILE2, do: 5052
  def wxID_FILE3, do: 5053
  def wxID_FILE4, do: 5054
  def wxID_FILE5, do: 5055
  def wxID_FILE6, do: 5056
  def wxID_FILE7, do: 5057
  def wxID_FILE8, do: 5058
  def wxID_FILE9, do: 5059
  def wxID_OK, do: 5100
  def wxID_CANCEL, do: 5101
  def wxID_APPLY, do: 5102
  def wxID_YES, do: 5103
  def wxID_NO, do: 5104
  def wxID_STATIC, do: 5105
  def wxID_FORWARD, do: 5106
  def wxID_BACKWARD, do: 5107
  def wxID_DEFAULT, do: 5108
  def wxID_MORE, do: 5109
  def wxID_SETUP, do: 5110
  def wxID_RESET, do: 5111
  def wxID_CONTEXT_HELP, do: 5112
  def wxID_YESTOALL, do: 5113
  def wxID_NOTOALL, do: 5114
  def wxID_ABORT, do: 5115
  def wxID_RETRY, do: 5116
  def wxID_IGNORE, do: 5117
  def wxID_ADD, do: 5118
  def wxID_REMOVE, do: 5119
  def wxID_UP, do: 5120
  def wxID_DOWN, do: 5121
  def wxID_HOME, do: 5122
  def wxID_REFRESH, do: 5123
  def wxID_STOP, do: 5124
  def wxID_INDEX, do: 5125
  def wxID_BOLD, do: 5126
  def wxID_ITALIC, do: 5127
  def wxID_JUSTIFY_CENTER, do: 5128
  def wxID_JUSTIFY_FILL, do: 5129
  def wxID_JUSTIFY_RIGHT, do: 5130
  def wxID_JUSTIFY_LEFT, do: 5131
  def wxID_UNDERLINE, do: 5132
  def wxID_INDENT, do: 5133
  def wxID_UNINDENT, do: 5134
  def wxID_ZOOM_100, do: 5135
  def wxID_ZOOM_FIT, do: 5136
  def wxID_ZOOM_IN, do: 5137
  def wxID_ZOOM_OUT, do: 5138
  def wxID_UNDELETE, do: 5139
  def wxID_REVERT_TO_SAVED, do: 5140
  def wxID_SYSTEM_MENU, do: 5200
  def wxID_CLOSE_FRAME, do: 5201
  def wxID_MOVE_FRAME, do: 5202
  def wxID_RESIZE_FRAME, do: 5203
  def wxID_MAXIMIZE_FRAME, do: 5204
  def wxID_ICONIZE_FRAME, do: 5205
  def wxID_RESTORE_FRAME, do: 5206
  def wxID_FILEDLGG, do: 5900
  def wxID_HIGHEST, do: 5999
  # From "defs.h"
  def wxDEFAULT, do: 70
  def wxDECORATIVE, do: 71
  def wxROMAN, do: 72
  def wxSCRIPT, do: 73
  def wxSWISS, do: 74
  def wxMODERN, do: 75
  def wxTELETYPE, do: 76
  def wxVARIABLE, do: 80
  def wxFIXED, do: 81
  def wxNORMAL, do: 90
  def wxLIGHT, do: 91
  def wxBOLD, do: 92
  def wxITALIC, do: 93
  def wxSLANT, do: 94
  def wxSOLID, do: 100
  def wxDOT, do: 101
  def wxLONG_DASH, do: 102
  def wxSHORT_DASH, do: 103
  def wxDOT_DASH, do: 104
  def wxUSER_DASH, do: 105
  def wxTRANSPARENT, do: 106
  def wxSTIPPLE_MASK_OPAQUE, do: 107
  def wxSTIPPLE_MASK, do: 108
  def wxSTIPPLE, do: 110
  def wxBDIAGONAL_HATCH, do: 111
  def wxCROSSDIAG_HATCH, do: 112
  def wxFDIAGONAL_HATCH, do: 113
  def wxCROSS_HATCH, do: 114
  def wxHORIZONTAL_HATCH, do: 115
  def wxVERTICAL_HATCH, do: 116
  def wxFIRST_HATCH, do: wxBDIAGONAL_HATCH()
  def wxLAST_HATCH, do: wxVERTICAL_HATCH()
  def wxJOIN_BEVEL, do: 120
  def wxJOIN_MITER, do: 121
  def wxJOIN_ROUND, do: 122
  def wxCAP_ROUND, do: 130
  def wxCAP_PROJECTING, do: 131
  def wxCAP_BUTT, do: 132
  # From "defs.h"
  def wxFLOOD_SURFACE, do: 1
  def wxFLOOD_BORDER, do: 2
  # From "defs.h"
  def wxODDEVEN_RULE, do: 1
  def wxWINDING_RULE, do: 2
  # From "defs.h"
  def wxTOOL_TOP, do: 1
  def wxTOOL_BOTTOM, do: 2
  def wxTOOL_LEFT, do: 3
  def wxTOOL_RIGHT, do: 4
  # From "defs.h"
  def wxMM_TEXT, do: 1
  def wxMM_LOMETRIC, do: 2
  def wxMM_HIMETRIC, do: 3
  def wxMM_LOENGLISH, do: 4
  def wxMM_HIENGLISH, do: 5
  def wxMM_TWIPS, do: 6
  def wxMM_ISOTROPIC, do: 7
  def wxMM_ANISOTROPIC, do: 8
  def wxMM_POINTS, do: 9
  def wxMM_METRIC, do: 10
  # From "defs.h"
  def wxPRINT_QUALITY_DRAFT, do: -4
  def wxPRINT_QUALITY_LOW, do: -3
  def wxPRINT_QUALITY_MEDIUM, do: -2
  def wxPRINT_QUALITY_HIGH, do: -1
  def wxLANDSCAPE, do: 2
  def wxPORTRAIT, do: 1
  def wxSIZE_FORCE, do: 16
  def wxSIZE_NO_ADJUSTMENTS, do: 8
  def wxSIZE_ALLOW_MINUS_ONE, do: 4
  def wxSIZE_USE_EXISTING, do: 0
  def wxSIZE_AUTO, do: bor(wxSIZE_AUTO_WIDTH(), wxSIZE_AUTO_HEIGHT())
  def wxSIZE_AUTO_HEIGHT, do: 2
  def wxSIZE_AUTO_WIDTH, do: 1
  def wxSETUP, do: 131_072
  def wxMORE, do: 65536
  def wxHELP, do: 32768
  def wxRESET, do: 16384
  def wxBACKWARD, do: 8192
  def wxFORWARD, do: 4096
  def wxICON_MASK, do: 0x00000100 |> bor(0x00000200 |> bor(0x00000400 |> bor(0x00000800)))
  def wxICON_ASTERISK, do: wxICON_INFORMATION()
  def wxICON_STOP, do: wxICON_HAND()
  def wxICON_INFORMATION, do: 2048
  def wxICON_QUESTION, do: 1024
  def wxICON_ERROR, do: wxICON_HAND()
  def wxICON_WARNING, do: wxICON_EXCLAMATION()
  def wxICON_HAND, do: 512
  def wxICON_EXCLAMATION, do: 256
  def wxNO_DEFAULT, do: 128
  def wxYES_DEFAULT, do: 0
  def wxCANCEL, do: 16
  def wxYES_NO, do: wxYES() |> bor(wxNO())
  def wxNO, do: 8
  def wxOK, do: 4
  def wxYES, do: 2
  def wxLI_VERTICAL, do: wxVERTICAL()
  def wxLI_HORIZONTAL, do: wxHORIZONTAL()
  def wxBI_EXPAND, do: wxEXPAND()
  def wxST_DOTS_END, do: 4
  def wxST_DOTS_MIDDLE, do: 2
  def wxST_NO_AUTORESIZE, do: 1
  def wxST_SIZEGRIP, do: 16
  def wxTC_OWNERDRAW, do: 1024
  def wxTC_MULTILINE, do: 512
  def wxTC_BOTTOM, do: 128
  def wxTC_RIGHT, do: 64
  def wxTC_LEFT, do: 32
  def wxTC_TOP, do: 0
  def wxTC_FIXEDWIDTH, do: 32
  def wxTC_RIGHTJUSTIFY, do: 16
  def wxSP_WRAP, do: 8192
  def wxSP_ARROW_KEYS, do: 4096
  def wxSP_VERTICAL, do: wxVERTICAL()
  def wxSP_HORIZONTAL, do: wxHORIZONTAL()
  def wxSB_VERTICAL, do: wxVERTICAL()
  def wxSB_HORIZONTAL, do: wxHORIZONTAL()
  def wxRB_USE_CHECKBOX, do: 16
  def wxRB_SINGLE, do: 8
  def wxRB_GROUP, do: 4
  def wxRA_USE_CHECKBOX, do: 16
  def wxRA_VERTICAL, do: wxVERTICAL()
  def wxRA_HORIZONTAL, do: wxHORIZONTAL()
  def wxRA_SPECIFY_ROWS, do: wxVERTICAL()
  def wxRA_SPECIFY_COLS, do: wxHORIZONTAL()
  def wxRA_TOPTOBOTTOM, do: 2
  def wxRA_LEFTTORIGHT, do: 1
  def wxCB_DROPDOWN, do: 32
  def wxCB_READONLY, do: 16
  def wxCB_SORT, do: 8
  def wxCB_SIMPLE, do: 4
  def wxLB_INT_HEIGHT, do: 2048
  def wxLB_HSCROLL, do: wxHSCROLL()
  def wxLB_ALWAYS_SB, do: 1024
  def wxLB_NEEDED_SB, do: 512
  def wxLB_OWNERDRAW, do: 256
  def wxLB_EXTENDED, do: 128
  def wxLB_MULTIPLE, do: 64
  def wxLB_SINGLE, do: 32
  def wxLB_SORT, do: 16
  def wxFIXED_LENGTH, do: 1024
  def wxCOLOURED, do: 2048
  def wxMENU_TEAROFF, do: 1
  def wxMB_DOCKABLE, do: 1
  def wxFRAME_NO_WINDOW_MENU, do: 256
  def wxFRAME_DRAWER, do: 32
  def wxDIALOG_EX_CONTEXTHELP, do: wxWS_EX_CONTEXTHELP()
  def wxFRAME_EX_CONTEXTHELP, do: wxWS_EX_CONTEXTHELP()
  def wxWS_EX_CONTEXTHELP, do: 128
  def wxDIALOG_EX_METAL, do: 64
  def wxFRAME_EX_METAL, do: 64
  def wxWS_EX_PROCESS_UI_UPDATES, do: 32
  def wxWS_EX_PROCESS_IDLE, do: 16
  def wxWS_EX_THEMED_BACKGROUND, do: 8
  def wxWS_EX_TRANSIENT, do: 4
  def wxWS_EX_BLOCK_EVENTS, do: 2
  def wxWS_EX_VALIDATE_RECURSIVELY, do: 1

  @dialyzer {:nowarn_function, wxWINDOW_STYLE_MASK: 0}
  def wxWINDOW_STYLE_MASK,
    do:
      wxVSCROLL()
      |> bor(
        wxHSCROLL()
        |> bor(
          wxBORDER_MASK()
          |> bor(
            wxALWAYS_SHOW_SB()
            |> bor(
              wxCLIP_CHILDREN()
              |> bor(
                wxCLIP_SIBLINGS()
                |> bor(
                  wxTRANSPARENT_WINDOW()
                  |> bor(
                    wxTAB_TRAVERSAL()
                    |> bor(
                      wxWANTS_CHARS()
                      |> bor(
                        wxRETAINED()
                        |> bor(wxPOPUP_WINDOW() |> bor(wxFULL_REPAINT_ON_RESIZE()))
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )

  def wxNO_FULL_REPAINT_ON_RESIZE, do: 0
  def wxFULL_REPAINT_ON_RESIZE, do: 65536
  def wxPOPUP_WINDOW, do: 131_072
  def wxBACKINGSTORE, do: wxRETAINED()
  def wxRETAINED, do: :wxe_util.get_const(wxRETAINED())
  def wxWANTS_CHARS, do: 262_144
  def wxTAB_TRAVERSAL, do: 524_288
  def wxTRANSPARENT_WINDOW, do: 1_048_576
  def wxCLIP_SIBLINGS, do: 536_870_912
  def wxCLIP_CHILDREN, do: 4_194_304
  def wxALWAYS_SHOW_SB, do: 8_388_608
  def wxNO_BORDER, do: wxBORDER_NONE()
  def wxSTATIC_BORDER, do: wxBORDER_STATIC()
  def wxSIMPLE_BORDER, do: wxBORDER_SIMPLE()
  def wxBORDER, do: wxBORDER_SIMPLE()
  def wxRAISED_BORDER, do: wxBORDER_RAISED()
  def wxSUNKEN_BORDER, do: wxBORDER_SUNKEN()
  def wxDOUBLE_BORDER, do: wxBORDER_DOUBLE()
  def wxCAPTION, do: 536_870_912
  def wxHSCROLL, do: 1_073_741_824
  def wxVSCROLL, do: 2_147_483_648
  def wxDEFAULT_CONTROL_BORDER, do: :wxe_util.get_const(wxDEFAULT_CONTROL_BORDER())
  def wxCENTER_ON_SCREEN, do: wxCENTRE_ON_SCREEN()
  def wxCENTRE_ON_SCREEN, do: 2
  def wxCENTER_FRAME, do: 0
  def wxBYTE_ORDER, do: :wxe_util.get_const(:wxBYTE_ORDER)
  def wxPDP_ENDIAN, do: 3412
  def wxLITTLE_ENDIAN, do: 1234
  def wxBIG_ENDIAN, do: 4321
  def wxHAS_INT64, do: :wxe_util.get_const(:wxHAS_INT64)
  def wxNOT_FOUND, do: -1
  # From "defs.h": form_ops_t
  def wxCLEAR, do: 0
  def wxROP_BLACK, do: wxCLEAR()
  def wxBLIT_BLACKNESS, do: wxCLEAR()
  def wxXOR, do: wxCLEAR() + 1
  def wxROP_XORPEN, do: wxXOR()
  def wxBLIT_SRCINVERT, do: wxXOR()
  def wxINVERT, do: wxXOR() + 1
  def wxROP_NOT, do: wxINVERT()
  def wxBLIT_DSTINVERT, do: wxINVERT()
  def wxOR_REVERSE, do: wxINVERT() + 1
  def wxROP_MERGEPENNOT, do: wxOR_REVERSE()
  def wxBLIT_00DD0228, do: wxOR_REVERSE()
  def wxAND_REVERSE, do: wxOR_REVERSE() + 1
  def wxROP_MASKPENNOT, do: wxAND_REVERSE()
  def wxBLIT_SRCERASE, do: wxAND_REVERSE()
  def wxCOPY, do: wxAND_REVERSE() + 1
  def wxROP_COPYPEN, do: wxCOPY()
  def wxBLIT_SRCCOPY, do: wxCOPY()
  def wxAND, do: wxCOPY() + 1
  def wxROP_MASKPEN, do: wxAND()
  def wxBLIT_SRCAND, do: wxAND()
  def wxAND_INVERT, do: wxAND() + 1
  def wxROP_MASKNOTPEN, do: wxAND_INVERT()
  def wxBLIT_00220326, do: wxAND_INVERT()
  def wxNO_OP, do: wxAND_INVERT() + 1
  def wxROP_NOP, do: wxNO_OP()
  def wxBLIT_00AA0029, do: wxNO_OP()
  def wxNOR, do: wxNO_OP() + 1
  def wxROP_NOTMERGEPEN, do: wxNOR()
  def wxBLIT_NOTSRCERASE, do: wxNOR()
  def wxEQUIV, do: wxNOR() + 1
  def wxROP_NOTXORPEN, do: wxEQUIV()
  def wxBLIT_00990066, do: wxEQUIV()
  def wxSRC_INVERT, do: wxEQUIV() + 1
  def wxROP_NOTCOPYPEN, do: wxSRC_INVERT()
  def wxBLIT_NOTSCRCOPY, do: wxSRC_INVERT()
  def wxOR_INVERT, do: wxSRC_INVERT() + 1
  def wxROP_MERGENOTPEN, do: wxOR_INVERT()
  def wxBLIT_MERGEPAINT, do: wxOR_INVERT()
  def wxNAND, do: wxOR_INVERT() + 1
  def wxROP_NOTMASKPEN, do: wxNAND()
  def wxBLIT_007700E6, do: wxNAND()
  def wxOR, do: wxNAND() + 1
  def wxROP_MERGEPEN, do: wxOR()
  def wxBLIT_SRCPAINT, do: wxOR()
  def wxSET, do: wxOR() + 1
  def wxROP_WHITE, do: wxSET()
  def wxBLIT_WHITENESS, do: wxSET()
  # From "defs.h": wxAlignment
  def wxALIGN_NOT, do: 0
  def wxALIGN_CENTER_HORIZONTAL, do: 256
  def wxALIGN_CENTRE_HORIZONTAL, do: wxALIGN_CENTER_HORIZONTAL()
  def wxALIGN_LEFT, do: wxALIGN_NOT()
  def wxALIGN_TOP, do: wxALIGN_NOT()
  def wxALIGN_RIGHT, do: 512
  def wxALIGN_BOTTOM, do: 1024
  def wxALIGN_CENTER_VERTICAL, do: 2048
  def wxALIGN_CENTRE_VERTICAL, do: wxALIGN_CENTER_VERTICAL()
  def wxALIGN_CENTER, do: wxALIGN_CENTER_HORIZONTAL() |> bor(wxALIGN_CENTER_VERTICAL())
  def wxALIGN_CENTRE, do: wxALIGN_CENTER()
  def wxALIGN_MASK, do: 3840
  # From "defs.h": wxBackgroundStyle
  def wxBG_STYLE_SYSTEM, do: 0
  def wxBG_STYLE_COLOUR, do: 1
  def wxBG_STYLE_CUSTOM, do: 2
  # From "defs.h": wxBorder
  def wxBORDER_DEFAULT, do: 0
  def wxBORDER_NONE, do: 2_097_152
  def wxBORDER_STATIC, do: 16_777_216
  def wxBORDER_SIMPLE, do: 33_554_432
  def wxBORDER_RAISED, do: 67_108_864
  def wxBORDER_SUNKEN, do: 134_217_728
  def wxBORDER_DOUBLE, do: 268_435_456
  def wxBORDER_THEME, do: 268_435_456
  def wxBORDER_MASK, do: 522_190_848
  # From "defs.h": wxDataFormatId
  def wxDF_INVALID, do: 0
  def wxDF_TEXT, do: 1
  def wxDF_BITMAP, do: 2
  def wxDF_METAFILE, do: 3
  def wxDF_SYLK, do: 4
  def wxDF_DIF, do: 5
  def wxDF_TIFF, do: 6
  def wxDF_OEMTEXT, do: 7
  def wxDF_DIB, do: 8
  def wxDF_PALETTE, do: 9
  def wxDF_PENDATA, do: 10
  def wxDF_RIFF, do: 11
  def wxDF_WAVE, do: 12
  def wxDF_UNICODETEXT, do: 13
  def wxDF_ENHMETAFILE, do: 14
  def wxDF_FILENAME, do: 15
  def wxDF_LOCALE, do: 16
  def wxDF_PRIVATE, do: 20
  def wxDF_HTML, do: 30
  def wxDF_MAX, do: 31
  # From "defs.h": wxDirection
  def wxLEFT, do: 16
  def wxRIGHT, do: 32
  def wxUP, do: 64
  def wxDOWN, do: 128
  def wxTOP, do: wxUP()
  def wxBOTTOM, do: wxDOWN()
  def wxNORTH, do: wxUP()
  def wxSOUTH, do: wxDOWN()
  def wxWEST, do: wxLEFT()
  def wxEAST, do: wxRIGHT()
  def wxALL, do: wxUP() |> bor(wxDOWN() |> bor(wxRIGHT() |> bor(wxLEFT())))
  # From "defs.h": wxDuplexMode
  def wxDUPLEX_SIMPLEX, do: 0
  def wxDUPLEX_HORIZONTAL, do: 1
  def wxDUPLEX_VERTICAL, do: 2
  # From "defs.h": wxGeometryCentre
  def wxCENTRE, do: 1
  def wxCENTER, do: wxCENTRE()
  # From "defs.h": wxHitTest
  def wxHT_NOWHERE, do: 0
  def wxHT_SCROLLBAR_FIRST, do: wxHT_NOWHERE()
  def wxHT_SCROLLBAR_ARROW_LINE_1, do: wxHT_NOWHERE() + 1
  def wxHT_SCROLLBAR_ARROW_LINE_2, do: wxHT_NOWHERE() + 2
  def wxHT_SCROLLBAR_ARROW_PAGE_1, do: wxHT_NOWHERE() + 3
  def wxHT_SCROLLBAR_ARROW_PAGE_2, do: wxHT_NOWHERE() + 4
  def wxHT_SCROLLBAR_THUMB, do: wxHT_NOWHERE() + 5
  def wxHT_SCROLLBAR_BAR_1, do: wxHT_NOWHERE() + 6
  def wxHT_SCROLLBAR_BAR_2, do: wxHT_NOWHERE() + 7
  def wxHT_SCROLLBAR_LAST, do: wxHT_NOWHERE() + 8
  def wxHT_WINDOW_OUTSIDE, do: wxHT_NOWHERE() + 9
  def wxHT_WINDOW_INSIDE, do: wxHT_NOWHERE() + 10
  def wxHT_WINDOW_VERT_SCROLLBAR, do: wxHT_NOWHERE() + 11
  def wxHT_WINDOW_HORZ_SCROLLBAR, do: wxHT_NOWHERE() + 12
  def wxHT_WINDOW_CORNER, do: wxHT_NOWHERE() + 13
  def wxHT_MAX, do: wxHT_NOWHERE() + 14
  # From "defs.h": wxItemKind
  def wxITEM_SEPARATOR, do: -1
  def wxITEM_NORMAL, do: 0
  def wxITEM_CHECK, do: 1
  def wxITEM_RADIO, do: 2
  def wxITEM_MAX, do: 3
  # From "defs.h": wxKeyCode
  def wxk_BACK, do: 8
  def wxk_TAB, do: 9
  def wxk_RETURN, do: 13
  def wxk_ESCAPE, do: 27
  def wxk_SPACE, do: 32
  def wxk_DELETE, do: 127
  def wxk_START, do: 300
  def wxk_LBUTTON, do: 301
  def wxk_RBUTTON, do: 302
  def wxk_CANCEL, do: 303
  def wxk_MBUTTON, do: 304
  def wxk_CLEAR, do: 305
  def wxk_SHIFT, do: 306
  def wxk_ALT, do: 307
  def wxk_CONTROL, do: 308
  def wxk_MENU, do: 309
  def wxk_PAUSE, do: 310
  def wxk_CAPITAL, do: 311
  def wxk_END, do: 312
  def wxk_HOME, do: 313
  def wxk_LEFT, do: 314
  def wxk_UP, do: 315
  def wxk_RIGHT, do: 316
  def wxk_DOWN, do: 317
  def wxk_SELECT, do: 318
  def wxk_PRINT, do: 319
  def wxk_EXECUTE, do: 320
  def wxk_SNAPSHOT, do: 321
  def wxk_INSERT, do: 322
  def wxk_HELP, do: 323
  def wxk_NUMPAD0, do: 324
  def wxk_NUMPAD1, do: 325
  def wxk_NUMPAD2, do: 326
  def wxk_NUMPAD3, do: 327
  def wxk_NUMPAD4, do: 328
  def wxk_NUMPAD5, do: 329
  def wxk_NUMPAD6, do: 330
  def wxk_NUMPAD7, do: 331
  def wxk_NUMPAD8, do: 332
  def wxk_NUMPAD9, do: 333
  def wxk_MULTIPLY, do: 334
  def wxk_ADD, do: 335
  def wxk_SEPARATOR, do: 336
  def wxk_SUBTRACT, do: 337
  def wxk_DECIMAL, do: 338
  def wxk_DIVIDE, do: 339
  def wxk_F1, do: 340
  def wxk_F2, do: 341
  def wxk_F3, do: 342
  def wxk_F4, do: 343
  def wxk_F5, do: 344
  def wxk_F6, do: 345
  def wxk_F7, do: 346
  def wxk_F8, do: 347
  def wxk_F9, do: 348
  def wxk_F10, do: 349
  def wxk_F11, do: 350
  def wxk_F12, do: 351
  def wxk_F13, do: 352
  def wxk_F14, do: 353
  def wxk_F15, do: 354
  def wxk_F16, do: 355
  def wxk_F17, do: 356
  def wxk_F18, do: 357
  def wxk_F19, do: 358
  def wxk_F20, do: 359
  def wxk_F21, do: 360
  def wxk_F22, do: 361
  def wxk_F23, do: 362
  def wxk_F24, do: 363
  def wxk_NUMLOCK, do: 364
  def wxk_SCROLL, do: 365
  def wxk_PAGEUP, do: 366
  def wxk_PAGEDOWN, do: 367
  def wxk_NUMPAD_SPACE, do: 368
  def wxk_NUMPAD_TAB, do: 369
  def wxk_NUMPAD_ENTER, do: 370
  def wxk_NUMPAD_F1, do: 371
  def wxk_NUMPAD_F2, do: 372
  def wxk_NUMPAD_F3, do: 373
  def wxk_NUMPAD_F4, do: 374
  def wxk_NUMPAD_HOME, do: 375
  def wxk_NUMPAD_LEFT, do: 376
  def wxk_NUMPAD_UP, do: 377
  def wxk_NUMPAD_RIGHT, do: 378
  def wxk_NUMPAD_DOWN, do: 379
  def wxk_NUMPAD_PAGEUP, do: 380
  def wxk_NUMPAD_PAGEDOWN, do: 381
  def wxk_NUMPAD_END, do: 382
  def wxk_NUMPAD_BEGIN, do: 383
  def wxk_NUMPAD_INSERT, do: 384
  def wxk_NUMPAD_DELETE, do: 385
  def wxk_NUMPAD_EQUAL, do: 386
  def wxk_NUMPAD_MULTIPLY, do: 387
  def wxk_NUMPAD_ADD, do: 388
  def wxk_NUMPAD_SEPARATOR, do: 389
  def wxk_NUMPAD_SUBTRACT, do: 390
  def wxk_NUMPAD_DECIMAL, do: 391
  def wxk_NUMPAD_DIVIDE, do: 392
  def wxk_WINDOWS_LEFT, do: 393
  def wxk_WINDOWS_RIGHT, do: 394
  def wxk_WINDOWS_MENU, do: 395
  def wxk_COMMAND, do: 396
  def wxk_SPECIAL1, do: 193
  def wxk_SPECIAL2, do: 194
  def wxk_SPECIAL3, do: 195
  def wxk_SPECIAL4, do: 196
  def wxk_SPECIAL5, do: 197
  def wxk_SPECIAL6, do: 198
  def wxk_SPECIAL7, do: 199
  def wxk_SPECIAL8, do: 200
  def wxk_SPECIAL9, do: 201
  def wxk_SPECIAL10, do: 202
  def wxk_SPECIAL11, do: 203
  def wxk_SPECIAL12, do: 204
  def wxk_SPECIAL13, do: 205
  def wxk_SPECIAL14, do: 206
  def wxk_SPECIAL15, do: 207
  def wxk_SPECIAL16, do: 208
  def wxk_SPECIAL17, do: 209
  def wxk_SPECIAL18, do: 210
  def wxk_SPECIAL19, do: 211
  def wxk_SPECIAL20, do: 212
  # From "defs.h": wxKeyModifier
  def wxMOD_NONE, do: 0
  def wxMOD_ALT, do: 1
  def wxMOD_CONTROL, do: 2
  def wxMOD_ALTGR, do: wxMOD_ALT() |> bor(wxMOD_CONTROL())
  def wxMOD_SHIFT, do: 4
  def wxMOD_META, do: 8
  def wxMOD_WIN, do: wxMOD_META()
  def wxMOD_CMD, do: :wxe_util.get_const(:wxMOD_CMD)
  def wxMOD_ALL, do: 65535
  # From "defs.h": wxNotificationOptions
  def wxNOTIFY_NONE, do: 0
  def wxNOTIFY_ONCE, do: 1
  def wxNOTIFY_REPEAT, do: 2
  # From "defs.h": wxOrientation
  def wxHORIZONTAL, do: 4
  def wxVERTICAL, do: 8
  def wxBOTH, do: wxVERTICAL() |> bor(wxHORIZONTAL())
  # From "defs.h": wxPaperSize
  def wxPAPER_NONE, do: 0
  def wxPAPER_LETTER, do: 1
  def wxPAPER_LEGAL, do: 2
  def wxPAPER_A4, do: 3
  def wxPAPER_CSHEET, do: 4
  def wxPAPER_DSHEET, do: 5
  def wxPAPER_ESHEET, do: 6
  def wxPAPER_LETTERSMALL, do: 7
  def wxPAPER_TABLOID, do: 8
  def wxPAPER_LEDGER, do: 9
  def wxPAPER_STATEMENT, do: 10
  def wxPAPER_EXECUTIVE, do: 11
  def wxPAPER_A3, do: 12
  def wxPAPER_A4SMALL, do: 13
  def wxPAPER_A5, do: 14
  def wxPAPER_B4, do: 15
  def wxPAPER_B5, do: 16
  def wxPAPER_FOLIO, do: 17
  def wxPAPER_QUARTO, do: 18
  def wxPAPER_10X14, do: 19
  def wxPAPER_11X17, do: 20
  def wxPAPER_NOTE, do: 21
  def wxPAPER_ENV_9, do: 22
  def wxPAPER_ENV_10, do: 23
  def wxPAPER_ENV_11, do: 24
  def wxPAPER_ENV_12, do: 25
  def wxPAPER_ENV_14, do: 26
  def wxPAPER_ENV_DL, do: 27
  def wxPAPER_ENV_C5, do: 28
  def wxPAPER_ENV_C3, do: 29
  def wxPAPER_ENV_C4, do: 30
  def wxPAPER_ENV_C6, do: 31
  def wxPAPER_ENV_C65, do: 32
  def wxPAPER_ENV_B4, do: 33
  def wxPAPER_ENV_B5, do: 34
  def wxPAPER_ENV_B6, do: 35
  def wxPAPER_ENV_ITALY, do: 36
  def wxPAPER_ENV_MONARCH, do: 37
  def wxPAPER_ENV_PERSONAL, do: 38
  def wxPAPER_FANFOLD_US, do: 39
  def wxPAPER_FANFOLD_STD_GERMAN, do: 40
  def wxPAPER_FANFOLD_LGL_GERMAN, do: 41
  def wxPAPER_ISO_B4, do: 42
  def wxPAPER_JAPANESE_POSTCARD, do: 43
  def wxPAPER_9X11, do: 44
  def wxPAPER_10X11, do: 45
  def wxPAPER_15X11, do: 46
  def wxPAPER_ENV_INVITE, do: 47
  def wxPAPER_LETTER_EXTRA, do: 48
  def wxPAPER_LEGAL_EXTRA, do: 49
  def wxPAPER_TABLOID_EXTRA, do: 50
  def wxPAPER_A4_EXTRA, do: 51
  def wxPAPER_LETTER_TRANSVERSE, do: 52
  def wxPAPER_A4_TRANSVERSE, do: 53
  def wxPAPER_LETTER_EXTRA_TRANSVERSE, do: 54
  def wxPAPER_A_PLUS, do: 55
  def wxPAPER_B_PLUS, do: 56
  def wxPAPER_LETTER_PLUS, do: 57
  def wxPAPER_A4_PLUS, do: 58
  def wxPAPER_A5_TRANSVERSE, do: 59
  def wxPAPER_B5_TRANSVERSE, do: 60
  def wxPAPER_A3_EXTRA, do: 61
  def wxPAPER_A5_EXTRA, do: 62
  def wxPAPER_B5_EXTRA, do: 63
  def wxPAPER_A2, do: 64
  def wxPAPER_A3_TRANSVERSE, do: 65
  def wxPAPER_A3_EXTRA_TRANSVERSE, do: 66
  def wxPAPER_DBL_JAPANESE_POSTCARD, do: 67
  def wxPAPER_A6, do: 68
  def wxPAPER_JENV_KAKU2, do: 69
  def wxPAPER_JENV_KAKU3, do: 70
  def wxPAPER_JENV_CHOU3, do: 71
  def wxPAPER_JENV_CHOU4, do: 72
  def wxPAPER_LETTER_ROTATED, do: 73
  def wxPAPER_A3_ROTATED, do: 74
  def wxPAPER_A4_ROTATED, do: 75
  def wxPAPER_A5_ROTATED, do: 76
  def wxPAPER_B4_JIS_ROTATED, do: 77
  def wxPAPER_B5_JIS_ROTATED, do: 78
  def wxPAPER_JAPANESE_POSTCARD_ROTATED, do: 79
  def wxPAPER_DBL_JAPANESE_POSTCARD_ROTATED, do: 80
  def wxPAPER_A6_ROTATED, do: 81
  def wxPAPER_JENV_KAKU2_ROTATED, do: 82
  def wxPAPER_JENV_KAKU3_ROTATED, do: 83
  def wxPAPER_JENV_CHOU3_ROTATED, do: 84
  def wxPAPER_JENV_CHOU4_ROTATED, do: 85
  def wxPAPER_B6_JIS, do: 86
  def wxPAPER_B6_JIS_ROTATED, do: 87
  def wxPAPER_12X11, do: 88
  def wxPAPER_JENV_YOU4, do: 89
  def wxPAPER_JENV_YOU4_ROTATED, do: 90
  def wxPAPER_P16K, do: 91
  def wxPAPER_P32K, do: 92
  def wxPAPER_P32KBIG, do: 93
  def wxPAPER_PENV_1, do: 94
  def wxPAPER_PENV_2, do: 95
  def wxPAPER_PENV_3, do: 96
  def wxPAPER_PENV_4, do: 97
  def wxPAPER_PENV_5, do: 98
  def wxPAPER_PENV_6, do: 99
  def wxPAPER_PENV_7, do: 100
  def wxPAPER_PENV_8, do: 101
  def wxPAPER_PENV_9, do: 102
  def wxPAPER_PENV_10, do: 103
  def wxPAPER_P16K_ROTATED, do: 104
  def wxPAPER_P32K_ROTATED, do: 105
  def wxPAPER_P32KBIG_ROTATED, do: 106
  def wxPAPER_PENV_1_ROTATED, do: 107
  def wxPAPER_PENV_2_ROTATED, do: 108
  def wxPAPER_PENV_3_ROTATED, do: 109
  def wxPAPER_PENV_4_ROTATED, do: 110
  def wxPAPER_PENV_5_ROTATED, do: 111
  def wxPAPER_PENV_6_ROTATED, do: 112
  def wxPAPER_PENV_7_ROTATED, do: 113
  def wxPAPER_PENV_8_ROTATED, do: 114
  def wxPAPER_PENV_9_ROTATED, do: 115
  def wxPAPER_PENV_10_ROTATED, do: 116
  # From "defs.h": wxPrintMode
  def wxPRINT_MODE_NONE, do: 0
  def wxPRINT_MODE_PREVIEW, do: 1
  def wxPRINT_MODE_FILE, do: 2
  def wxPRINT_MODE_PRINTER, do: 3
  def wxPRINT_MODE_STREAM, do: 4
  # From "defs.h": wxStretch
  def wxSTRETCH_NOT, do: 0
  def wxSHRINK, do: 4096
  def wxGROW, do: 8192
  def wxEXPAND, do: wxGROW()
  def wxSHAPED, do: 16384
  def wxFIXED_MINSIZE, do: 32768
  def wxRESERVE_SPACE_EVEN_IF_HIDDEN, do: 2
  def wxTILE, do: 49152
  def wxADJUST_MINSIZE, do: 0
  # From "defs.h": wxUpdateUI
  def wxUPDATE_UI_NONE, do: 0
  def wxUPDATE_UI_RECURSE, do: 1
  def wxUPDATE_UI_FROMIDLE, do: 2
  # From "dialog.h"
  def wxDEFAULT_DIALOG_STYLE, do: wxCAPTION() |> bor(wxSYSTEM_MENU() |> bor(wxCLOSE_BOX()))
  def wxDIALOG_NO_PARENT, do: 1
  # From "dirctrlg.h"
  def wxDIRCTRL_DIR_ONLY, do: 16
  def wxDIRCTRL_SELECT_FIRST, do: 32
  def wxDIRCTRL_SHOW_FILTERS, do: 64
  def wxDIRCTRL_3D_INTERNAL, do: 128
  def wxDIRCTRL_EDIT_LABELS, do: 256
  # From "dirctrlg.h"
  def wxID_FILTERLISTCTRL, do: 7001
  def wxID_TREECTRL, do: 7000
  # From "dirdlg.h"
  def wxDD_DEFAULT_STYLE, do: wxDEFAULT_DIALOG_STYLE() |> bor(wxRESIZE_BORDER())
  def wxDD_NEW_DIR_BUTTON, do: 0
  def wxDD_DIR_MUST_EXIST, do: 512
  def wxDD_CHANGE_DIR, do: 256
  # From "dirdlgg.h"
  # From "dnd.h"
  def wxDrag_CopyOnly, do: 0
  def wxDrag_AllowMove, do: 1
  def wxDrag_DefaultMove, do: 3
  # From "dnd.h": wxDragResult
  def wxDragError, do: 0
  def wxDragNone, do: 1
  def wxDragCopy, do: 2
  def wxDragMove, do: 3
  def wxDragLink, do: 4
  def wxDragCancel, do: 5
  # From "event.h"
  def wxMOUSE_BTN_ANY, do: -1
  def wxMOUSE_BTN_NONE, do: 0
  def wxMOUSE_BTN_LEFT, do: 1
  def wxMOUSE_BTN_MIDDLE, do: 2
  def wxMOUSE_BTN_RIGHT, do: 3
  # From "event.h"
  def wxJOYSTICK1, do: 0
  def wxJOYSTICK2, do: 1
  # From "event.h"
  def wxJOY_BUTTON_ANY, do: -1
  def wxJOY_BUTTON1, do: 1
  def wxJOY_BUTTON2, do: 2
  def wxJOY_BUTTON3, do: 4
  def wxJOY_BUTTON4, do: 8
  # From "event.h"
  # From "event.h": Propagation_state
  def wxEVENT_PROPAGATE_NONE, do: 0
  # From "event.h": wxIdleMode
  def wxIDLE_PROCESS_ALL, do: 0
  def wxIDLE_PROCESS_SPECIFIED, do: 1
  # From "event.h": wxUpdateUIMode
  def wxUPDATE_UI_PROCESS_ALL, do: 0
  def wxUPDATE_UI_PROCESS_SPECIFIED, do: 1
  # From "fdrepdlg.h"
  # From "fdrepdlg.h": wxFindReplaceDialogStyles
  def wxFR_REPLACEDIALOG, do: 1
  def wxFR_NOUPDOWN, do: 2
  def wxFR_NOMATCHCASE, do: 4
  def wxFR_NOWHOLEWORD, do: 8
  # From "fdrepdlg.h": wxFindReplaceFlags
  def wxFR_DOWN, do: 1
  def wxFR_WHOLEWORD, do: 2
  def wxFR_MATCHCASE, do: 4
  # From "filedlg.h"
  def wxFD_OPEN, do: 1
  def wxFD_SAVE, do: 2
  def wxFD_OVERWRITE_PROMPT, do: 4
  def wxFD_FILE_MUST_EXIST, do: 16
  def wxFD_MULTIPLE, do: 32
  def wxFD_CHANGE_DIR, do: 128
  def wxFD_PREVIEW, do: 256
  # From "filedlg.h"
  def wxFD_DEFAULT_STYLE, do: wxFD_OPEN()
  # From "filepicker.h"
  def wxDIRP_DEFAULT_STYLE, do: wxDIRP_DIR_MUST_EXIST()
  def wxDIRP_USE_TEXTCTRL, do: wxPB_USE_TEXTCTRL()
  def wxFLP_DEFAULT_STYLE, do: wxFLP_OPEN() |> bor(wxFLP_FILE_MUST_EXIST())
  def wxFLP_USE_TEXTCTRL, do: wxPB_USE_TEXTCTRL()
  def wxDIRP_CHANGE_DIR, do: 16
  def wxDIRP_DIR_MUST_EXIST, do: 8
  def wxFLP_CHANGE_DIR, do: 16384
  def wxFLP_FILE_MUST_EXIST, do: 8192
  def wxFLP_OVERWRITE_PROMPT, do: 4096
  def wxFLP_SAVE, do: 2048
  def wxFLP_OPEN, do: 1024
  # From "font.h"
  def wxFONTFLAG_DEFAULT, do: 0
  def wxFONTFLAG_ITALIC, do: 1
  def wxFONTFLAG_SLANT, do: 2
  def wxFONTFLAG_LIGHT, do: 4
  def wxFONTFLAG_BOLD, do: 8
  def wxFONTFLAG_ANTIALIASED, do: 16
  def wxFONTFLAG_NOT_ANTIALIASED, do: 32
  def wxFONTFLAG_UNDERLINED, do: 64
  def wxFONTFLAG_STRIKETHROUGH, do: 128

  def wxFONTFLAG_MASK,
    do:
      wxFONTFLAG_ITALIC()
      |> bor(
        wxFONTFLAG_SLANT()
        |> bor(
          wxFONTFLAG_LIGHT()
          |> bor(
            wxFONTFLAG_BOLD()
            |> bor(
              wxFONTFLAG_ANTIALIASED()
              |> bor(
                wxFONTFLAG_NOT_ANTIALIASED()
                |> bor(wxFONTFLAG_UNDERLINED() |> bor(wxFONTFLAG_STRIKETHROUGH()))
              )
            )
          )
        )
      )

  # From "font.h": wxFontFamily
  def wxFONTFAMILY_DEFAULT, do: wxDEFAULT()
  def wxFONTFAMILY_DECORATIVE, do: wxDECORATIVE()
  def wxFONTFAMILY_ROMAN, do: wxROMAN()
  def wxFONTFAMILY_SCRIPT, do: wxSCRIPT()
  def wxFONTFAMILY_SWISS, do: wxSWISS()
  def wxFONTFAMILY_MODERN, do: wxMODERN()
  def wxFONTFAMILY_TELETYPE, do: wxTELETYPE()
  def wxFONTFAMILY_MAX, do: wxTELETYPE() + 1
  def wxFONTFAMILY_UNKNOWN, do: wxFONTFAMILY_MAX()
  # From "font.h": wxFontStyle
  def wxFONTSTYLE_NORMAL, do: wxNORMAL()
  def wxFONTSTYLE_ITALIC, do: wxITALIC()
  def wxFONTSTYLE_SLANT, do: wxSLANT()
  def wxFONTSTYLE_MAX, do: wxSLANT() + 1
  # From "font.h": wxFontWeight
  def wxFONTWEIGHT_NORMAL, do: :wxe_util.get_const(:wxFONTWEIGHT_NORMAL)
  def wxFONTWEIGHT_LIGHT, do: :wxe_util.get_const(:wxFONTWEIGHT_LIGHT)
  def wxFONTWEIGHT_BOLD, do: :wxe_util.get_const(:wxFONTWEIGHT_BOLD)
  def wxFONTWEIGHT_MAX, do: :wxe_util.get_const(:wxFONTWEIGHT_MAX)
  # From "fontenc.h": wxFontEncoding
  def wxFONTENCODING_SYSTEM, do: -1
  def wxFONTENCODING_DEFAULT, do: 0
  def wxFONTENCODING_ISO8859_1, do: 1
  def wxFONTENCODING_ISO8859_2, do: 2
  def wxFONTENCODING_ISO8859_3, do: 3
  def wxFONTENCODING_ISO8859_4, do: 4
  def wxFONTENCODING_ISO8859_5, do: 5
  def wxFONTENCODING_ISO8859_6, do: 6
  def wxFONTENCODING_ISO8859_7, do: 7
  def wxFONTENCODING_ISO8859_8, do: 8
  def wxFONTENCODING_ISO8859_9, do: 9
  def wxFONTENCODING_ISO8859_10, do: 10
  def wxFONTENCODING_ISO8859_11, do: 11
  def wxFONTENCODING_ISO8859_12, do: 12
  def wxFONTENCODING_ISO8859_13, do: 13
  def wxFONTENCODING_ISO8859_14, do: 14
  def wxFONTENCODING_ISO8859_15, do: 15
  def wxFONTENCODING_ISO8859_MAX, do: 16
  def wxFONTENCODING_KOI8, do: 17
  def wxFONTENCODING_KOI8_U, do: 18
  def wxFONTENCODING_ALTERNATIVE, do: 19
  def wxFONTENCODING_BULGARIAN, do: 20
  def wxFONTENCODING_CP437, do: 21
  def wxFONTENCODING_CP850, do: 22
  def wxFONTENCODING_CP852, do: 23
  def wxFONTENCODING_CP855, do: 24
  def wxFONTENCODING_CP866, do: 25
  def wxFONTENCODING_CP874, do: 26
  def wxFONTENCODING_CP932, do: 27
  def wxFONTENCODING_CP936, do: 28
  def wxFONTENCODING_CP949, do: 29
  def wxFONTENCODING_CP950, do: 30
  def wxFONTENCODING_CP1250, do: 31
  def wxFONTENCODING_CP1251, do: 32
  def wxFONTENCODING_CP1252, do: 33
  def wxFONTENCODING_CP1253, do: 34
  def wxFONTENCODING_CP1254, do: 35
  def wxFONTENCODING_CP1255, do: 36
  def wxFONTENCODING_CP1256, do: 37
  def wxFONTENCODING_CP1257, do: 38
  def wxFONTENCODING_CP12_MAX, do: 39
  def wxFONTENCODING_UTF7, do: 40
  def wxFONTENCODING_UTF8, do: 41
  def wxFONTENCODING_EUC_JP, do: 42
  def wxFONTENCODING_UTF16BE, do: 43
  def wxFONTENCODING_UTF16LE, do: 44
  def wxFONTENCODING_UTF32BE, do: 45
  def wxFONTENCODING_UTF32LE, do: 46
  def wxFONTENCODING_MACROMAN, do: 47
  def wxFONTENCODING_MACJAPANESE, do: 48
  def wxFONTENCODING_MACCHINESETRAD, do: 49
  def wxFONTENCODING_MACKOREAN, do: 50
  def wxFONTENCODING_MACARABIC, do: 51
  def wxFONTENCODING_MACHEBREW, do: 52
  def wxFONTENCODING_MACGREEK, do: 53
  def wxFONTENCODING_MACCYRILLIC, do: 54
  def wxFONTENCODING_MACDEVANAGARI, do: 55
  def wxFONTENCODING_MACGURMUKHI, do: 56
  def wxFONTENCODING_MACGUJARATI, do: 57
  def wxFONTENCODING_MACORIYA, do: 58
  def wxFONTENCODING_MACBENGALI, do: 59
  def wxFONTENCODING_MACTAMIL, do: 60
  def wxFONTENCODING_MACTELUGU, do: 61
  def wxFONTENCODING_MACKANNADA, do: 62
  def wxFONTENCODING_MACMALAJALAM, do: 63
  def wxFONTENCODING_MACSINHALESE, do: 64
  def wxFONTENCODING_MACBURMESE, do: 65
  def wxFONTENCODING_MACKHMER, do: 66
  def wxFONTENCODING_MACTHAI, do: 67
  def wxFONTENCODING_MACLAOTIAN, do: 68
  def wxFONTENCODING_MACGEORGIAN, do: 69
  def wxFONTENCODING_MACARMENIAN, do: 70
  def wxFONTENCODING_MACCHINESESIMP, do: 71
  def wxFONTENCODING_MACTIBETAN, do: 72
  def wxFONTENCODING_MACMONGOLIAN, do: 73
  def wxFONTENCODING_MACETHIOPIC, do: 74
  def wxFONTENCODING_MACCENTRALEUR, do: 75
  def wxFONTENCODING_MACVIATNAMESE, do: 76
  def wxFONTENCODING_MACARABICEXT, do: 77
  def wxFONTENCODING_MACSYMBOL, do: 78
  def wxFONTENCODING_MACDINGBATS, do: 79
  def wxFONTENCODING_MACTURKISH, do: 80
  def wxFONTENCODING_MACCROATIAN, do: 81
  def wxFONTENCODING_MACICELANDIC, do: 82
  def wxFONTENCODING_MACROMANIAN, do: 83
  def wxFONTENCODING_MACCELTIC, do: 84
  def wxFONTENCODING_MACGAELIC, do: 85
  def wxFONTENCODING_MACKEYBOARD, do: 86
  def wxFONTENCODING_MAX, do: 87
  def wxFONTENCODING_MACMIN, do: wxFONTENCODING_MACROMAN()
  def wxFONTENCODING_MACMAX, do: wxFONTENCODING_MACKEYBOARD()
  def wxFONTENCODING_UTF16, do: :wxe_util.get_const(:wxFONTENCODING_UTF16)
  def wxFONTENCODING_UTF32, do: :wxe_util.get_const(:wxFONTENCODING_UTF32)
  def wxFONTENCODING_UNICODE, do: wxFONTENCODING_UTF32()
  def wxFONTENCODING_GB2312, do: wxFONTENCODING_CP936()
  def wxFONTENCODING_BIG5, do: wxFONTENCODING_CP950()
  def wxFONTENCODING_SHIFT_JIS, do: wxFONTENCODING_CP932()
  # From "fontpicker.h"
  def wxFNTP_MAXPOINT_SIZE, do: 100
  def wxFNTP_DEFAULT_STYLE, do: wxFNTP_FONTDESC_AS_LABEL() |> bor(wxFNTP_USEFONT_FOR_LABEL())
  def wxFNTP_USE_TEXTCTRL, do: wxPB_USE_TEXTCTRL()
  def wxFNTP_USEFONT_FOR_LABEL, do: 16
  def wxFNTP_FONTDESC_AS_LABEL, do: 8
  # From "frame.h"
  def wxFRAME_SHAPED, do: 16
  def wxFRAME_FLOAT_ON_PARENT, do: 8
  def wxFRAME_TOOL_WINDOW, do: 4
  def wxFRAME_NO_TASKBAR, do: 2
  # From "framemanager.h": wxAuiButtonId
  def wxAUI_BUTTON_CLOSE, do: 101
  def wxAUI_BUTTON_MAXIMIZE_RESTORE, do: 102
  def wxAUI_BUTTON_MINIMIZE, do: 103
  def wxAUI_BUTTON_PIN, do: 104
  def wxAUI_BUTTON_OPTIONS, do: 105
  def wxAUI_BUTTON_WINDOWLIST, do: 106
  def wxAUI_BUTTON_LEFT, do: 107
  def wxAUI_BUTTON_RIGHT, do: 108
  def wxAUI_BUTTON_UP, do: 109
  def wxAUI_BUTTON_DOWN, do: 110
  def wxAUI_BUTTON_CUSTOM1, do: 201
  def wxAUI_BUTTON_CUSTOM2, do: 202
  def wxAUI_BUTTON_CUSTOM3, do: 203
  # From "framemanager.h": wxAuiManagerDock
  def wxAUI_DOCK_NONE, do: 0
  def wxAUI_DOCK_TOP, do: 1
  def wxAUI_DOCK_RIGHT, do: 2
  def wxAUI_DOCK_BOTTOM, do: 3
  def wxAUI_DOCK_LEFT, do: 4
  def wxAUI_DOCK_CENTER, do: 5
  def wxAUI_DOCK_CENTRE, do: wxAUI_DOCK_CENTER()
  # From "framemanager.h": wxAuiManagerOption
  def wxAUI_MGR_ALLOW_FLOATING, do: 1
  def wxAUI_MGR_ALLOW_ACTIVE_PANE, do: 2
  def wxAUI_MGR_TRANSPARENT_DRAG, do: 4
  def wxAUI_MGR_TRANSPARENT_HINT, do: 8
  def wxAUI_MGR_VENETIAN_BLINDS_HINT, do: 16
  def wxAUI_MGR_RECTANGLE_HINT, do: 32
  def wxAUI_MGR_HINT_FADE, do: 64
  def wxAUI_MGR_NO_VENETIAN_BLINDS_FADE, do: 128
  def wxAUI_MGR_LIVE_RESIZE, do: 256

  def wxAUI_MGR_DEFAULT,
    do:
      wxAUI_MGR_ALLOW_FLOATING()
      |> bor(
        wxAUI_MGR_TRANSPARENT_HINT()
        |> bor(wxAUI_MGR_HINT_FADE() |> bor(wxAUI_MGR_NO_VENETIAN_BLINDS_FADE()))
      )

  # From "framemanager.h": wxAuiPaneButtonState
  def wxAUI_BUTTON_STATE_NORMAL, do: 0
  def wxAUI_BUTTON_STATE_HOVER, do: 2
  def wxAUI_BUTTON_STATE_PRESSED, do: 4
  def wxAUI_BUTTON_STATE_DISABLED, do: 8
  def wxAUI_BUTTON_STATE_HIDDEN, do: 16
  def wxAUI_BUTTON_STATE_CHECKED, do: 32
  # From "framemanager.h": wxAuiPaneDockArtGradients
  def wxAUI_GRADIENT_NONE, do: 0
  def wxAUI_GRADIENT_VERTICAL, do: 1
  def wxAUI_GRADIENT_HORIZONTAL, do: 2
  # From "framemanager.h": wxAuiPaneDockArtSetting
  def wxAUI_DOCKART_SASH_SIZE, do: 0
  def wxAUI_DOCKART_CAPTION_SIZE, do: 1
  def wxAUI_DOCKART_GRIPPER_SIZE, do: 2
  def wxAUI_DOCKART_PANE_BORDER_SIZE, do: 3
  def wxAUI_DOCKART_PANE_BUTTON_SIZE, do: 4
  def wxAUI_DOCKART_BACKGROUND_COLOUR, do: 5
  def wxAUI_DOCKART_SASH_COLOUR, do: 6
  def wxAUI_DOCKART_ACTIVE_CAPTION_COLOUR, do: 7
  def wxAUI_DOCKART_ACTIVE_CAPTION_GRADIENT_COLOUR, do: 8
  def wxAUI_DOCKART_INACTIVE_CAPTION_COLOUR, do: 9
  def wxAUI_DOCKART_INACTIVE_CAPTION_GRADIENT_COLOUR, do: 10
  def wxAUI_DOCKART_ACTIVE_CAPTION_TEXT_COLOUR, do: 11
  def wxAUI_DOCKART_INACTIVE_CAPTION_TEXT_COLOUR, do: 12
  def wxAUI_DOCKART_BORDER_COLOUR, do: 13
  def wxAUI_DOCKART_GRIPPER_COLOUR, do: 14
  def wxAUI_DOCKART_CAPTION_FONT, do: 15
  def wxAUI_DOCKART_GRADIENT_TYPE, do: 16
  # From "framemanager.h": wxAuiPaneInsertLevel
  def wxAUI_INSERT_PANE, do: 0
  def wxAUI_INSERT_ROW, do: 1
  def wxAUI_INSERT_DOCK, do: 2
  # From "gauge.h"
  def wxGAUGE_EMULATE_INDETERMINATE_MODE,
    do: :wxe_util.get_const(:wxGAUGE_EMULATE_INDETERMINATE_MODE)

  def wxGA_SMOOTH, do: 32
  def wxGA_VERTICAL, do: wxVERTICAL()
  def wxGA_HORIZONTAL, do: wxHORIZONTAL()
  # From "gdicmn.h"
  # From "gdicmn.h": wxBitmapType
  def wxBITMAP_TYPE_INVALID, do: 0
  def wxBITMAP_TYPE_BMP, do: 1
  def wxBITMAP_TYPE_BMP_RESOURCE, do: 2
  def wxBITMAP_TYPE_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE()
  def wxBITMAP_TYPE_ICO, do: wxBITMAP_TYPE_BMP_RESOURCE() + 1
  def wxBITMAP_TYPE_ICO_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 2
  def wxBITMAP_TYPE_CUR, do: wxBITMAP_TYPE_BMP_RESOURCE() + 3
  def wxBITMAP_TYPE_CUR_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 4
  def wxBITMAP_TYPE_XBM, do: wxBITMAP_TYPE_BMP_RESOURCE() + 5
  def wxBITMAP_TYPE_XBM_DATA, do: wxBITMAP_TYPE_BMP_RESOURCE() + 6
  def wxBITMAP_TYPE_XPM, do: wxBITMAP_TYPE_BMP_RESOURCE() + 7
  def wxBITMAP_TYPE_XPM_DATA, do: wxBITMAP_TYPE_BMP_RESOURCE() + 8
  def wxBITMAP_TYPE_TIF, do: wxBITMAP_TYPE_BMP_RESOURCE() + 9
  def wxBITMAP_TYPE_TIF_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 10
  def wxBITMAP_TYPE_GIF, do: wxBITMAP_TYPE_BMP_RESOURCE() + 11
  def wxBITMAP_TYPE_GIF_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 12
  def wxBITMAP_TYPE_PNG, do: wxBITMAP_TYPE_BMP_RESOURCE() + 13
  def wxBITMAP_TYPE_PNG_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 14
  def wxBITMAP_TYPE_JPEG, do: wxBITMAP_TYPE_BMP_RESOURCE() + 15
  def wxBITMAP_TYPE_JPEG_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 16
  def wxBITMAP_TYPE_PNM, do: wxBITMAP_TYPE_BMP_RESOURCE() + 17
  def wxBITMAP_TYPE_PNM_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 18
  def wxBITMAP_TYPE_PCX, do: wxBITMAP_TYPE_BMP_RESOURCE() + 19
  def wxBITMAP_TYPE_PCX_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 20
  def wxBITMAP_TYPE_PICT, do: wxBITMAP_TYPE_BMP_RESOURCE() + 21
  def wxBITMAP_TYPE_PICT_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 22
  def wxBITMAP_TYPE_ICON, do: wxBITMAP_TYPE_BMP_RESOURCE() + 23
  def wxBITMAP_TYPE_ICON_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 24
  def wxBITMAP_TYPE_ANI, do: wxBITMAP_TYPE_BMP_RESOURCE() + 25
  def wxBITMAP_TYPE_IFF, do: wxBITMAP_TYPE_BMP_RESOURCE() + 26
  def wxBITMAP_TYPE_TGA, do: wxBITMAP_TYPE_BMP_RESOURCE() + 27
  def wxBITMAP_TYPE_MACCURSOR, do: wxBITMAP_TYPE_BMP_RESOURCE() + 28
  def wxBITMAP_TYPE_MACCURSOR_RESOURCE, do: wxBITMAP_TYPE_BMP_RESOURCE() + 29
  def wxBITMAP_TYPE_ANY, do: 50
  # From "gdicmn.h": wxStockCursor
  def wxCURSOR_NONE, do: 0
  def wxCURSOR_ARROW, do: 1
  def wxCURSOR_RIGHT_ARROW, do: 2
  def wxCURSOR_BULLSEYE, do: 3
  def wxCURSOR_CHAR, do: 4
  def wxCURSOR_CROSS, do: 5
  def wxCURSOR_HAND, do: 6
  def wxCURSOR_IBEAM, do: 7
  def wxCURSOR_LEFT_BUTTON, do: 8
  def wxCURSOR_MAGNIFIER, do: 9
  def wxCURSOR_MIDDLE_BUTTON, do: 10
  def wxCURSOR_NO_ENTRY, do: 11
  def wxCURSOR_PAINT_BRUSH, do: 12
  def wxCURSOR_PENCIL, do: 13
  def wxCURSOR_POINT_LEFT, do: 14
  def wxCURSOR_POINT_RIGHT, do: 15
  def wxCURSOR_QUESTION_ARROW, do: 16
  def wxCURSOR_RIGHT_BUTTON, do: 17
  def wxCURSOR_SIZENESW, do: 18
  def wxCURSOR_SIZENS, do: 19
  def wxCURSOR_SIZENWSE, do: 20
  def wxCURSOR_SIZEWE, do: 21
  def wxCURSOR_SIZING, do: 22
  def wxCURSOR_SPRAYCAN, do: 23
  def wxCURSOR_WAIT, do: 24
  def wxCURSOR_WATCH, do: 25
  def wxCURSOR_BLANK, do: 26
  def wxCURSOR_DEFAULT, do: :wxe_util.get_const(:wxCURSOR_DEFAULT)
  def wxCURSOR_ARROWWAIT, do: :wxe_util.get_const(:wxCURSOR_ARROWWAIT)
  def wxCURSOR_MAX, do: :wxe_util.get_const(:wxCURSOR_MAX)
  # From "generic_2laywin.h"
  def wxLAYOUT_QUERY, do: 256
  def wxLAYOUT_MRU_LENGTH, do: 16
  def wxLAYOUT_LENGTH_X, do: 0
  def wxLAYOUT_LENGTH_Y, do: 8
  # From "generic_2laywin.h": wxLayoutAlignment
  def wxLAYOUT_NONE, do: 0
  def wxLAYOUT_TOP, do: 1
  def wxLAYOUT_LEFT, do: 2
  def wxLAYOUT_RIGHT, do: 3
  def wxLAYOUT_BOTTOM, do: 4
  # From "generic_2laywin.h": wxLayoutOrientation
  def wxLAYOUT_HORIZONTAL, do: 0
  def wxLAYOUT_VERTICAL, do: 1
  # From "generic_2sashwin.h"
  def wxSW_3D, do: wxSW_3DSASH() |> bor(wxSW_3DBORDER())
  def wxSW_3DBORDER, do: 128
  def wxSW_3DSASH, do: 64
  def wxSW_BORDER, do: 32
  def wxSW_NOBORDER, do: 0
  def wxSASH_DRAG_LEFT_DOWN, do: 2
  def wxSASH_DRAG_DRAGGING, do: 1
  def wxSASH_DRAG_NONE, do: 0
  # From "generic_2sashwin.h": wxSashEdgePosition
  def wxSASH_TOP, do: 0
  def wxSASH_RIGHT, do: 1
  def wxSASH_BOTTOM, do: 2
  def wxSASH_LEFT, do: 3
  def wxSASH_NONE, do: 100
  # From "generic_2splash.h"
  def wxSPLASH_NO_TIMEOUT, do: 0
  def wxSPLASH_TIMEOUT, do: 4
  def wxSPLASH_NO_CENTRE, do: 0
  def wxSPLASH_CENTRE_ON_SCREEN, do: 2
  def wxSPLASH_CENTRE_ON_PARENT, do: 1
  # From "generic_2splitter.h"
  def wxSPLIT_DRAG_NONE, do: 0
  def wxSPLIT_DRAG_DRAGGING, do: 1
  def wxSPLIT_DRAG_LEFT_DOWN, do: 2
  # From "generic_2splitter.h": wxSplitMode
  def wxSPLIT_HORIZONTAL, do: 1
  def wxSPLIT_VERTICAL, do: 2
  # From "glcanvas.h"
  def wx_GL_RGBA, do: 1
  def wx_GL_BUFFER_SIZE, do: 2
  def wx_GL_LEVEL, do: 3
  def wx_GL_DOUBLEBUFFER, do: 4
  def wx_GL_STEREO, do: 5
  def wx_GL_AUX_BUFFERS, do: 6
  def wx_GL_MIN_RED, do: 7
  def wx_GL_MIN_GREEN, do: 8
  def wx_GL_MIN_BLUE, do: 9
  def wx_GL_MIN_ALPHA, do: 10
  def wx_GL_DEPTH_SIZE, do: 11
  def wx_GL_STENCIL_SIZE, do: 12
  def wx_GL_MIN_ACCUM_RED, do: 13
  def wx_GL_MIN_ACCUM_GREEN, do: 14
  def wx_GL_MIN_ACCUM_BLUE, do: 15
  def wx_GL_MIN_ACCUM_ALPHA, do: 16
  # From "hash.h"
  def wxHASH_SIZE_DEFAULT, do: 1000
  # From "htmlwin.h"
  def wxHW_DEFAULT_STYLE, do: wxHW_SCROLLBAR_AUTO()
  def wxHW_NO_SELECTION, do: 8
  def wxHW_SCROLLBAR_AUTO, do: 4
  def wxHW_SCROLLBAR_NEVER, do: 2
  # From "htmlwin.h": wxHtmlOpeningStatus
  def wxHTML_OPEN, do: 0
  def wxHTML_BLOCK, do: 1
  def wxHTML_REDIRECT, do: 2
  # From "htmprint.h"
  def wxPAGE_ODD, do: 0
  def wxPAGE_EVEN, do: 1
  def wxPAGE_ALL, do: 2
  # From "imagbmp.h"
  def wxBMP_24BPP, do: 24
  def wxBMP_8BPP, do: 8
  def wxBMP_8BPP_GREY, do: 9
  def wxBMP_8BPP_GRAY, do: wxBMP_8BPP_GREY()
  def wxBMP_8BPP_RED, do: 10
  def wxBMP_8BPP_PALETTE, do: 11
  def wxBMP_4BPP, do: 4
  def wxBMP_1BPP, do: 1
  def wxBMP_1BPP_BW, do: 2
  # From "image.h"
  def wxIMAGE_RESOLUTION_INCHES, do: 1
  def wxIMAGE_RESOLUTION_CM, do: 2
  # From "image.h"
  def wxIMAGE_QUALITY_NORMAL, do: 0
  def wxIMAGE_QUALITY_HIGH, do: 1
  # From "imaglist.h"
  def wxIMAGE_LIST_NORMAL, do: 0
  def wxIMAGE_LIST_SMALL, do: 1
  def wxIMAGE_LIST_STATE, do: 2
  # From "imaglist.h"
  def wxIMAGELIST_DRAW_FOCUSED, do: 8
  def wxIMAGELIST_DRAW_SELECTED, do: 4
  def wxIMAGELIST_DRAW_TRANSPARENT, do: 2
  def wxIMAGELIST_DRAW_NORMAL, do: 1
  # From "intl.h": wxLanguage
  def wxLANGUAGE_DEFAULT, do: :wxe_util.get_const(:wxLANGUAGE_DEFAULT)
  def wxLANGUAGE_UNKNOWN, do: :wxe_util.get_const(:wxLANGUAGE_UNKNOWN)
  def wxLANGUAGE_ABKHAZIAN, do: :wxe_util.get_const(:wxLANGUAGE_ABKHAZIAN)
  def wxLANGUAGE_AFAR, do: :wxe_util.get_const(:wxLANGUAGE_AFAR)
  def wxLANGUAGE_AFRIKAANS, do: :wxe_util.get_const(:wxLANGUAGE_AFRIKAANS)
  def wxLANGUAGE_ALBANIAN, do: :wxe_util.get_const(:wxLANGUAGE_ALBANIAN)
  def wxLANGUAGE_AMHARIC, do: :wxe_util.get_const(:wxLANGUAGE_AMHARIC)
  def wxLANGUAGE_ARABIC, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC)
  def wxLANGUAGE_ARABIC_ALGERIA, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_ALGERIA)
  def wxLANGUAGE_ARABIC_BAHRAIN, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_BAHRAIN)
  def wxLANGUAGE_ARABIC_EGYPT, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_EGYPT)
  def wxLANGUAGE_ARABIC_IRAQ, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_IRAQ)
  def wxLANGUAGE_ARABIC_JORDAN, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_JORDAN)
  def wxLANGUAGE_ARABIC_KUWAIT, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_KUWAIT)
  def wxLANGUAGE_ARABIC_LEBANON, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_LEBANON)
  def wxLANGUAGE_ARABIC_LIBYA, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_LIBYA)
  def wxLANGUAGE_ARABIC_MOROCCO, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_MOROCCO)
  def wxLANGUAGE_ARABIC_OMAN, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_OMAN)
  def wxLANGUAGE_ARABIC_QATAR, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_QATAR)
  def wxLANGUAGE_ARABIC_SAUDI_ARABIA, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_SAUDI_ARABIA)
  def wxLANGUAGE_ARABIC_SUDAN, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_SUDAN)
  def wxLANGUAGE_ARABIC_SYRIA, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_SYRIA)
  def wxLANGUAGE_ARABIC_TUNISIA, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_TUNISIA)
  def wxLANGUAGE_ARABIC_UAE, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_UAE)
  def wxLANGUAGE_ARABIC_YEMEN, do: :wxe_util.get_const(:wxLANGUAGE_ARABIC_YEMEN)
  def wxLANGUAGE_ARMENIAN, do: :wxe_util.get_const(:wxLANGUAGE_ARMENIAN)
  def wxLANGUAGE_ASSAMESE, do: :wxe_util.get_const(:wxLANGUAGE_ASSAMESE)
  def wxLANGUAGE_AYMARA, do: :wxe_util.get_const(:wxLANGUAGE_AYMARA)
  def wxLANGUAGE_AZERI, do: :wxe_util.get_const(:wxLANGUAGE_AZERI)
  def wxLANGUAGE_AZERI_CYRILLIC, do: :wxe_util.get_const(:wxLANGUAGE_AZERI_CYRILLIC)
  def wxLANGUAGE_AZERI_LATIN, do: :wxe_util.get_const(:wxLANGUAGE_AZERI_LATIN)
  def wxLANGUAGE_BASHKIR, do: :wxe_util.get_const(:wxLANGUAGE_BASHKIR)
  def wxLANGUAGE_BASQUE, do: :wxe_util.get_const(:wxLANGUAGE_BASQUE)
  def wxLANGUAGE_BELARUSIAN, do: :wxe_util.get_const(:wxLANGUAGE_BELARUSIAN)
  def wxLANGUAGE_BENGALI, do: :wxe_util.get_const(:wxLANGUAGE_BENGALI)
  def wxLANGUAGE_BHUTANI, do: :wxe_util.get_const(:wxLANGUAGE_BHUTANI)
  def wxLANGUAGE_BIHARI, do: :wxe_util.get_const(:wxLANGUAGE_BIHARI)
  def wxLANGUAGE_BISLAMA, do: :wxe_util.get_const(:wxLANGUAGE_BISLAMA)
  def wxLANGUAGE_BRETON, do: :wxe_util.get_const(:wxLANGUAGE_BRETON)
  def wxLANGUAGE_BULGARIAN, do: :wxe_util.get_const(:wxLANGUAGE_BULGARIAN)
  def wxLANGUAGE_BURMESE, do: :wxe_util.get_const(:wxLANGUAGE_BURMESE)
  def wxLANGUAGE_CAMBODIAN, do: :wxe_util.get_const(:wxLANGUAGE_CAMBODIAN)
  def wxLANGUAGE_CATALAN, do: :wxe_util.get_const(:wxLANGUAGE_CATALAN)
  def wxLANGUAGE_CHINESE, do: :wxe_util.get_const(:wxLANGUAGE_CHINESE)
  def wxLANGUAGE_CHINESE_SIMPLIFIED, do: :wxe_util.get_const(:wxLANGUAGE_CHINESE_SIMPLIFIED)
  def wxLANGUAGE_CHINESE_TRADITIONAL, do: :wxe_util.get_const(:wxLANGUAGE_CHINESE_TRADITIONAL)
  def wxLANGUAGE_CHINESE_HONGKONG, do: :wxe_util.get_const(:wxLANGUAGE_CHINESE_HONGKONG)
  def wxLANGUAGE_CHINESE_MACAU, do: :wxe_util.get_const(:wxLANGUAGE_CHINESE_MACAU)
  def wxLANGUAGE_CHINESE_SINGAPORE, do: :wxe_util.get_const(:wxLANGUAGE_CHINESE_SINGAPORE)
  def wxLANGUAGE_CHINESE_TAIWAN, do: :wxe_util.get_const(:wxLANGUAGE_CHINESE_TAIWAN)
  def wxLANGUAGE_CORSICAN, do: :wxe_util.get_const(:wxLANGUAGE_CORSICAN)
  def wxLANGUAGE_CROATIAN, do: :wxe_util.get_const(:wxLANGUAGE_CROATIAN)
  def wxLANGUAGE_CZECH, do: :wxe_util.get_const(:wxLANGUAGE_CZECH)
  def wxLANGUAGE_DANISH, do: :wxe_util.get_const(:wxLANGUAGE_DANISH)
  def wxLANGUAGE_DUTCH, do: :wxe_util.get_const(:wxLANGUAGE_DUTCH)
  def wxLANGUAGE_DUTCH_BELGIAN, do: :wxe_util.get_const(:wxLANGUAGE_DUTCH_BELGIAN)
  def wxLANGUAGE_ENGLISH, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH)
  def wxLANGUAGE_ENGLISH_UK, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_UK)
  def wxLANGUAGE_ENGLISH_US, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_US)
  def wxLANGUAGE_ENGLISH_AUSTRALIA, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_AUSTRALIA)
  def wxLANGUAGE_ENGLISH_BELIZE, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_BELIZE)
  def wxLANGUAGE_ENGLISH_BOTSWANA, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_BOTSWANA)
  def wxLANGUAGE_ENGLISH_CANADA, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_CANADA)
  def wxLANGUAGE_ENGLISH_CARIBBEAN, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_CARIBBEAN)
  def wxLANGUAGE_ENGLISH_DENMARK, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_DENMARK)
  def wxLANGUAGE_ENGLISH_EIRE, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_EIRE)
  def wxLANGUAGE_ENGLISH_JAMAICA, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_JAMAICA)
  def wxLANGUAGE_ENGLISH_NEW_ZEALAND, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_NEW_ZEALAND)
  def wxLANGUAGE_ENGLISH_PHILIPPINES, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_PHILIPPINES)
  def wxLANGUAGE_ENGLISH_SOUTH_AFRICA, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_SOUTH_AFRICA)
  def wxLANGUAGE_ENGLISH_TRINIDAD, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_TRINIDAD)
  def wxLANGUAGE_ENGLISH_ZIMBABWE, do: :wxe_util.get_const(:wxLANGUAGE_ENGLISH_ZIMBABWE)
  def wxLANGUAGE_ESPERANTO, do: :wxe_util.get_const(:wxLANGUAGE_ESPERANTO)
  def wxLANGUAGE_ESTONIAN, do: :wxe_util.get_const(:wxLANGUAGE_ESTONIAN)
  def wxLANGUAGE_FAEROESE, do: :wxe_util.get_const(:wxLANGUAGE_FAEROESE)
  def wxLANGUAGE_FARSI, do: :wxe_util.get_const(:wxLANGUAGE_FARSI)
  def wxLANGUAGE_FIJI, do: :wxe_util.get_const(:wxLANGUAGE_FIJI)
  def wxLANGUAGE_FINNISH, do: :wxe_util.get_const(:wxLANGUAGE_FINNISH)
  def wxLANGUAGE_FRENCH, do: :wxe_util.get_const(:wxLANGUAGE_FRENCH)
  def wxLANGUAGE_FRENCH_BELGIAN, do: :wxe_util.get_const(:wxLANGUAGE_FRENCH_BELGIAN)
  def wxLANGUAGE_FRENCH_CANADIAN, do: :wxe_util.get_const(:wxLANGUAGE_FRENCH_CANADIAN)
  def wxLANGUAGE_FRENCH_LUXEMBOURG, do: :wxe_util.get_const(:wxLANGUAGE_FRENCH_LUXEMBOURG)
  def wxLANGUAGE_FRENCH_MONACO, do: :wxe_util.get_const(:wxLANGUAGE_FRENCH_MONACO)
  def wxLANGUAGE_FRENCH_SWISS, do: :wxe_util.get_const(:wxLANGUAGE_FRENCH_SWISS)
  def wxLANGUAGE_FRISIAN, do: :wxe_util.get_const(:wxLANGUAGE_FRISIAN)
  def wxLANGUAGE_GALICIAN, do: :wxe_util.get_const(:wxLANGUAGE_GALICIAN)
  def wxLANGUAGE_GEORGIAN, do: :wxe_util.get_const(:wxLANGUAGE_GEORGIAN)
  def wxLANGUAGE_GERMAN, do: :wxe_util.get_const(:wxLANGUAGE_GERMAN)
  def wxLANGUAGE_GERMAN_AUSTRIAN, do: :wxe_util.get_const(:wxLANGUAGE_GERMAN_AUSTRIAN)
  def wxLANGUAGE_GERMAN_BELGIUM, do: :wxe_util.get_const(:wxLANGUAGE_GERMAN_BELGIUM)
  def wxLANGUAGE_GERMAN_LIECHTENSTEIN, do: :wxe_util.get_const(:wxLANGUAGE_GERMAN_LIECHTENSTEIN)
  def wxLANGUAGE_GERMAN_LUXEMBOURG, do: :wxe_util.get_const(:wxLANGUAGE_GERMAN_LUXEMBOURG)
  def wxLANGUAGE_GERMAN_SWISS, do: :wxe_util.get_const(:wxLANGUAGE_GERMAN_SWISS)
  def wxLANGUAGE_GREEK, do: :wxe_util.get_const(:wxLANGUAGE_GREEK)
  def wxLANGUAGE_GREENLANDIC, do: :wxe_util.get_const(:wxLANGUAGE_GREENLANDIC)
  def wxLANGUAGE_GUARANI, do: :wxe_util.get_const(:wxLANGUAGE_GUARANI)
  def wxLANGUAGE_GUJARATI, do: :wxe_util.get_const(:wxLANGUAGE_GUJARATI)
  def wxLANGUAGE_HAUSA, do: :wxe_util.get_const(:wxLANGUAGE_HAUSA)
  def wxLANGUAGE_HEBREW, do: :wxe_util.get_const(:wxLANGUAGE_HEBREW)
  def wxLANGUAGE_HINDI, do: :wxe_util.get_const(:wxLANGUAGE_HINDI)
  def wxLANGUAGE_HUNGARIAN, do: :wxe_util.get_const(:wxLANGUAGE_HUNGARIAN)
  def wxLANGUAGE_ICELANDIC, do: :wxe_util.get_const(:wxLANGUAGE_ICELANDIC)
  def wxLANGUAGE_INDONESIAN, do: :wxe_util.get_const(:wxLANGUAGE_INDONESIAN)
  def wxLANGUAGE_INTERLINGUA, do: :wxe_util.get_const(:wxLANGUAGE_INTERLINGUA)
  def wxLANGUAGE_INTERLINGUE, do: :wxe_util.get_const(:wxLANGUAGE_INTERLINGUE)
  def wxLANGUAGE_INUKTITUT, do: :wxe_util.get_const(:wxLANGUAGE_INUKTITUT)
  def wxLANGUAGE_INUPIAK, do: :wxe_util.get_const(:wxLANGUAGE_INUPIAK)
  def wxLANGUAGE_IRISH, do: :wxe_util.get_const(:wxLANGUAGE_IRISH)
  def wxLANGUAGE_ITALIAN, do: :wxe_util.get_const(:wxLANGUAGE_ITALIAN)
  def wxLANGUAGE_ITALIAN_SWISS, do: :wxe_util.get_const(:wxLANGUAGE_ITALIAN_SWISS)
  def wxLANGUAGE_JAPANESE, do: :wxe_util.get_const(:wxLANGUAGE_JAPANESE)
  def wxLANGUAGE_JAVANESE, do: :wxe_util.get_const(:wxLANGUAGE_JAVANESE)
  def wxLANGUAGE_KANNADA, do: :wxe_util.get_const(:wxLANGUAGE_KANNADA)
  def wxLANGUAGE_KASHMIRI, do: :wxe_util.get_const(:wxLANGUAGE_KASHMIRI)
  def wxLANGUAGE_KASHMIRI_INDIA, do: :wxe_util.get_const(:wxLANGUAGE_KASHMIRI_INDIA)
  def wxLANGUAGE_KAZAKH, do: :wxe_util.get_const(:wxLANGUAGE_KAZAKH)
  def wxLANGUAGE_KERNEWEK, do: :wxe_util.get_const(:wxLANGUAGE_KERNEWEK)
  def wxLANGUAGE_KINYARWANDA, do: :wxe_util.get_const(:wxLANGUAGE_KINYARWANDA)
  def wxLANGUAGE_KIRGHIZ, do: :wxe_util.get_const(:wxLANGUAGE_KIRGHIZ)
  def wxLANGUAGE_KIRUNDI, do: :wxe_util.get_const(:wxLANGUAGE_KIRUNDI)
  def wxLANGUAGE_KONKANI, do: :wxe_util.get_const(:wxLANGUAGE_KONKANI)
  def wxLANGUAGE_KOREAN, do: :wxe_util.get_const(:wxLANGUAGE_KOREAN)
  def wxLANGUAGE_KURDISH, do: :wxe_util.get_const(:wxLANGUAGE_KURDISH)
  def wxLANGUAGE_LAOTHIAN, do: :wxe_util.get_const(:wxLANGUAGE_LAOTHIAN)
  def wxLANGUAGE_LATIN, do: :wxe_util.get_const(:wxLANGUAGE_LATIN)
  def wxLANGUAGE_LATVIAN, do: :wxe_util.get_const(:wxLANGUAGE_LATVIAN)
  def wxLANGUAGE_LINGALA, do: :wxe_util.get_const(:wxLANGUAGE_LINGALA)
  def wxLANGUAGE_LITHUANIAN, do: :wxe_util.get_const(:wxLANGUAGE_LITHUANIAN)
  def wxLANGUAGE_MACEDONIAN, do: :wxe_util.get_const(:wxLANGUAGE_MACEDONIAN)
  def wxLANGUAGE_MALAGASY, do: :wxe_util.get_const(:wxLANGUAGE_MALAGASY)
  def wxLANGUAGE_MALAY, do: :wxe_util.get_const(:wxLANGUAGE_MALAY)
  def wxLANGUAGE_MALAYALAM, do: :wxe_util.get_const(:wxLANGUAGE_MALAYALAM)

  def wxLANGUAGE_MALAY_BRUNEI_DARUSSALAM,
    do: :wxe_util.get_const(:wxLANGUAGE_MALAY_BRUNEI_DARUSSALAM)

  def wxLANGUAGE_MALAY_MALAYSIA, do: :wxe_util.get_const(:wxLANGUAGE_MALAY_MALAYSIA)
  def wxLANGUAGE_MALTESE, do: :wxe_util.get_const(:wxLANGUAGE_MALTESE)
  def wxLANGUAGE_MANIPURI, do: :wxe_util.get_const(:wxLANGUAGE_MANIPURI)
  def wxLANGUAGE_MAORI, do: :wxe_util.get_const(:wxLANGUAGE_MAORI)
  def wxLANGUAGE_MARATHI, do: :wxe_util.get_const(:wxLANGUAGE_MARATHI)
  def wxLANGUAGE_MOLDAVIAN, do: :wxe_util.get_const(:wxLANGUAGE_MOLDAVIAN)
  def wxLANGUAGE_MONGOLIAN, do: :wxe_util.get_const(:wxLANGUAGE_MONGOLIAN)
  def wxLANGUAGE_NAURU, do: :wxe_util.get_const(:wxLANGUAGE_NAURU)
  def wxLANGUAGE_NEPALI, do: :wxe_util.get_const(:wxLANGUAGE_NEPALI)
  def wxLANGUAGE_NEPALI_INDIA, do: :wxe_util.get_const(:wxLANGUAGE_NEPALI_INDIA)
  def wxLANGUAGE_NORWEGIAN_BOKMAL, do: :wxe_util.get_const(:wxLANGUAGE_NORWEGIAN_BOKMAL)
  def wxLANGUAGE_NORWEGIAN_NYNORSK, do: :wxe_util.get_const(:wxLANGUAGE_NORWEGIAN_NYNORSK)
  def wxLANGUAGE_OCCITAN, do: :wxe_util.get_const(:wxLANGUAGE_OCCITAN)
  def wxLANGUAGE_ORIYA, do: :wxe_util.get_const(:wxLANGUAGE_ORIYA)
  def wxLANGUAGE_OROMO, do: :wxe_util.get_const(:wxLANGUAGE_OROMO)
  def wxLANGUAGE_PASHTO, do: :wxe_util.get_const(:wxLANGUAGE_PASHTO)
  def wxLANGUAGE_POLISH, do: :wxe_util.get_const(:wxLANGUAGE_POLISH)
  def wxLANGUAGE_PORTUGUESE, do: :wxe_util.get_const(:wxLANGUAGE_PORTUGUESE)
  def wxLANGUAGE_PORTUGUESE_BRAZILIAN, do: :wxe_util.get_const(:wxLANGUAGE_PORTUGUESE_BRAZILIAN)
  def wxLANGUAGE_PUNJABI, do: :wxe_util.get_const(:wxLANGUAGE_PUNJABI)
  def wxLANGUAGE_QUECHUA, do: :wxe_util.get_const(:wxLANGUAGE_QUECHUA)
  def wxLANGUAGE_RHAETO_ROMANCE, do: :wxe_util.get_const(:wxLANGUAGE_RHAETO_ROMANCE)
  def wxLANGUAGE_ROMANIAN, do: :wxe_util.get_const(:wxLANGUAGE_ROMANIAN)
  def wxLANGUAGE_RUSSIAN, do: :wxe_util.get_const(:wxLANGUAGE_RUSSIAN)
  def wxLANGUAGE_RUSSIAN_UKRAINE, do: :wxe_util.get_const(:wxLANGUAGE_RUSSIAN_UKRAINE)
  def wxLANGUAGE_SAMOAN, do: :wxe_util.get_const(:wxLANGUAGE_SAMOAN)
  def wxLANGUAGE_SANGHO, do: :wxe_util.get_const(:wxLANGUAGE_SANGHO)
  def wxLANGUAGE_SANSKRIT, do: :wxe_util.get_const(:wxLANGUAGE_SANSKRIT)
  def wxLANGUAGE_SCOTS_GAELIC, do: :wxe_util.get_const(:wxLANGUAGE_SCOTS_GAELIC)
  def wxLANGUAGE_SERBIAN, do: :wxe_util.get_const(:wxLANGUAGE_SERBIAN)
  def wxLANGUAGE_SERBIAN_CYRILLIC, do: :wxe_util.get_const(:wxLANGUAGE_SERBIAN_CYRILLIC)
  def wxLANGUAGE_SERBIAN_LATIN, do: :wxe_util.get_const(:wxLANGUAGE_SERBIAN_LATIN)
  def wxLANGUAGE_SERBO_CROATIAN, do: :wxe_util.get_const(:wxLANGUAGE_SERBO_CROATIAN)
  def wxLANGUAGE_SESOTHO, do: :wxe_util.get_const(:wxLANGUAGE_SESOTHO)
  def wxLANGUAGE_SETSWANA, do: :wxe_util.get_const(:wxLANGUAGE_SETSWANA)
  def wxLANGUAGE_SHONA, do: :wxe_util.get_const(:wxLANGUAGE_SHONA)
  def wxLANGUAGE_SINDHI, do: :wxe_util.get_const(:wxLANGUAGE_SINDHI)
  def wxLANGUAGE_SINHALESE, do: :wxe_util.get_const(:wxLANGUAGE_SINHALESE)
  def wxLANGUAGE_SISWATI, do: :wxe_util.get_const(:wxLANGUAGE_SISWATI)
  def wxLANGUAGE_SLOVAK, do: :wxe_util.get_const(:wxLANGUAGE_SLOVAK)
  def wxLANGUAGE_SLOVENIAN, do: :wxe_util.get_const(:wxLANGUAGE_SLOVENIAN)
  def wxLANGUAGE_SOMALI, do: :wxe_util.get_const(:wxLANGUAGE_SOMALI)
  def wxLANGUAGE_SPANISH, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH)
  def wxLANGUAGE_SPANISH_ARGENTINA, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_ARGENTINA)
  def wxLANGUAGE_SPANISH_BOLIVIA, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_BOLIVIA)
  def wxLANGUAGE_SPANISH_CHILE, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_CHILE)
  def wxLANGUAGE_SPANISH_COLOMBIA, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_COLOMBIA)
  def wxLANGUAGE_SPANISH_COSTA_RICA, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_COSTA_RICA)

  def wxLANGUAGE_SPANISH_DOMINICAN_REPUBLIC,
    do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_DOMINICAN_REPUBLIC)

  def wxLANGUAGE_SPANISH_ECUADOR, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_ECUADOR)
  def wxLANGUAGE_SPANISH_EL_SALVADOR, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_EL_SALVADOR)
  def wxLANGUAGE_SPANISH_GUATEMALA, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_GUATEMALA)
  def wxLANGUAGE_SPANISH_HONDURAS, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_HONDURAS)
  def wxLANGUAGE_SPANISH_MEXICAN, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_MEXICAN)
  def wxLANGUAGE_SPANISH_MODERN, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_MODERN)
  def wxLANGUAGE_SPANISH_NICARAGUA, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_NICARAGUA)
  def wxLANGUAGE_SPANISH_PANAMA, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_PANAMA)
  def wxLANGUAGE_SPANISH_PARAGUAY, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_PARAGUAY)
  def wxLANGUAGE_SPANISH_PERU, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_PERU)
  def wxLANGUAGE_SPANISH_PUERTO_RICO, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_PUERTO_RICO)
  def wxLANGUAGE_SPANISH_URUGUAY, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_URUGUAY)
  def wxLANGUAGE_SPANISH_US, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_US)
  def wxLANGUAGE_SPANISH_VENEZUELA, do: :wxe_util.get_const(:wxLANGUAGE_SPANISH_VENEZUELA)
  def wxLANGUAGE_SUNDANESE, do: :wxe_util.get_const(:wxLANGUAGE_SUNDANESE)
  def wxLANGUAGE_SWAHILI, do: :wxe_util.get_const(:wxLANGUAGE_SWAHILI)
  def wxLANGUAGE_SWEDISH, do: :wxe_util.get_const(:wxLANGUAGE_SWEDISH)
  def wxLANGUAGE_SWEDISH_FINLAND, do: :wxe_util.get_const(:wxLANGUAGE_SWEDISH_FINLAND)
  def wxLANGUAGE_TAGALOG, do: :wxe_util.get_const(:wxLANGUAGE_TAGALOG)
  def wxLANGUAGE_TAJIK, do: :wxe_util.get_const(:wxLANGUAGE_TAJIK)
  def wxLANGUAGE_TAMIL, do: :wxe_util.get_const(:wxLANGUAGE_TAMIL)
  def wxLANGUAGE_TATAR, do: :wxe_util.get_const(:wxLANGUAGE_TATAR)
  def wxLANGUAGE_TELUGU, do: :wxe_util.get_const(:wxLANGUAGE_TELUGU)
  def wxLANGUAGE_THAI, do: :wxe_util.get_const(:wxLANGUAGE_THAI)
  def wxLANGUAGE_TIBETAN, do: :wxe_util.get_const(:wxLANGUAGE_TIBETAN)
  def wxLANGUAGE_TIGRINYA, do: :wxe_util.get_const(:wxLANGUAGE_TIGRINYA)
  def wxLANGUAGE_TONGA, do: :wxe_util.get_const(:wxLANGUAGE_TONGA)
  def wxLANGUAGE_TSONGA, do: :wxe_util.get_const(:wxLANGUAGE_TSONGA)
  def wxLANGUAGE_TURKISH, do: :wxe_util.get_const(:wxLANGUAGE_TURKISH)
  def wxLANGUAGE_TURKMEN, do: :wxe_util.get_const(:wxLANGUAGE_TURKMEN)
  def wxLANGUAGE_TWI, do: :wxe_util.get_const(:wxLANGUAGE_TWI)
  def wxLANGUAGE_UIGHUR, do: :wxe_util.get_const(:wxLANGUAGE_UIGHUR)
  def wxLANGUAGE_UKRAINIAN, do: :wxe_util.get_const(:wxLANGUAGE_UKRAINIAN)
  def wxLANGUAGE_URDU, do: :wxe_util.get_const(:wxLANGUAGE_URDU)
  def wxLANGUAGE_URDU_INDIA, do: :wxe_util.get_const(:wxLANGUAGE_URDU_INDIA)
  def wxLANGUAGE_URDU_PAKISTAN, do: :wxe_util.get_const(:wxLANGUAGE_URDU_PAKISTAN)
  def wxLANGUAGE_UZBEK, do: :wxe_util.get_const(:wxLANGUAGE_UZBEK)
  def wxLANGUAGE_UZBEK_CYRILLIC, do: :wxe_util.get_const(:wxLANGUAGE_UZBEK_CYRILLIC)
  def wxLANGUAGE_UZBEK_LATIN, do: :wxe_util.get_const(:wxLANGUAGE_UZBEK_LATIN)
  def wxLANGUAGE_VIETNAMESE, do: :wxe_util.get_const(:wxLANGUAGE_VIETNAMESE)
  def wxLANGUAGE_VOLAPUK, do: :wxe_util.get_const(:wxLANGUAGE_VOLAPUK)
  def wxLANGUAGE_WELSH, do: :wxe_util.get_const(:wxLANGUAGE_WELSH)
  def wxLANGUAGE_WOLOF, do: :wxe_util.get_const(:wxLANGUAGE_WOLOF)
  def wxLANGUAGE_XHOSA, do: :wxe_util.get_const(:wxLANGUAGE_XHOSA)
  def wxLANGUAGE_YIDDISH, do: :wxe_util.get_const(:wxLANGUAGE_YIDDISH)
  def wxLANGUAGE_YORUBA, do: :wxe_util.get_const(:wxLANGUAGE_YORUBA)
  def wxLANGUAGE_ZHUANG, do: :wxe_util.get_const(:wxLANGUAGE_ZHUANG)
  def wxLANGUAGE_ZULU, do: :wxe_util.get_const(:wxLANGUAGE_ZULU)
  def wxLANGUAGE_USER_DEFINED, do: :wxe_util.get_const(:wxLANGUAGE_USER_DEFINED)
  def wxLANGUAGE_VALENCIAN, do: :wxe_util.get_const(:wxLANGUAGE_VALENCIAN)
  def wxLANGUAGE_SAMI, do: :wxe_util.get_const(:wxLANGUAGE_SAMI)
  # From "intl.h": wxLayoutDirection
  def wxLayout_Default, do: 0
  def wxLayout_LeftToRight, do: 1
  def wxLayout_RightToLeft, do: 2
  # From "intl.h": wxLocaleCategory
  def wxLOCALE_CAT_NUMBER, do: 0
  def wxLOCALE_CAT_DATE, do: 1
  def wxLOCALE_CAT_MONEY, do: 2
  def wxLOCALE_CAT_MAX, do: 3
  # From "intl.h": wxLocaleInfo
  def wxLOCALE_THOUSANDS_SEP, do: 0
  def wxLOCALE_DECIMAL_POINT, do: 1
  # From "intl.h": wxLocaleInitFlags
  def wxLOCALE_LOAD_DEFAULT, do: 1
  def wxLOCALE_CONV_ENCODING, do: 2
  # From "layout.h"
  def wxLAYOUT_DEFAULT_MARGIN, do: 0
  # From "layout.h": wxEdge
  def wxLeft, do: 0
  def wxTop, do: 1
  def wxRight, do: 2
  def wxBottom, do: 3
  def wxWidth, do: 4
  def wxHeight, do: 5
  def wxCentre, do: 6
  def wxCenter, do: wxCentre()
  def wxCentreX, do: wxCentre() + 1
  def wxCentreY, do: wxCentre() + 2
  # From "layout.h": wxRelationship
  def wxUnconstrained, do: 0
  def wxAsIs, do: 1
  def wxPercentOf, do: 2
  def wxAbove, do: 3
  def wxBelow, do: 4
  def wxLeftOf, do: 5
  def wxRightOf, do: 6
  def wxSameAs, do: 7
  def wxAbsolute, do: 8
  # From "list.h": wxKeyType
  def wxKEY_NONE, do: 0
  def wxKEY_INTEGER, do: 1
  def wxKEY_STRING, do: 2
  # From "listbase.h"
  def wxLIST_NEXT_ABOVE, do: 0
  def wxLIST_NEXT_ALL, do: 1
  def wxLIST_NEXT_BELOW, do: 2
  def wxLIST_NEXT_LEFT, do: 3
  def wxLIST_NEXT_RIGHT, do: 4
  # From "listbase.h"
  def wxLIST_ALIGN_DEFAULT, do: 0
  def wxLIST_ALIGN_LEFT, do: 1
  def wxLIST_ALIGN_TOP, do: 2
  def wxLIST_ALIGN_SNAP_TO_GRID, do: 3
  # From "listbase.h"
  def wxLIST_AUTOSIZE, do: -1
  def wxLIST_AUTOSIZE_USEHEADER, do: -2
  # From "listbase.h"
  def wxLIST_RECT_BOUNDS, do: 0
  def wxLIST_RECT_ICON, do: 1
  def wxLIST_RECT_LABEL, do: 2
  # From "listbase.h"
  def wxLIST_FIND_UP, do: 0
  def wxLIST_FIND_DOWN, do: 1
  def wxLIST_FIND_LEFT, do: 2
  def wxLIST_FIND_RIGHT, do: 3
  # From "listbase.h"
  def wxLIST_HITTEST_ONITEM,
    do:
      wxLIST_HITTEST_ONITEMICON()
      |> bor(wxLIST_HITTEST_ONITEMLABEL() |> bor(wxLIST_HITTEST_ONITEMSTATEICON()))

  def wxLIST_HITTEST_TORIGHT, do: 2048
  def wxLIST_HITTEST_TOLEFT, do: 1024
  def wxLIST_HITTEST_ONITEMSTATEICON, do: 512
  def wxLIST_HITTEST_ONITEMRIGHT, do: 256
  def wxLIST_HITTEST_ONITEMLABEL, do: 128
  def wxLIST_HITTEST_ONITEMICON, do: 32
  def wxLIST_HITTEST_NOWHERE, do: 4
  def wxLIST_HITTEST_BELOW, do: 2
  def wxLIST_HITTEST_ABOVE, do: 1
  def wxLIST_STATE_SOURCE, do: 256
  def wxLIST_STATE_PICKED, do: 128
  def wxLIST_STATE_INUSE, do: 64
  def wxLIST_STATE_FILTERED, do: 32
  def wxLIST_STATE_DISABLED, do: 16
  def wxLIST_STATE_CUT, do: 8
  def wxLIST_STATE_SELECTED, do: 4
  def wxLIST_STATE_FOCUSED, do: 2
  def wxLIST_STATE_DROPHILITED, do: 1
  def wxLIST_STATE_DONTCARE, do: 0
  def wxLIST_MASK_FORMAT, do: 64
  def wxLIST_MASK_WIDTH, do: 32
  def wxLIST_SET_ITEM, do: 16
  def wxLIST_MASK_DATA, do: 8
  def wxLIST_MASK_IMAGE, do: 4
  def wxLIST_MASK_TEXT, do: 2
  def wxLIST_MASK_STATE, do: 1
  def wxLC_USER_TEXT, do: wxLC_VIRTUAL()
  def wxLC_MASK_SORT, do: wxLC_SORT_ASCENDING() |> bor(wxLC_SORT_DESCENDING())
  def wxLC_MASK_ALIGN, do: wxLC_ALIGN_TOP() |> bor(wxLC_ALIGN_LEFT())

  def wxLC_MASK_TYPE,
    do: wxLC_ICON() |> bor(wxLC_SMALL_ICON() |> bor(wxLC_LIST() |> bor(wxLC_REPORT())))

  def wxLC_SORT_DESCENDING, do: 32768
  def wxLC_SORT_ASCENDING, do: 16384
  def wxLC_SINGLE_SEL, do: 8192
  def wxLC_NO_SORT_HEADER, do: 4096
  def wxLC_NO_HEADER, do: 2048
  def wxLC_EDIT_LABELS, do: 1024
  def wxLC_VIRTUAL, do: 512
  def wxLC_AUTOARRANGE, do: 256
  def wxLC_ALIGN_LEFT, do: 128
  def wxLC_ALIGN_TOP, do: 64
  def wxLC_REPORT, do: 32
  def wxLC_LIST, do: 16
  def wxLC_SMALL_ICON, do: 8
  def wxLC_ICON, do: 4
  def wxLC_HRULES, do: 2
  def wxLC_VRULES, do: 1
  # From "listbase.h": wxListColumnFormat
  def wxLIST_FORMAT_LEFT, do: 0
  def wxLIST_FORMAT_RIGHT, do: 1
  def wxLIST_FORMAT_CENTRE, do: 2
  def wxLIST_FORMAT_CENTER, do: wxLIST_FORMAT_CENTRE()
  # From "listbook.h"
  def wxLB_ALIGN_MASK, do: wxBK_ALIGN_MASK()
  def wxLB_RIGHT, do: wxBK_RIGHT()
  def wxLB_LEFT, do: wxBK_LEFT()
  def wxLB_BOTTOM, do: wxBK_BOTTOM()
  def wxLB_TOP, do: wxBK_TOP()
  def wxLB_DEFAULT, do: wxBK_DEFAULT()
  # From "log.h"
  def wxTraceRefCount, do: 8
  def wxTraceResAlloc, do: 4
  def wxTraceMessages, do: 2
  def wxTraceMemAlloc, do: 1
  # From "notebook.h"
  def wxNB_HITTEST_NOWHERE, do: wxBK_HITTEST_NOWHERE()
  def wxNB_HITTEST_ONICON, do: wxBK_HITTEST_ONICON()
  def wxNB_HITTEST_ONLABEL, do: wxBK_HITTEST_ONLABEL()
  def wxNB_HITTEST_ONITEM, do: wxBK_HITTEST_ONITEM()
  def wxNB_HITTEST_ONPAGE, do: wxBK_HITTEST_ONPAGE()
  # From "notebook.h"
  def wxNB_FLAT, do: 2048
  def wxNB_NOPAGETHEME, do: 1024
  def wxNB_MULTILINE, do: 512
  def wxNB_FIXEDWIDTH, do: 256
  def wxNB_RIGHT, do: wxBK_RIGHT()
  def wxNB_LEFT, do: wxBK_LEFT()
  def wxNB_BOTTOM, do: wxBK_BOTTOM()
  def wxNB_TOP, do: wxBK_TOP()
  def wxNB_DEFAULT, do: wxBK_DEFAULT()
  # From "pickerbase.h"
  def wxPB_USE_TEXTCTRL, do: 2
  # From "prntbase.h"
  def wxID_PREVIEW_GOTO, do: 8
  def wxID_PREVIEW_LAST, do: 7
  def wxID_PREVIEW_FIRST, do: 6
  def wxID_PREVIEW_ZOOM, do: 5
  def wxID_PREVIEW_PRINT, do: 4
  def wxID_PREVIEW_PREVIOUS, do: 3
  def wxID_PREVIEW_NEXT, do: 2
  def wxID_PREVIEW_CLOSE, do: 1

  def wxPREVIEW_DEFAULT,
    do:
      wxPREVIEW_PREVIOUS()
      |> bor(
        wxPREVIEW_NEXT()
        |> bor(
          wxPREVIEW_ZOOM()
          |> bor(wxPREVIEW_FIRST() |> bor(wxPREVIEW_GOTO() |> bor(wxPREVIEW_LAST())))
        )
      )

  def wxPREVIEW_GOTO, do: 64
  def wxPREVIEW_LAST, do: 32
  def wxPREVIEW_FIRST, do: 16
  def wxPREVIEW_ZOOM, do: 8
  def wxPREVIEW_NEXT, do: 4
  def wxPREVIEW_PREVIOUS, do: 2
  def wxPREVIEW_PRINT, do: 1
  # From "prntbase.h": wxPrinterError
  def wxPRINTER_NO_ERROR, do: 0
  def wxPRINTER_CANCELLED, do: 1
  def wxPRINTER_ERROR, do: 2
  # From "progdlg.h"
  def wxPD_CAN_SKIP, do: 128
  def wxPD_REMAINING_TIME, do: 64
  def wxPD_SMOOTH, do: 32
  def wxPD_ESTIMATED_TIME, do: 16
  def wxPD_ELAPSED_TIME, do: 8
  def wxPD_AUTO_HIDE, do: 4
  def wxPD_APP_MODAL, do: 2
  def wxPD_CAN_ABORT, do: 1
  # From "region.h": wxRegionContain
  def wxOutRegion, do: 0
  def wxPartRegion, do: 1
  def wxInRegion, do: 2
  # From "region.h": wxRegionOp
  def wxRGN_AND, do: 0
  def wxRGN_COPY, do: 1
  def wxRGN_DIFF, do: 2
  def wxRGN_OR, do: 3
  def wxRGN_XOR, do: 4
  # From "scrolwin.h"
  def wxScrolledWindowStyle, do: wxHSCROLL() |> bor(wxVSCROLL())
  # From "settings.h": wxSystemColour
  def wxSYS_COLOUR_SCROLLBAR, do: 0
  def wxSYS_COLOUR_BACKGROUND, do: 1
  def wxSYS_COLOUR_DESKTOP, do: wxSYS_COLOUR_BACKGROUND()
  def wxSYS_COLOUR_ACTIVECAPTION, do: wxSYS_COLOUR_BACKGROUND() + 1
  def wxSYS_COLOUR_INACTIVECAPTION, do: wxSYS_COLOUR_BACKGROUND() + 2
  def wxSYS_COLOUR_MENU, do: wxSYS_COLOUR_BACKGROUND() + 3
  def wxSYS_COLOUR_WINDOW, do: wxSYS_COLOUR_BACKGROUND() + 4
  def wxSYS_COLOUR_WINDOWFRAME, do: wxSYS_COLOUR_BACKGROUND() + 5
  def wxSYS_COLOUR_MENUTEXT, do: wxSYS_COLOUR_BACKGROUND() + 6
  def wxSYS_COLOUR_WINDOWTEXT, do: wxSYS_COLOUR_BACKGROUND() + 7
  def wxSYS_COLOUR_CAPTIONTEXT, do: wxSYS_COLOUR_BACKGROUND() + 8
  def wxSYS_COLOUR_ACTIVEBORDER, do: wxSYS_COLOUR_BACKGROUND() + 9
  def wxSYS_COLOUR_INACTIVEBORDER, do: wxSYS_COLOUR_BACKGROUND() + 10
  def wxSYS_COLOUR_APPWORKSPACE, do: wxSYS_COLOUR_BACKGROUND() + 11
  def wxSYS_COLOUR_HIGHLIGHT, do: wxSYS_COLOUR_BACKGROUND() + 12
  def wxSYS_COLOUR_HIGHLIGHTTEXT, do: wxSYS_COLOUR_BACKGROUND() + 13
  def wxSYS_COLOUR_BTNFACE, do: wxSYS_COLOUR_BACKGROUND() + 14
  def wxSYS_COLOUR_3DFACE, do: wxSYS_COLOUR_BTNFACE()
  def wxSYS_COLOUR_BTNSHADOW, do: wxSYS_COLOUR_BTNFACE() + 1
  def wxSYS_COLOUR_3DSHADOW, do: wxSYS_COLOUR_BTNSHADOW()
  def wxSYS_COLOUR_GRAYTEXT, do: wxSYS_COLOUR_BTNSHADOW() + 1
  def wxSYS_COLOUR_BTNTEXT, do: wxSYS_COLOUR_BTNSHADOW() + 2
  def wxSYS_COLOUR_INACTIVECAPTIONTEXT, do: wxSYS_COLOUR_BTNSHADOW() + 3
  def wxSYS_COLOUR_BTNHIGHLIGHT, do: wxSYS_COLOUR_BTNSHADOW() + 4
  def wxSYS_COLOUR_BTNHILIGHT, do: wxSYS_COLOUR_BTNHIGHLIGHT()
  def wxSYS_COLOUR_3DHIGHLIGHT, do: wxSYS_COLOUR_BTNHIGHLIGHT()
  def wxSYS_COLOUR_3DHILIGHT, do: wxSYS_COLOUR_BTNHIGHLIGHT()
  def wxSYS_COLOUR_3DDKSHADOW, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 1
  def wxSYS_COLOUR_3DLIGHT, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 2
  def wxSYS_COLOUR_INFOTEXT, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 3
  def wxSYS_COLOUR_INFOBK, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 4
  def wxSYS_COLOUR_LISTBOX, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 5
  def wxSYS_COLOUR_HOTLIGHT, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 6
  def wxSYS_COLOUR_GRADIENTACTIVECAPTION, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 7
  def wxSYS_COLOUR_GRADIENTINACTIVECAPTION, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 8
  def wxSYS_COLOUR_MENUHILIGHT, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 9
  def wxSYS_COLOUR_MENUBAR, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 10
  def wxSYS_COLOUR_LISTBOXTEXT, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 11
  def wxSYS_COLOUR_LISTBOXHIGHLIGHTTEXT, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 12
  def wxSYS_COLOUR_MAX, do: wxSYS_COLOUR_BTNHIGHLIGHT() + 13
  # From "settings.h": wxSystemFeature
  def wxSYS_CAN_DRAW_FRAME_DECORATIONS, do: 1
  def wxSYS_CAN_ICONIZE_FRAME, do: 2
  def wxSYS_TABLET_PRESENT, do: 3
  # From "settings.h": wxSystemFont
  def wxSYS_OEM_FIXED_FONT, do: 10
  def wxSYS_ANSI_FIXED_FONT, do: 11
  def wxSYS_ANSI_VAR_FONT, do: 12
  def wxSYS_SYSTEM_FONT, do: 13
  def wxSYS_DEVICE_DEFAULT_FONT, do: 14
  def wxSYS_DEFAULT_PALETTE, do: 15
  def wxSYS_SYSTEM_FIXED_FONT, do: 16
  def wxSYS_DEFAULT_GUI_FONT, do: 17
  def wxSYS_ICONTITLE_FONT, do: wxSYS_DEFAULT_GUI_FONT()
  # From "settings.h": wxSystemMetric
  def wxSYS_MOUSE_BUTTONS, do: 1
  def wxSYS_BORDER_X, do: 2
  def wxSYS_BORDER_Y, do: 3
  def wxSYS_CURSOR_X, do: 4
  def wxSYS_CURSOR_Y, do: 5
  def wxSYS_DCLICK_X, do: 6
  def wxSYS_DCLICK_Y, do: 7
  def wxSYS_DRAG_X, do: 8
  def wxSYS_DRAG_Y, do: 9
  def wxSYS_EDGE_X, do: 10
  def wxSYS_EDGE_Y, do: 11
  def wxSYS_HSCROLL_ARROW_X, do: 12
  def wxSYS_HSCROLL_ARROW_Y, do: 13
  def wxSYS_HTHUMB_X, do: 14
  def wxSYS_ICON_X, do: 15
  def wxSYS_ICON_Y, do: 16
  def wxSYS_ICONSPACING_X, do: 17
  def wxSYS_ICONSPACING_Y, do: 18
  def wxSYS_WINDOWMIN_X, do: 19
  def wxSYS_WINDOWMIN_Y, do: 20
  def wxSYS_SCREEN_X, do: 21
  def wxSYS_SCREEN_Y, do: 22
  def wxSYS_FRAMESIZE_X, do: 23
  def wxSYS_FRAMESIZE_Y, do: 24
  def wxSYS_SMALLICON_X, do: 25
  def wxSYS_SMALLICON_Y, do: 26
  def wxSYS_HSCROLL_Y, do: 27
  def wxSYS_VSCROLL_X, do: 28
  def wxSYS_VSCROLL_ARROW_X, do: 29
  def wxSYS_VSCROLL_ARROW_Y, do: 30
  def wxSYS_VTHUMB_Y, do: 31
  def wxSYS_CAPTION_Y, do: 32
  def wxSYS_MENU_Y, do: 33
  def wxSYS_NETWORK_PRESENT, do: 34
  def wxSYS_PENWINDOWS_PRESENT, do: 35
  def wxSYS_SHOW_SOUNDS, do: 36
  def wxSYS_SWAP_BUTTONS, do: 37
  # From "settings.h": wxSystemScreenType
  def wxSYS_SCREEN_NONE, do: 0
  def wxSYS_SCREEN_TINY, do: 1
  def wxSYS_SCREEN_PDA, do: 2
  def wxSYS_SCREEN_SMALL, do: 3
  def wxSYS_SCREEN_DESKTOP, do: 4
  # From "sizer.h": wxFlexSizerGrowMode
  def wxFLEX_GROWMODE_NONE, do: 0
  def wxFLEX_GROWMODE_SPECIFIED, do: 1
  def wxFLEX_GROWMODE_ALL, do: 2
  # From "slider.h"
  def wxSL_INVERSE, do: 4096
  def wxSL_SELRANGE, do: 2048
  def wxSL_BOTH, do: 1024
  def wxSL_BOTTOM, do: 512
  def wxSL_RIGHT, do: 256
  def wxSL_TOP, do: 128
  def wxSL_LEFT, do: 64
  def wxSL_LABELS, do: :wxe_util.get_const(:wxSL_LABELS)
  def wxSL_AUTOTICKS, do: wxSL_TICKS()
  def wxSL_TICKS, do: 16
  def wxSL_VERTICAL, do: wxVERTICAL()
  def wxSL_HORIZONTAL, do: wxHORIZONTAL()
  # From "splitter.h"
  def wxSP_3D, do: wxSP_3DBORDER() |> bor(wxSP_3DSASH())
  def wxSP_BORDER, do: wxSP_3DBORDER()
  def wxSP_NO_XP_THEME, do: 1024
  def wxSP_3DBORDER, do: 512
  def wxSP_3DSASH, do: 256
  def wxSP_LIVE_UPDATE, do: 128
  def wxSP_PERMIT_UNSPLIT, do: 64
  def wxSP_NOSASH, do: 16
  def wxSP_NOBORDER, do: 0
  # From "statusbr.h"
  def wxSB_RAISED, do: 2
  def wxSB_FLAT, do: 1
  def wxSB_NORMAL, do: 0
  # From "stc.h"
  def wxSTC_CMD_WORDRIGHTENDEXTEND, do: 2442
  def wxSTC_CMD_WORDRIGHTEND, do: 2441
  def wxSTC_CMD_WORDLEFTENDEXTEND, do: 2440
  def wxSTC_CMD_WORDLEFTEND, do: 2439
  def wxSTC_CMD_STUTTEREDPAGEDOWNEXTEND, do: 2438
  def wxSTC_CMD_STUTTEREDPAGEDOWN, do: 2437
  def wxSTC_CMD_STUTTEREDPAGEUPEXTEND, do: 2436
  def wxSTC_CMD_STUTTEREDPAGEUP, do: 2435
  def wxSTC_CMD_PAGEDOWNRECTEXTEND, do: 2434
  def wxSTC_CMD_PAGEUPRECTEXTEND, do: 2433
  def wxSTC_CMD_LINEENDRECTEXTEND, do: 2432
  def wxSTC_CMD_VCHOMERECTEXTEND, do: 2431
  def wxSTC_CMD_HOMERECTEXTEND, do: 2430
  def wxSTC_CMD_CHARRIGHTRECTEXTEND, do: 2429
  def wxSTC_CMD_CHARLEFTRECTEXTEND, do: 2428
  def wxSTC_CMD_LINEUPRECTEXTEND, do: 2427
  def wxSTC_CMD_LINEDOWNRECTEXTEND, do: 2426
  def wxSTC_CMD_PARAUPEXTEND, do: 2416
  def wxSTC_CMD_PARAUP, do: 2415
  def wxSTC_CMD_PARADOWNEXTEND, do: 2414
  def wxSTC_CMD_PARADOWN, do: 2413
  def wxSTC_CMD_DELLINERIGHT, do: 2396
  def wxSTC_CMD_DELLINELEFT, do: 2395
  def wxSTC_CMD_WORDPARTRIGHTEXTEND, do: 2393
  def wxSTC_CMD_WORDPARTRIGHT, do: 2392
  def wxSTC_CMD_WORDPARTLEFTEXTEND, do: 2391
  def wxSTC_CMD_WORDPARTLEFT, do: 2390
  def wxSTC_CMD_LINECOPY, do: 2455
  def wxSTC_CMD_VCHOMEWRAPEXTEND, do: 2454
  def wxSTC_CMD_VCHOMEWRAP, do: 2453
  def wxSTC_CMD_LINEENDWRAPEXTEND, do: 2452
  def wxSTC_CMD_LINEENDWRAP, do: 2451
  def wxSTC_CMD_HOMEWRAPEXTEND, do: 2450
  def wxSTC_CMD_HOMEWRAP, do: 2349
  def wxSTC_CMD_LINEENDDISPLAYEXTEND, do: 2348
  def wxSTC_CMD_LINEENDDISPLAY, do: 2347
  def wxSTC_CMD_HOMEDISPLAYEXTEND, do: 2346
  def wxSTC_CMD_HOMEDISPLAY, do: 2345
  def wxSTC_CMD_DELETEBACKNOTLINE, do: 2344
  def wxSTC_CMD_LINESCROLLUP, do: 2343
  def wxSTC_CMD_LINESCROLLDOWN, do: 2342
  def wxSTC_CMD_UPPERCASE, do: 2341
  def wxSTC_CMD_LOWERCASE, do: 2340
  def wxSTC_CMD_LINEDUPLICATE, do: 2404
  def wxSTC_CMD_LINETRANSPOSE, do: 2339
  def wxSTC_CMD_LINEDELETE, do: 2338
  def wxSTC_CMD_LINECUT, do: 2337
  def wxSTC_CMD_DELWORDRIGHT, do: 2336
  def wxSTC_CMD_DELWORDLEFT, do: 2335
  def wxSTC_CMD_ZOOMOUT, do: 2334
  def wxSTC_CMD_ZOOMIN, do: 2333
  def wxSTC_CMD_VCHOMEEXTEND, do: 2332
  def wxSTC_CMD_VCHOME, do: 2331
  def wxSTC_CMD_FORMFEED, do: 2330
  def wxSTC_CMD_NEWLINE, do: 2329
  def wxSTC_CMD_BACKTAB, do: 2328
  def wxSTC_CMD_TAB, do: 2327
  def wxSTC_CMD_DELETEBACK, do: 2326
  def wxSTC_CMD_CANCEL, do: 2325
  def wxSTC_CMD_EDITTOGGLEOVERTYPE, do: 2324
  def wxSTC_CMD_PAGEDOWNEXTEND, do: 2323
  def wxSTC_CMD_PAGEDOWN, do: 2322
  def wxSTC_CMD_PAGEUPEXTEND, do: 2321
  def wxSTC_CMD_PAGEUP, do: 2320
  def wxSTC_CMD_DOCUMENTENDEXTEND, do: 2319
  def wxSTC_CMD_DOCUMENTEND, do: 2318
  def wxSTC_CMD_DOCUMENTSTARTEXTEND, do: 2317
  def wxSTC_CMD_DOCUMENTSTART, do: 2316
  def wxSTC_CMD_LINEENDEXTEND, do: 2315
  def wxSTC_CMD_LINEEND, do: 2314
  def wxSTC_CMD_HOMEEXTEND, do: 2313
  def wxSTC_CMD_HOME, do: 2312
  def wxSTC_CMD_WORDRIGHTEXTEND, do: 2311
  def wxSTC_CMD_WORDRIGHT, do: 2310
  def wxSTC_CMD_WORDLEFTEXTEND, do: 2309
  def wxSTC_CMD_WORDLEFT, do: 2308
  def wxSTC_CMD_CHARRIGHTEXTEND, do: 2307
  def wxSTC_CMD_CHARRIGHT, do: 2306
  def wxSTC_CMD_CHARLEFTEXTEND, do: 2305
  def wxSTC_CMD_CHARLEFT, do: 2304
  def wxSTC_CMD_LINEUPEXTEND, do: 2303
  def wxSTC_CMD_LINEUP, do: 2302
  def wxSTC_CMD_LINEDOWNEXTEND, do: 2301
  def wxSTC_CMD_LINEDOWN, do: 2300
  def wxSTC_CMD_CLEAR, do: 2180
  def wxSTC_CMD_PASTE, do: 2179
  def wxSTC_CMD_COPY, do: 2178
  def wxSTC_CMD_CUT, do: 2177
  def wxSTC_CMD_UNDO, do: 2176
  def wxSTC_CMD_SELECTALL, do: 2013
  def wxSTC_CMD_REDO, do: 2011
  def wxSTC_SPICE_COMMENTLINE, do: 8
  def wxSTC_SPICE_VALUE, do: 7
  def wxSTC_SPICE_DELIMITER, do: 6
  def wxSTC_SPICE_NUMBER, do: 5
  def wxSTC_SPICE_KEYWORD3, do: 4
  def wxSTC_SPICE_KEYWORD2, do: 3
  def wxSTC_SPICE_KEYWORD, do: 2
  def wxSTC_SPICE_IDENTIFIER, do: 1
  def wxSTC_SPICE_DEFAULT, do: 0
  def wxSTC_OPAL_DEFAULT, do: 32
  def wxSTC_OPAL_BOOL_CONST, do: 8
  def wxSTC_OPAL_PAR, do: 7
  def wxSTC_OPAL_STRING, do: 6
  def wxSTC_OPAL_SORT, do: 5
  def wxSTC_OPAL_KEYWORD, do: 4
  def wxSTC_OPAL_INTEGER, do: 3
  def wxSTC_OPAL_COMMENT_LINE, do: 2
  def wxSTC_OPAL_COMMENT_BLOCK, do: 1
  def wxSTC_OPAL_SPACE, do: 0
  def wxSTC_INNO_IDENTIFIER, do: 12
  def wxSTC_INNO_STRING_SINGLE, do: 11
  def wxSTC_INNO_STRING_DOUBLE, do: 10
  def wxSTC_INNO_KEYWORD_USER, do: 9
  def wxSTC_INNO_KEYWORD_PASCAL, do: 8
  def wxSTC_INNO_COMMENT_PASCAL, do: 7
  def wxSTC_INNO_PREPROC_INLINE, do: 6
  def wxSTC_INNO_PREPROC, do: 5
  def wxSTC_INNO_SECTION, do: 4
  def wxSTC_INNO_PARAMETER, do: 3
  def wxSTC_INNO_KEYWORD, do: 2
  def wxSTC_INNO_COMMENT, do: 1
  def wxSTC_INNO_DEFAULT, do: 0
  def wxSTC_CSOUND_STRINGEOL, do: 15
  def wxSTC_CSOUND_GLOBAL_VAR, do: 14
  def wxSTC_CSOUND_IRATE_VAR, do: 13
  def wxSTC_CSOUND_KRATE_VAR, do: 12
  def wxSTC_CSOUND_ARATE_VAR, do: 11
  def wxSTC_CSOUND_PARAM, do: 10
  def wxSTC_CSOUND_COMMENTBLOCK, do: 9
  def wxSTC_CSOUND_USERKEYWORD, do: 8
  def wxSTC_CSOUND_HEADERSTMT, do: 7
  def wxSTC_CSOUND_OPCODE, do: 6
  def wxSTC_CSOUND_IDENTIFIER, do: 5
  def wxSTC_CSOUND_INSTR, do: 4
  def wxSTC_CSOUND_OPERATOR, do: 3
  def wxSTC_CSOUND_NUMBER, do: 2
  def wxSTC_CSOUND_COMMENT, do: 1
  def wxSTC_CSOUND_DEFAULT, do: 0
  def wxSTC_FS_BINNUMBER, do: 23
  def wxSTC_FS_HEXNUMBER, do: 22
  def wxSTC_FS_ERROR, do: 21
  def wxSTC_FS_LABEL, do: 20
  def wxSTC_FS_ASM, do: 19
  def wxSTC_FS_CONSTANT, do: 18
  def wxSTC_FS_STRINGEOL, do: 17
  def wxSTC_FS_DATE, do: 16
  def wxSTC_FS_IDENTIFIER, do: 15
  def wxSTC_FS_OPERATOR, do: 14
  def wxSTC_FS_PREPROCESSOR, do: 13
  def wxSTC_FS_STRING, do: 12
  def wxSTC_FS_NUMBER, do: 11
  def wxSTC_FS_KEYWORD4, do: 10
  def wxSTC_FS_KEYWORD3, do: 9
  def wxSTC_FS_KEYWORD2, do: 8
  def wxSTC_FS_KEYWORD, do: 7
  def wxSTC_FS_COMMENTDOCKEYWORDERROR, do: 6
  def wxSTC_FS_COMMENTDOCKEYWORD, do: 5
  def wxSTC_FS_COMMENTLINEDOC, do: 4
  def wxSTC_FS_COMMENTDOC, do: 3
  def wxSTC_FS_COMMENTLINE, do: 2
  def wxSTC_FS_COMMENT, do: 1
  def wxSTC_FS_DEFAULT, do: 0
  def wxSTC_ST_SPEC_SEL, do: 16
  def wxSTC_ST_CHARACTER, do: 15
  def wxSTC_ST_ASSIGN, do: 14
  def wxSTC_ST_KWSEND, do: 13
  def wxSTC_ST_SPECIAL, do: 12
  def wxSTC_ST_RETURN, do: 11
  def wxSTC_ST_GLOBAL, do: 10
  def wxSTC_ST_NIL, do: 9
  def wxSTC_ST_SUPER, do: 8
  def wxSTC_ST_SELF, do: 7
  def wxSTC_ST_BOOL, do: 6
  def wxSTC_ST_BINARY, do: 5
  def wxSTC_ST_SYMBOL, do: 4
  def wxSTC_ST_COMMENT, do: 3
  def wxSTC_ST_NUMBER, do: 2
  def wxSTC_ST_STRING, do: 1
  def wxSTC_ST_DEFAULT, do: 0
  def wxSTC_SQL_QUOTEDIDENTIFIER, do: 23
  def wxSTC_SQL_USER4, do: 22
  def wxSTC_SQL_USER3, do: 21
  def wxSTC_SQL_USER2, do: 20
  def wxSTC_SQL_USER1, do: 19
  def wxSTC_SQL_COMMENTDOCKEYWORDERROR, do: 18
  def wxSTC_SQL_COMMENTDOCKEYWORD, do: 17
  def wxSTC_SQL_WORD2, do: 16
  def wxSTC_SQL_COMMENTLINEDOC, do: 15
  def wxSTC_SQL_SQLPLUS_COMMENT, do: 13
  def wxSTC_SQL_IDENTIFIER, do: 11
  def wxSTC_SQL_OPERATOR, do: 10
  def wxSTC_SQL_SQLPLUS_PROMPT, do: 9
  def wxSTC_SQL_SQLPLUS, do: 8
  def wxSTC_SQL_CHARACTER, do: 7
  def wxSTC_SQL_STRING, do: 6
  def wxSTC_SQL_WORD, do: 5
  def wxSTC_SQL_NUMBER, do: 4
  def wxSTC_SQL_COMMENTDOC, do: 3
  def wxSTC_SQL_COMMENTLINE, do: 2
  def wxSTC_SQL_COMMENT, do: 1
  def wxSTC_SQL_DEFAULT, do: 0
  def wxSTC_REBOL_WORD8, do: 28
  def wxSTC_REBOL_WORD7, do: 27
  def wxSTC_REBOL_WORD6, do: 26
  def wxSTC_REBOL_WORD5, do: 25
  def wxSTC_REBOL_WORD4, do: 24
  def wxSTC_REBOL_WORD3, do: 23
  def wxSTC_REBOL_WORD2, do: 22
  def wxSTC_REBOL_WORD, do: 21
  def wxSTC_REBOL_IDENTIFIER, do: 20
  def wxSTC_REBOL_TIME, do: 19
  def wxSTC_REBOL_DATE, do: 18
  def wxSTC_REBOL_URL, do: 17
  def wxSTC_REBOL_EMAIL, do: 16
  def wxSTC_REBOL_FILE, do: 15
  def wxSTC_REBOL_TAG, do: 14
  def wxSTC_REBOL_ISSUE, do: 13
  def wxSTC_REBOL_MONEY, do: 12
  def wxSTC_REBOL_BINARY, do: 11
  def wxSTC_REBOL_TUPLE, do: 10
  def wxSTC_REBOL_PAIR, do: 9
  def wxSTC_REBOL_NUMBER, do: 8
  def wxSTC_REBOL_BRACEDSTRING, do: 7
  def wxSTC_REBOL_QUOTEDSTRING, do: 6
  def wxSTC_REBOL_CHARACTER, do: 5
  def wxSTC_REBOL_OPERATOR, do: 4
  def wxSTC_REBOL_PREFACE, do: 3
  def wxSTC_REBOL_COMMENTBLOCK, do: 2
  def wxSTC_REBOL_COMMENTLINE, do: 1
  def wxSTC_REBOL_DEFAULT, do: 0
  def wxSTC_T3_USER3, do: 19
  def wxSTC_T3_USER2, do: 18
  def wxSTC_T3_USER1, do: 17
  def wxSTC_T3_HTML_STRING, do: 16
  def wxSTC_T3_HTML_DEFAULT, do: 15
  def wxSTC_T3_HTML_TAG, do: 14
  def wxSTC_T3_MSG_PARAM, do: 13
  def wxSTC_T3_LIB_DIRECTIVE, do: 12
  def wxSTC_T3_X_STRING, do: 11
  def wxSTC_T3_D_STRING, do: 10
  def wxSTC_T3_S_STRING, do: 9
  def wxSTC_T3_IDENTIFIER, do: 8
  def wxSTC_T3_NUMBER, do: 7
  def wxSTC_T3_KEYWORD, do: 6
  def wxSTC_T3_OPERATOR, do: 5
  def wxSTC_T3_LINE_COMMENT, do: 4
  def wxSTC_T3_BLOCK_COMMENT, do: 3
  def wxSTC_T3_PREPROCESSOR, do: 2
  def wxSTC_T3_X_DEFAULT, do: 1
  def wxSTC_T3_DEFAULT, do: 0
  def wxSTC_HA_COMMENTBLOCK3, do: 16
  def wxSTC_HA_COMMENTBLOCK2, do: 15
  def wxSTC_HA_COMMENTBLOCK, do: 14
  def wxSTC_HA_COMMENTLINE, do: 13
  def wxSTC_HA_INSTANCE, do: 12
  def wxSTC_HA_OPERATOR, do: 11
  def wxSTC_HA_IMPORT, do: 10
  def wxSTC_HA_DATA, do: 9
  def wxSTC_HA_CAPITAL, do: 8
  def wxSTC_HA_MODULE, do: 7
  def wxSTC_HA_CLASS, do: 6
  def wxSTC_HA_CHARACTER, do: 5
  def wxSTC_HA_STRING, do: 4
  def wxSTC_HA_NUMBER, do: 3
  def wxSTC_HA_KEYWORD, do: 2
  def wxSTC_HA_IDENTIFIER, do: 1
  def wxSTC_HA_DEFAULT, do: 0
  def wxSTC_CAML_COMMENT3, do: 15
  def wxSTC_CAML_COMMENT2, do: 14
  def wxSTC_CAML_COMMENT1, do: 13
  def wxSTC_CAML_COMMENT, do: 12
  def wxSTC_CAML_STRING, do: 11
  def wxSTC_CAML_CHAR, do: 9
  def wxSTC_CAML_NUMBER, do: 8
  def wxSTC_CAML_OPERATOR, do: 7
  def wxSTC_CAML_LINENUM, do: 6
  def wxSTC_CAML_KEYWORD3, do: 5
  def wxSTC_CAML_KEYWORD2, do: 4
  def wxSTC_CAML_KEYWORD, do: 3
  def wxSTC_CAML_TAGNAME, do: 2
  def wxSTC_CAML_IDENTIFIER, do: 1
  def wxSTC_CAML_DEFAULT, do: 0
  def wxSTC_VHDL_USERWORD, do: 14
  def wxSTC_VHDL_STDTYPE, do: 13
  def wxSTC_VHDL_STDPACKAGE, do: 12
  def wxSTC_VHDL_STDFUNCTION, do: 11
  def wxSTC_VHDL_ATTRIBUTE, do: 10
  def wxSTC_VHDL_STDOPERATOR, do: 9
  def wxSTC_VHDL_KEYWORD, do: 8
  def wxSTC_VHDL_STRINGEOL, do: 7
  def wxSTC_VHDL_IDENTIFIER, do: 6
  def wxSTC_VHDL_OPERATOR, do: 5
  def wxSTC_VHDL_STRING, do: 4
  def wxSTC_VHDL_NUMBER, do: 3
  def wxSTC_VHDL_COMMENTLINEBANG, do: 2
  def wxSTC_VHDL_COMMENT, do: 1
  def wxSTC_VHDL_DEFAULT, do: 0
  def wxSTC_ASN1_OPERATOR, do: 10
  def wxSTC_ASN1_TYPE, do: 9
  def wxSTC_ASN1_DESCRIPTOR, do: 8
  def wxSTC_ASN1_ATTRIBUTE, do: 7
  def wxSTC_ASN1_KEYWORD, do: 6
  def wxSTC_ASN1_SCALAR, do: 5
  def wxSTC_ASN1_OID, do: 4
  def wxSTC_ASN1_STRING, do: 3
  def wxSTC_ASN1_IDENTIFIER, do: 2
  def wxSTC_ASN1_COMMENT, do: 1
  def wxSTC_ASN1_DEFAULT, do: 0
  def wxSTC_SH_HERE_Q, do: 13
  def wxSTC_SH_HERE_DELIM, do: 12
  def wxSTC_SH_BACKTICKS, do: 11
  def wxSTC_SH_PARAM, do: 10
  def wxSTC_SH_SCALAR, do: 9
  def wxSTC_SH_IDENTIFIER, do: 8
  def wxSTC_SH_OPERATOR, do: 7
  def wxSTC_SH_CHARACTER, do: 6
  def wxSTC_SH_STRING, do: 5
  def wxSTC_SH_WORD, do: 4
  def wxSTC_SH_NUMBER, do: 3
  def wxSTC_SH_COMMENTLINE, do: 2
  def wxSTC_SH_ERROR, do: 1
  def wxSTC_SH_DEFAULT, do: 0
  def wxSTC_APDL_FUNCTION, do: 12
  def wxSTC_APDL_ARGUMENT, do: 11
  def wxSTC_APDL_STARCOMMAND, do: 10
  def wxSTC_APDL_SLASHCOMMAND, do: 9
  def wxSTC_APDL_COMMAND, do: 8
  def wxSTC_APDL_PROCESSOR, do: 7
  def wxSTC_APDL_WORD, do: 6
  def wxSTC_APDL_OPERATOR, do: 5
  def wxSTC_APDL_STRING, do: 4
  def wxSTC_APDL_NUMBER, do: 3
  def wxSTC_APDL_COMMENTBLOCK, do: 2
  def wxSTC_APDL_COMMENT, do: 1
  def wxSTC_APDL_DEFAULT, do: 0
  def wxSTC_AU3_UDF, do: 15
  def wxSTC_AU3_COMOBJ, do: 14
  def wxSTC_AU3_EXPAND, do: 13
  def wxSTC_AU3_SPECIAL, do: 12
  def wxSTC_AU3_PREPROCESSOR, do: 11
  def wxSTC_AU3_SENT, do: 10
  def wxSTC_AU3_VARIABLE, do: 9
  def wxSTC_AU3_OPERATOR, do: 8
  def wxSTC_AU3_STRING, do: 7
  def wxSTC_AU3_MACRO, do: 6
  def wxSTC_AU3_KEYWORD, do: 5
  def wxSTC_AU3_FUNCTION, do: 4
  def wxSTC_AU3_NUMBER, do: 3
  def wxSTC_AU3_COMMENTBLOCK, do: 2
  def wxSTC_AU3_COMMENT, do: 1
  def wxSTC_AU3_DEFAULT, do: 0
  def wxSTC_SN_USER, do: 19
  def wxSTC_SN_SIGNAL, do: 14
  def wxSTC_SN_REGEXTAG, do: 13
  def wxSTC_SN_STRINGEOL, do: 12
  def wxSTC_SN_IDENTIFIER, do: 11
  def wxSTC_SN_OPERATOR, do: 10
  def wxSTC_SN_PREPROCESSOR, do: 9
  def wxSTC_SN_WORD3, do: 8
  def wxSTC_SN_WORD2, do: 7
  def wxSTC_SN_STRING, do: 6
  def wxSTC_SN_WORD, do: 5
  def wxSTC_SN_NUMBER, do: 4
  def wxSTC_SN_COMMENTLINEBANG, do: 3
  def wxSTC_SN_COMMENTLINE, do: 2
  def wxSTC_SN_CODE, do: 1
  def wxSTC_SN_DEFAULT, do: 0
  def wxSTC_GC_OPERATOR, do: 9
  def wxSTC_GC_STRING, do: 8
  def wxSTC_GC_COMMAND, do: 7
  def wxSTC_GC_CONTROL, do: 6
  def wxSTC_GC_ATTRIBUTE, do: 5
  def wxSTC_GC_EVENT, do: 4
  def wxSTC_GC_GLOBAL, do: 3
  def wxSTC_GC_COMMENTBLOCK, do: 2
  def wxSTC_GC_COMMENTLINE, do: 1
  def wxSTC_GC_DEFAULT, do: 0
  def wxSTC_KIX_IDENTIFIER, do: 31
  def wxSTC_KIX_OPERATOR, do: 9
  def wxSTC_KIX_FUNCTIONS, do: 8
  def wxSTC_KIX_KEYWORD, do: 7
  def wxSTC_KIX_MACRO, do: 6
  def wxSTC_KIX_VAR, do: 5
  def wxSTC_KIX_NUMBER, do: 4
  def wxSTC_KIX_STRING2, do: 3
  def wxSTC_KIX_STRING1, do: 2
  def wxSTC_KIX_COMMENT, do: 1
  def wxSTC_KIX_DEFAULT, do: 0
  def wxSTC_V_USER, do: 19
  def wxSTC_V_STRINGEOL, do: 12
  def wxSTC_V_IDENTIFIER, do: 11
  def wxSTC_V_OPERATOR, do: 10
  def wxSTC_V_PREPROCESSOR, do: 9
  def wxSTC_V_WORD3, do: 8
  def wxSTC_V_WORD2, do: 7
  def wxSTC_V_STRING, do: 6
  def wxSTC_V_WORD, do: 5
  def wxSTC_V_NUMBER, do: 4
  def wxSTC_V_COMMENTLINEBANG, do: 3
  def wxSTC_V_COMMENTLINE, do: 2
  def wxSTC_V_COMMENT, do: 1
  def wxSTC_V_DEFAULT, do: 0
  def wxSTC_MSSQL_COLUMN_NAME_2, do: 16
  def wxSTC_MSSQL_DEFAULT_PREF_DATATYPE, do: 15
  def wxSTC_MSSQL_STORED_PROCEDURE, do: 14
  def wxSTC_MSSQL_FUNCTION, do: 13
  def wxSTC_MSSQL_GLOBAL_VARIABLE, do: 12
  def wxSTC_MSSQL_SYSTABLE, do: 11
  def wxSTC_MSSQL_DATATYPE, do: 10
  def wxSTC_MSSQL_STATEMENT, do: 9
  def wxSTC_MSSQL_COLUMN_NAME, do: 8
  def wxSTC_MSSQL_VARIABLE, do: 7
  def wxSTC_MSSQL_IDENTIFIER, do: 6
  def wxSTC_MSSQL_OPERATOR, do: 5
  def wxSTC_MSSQL_STRING, do: 4
  def wxSTC_MSSQL_NUMBER, do: 3
  def wxSTC_MSSQL_LINE_COMMENT, do: 2
  def wxSTC_MSSQL_COMMENT, do: 1
  def wxSTC_MSSQL_DEFAULT, do: 0
  def wxSTC_ERLANG_UNKNOWN, do: 31
  def wxSTC_ERLANG_NODE_NAME, do: 13
  def wxSTC_ERLANG_SEPARATOR, do: 12
  def wxSTC_ERLANG_RECORD, do: 11
  def wxSTC_ERLANG_MACRO, do: 10
  def wxSTC_ERLANG_CHARACTER, do: 9
  def wxSTC_ERLANG_FUNCTION_NAME, do: 8
  def wxSTC_ERLANG_ATOM, do: 7
  def wxSTC_ERLANG_OPERATOR, do: 6
  def wxSTC_ERLANG_STRING, do: 5
  def wxSTC_ERLANG_KEYWORD, do: 4
  def wxSTC_ERLANG_NUMBER, do: 3
  def wxSTC_ERLANG_VARIABLE, do: 2
  def wxSTC_ERLANG_COMMENT, do: 1
  def wxSTC_ERLANG_DEFAULT, do: 0
  def wxSTC_METAPOST_EXTRA, do: 6
  def wxSTC_METAPOST_TEXT, do: 5
  def wxSTC_METAPOST_COMMAND, do: 4
  def wxSTC_METAPOST_SYMBOL, do: 3
  def wxSTC_METAPOST_GROUP, do: 2
  def wxSTC_METAPOST_SPECIAL, do: 1
  def wxSTC_METAPOST_DEFAULT, do: 0
  def wxSTC_TEX_TEXT, do: 5
  def wxSTC_TEX_COMMAND, do: 4
  def wxSTC_TEX_SYMBOL, do: 3
  def wxSTC_TEX_GROUP, do: 2
  def wxSTC_TEX_SPECIAL, do: 1
  def wxSTC_TEX_DEFAULT, do: 0
  def wxSTC_YAML_ERROR, do: 8
  def wxSTC_YAML_TEXT, do: 7
  def wxSTC_YAML_DOCUMENT, do: 6
  def wxSTC_YAML_REFERENCE, do: 5
  def wxSTC_YAML_NUMBER, do: 4
  def wxSTC_YAML_KEYWORD, do: 3
  def wxSTC_YAML_IDENTIFIER, do: 2
  def wxSTC_YAML_COMMENT, do: 1
  def wxSTC_YAML_DEFAULT, do: 0
  def wxSTC_LOT_ABORT, do: 6
  def wxSTC_LOT_FAIL, do: 5
  def wxSTC_LOT_PASS, do: 4
  def wxSTC_LOT_SET, do: 3
  def wxSTC_LOT_BREAK, do: 2
  def wxSTC_LOT_HEADER, do: 1
  def wxSTC_LOT_DEFAULT, do: 0
  def wxSTC_CLW_DEPRECATED, do: 16
  def wxSTC_CLW_ERROR, do: 15
  def wxSTC_CLW_STANDARD_EQUATE, do: 14
  def wxSTC_CLW_ATTRIBUTE, do: 13
  def wxSTC_CLW_STRUCTURE_DATA_TYPE, do: 12
  def wxSTC_CLW_BUILTIN_PROCEDURES_FUNCTION, do: 11
  def wxSTC_CLW_RUNTIME_EXPRESSIONS, do: 10
  def wxSTC_CLW_COMPILER_DIRECTIVE, do: 9
  def wxSTC_CLW_KEYWORD, do: 8
  def wxSTC_CLW_PICTURE_STRING, do: 7
  def wxSTC_CLW_REAL_CONSTANT, do: 6
  def wxSTC_CLW_INTEGER_CONSTANT, do: 5
  def wxSTC_CLW_USER_IDENTIFIER, do: 4
  def wxSTC_CLW_STRING, do: 3
  def wxSTC_CLW_COMMENT, do: 2
  def wxSTC_CLW_LABEL, do: 1
  def wxSTC_CLW_DEFAULT, do: 0
  def wxSTC_MMIXAL_INCLUDE, do: 17
  def wxSTC_MMIXAL_SYMBOL, do: 16
  def wxSTC_MMIXAL_OPERATOR, do: 15
  def wxSTC_MMIXAL_HEX, do: 14
  def wxSTC_MMIXAL_REGISTER, do: 13
  def wxSTC_MMIXAL_STRING, do: 12
  def wxSTC_MMIXAL_CHAR, do: 11
  def wxSTC_MMIXAL_REF, do: 10
  def wxSTC_MMIXAL_NUMBER, do: 9
  def wxSTC_MMIXAL_OPERANDS, do: 8
  def wxSTC_MMIXAL_OPCODE_POST, do: 7
  def wxSTC_MMIXAL_OPCODE_UNKNOWN, do: 6
  def wxSTC_MMIXAL_OPCODE_VALID, do: 5
  def wxSTC_MMIXAL_OPCODE_PRE, do: 4
  def wxSTC_MMIXAL_OPCODE, do: 3
  def wxSTC_MMIXAL_LABEL, do: 2
  def wxSTC_MMIXAL_COMMENT, do: 1
  def wxSTC_MMIXAL_LEADWS, do: 0
  def wxSTC_NSIS_COMMENTBOX, do: 18
  def wxSTC_NSIS_FUNCTIONDEF, do: 17
  def wxSTC_NSIS_PAGEEX, do: 16
  def wxSTC_NSIS_SECTIONGROUP, do: 15
  def wxSTC_NSIS_NUMBER, do: 14
  def wxSTC_NSIS_STRINGVAR, do: 13
  def wxSTC_NSIS_MACRODEF, do: 12
  def wxSTC_NSIS_IFDEFINEDEF, do: 11
  def wxSTC_NSIS_SUBSECTIONDEF, do: 10
  def wxSTC_NSIS_SECTIONDEF, do: 9
  def wxSTC_NSIS_USERDEFINED, do: 8
  def wxSTC_NSIS_LABEL, do: 7
  def wxSTC_NSIS_VARIABLE, do: 6
  def wxSTC_NSIS_FUNCTION, do: 5
  def wxSTC_NSIS_STRINGRQ, do: 4
  def wxSTC_NSIS_STRINGLQ, do: 3
  def wxSTC_NSIS_STRINGDQ, do: 2
  def wxSTC_NSIS_COMMENT, do: 1
  def wxSTC_NSIS_DEFAULT, do: 0
  def wxSTC_PS_BADSTRINGCHAR, do: 15
  def wxSTC_PS_BASE85STRING, do: 14
  def wxSTC_PS_HEXSTRING, do: 13
  def wxSTC_PS_TEXT, do: 12
  def wxSTC_PS_PAREN_PROC, do: 11
  def wxSTC_PS_PAREN_DICT, do: 10
  def wxSTC_PS_PAREN_ARRAY, do: 9
  def wxSTC_PS_IMMEVAL, do: 8
  def wxSTC_PS_LITERAL, do: 7
  def wxSTC_PS_KEYWORD, do: 6
  def wxSTC_PS_NAME, do: 5
  def wxSTC_PS_NUMBER, do: 4
  def wxSTC_PS_DSC_VALUE, do: 3
  def wxSTC_PS_DSC_COMMENT, do: 2
  def wxSTC_PS_COMMENT, do: 1
  def wxSTC_PS_DEFAULT, do: 0
  def wxSTC_ESCRIPT_WORD3, do: 11
  def wxSTC_ESCRIPT_WORD2, do: 10
  def wxSTC_ESCRIPT_BRACE, do: 9
  def wxSTC_ESCRIPT_IDENTIFIER, do: 8
  def wxSTC_ESCRIPT_OPERATOR, do: 7
  def wxSTC_ESCRIPT_STRING, do: 6
  def wxSTC_ESCRIPT_WORD, do: 5
  def wxSTC_ESCRIPT_NUMBER, do: 4
  def wxSTC_ESCRIPT_COMMENTDOC, do: 3
  def wxSTC_ESCRIPT_COMMENTLINE, do: 2
  def wxSTC_ESCRIPT_COMMENT, do: 1
  def wxSTC_ESCRIPT_DEFAULT, do: 0
  def wxSTC_LOUT_STRINGEOL, do: 10
  def wxSTC_LOUT_IDENTIFIER, do: 9
  def wxSTC_LOUT_OPERATOR, do: 8
  def wxSTC_LOUT_STRING, do: 7
  def wxSTC_LOUT_WORD4, do: 6
  def wxSTC_LOUT_WORD3, do: 5
  def wxSTC_LOUT_WORD2, do: 4
  def wxSTC_LOUT_WORD, do: 3
  def wxSTC_LOUT_NUMBER, do: 2
  def wxSTC_LOUT_COMMENT, do: 1
  def wxSTC_LOUT_DEFAULT, do: 0
  def wxSTC_POV_WORD8, do: 16
  def wxSTC_POV_WORD7, do: 15
  def wxSTC_POV_WORD6, do: 14
  def wxSTC_POV_WORD5, do: 13
  def wxSTC_POV_WORD4, do: 12
  def wxSTC_POV_WORD3, do: 11
  def wxSTC_POV_WORD2, do: 10
  def wxSTC_POV_BADDIRECTIVE, do: 9
  def wxSTC_POV_DIRECTIVE, do: 8
  def wxSTC_POV_STRINGEOL, do: 7
  def wxSTC_POV_STRING, do: 6
  def wxSTC_POV_IDENTIFIER, do: 5
  def wxSTC_POV_OPERATOR, do: 4
  def wxSTC_POV_NUMBER, do: 3
  def wxSTC_POV_COMMENTLINE, do: 2
  def wxSTC_POV_COMMENT, do: 1
  def wxSTC_POV_DEFAULT, do: 0
  def wxSTC_CSS_ATTRIBUTE, do: 16
  def wxSTC_CSS_IDENTIFIER2, do: 15
  def wxSTC_CSS_SINGLESTRING, do: 14
  def wxSTC_CSS_DOUBLESTRING, do: 13
  def wxSTC_CSS_DIRECTIVE, do: 12
  def wxSTC_CSS_IMPORTANT, do: 11
  def wxSTC_CSS_ID, do: 10
  def wxSTC_CSS_COMMENT, do: 9
  def wxSTC_CSS_VALUE, do: 8
  def wxSTC_CSS_UNKNOWN_IDENTIFIER, do: 7
  def wxSTC_CSS_IDENTIFIER, do: 6
  def wxSTC_CSS_OPERATOR, do: 5
  def wxSTC_CSS_UNKNOWN_PSEUDOCLASS, do: 4
  def wxSTC_CSS_PSEUDOCLASS, do: 3
  def wxSTC_CSS_CLASS, do: 2
  def wxSTC_CSS_TAG, do: 1
  def wxSTC_CSS_DEFAULT, do: 0
  def wxSTC_F_CONTINUATION, do: 14
  def wxSTC_F_LABEL, do: 13
  def wxSTC_F_OPERATOR2, do: 12
  def wxSTC_F_PREPROCESSOR, do: 11
  def wxSTC_F_WORD3, do: 10
  def wxSTC_F_WORD2, do: 9
  def wxSTC_F_WORD, do: 8
  def wxSTC_F_IDENTIFIER, do: 7
  def wxSTC_F_OPERATOR, do: 6
  def wxSTC_F_STRINGEOL, do: 5
  def wxSTC_F_STRING2, do: 4
  def wxSTC_F_STRING1, do: 3
  def wxSTC_F_NUMBER, do: 2
  def wxSTC_F_COMMENT, do: 1
  def wxSTC_F_DEFAULT, do: 0
  def wxSTC_ASM_EXTINSTRUCTION, do: 14
  def wxSTC_ASM_STRINGEOL, do: 13
  def wxSTC_ASM_CHARACTER, do: 12
  def wxSTC_ASM_COMMENTBLOCK, do: 11
  def wxSTC_ASM_DIRECTIVEOPERAND, do: 10
  def wxSTC_ASM_DIRECTIVE, do: 9
  def wxSTC_ASM_REGISTER, do: 8
  def wxSTC_ASM_MATHINSTRUCTION, do: 7
  def wxSTC_ASM_CPUINSTRUCTION, do: 6
  def wxSTC_ASM_IDENTIFIER, do: 5
  def wxSTC_ASM_OPERATOR, do: 4
  def wxSTC_ASM_STRING, do: 3
  def wxSTC_ASM_NUMBER, do: 2
  def wxSTC_ASM_COMMENT, do: 1
  def wxSTC_ASM_DEFAULT, do: 0
  def wxSTC_SCRIPTOL_PREPROCESSOR, do: 15
  def wxSTC_SCRIPTOL_CLASSNAME, do: 14
  def wxSTC_SCRIPTOL_TRIPLE, do: 13
  def wxSTC_SCRIPTOL_IDENTIFIER, do: 12
  def wxSTC_SCRIPTOL_OPERATOR, do: 11
  def wxSTC_SCRIPTOL_KEYWORD, do: 10
  def wxSTC_SCRIPTOL_STRINGEOL, do: 9
  def wxSTC_SCRIPTOL_CHARACTER, do: 8
  def wxSTC_SCRIPTOL_STRING, do: 7
  def wxSTC_SCRIPTOL_NUMBER, do: 6
  def wxSTC_SCRIPTOL_COMMENTBLOCK, do: 5
  def wxSTC_SCRIPTOL_CSTYLE, do: 4
  def wxSTC_SCRIPTOL_PERSISTENT, do: 3
  def wxSTC_SCRIPTOL_COMMENTLINE, do: 2
  def wxSTC_SCRIPTOL_WHITE, do: 1
  def wxSTC_SCRIPTOL_DEFAULT, do: 0
  def wxSTC_MATLAB_DOUBLEQUOTESTRING, do: 8
  def wxSTC_MATLAB_IDENTIFIER, do: 7
  def wxSTC_MATLAB_OPERATOR, do: 6
  def wxSTC_MATLAB_STRING, do: 5
  def wxSTC_MATLAB_KEYWORD, do: 4
  def wxSTC_MATLAB_NUMBER, do: 3
  def wxSTC_MATLAB_COMMAND, do: 2
  def wxSTC_MATLAB_COMMENT, do: 1
  def wxSTC_MATLAB_DEFAULT, do: 0
  def wxSTC_FORTH_LOCALE, do: 11
  def wxSTC_FORTH_STRING, do: 10
  def wxSTC_FORTH_NUMBER, do: 9
  def wxSTC_FORTH_PREWORD2, do: 8
  def wxSTC_FORTH_PREWORD1, do: 7
  def wxSTC_FORTH_DEFWORD, do: 6
  def wxSTC_FORTH_KEYWORD, do: 5
  def wxSTC_FORTH_CONTROL, do: 4
  def wxSTC_FORTH_IDENTIFIER, do: 3
  def wxSTC_FORTH_COMMENT_ML, do: 2
  def wxSTC_FORTH_COMMENT, do: 1
  def wxSTC_FORTH_DEFAULT, do: 0
  def wxSTC_NNCRONTAB_IDENTIFIER, do: 10
  def wxSTC_NNCRONTAB_ENVIRONMENT, do: 9
  def wxSTC_NNCRONTAB_STRING, do: 8
  def wxSTC_NNCRONTAB_NUMBER, do: 7
  def wxSTC_NNCRONTAB_ASTERISK, do: 6
  def wxSTC_NNCRONTAB_MODIFIER, do: 5
  def wxSTC_NNCRONTAB_KEYWORD, do: 4
  def wxSTC_NNCRONTAB_SECTION, do: 3
  def wxSTC_NNCRONTAB_TASK, do: 2
  def wxSTC_NNCRONTAB_COMMENT, do: 1
  def wxSTC_NNCRONTAB_DEFAULT, do: 0
  def wxSTC_EIFFEL_STRINGEOL, do: 8
  def wxSTC_EIFFEL_IDENTIFIER, do: 7
  def wxSTC_EIFFEL_OPERATOR, do: 6
  def wxSTC_EIFFEL_CHARACTER, do: 5
  def wxSTC_EIFFEL_STRING, do: 4
  def wxSTC_EIFFEL_WORD, do: 3
  def wxSTC_EIFFEL_NUMBER, do: 2
  def wxSTC_EIFFEL_COMMENTLINE, do: 1
  def wxSTC_EIFFEL_DEFAULT, do: 0
  def wxSTC_LISP_MULTI_COMMENT, do: 12
  def wxSTC_LISP_SPECIAL, do: 11
  def wxSTC_LISP_OPERATOR, do: 10
  def wxSTC_LISP_IDENTIFIER, do: 9
  def wxSTC_LISP_STRINGEOL, do: 8
  def wxSTC_LISP_STRING, do: 6
  def wxSTC_LISP_SYMBOL, do: 5
  def wxSTC_LISP_KEYWORD_KW, do: 4
  def wxSTC_LISP_KEYWORD, do: 3
  def wxSTC_LISP_NUMBER, do: 2
  def wxSTC_LISP_COMMENT, do: 1
  def wxSTC_LISP_DEFAULT, do: 0
  def wxSTC_BAAN_WORD2, do: 10
  def wxSTC_BAAN_STRINGEOL, do: 9
  def wxSTC_BAAN_IDENTIFIER, do: 8
  def wxSTC_BAAN_OPERATOR, do: 7
  def wxSTC_BAAN_PREPROCESSOR, do: 6
  def wxSTC_BAAN_STRING, do: 5
  def wxSTC_BAAN_WORD, do: 4
  def wxSTC_BAAN_NUMBER, do: 3
  def wxSTC_BAAN_COMMENTDOC, do: 2
  def wxSTC_BAAN_COMMENT, do: 1
  def wxSTC_BAAN_DEFAULT, do: 0
  def wxSTC_ADA_ILLEGAL, do: 11
  def wxSTC_ADA_COMMENTLINE, do: 10
  def wxSTC_ADA_LABEL, do: 9
  def wxSTC_ADA_STRINGEOL, do: 8
  def wxSTC_ADA_STRING, do: 7
  def wxSTC_ADA_CHARACTEREOL, do: 6
  def wxSTC_ADA_CHARACTER, do: 5
  def wxSTC_ADA_DELIMITER, do: 4
  def wxSTC_ADA_NUMBER, do: 3
  def wxSTC_ADA_IDENTIFIER, do: 2
  def wxSTC_ADA_WORD, do: 1
  def wxSTC_ADA_DEFAULT, do: 0
  def wxSTC_AVE_WORD6, do: 16
  def wxSTC_AVE_WORD5, do: 15
  def wxSTC_AVE_WORD4, do: 14
  def wxSTC_AVE_WORD3, do: 13
  def wxSTC_AVE_WORD2, do: 12
  def wxSTC_AVE_WORD1, do: 11
  def wxSTC_AVE_OPERATOR, do: 10
  def wxSTC_AVE_IDENTIFIER, do: 9
  def wxSTC_AVE_STRINGEOL, do: 8
  def wxSTC_AVE_ENUM, do: 7
  def wxSTC_AVE_STRING, do: 6
  def wxSTC_AVE_WORD, do: 3
  def wxSTC_AVE_NUMBER, do: 2
  def wxSTC_AVE_COMMENT, do: 1
  def wxSTC_AVE_DEFAULT, do: 0
  def wxSTC_CONF_DIRECTIVE, do: 9
  def wxSTC_CONF_IP, do: 8
  def wxSTC_CONF_OPERATOR, do: 7
  def wxSTC_CONF_STRING, do: 6
  def wxSTC_CONF_PARAMETER, do: 5
  def wxSTC_CONF_EXTENSION, do: 4
  def wxSTC_CONF_IDENTIFIER, do: 3
  def wxSTC_CONF_NUMBER, do: 2
  def wxSTC_CONF_COMMENT, do: 1
  def wxSTC_CONF_DEFAULT, do: 0
  def wxSTC_DIFF_ADDED, do: 6
  def wxSTC_DIFF_DELETED, do: 5
  def wxSTC_DIFF_POSITION, do: 4
  def wxSTC_DIFF_HEADER, do: 3
  def wxSTC_DIFF_COMMAND, do: 2
  def wxSTC_DIFF_COMMENT, do: 1
  def wxSTC_DIFF_DEFAULT, do: 0
  def wxSTC_MAKE_IDEOL, do: 9
  def wxSTC_MAKE_TARGET, do: 5
  def wxSTC_MAKE_OPERATOR, do: 4
  def wxSTC_MAKE_IDENTIFIER, do: 3
  def wxSTC_MAKE_PREPROCESSOR, do: 2
  def wxSTC_MAKE_COMMENT, do: 1
  def wxSTC_MAKE_DEFAULT, do: 0
  def wxSTC_BAT_OPERATOR, do: 7
  def wxSTC_BAT_IDENTIFIER, do: 6
  def wxSTC_BAT_COMMAND, do: 5
  def wxSTC_BAT_HIDE, do: 4
  def wxSTC_BAT_LABEL, do: 3
  def wxSTC_BAT_WORD, do: 2
  def wxSTC_BAT_COMMENT, do: 1
  def wxSTC_BAT_DEFAULT, do: 0
  def wxSTC_ERR_JAVA_STACK, do: 20
  def wxSTC_ERR_TIDY, do: 19
  def wxSTC_ERR_ABSF, do: 18
  def wxSTC_ERR_IFORT, do: 17
  def wxSTC_ERR_IFC, do: 16
  def wxSTC_ERR_ELF, do: 15
  def wxSTC_ERR_PHP, do: 14
  def wxSTC_ERR_DIFF_MESSAGE, do: 13
  def wxSTC_ERR_DIFF_DELETION, do: 12
  def wxSTC_ERR_DIFF_ADDITION, do: 11
  def wxSTC_ERR_DIFF_CHANGED, do: 10
  def wxSTC_ERR_CTAG, do: 9
  def wxSTC_ERR_LUA, do: 8
  def wxSTC_ERR_NET, do: 7
  def wxSTC_ERR_PERL, do: 6
  def wxSTC_ERR_BORLAND, do: 5
  def wxSTC_ERR_CMD, do: 4
  def wxSTC_ERR_MS, do: 3
  def wxSTC_ERR_GCC, do: 2
  def wxSTC_ERR_PYTHON, do: 1
  def wxSTC_ERR_DEFAULT, do: 0
  def wxSTC_LUA_WORD8, do: 19
  def wxSTC_LUA_WORD7, do: 18
  def wxSTC_LUA_WORD6, do: 17
  def wxSTC_LUA_WORD5, do: 16
  def wxSTC_LUA_WORD4, do: 15
  def wxSTC_LUA_WORD3, do: 14
  def wxSTC_LUA_WORD2, do: 13
  def wxSTC_LUA_STRINGEOL, do: 12
  def wxSTC_LUA_IDENTIFIER, do: 11
  def wxSTC_LUA_OPERATOR, do: 10
  def wxSTC_LUA_PREPROCESSOR, do: 9
  def wxSTC_LUA_LITERALSTRING, do: 8
  def wxSTC_LUA_CHARACTER, do: 7
  def wxSTC_LUA_STRING, do: 6
  def wxSTC_LUA_WORD, do: 5
  def wxSTC_LUA_NUMBER, do: 4
  def wxSTC_LUA_COMMENTDOC, do: 3
  def wxSTC_LUA_COMMENTLINE, do: 2
  def wxSTC_LUA_COMMENT, do: 1
  def wxSTC_LUA_DEFAULT, do: 0
  def wxSTC_L_COMMENT, do: 4
  def wxSTC_L_MATH, do: 3
  def wxSTC_L_TAG, do: 2
  def wxSTC_L_COMMAND, do: 1
  def wxSTC_L_DEFAULT, do: 0
  def wxSTC_PROPS_KEY, do: 5
  def wxSTC_PROPS_DEFVAL, do: 4
  def wxSTC_PROPS_ASSIGNMENT, do: 3
  def wxSTC_PROPS_SECTION, do: 2
  def wxSTC_PROPS_COMMENT, do: 1
  def wxSTC_PROPS_DEFAULT, do: 0
  def wxSTC_B_BINNUMBER, do: 18
  def wxSTC_B_HEXNUMBER, do: 17
  def wxSTC_B_ERROR, do: 16
  def wxSTC_B_LABEL, do: 15
  def wxSTC_B_ASM, do: 14
  def wxSTC_B_CONSTANT, do: 13
  def wxSTC_B_KEYWORD4, do: 12
  def wxSTC_B_KEYWORD3, do: 11
  def wxSTC_B_KEYWORD2, do: 10
  def wxSTC_B_STRINGEOL, do: 9
  def wxSTC_B_DATE, do: 8
  def wxSTC_B_IDENTIFIER, do: 7
  def wxSTC_B_OPERATOR, do: 6
  def wxSTC_B_PREPROCESSOR, do: 5
  def wxSTC_B_STRING, do: 4
  def wxSTC_B_KEYWORD, do: 3
  def wxSTC_B_NUMBER, do: 2
  def wxSTC_B_COMMENT, do: 1
  def wxSTC_B_DEFAULT, do: 0
  def wxSTC_RB_UPPER_BOUND, do: 41
  def wxSTC_RB_STDERR, do: 40
  def wxSTC_RB_STDOUT, do: 31
  def wxSTC_RB_STDIN, do: 30
  def wxSTC_RB_WORD_DEMOTED, do: 29
  def wxSTC_RB_STRING_QW, do: 28
  def wxSTC_RB_STRING_QR, do: 27
  def wxSTC_RB_STRING_QX, do: 26
  def wxSTC_RB_STRING_QQ, do: 25
  def wxSTC_RB_STRING_Q, do: 24
  def wxSTC_RB_HERE_QX, do: 23
  def wxSTC_RB_HERE_QQ, do: 22
  def wxSTC_RB_HERE_Q, do: 21
  def wxSTC_RB_HERE_DELIM, do: 20
  def wxSTC_RB_DATASECTION, do: 19
  def wxSTC_RB_BACKTICKS, do: 18
  def wxSTC_RB_CLASS_VAR, do: 17
  def wxSTC_RB_INSTANCE_VAR, do: 16
  def wxSTC_RB_MODULE_NAME, do: 15
  def wxSTC_RB_SYMBOL, do: 14
  def wxSTC_RB_GLOBAL, do: 13
  def wxSTC_RB_REGEX, do: 12
  def wxSTC_RB_IDENTIFIER, do: 11
  def wxSTC_RB_OPERATOR, do: 10
  def wxSTC_RB_DEFNAME, do: 9
  def wxSTC_RB_CLASSNAME, do: 8
  def wxSTC_RB_CHARACTER, do: 7
  def wxSTC_RB_STRING, do: 6
  def wxSTC_RB_WORD, do: 5
  def wxSTC_RB_NUMBER, do: 4
  def wxSTC_RB_POD, do: 3
  def wxSTC_RB_COMMENTLINE, do: 2
  def wxSTC_RB_ERROR, do: 1
  def wxSTC_RB_DEFAULT, do: 0
  def wxSTC_PL_POD_VERB, do: 31
  def wxSTC_PL_STRING_QW, do: 30
  def wxSTC_PL_STRING_QR, do: 29
  def wxSTC_PL_STRING_QX, do: 28
  def wxSTC_PL_STRING_QQ, do: 27
  def wxSTC_PL_STRING_Q, do: 26
  def wxSTC_PL_HERE_QX, do: 25
  def wxSTC_PL_HERE_QQ, do: 24
  def wxSTC_PL_HERE_Q, do: 23
  def wxSTC_PL_HERE_DELIM, do: 22
  def wxSTC_PL_DATASECTION, do: 21
  def wxSTC_PL_BACKTICKS, do: 20
  def wxSTC_PL_LONGQUOTE, do: 19
  def wxSTC_PL_REGSUBST, do: 18
  def wxSTC_PL_REGEX, do: 17
  def wxSTC_PL_VARIABLE_INDEXER, do: 16
  def wxSTC_PL_SYMBOLTABLE, do: 15
  def wxSTC_PL_HASH, do: 14
  def wxSTC_PL_ARRAY, do: 13
  def wxSTC_PL_SCALAR, do: 12
  def wxSTC_PL_IDENTIFIER, do: 11
  def wxSTC_PL_OPERATOR, do: 10
  def wxSTC_PL_PREPROCESSOR, do: 9
  def wxSTC_PL_PUNCTUATION, do: 8
  def wxSTC_PL_CHARACTER, do: 7
  def wxSTC_PL_STRING, do: 6
  def wxSTC_PL_WORD, do: 5
  def wxSTC_PL_NUMBER, do: 4
  def wxSTC_PL_POD, do: 3
  def wxSTC_PL_COMMENTLINE, do: 2
  def wxSTC_PL_ERROR, do: 1
  def wxSTC_PL_DEFAULT, do: 0
  def wxSTC_HPHP_OPERATOR, do: 127
  def wxSTC_HPHP_HSTRING_VARIABLE, do: 126
  def wxSTC_HPHP_COMMENTLINE, do: 125
  def wxSTC_HPHP_COMMENT, do: 124
  def wxSTC_HPHP_VARIABLE, do: 123
  def wxSTC_HPHP_NUMBER, do: 122
  def wxSTC_HPHP_WORD, do: 121
  def wxSTC_HPHP_SIMPLESTRING, do: 120
  def wxSTC_HPHP_HSTRING, do: 119
  def wxSTC_HPHP_DEFAULT, do: 118
  def wxSTC_HPA_IDENTIFIER, do: 117
  def wxSTC_HPA_OPERATOR, do: 116
  def wxSTC_HPA_DEFNAME, do: 115
  def wxSTC_HPA_CLASSNAME, do: 114
  def wxSTC_HPA_TRIPLEDOUBLE, do: 113
  def wxSTC_HPA_TRIPLE, do: 112
  def wxSTC_HPA_WORD, do: 111
  def wxSTC_HPA_CHARACTER, do: 110
  def wxSTC_HPA_STRING, do: 109
  def wxSTC_HPA_NUMBER, do: 108
  def wxSTC_HPA_COMMENTLINE, do: 107
  def wxSTC_HPA_DEFAULT, do: 106
  def wxSTC_HPA_START, do: 105
  def wxSTC_HPHP_COMPLEX_VARIABLE, do: 104
  def wxSTC_HP_IDENTIFIER, do: 102
  def wxSTC_HP_OPERATOR, do: 101
  def wxSTC_HP_DEFNAME, do: 100
  def wxSTC_HP_CLASSNAME, do: 99
  def wxSTC_HP_TRIPLEDOUBLE, do: 98
  def wxSTC_HP_TRIPLE, do: 97
  def wxSTC_HP_WORD, do: 96
  def wxSTC_HP_CHARACTER, do: 95
  def wxSTC_HP_STRING, do: 94
  def wxSTC_HP_NUMBER, do: 93
  def wxSTC_HP_COMMENTLINE, do: 92
  def wxSTC_HP_DEFAULT, do: 91
  def wxSTC_HP_START, do: 90
  def wxSTC_HBA_STRINGEOL, do: 87
  def wxSTC_HBA_IDENTIFIER, do: 86
  def wxSTC_HBA_STRING, do: 85
  def wxSTC_HBA_WORD, do: 84
  def wxSTC_HBA_NUMBER, do: 83
  def wxSTC_HBA_COMMENTLINE, do: 82
  def wxSTC_HBA_DEFAULT, do: 81
  def wxSTC_HBA_START, do: 80
  def wxSTC_HB_STRINGEOL, do: 77
  def wxSTC_HB_IDENTIFIER, do: 76
  def wxSTC_HB_STRING, do: 75
  def wxSTC_HB_WORD, do: 74
  def wxSTC_HB_NUMBER, do: 73
  def wxSTC_HB_COMMENTLINE, do: 72
  def wxSTC_HB_DEFAULT, do: 71
  def wxSTC_HB_START, do: 70
  def wxSTC_HJA_REGEX, do: 67
  def wxSTC_HJA_STRINGEOL, do: 66
  def wxSTC_HJA_SYMBOLS, do: 65
  def wxSTC_HJA_SINGLESTRING, do: 64
  def wxSTC_HJA_DOUBLESTRING, do: 63
  def wxSTC_HJA_KEYWORD, do: 62
  def wxSTC_HJA_WORD, do: 61
  def wxSTC_HJA_NUMBER, do: 60
  def wxSTC_HJA_COMMENTDOC, do: 59
  def wxSTC_HJA_COMMENTLINE, do: 58
  def wxSTC_HJA_COMMENT, do: 57
  def wxSTC_HJA_DEFAULT, do: 56
  def wxSTC_HJA_START, do: 55
  def wxSTC_HJ_REGEX, do: 52
  def wxSTC_HJ_STRINGEOL, do: 51
  def wxSTC_HJ_SYMBOLS, do: 50
  def wxSTC_HJ_SINGLESTRING, do: 49
  def wxSTC_HJ_DOUBLESTRING, do: 48
  def wxSTC_HJ_KEYWORD, do: 47
  def wxSTC_HJ_WORD, do: 46
  def wxSTC_HJ_NUMBER, do: 45
  def wxSTC_HJ_COMMENTDOC, do: 44
  def wxSTC_HJ_COMMENTLINE, do: 43
  def wxSTC_HJ_COMMENT, do: 42
  def wxSTC_HJ_DEFAULT, do: 41
  def wxSTC_HJ_START, do: 40
  def wxSTC_H_SGML_BLOCK_DEFAULT, do: 31
  def wxSTC_H_SGML_1ST_PARAM_COMMENT, do: 30
  def wxSTC_H_SGML_COMMENT, do: 29
  def wxSTC_H_SGML_ENTITY, do: 28
  def wxSTC_H_SGML_SPECIAL, do: 27
  def wxSTC_H_SGML_ERROR, do: 26
  def wxSTC_H_SGML_SIMPLESTRING, do: 25
  def wxSTC_H_SGML_DOUBLESTRING, do: 24
  def wxSTC_H_SGML_1ST_PARAM, do: 23
  def wxSTC_H_SGML_COMMAND, do: 22
  def wxSTC_H_SGML_DEFAULT, do: 21
  def wxSTC_H_XCCOMMENT, do: 20
  def wxSTC_H_VALUE, do: 19
  def wxSTC_H_QUESTION, do: 18
  def wxSTC_H_CDATA, do: 17
  def wxSTC_H_ASPAT, do: 16
  def wxSTC_H_ASP, do: 15
  def wxSTC_H_SCRIPT, do: 14
  def wxSTC_H_XMLEND, do: 13
  def wxSTC_H_XMLSTART, do: 12
  def wxSTC_H_TAGEND, do: 11
  def wxSTC_H_ENTITY, do: 10
  def wxSTC_H_COMMENT, do: 9
  def wxSTC_H_OTHER, do: 8
  def wxSTC_H_SINGLESTRING, do: 7
  def wxSTC_H_DOUBLESTRING, do: 6
  def wxSTC_H_NUMBER, do: 5
  def wxSTC_H_ATTRIBUTEUNKNOWN, do: 4
  def wxSTC_H_ATTRIBUTE, do: 3
  def wxSTC_H_TAGUNKNOWN, do: 2
  def wxSTC_H_TAG, do: 1
  def wxSTC_H_DEFAULT, do: 0
  def wxSTC_TCL_BLOCK_COMMENT, do: 21
  def wxSTC_TCL_COMMENT_BOX, do: 20
  def wxSTC_TCL_WORD8, do: 19
  def wxSTC_TCL_WORD7, do: 18
  def wxSTC_TCL_WORD6, do: 17
  def wxSTC_TCL_WORD5, do: 16
  def wxSTC_TCL_WORD4, do: 15
  def wxSTC_TCL_WORD3, do: 14
  def wxSTC_TCL_WORD2, do: 13
  def wxSTC_TCL_WORD, do: 12
  def wxSTC_TCL_EXPAND, do: 11
  def wxSTC_TCL_MODIFIER, do: 10
  def wxSTC_TCL_SUB_BRACE, do: 9
  def wxSTC_TCL_SUBSTITUTION, do: 8
  def wxSTC_TCL_IDENTIFIER, do: 7
  def wxSTC_TCL_OPERATOR, do: 6
  def wxSTC_TCL_IN_QUOTE, do: 5
  def wxSTC_TCL_WORD_IN_QUOTE, do: 4
  def wxSTC_TCL_NUMBER, do: 3
  def wxSTC_TCL_COMMENTLINE, do: 2
  def wxSTC_TCL_COMMENT, do: 1
  def wxSTC_TCL_DEFAULT, do: 0
  def wxSTC_C_GLOBALCLASS, do: 19
  def wxSTC_C_COMMENTDOCKEYWORDERROR, do: 18
  def wxSTC_C_COMMENTDOCKEYWORD, do: 17
  def wxSTC_C_WORD2, do: 16
  def wxSTC_C_COMMENTLINEDOC, do: 15
  def wxSTC_C_REGEX, do: 14
  def wxSTC_C_VERBATIM, do: 13
  def wxSTC_C_STRINGEOL, do: 12
  def wxSTC_C_IDENTIFIER, do: 11
  def wxSTC_C_OPERATOR, do: 10
  def wxSTC_C_PREPROCESSOR, do: 9
  def wxSTC_C_UUID, do: 8
  def wxSTC_C_CHARACTER, do: 7
  def wxSTC_C_STRING, do: 6
  def wxSTC_C_WORD, do: 5
  def wxSTC_C_NUMBER, do: 4
  def wxSTC_C_COMMENTDOC, do: 3
  def wxSTC_C_COMMENTLINE, do: 2
  def wxSTC_C_COMMENT, do: 1
  def wxSTC_C_DEFAULT, do: 0
  def wxSTC_P_DECORATOR, do: 15
  def wxSTC_P_WORD2, do: 14
  def wxSTC_P_STRINGEOL, do: 13
  def wxSTC_P_COMMENTBLOCK, do: 12
  def wxSTC_P_IDENTIFIER, do: 11
  def wxSTC_P_OPERATOR, do: 10
  def wxSTC_P_DEFNAME, do: 9
  def wxSTC_P_CLASSNAME, do: 8
  def wxSTC_P_TRIPLEDOUBLE, do: 7
  def wxSTC_P_TRIPLE, do: 6
  def wxSTC_P_WORD, do: 5
  def wxSTC_P_CHARACTER, do: 4
  def wxSTC_P_STRING, do: 3
  def wxSTC_P_NUMBER, do: 2
  def wxSTC_P_COMMENTLINE, do: 1
  def wxSTC_P_DEFAULT, do: 0
  def wxSTC_LEX_AUTOMATIC, do: 1000
  def wxSTC_LEX_SPICE, do: 78
  def wxSTC_LEX_OPAL, do: 77
  def wxSTC_LEX_INNOSETUP, do: 76
  def wxSTC_LEX_FREEBASIC, do: 75
  def wxSTC_LEX_CSOUND, do: 74
  def wxSTC_LEX_FLAGSHIP, do: 73
  def wxSTC_LEX_SMALLTALK, do: 72
  def wxSTC_LEX_REBOL, do: 71
  def wxSTC_LEX_TADS3, do: 70
  def wxSTC_LEX_PHPSCRIPT, do: 69
  def wxSTC_LEX_HASKELL, do: 68
  def wxSTC_LEX_PUREBASIC, do: 67
  def wxSTC_LEX_BLITZBASIC, do: 66
  def wxSTC_LEX_CAML, do: 65
  def wxSTC_LEX_VHDL, do: 64
  def wxSTC_LEX_ASN1, do: 63
  def wxSTC_LEX_BASH, do: 62
  def wxSTC_LEX_APDL, do: 61
  def wxSTC_LEX_AU3, do: 60
  def wxSTC_LEX_SPECMAN, do: 59
  def wxSTC_LEX_GUI4CLI, do: 58
  def wxSTC_LEX_KIX, do: 57
  def wxSTC_LEX_VERILOG, do: 56
  def wxSTC_LEX_MSSQL, do: 55
  def wxSTC_LEX_OCTAVE, do: 54
  def wxSTC_LEX_ERLANG, do: 53
  def wxSTC_LEX_FORTH, do: 52
  def wxSTC_LEX_POWERBASIC, do: 51
  def wxSTC_LEX_METAPOST, do: 50
  def wxSTC_LEX_TEX, do: 49
  def wxSTC_LEX_YAML, do: 48
  def wxSTC_LEX_LOT, do: 47
  def wxSTC_LEX_CLWNOCASE, do: 46
  def wxSTC_LEX_CLW, do: 45
  def wxSTC_LEX_MMIXAL, do: 44
  def wxSTC_LEX_NSIS, do: 43
  def wxSTC_LEX_PS, do: 42
  def wxSTC_LEX_ESCRIPT, do: 41
  def wxSTC_LEX_LOUT, do: 40
  def wxSTC_LEX_POV, do: 39
  def wxSTC_LEX_CSS, do: 38
  def wxSTC_LEX_F77, do: 37
  def wxSTC_LEX_FORTRAN, do: 36
  def wxSTC_LEX_CPPNOCASE, do: 35
  def wxSTC_LEX_ASM, do: 34
  def wxSTC_LEX_SCRIPTOL, do: 33
  def wxSTC_LEX_MATLAB, do: 32
  def wxSTC_LEX_BAAN, do: 31
  def wxSTC_LEX_VBSCRIPT, do: 28
  def wxSTC_LEX_BULLANT, do: 27
  def wxSTC_LEX_NNCRONTAB, do: 26
  def wxSTC_LEX_TCL, do: 25
  def wxSTC_LEX_EIFFELKW, do: 24
  def wxSTC_LEX_EIFFEL, do: 23
  def wxSTC_LEX_RUBY, do: 22
  def wxSTC_LEX_LISP, do: 21
  def wxSTC_LEX_ADA, do: 20
  def wxSTC_LEX_AVE, do: 19
  def wxSTC_LEX_PASCAL, do: 18
  def wxSTC_LEX_CONF, do: 17
  def wxSTC_LEX_DIFF, do: 16
  def wxSTC_LEX_LUA, do: 15
  def wxSTC_LEX_LATEX, do: 14
  def wxSTC_LEX_XCODE, do: 13
  def wxSTC_LEX_BATCH, do: 12
  def wxSTC_LEX_MAKEFILE, do: 11
  def wxSTC_LEX_ERRORLIST, do: 10
  def wxSTC_LEX_PROPERTIES, do: 9
  def wxSTC_LEX_VB, do: 8
  def wxSTC_LEX_SQL, do: 7
  def wxSTC_LEX_PERL, do: 6
  def wxSTC_LEX_XML, do: 5
  def wxSTC_LEX_HTML, do: 4
  def wxSTC_LEX_CPP, do: 3
  def wxSTC_LEX_PYTHON, do: 2
  def wxSTC_LEX_NULL, do: 1
  def wxSTC_LEX_CONTAINER, do: 0
  def wxSTC_SCMOD_ALT, do: 4
  def wxSTC_SCMOD_CTRL, do: 2
  def wxSTC_SCMOD_SHIFT, do: 1
  def wxSTC_SCMOD_NORM, do: 0
  def wxSTC_KEY_DIVIDE, do: 312
  def wxSTC_KEY_SUBTRACT, do: 311
  def wxSTC_KEY_ADD, do: 310
  def wxSTC_KEY_RETURN, do: 13
  def wxSTC_KEY_TAB, do: 9
  def wxSTC_KEY_BACK, do: 8
  def wxSTC_KEY_ESCAPE, do: 7
  def wxSTC_KEY_INSERT, do: 309
  def wxSTC_KEY_DELETE, do: 308
  def wxSTC_KEY_NEXT, do: 307
  def wxSTC_KEY_PRIOR, do: 306
  def wxSTC_KEY_END, do: 305
  def wxSTC_KEY_HOME, do: 304
  def wxSTC_KEY_RIGHT, do: 303
  def wxSTC_KEY_LEFT, do: 302
  def wxSTC_KEY_UP, do: 301
  def wxSTC_KEY_DOWN, do: 300
  def wxSTC_MODEVENTMASKALL, do: 8191
  def wxSTC_MULTILINEUNDOREDO, do: 4096
  def wxSTC_MOD_BEFOREDELETE, do: 2048
  def wxSTC_MOD_BEFOREINSERT, do: 1024
  def wxSTC_MOD_CHANGEMARKER, do: 512
  def wxSTC_LASTSTEPINUNDOREDO, do: 256
  def wxSTC_MULTISTEPUNDOREDO, do: 128
  def wxSTC_PERFORMED_REDO, do: 64
  def wxSTC_PERFORMED_UNDO, do: 32
  def wxSTC_PERFORMED_USER, do: 16
  def wxSTC_MOD_CHANGEFOLD, do: 8
  def wxSTC_MOD_CHANGESTYLE, do: 4
  def wxSTC_MOD_DELETETEXT, do: 2
  def wxSTC_MOD_INSERTTEXT, do: 1
  def wxSTC_KEYWORDSET_MAX, do: 8
  def wxSTC_ALPHA_NOALPHA, do: 256
  def wxSTC_ALPHA_OPAQUE, do: 255
  def wxSTC_ALPHA_TRANSPARENT, do: 0
  def wxSTC_SEL_LINES, do: 2
  def wxSTC_SEL_RECTANGLE, do: 1
  def wxSTC_SEL_STREAM, do: 0
  def wxSTC_CARET_EVEN, do: 8
  def wxSTC_CARET_JUMPS, do: 16
  def wxSTC_CARET_STRICT, do: 4
  def wxSTC_CARET_SLOP, do: 1
  def wxSTC_VISIBLE_STRICT, do: 4
  def wxSTC_VISIBLE_SLOP, do: 1
  def wxSTC_CURSORWAIT, do: 4
  def wxSTC_CURSORNORMAL, do: -1
  def wxSTC_EDGE_BACKGROUND, do: 2
  def wxSTC_EDGE_LINE, do: 1
  def wxSTC_EDGE_NONE, do: 0
  def wxSTC_CACHE_DOCUMENT, do: 3
  def wxSTC_CACHE_PAGE, do: 2
  def wxSTC_CACHE_CARET, do: 1
  def wxSTC_CACHE_NONE, do: 0
  def wxSTC_WRAPVISUALFLAGLOC_START_BY_TEXT, do: 2
  def wxSTC_WRAPVISUALFLAGLOC_END_BY_TEXT, do: 1
  def wxSTC_WRAPVISUALFLAGLOC_DEFAULT, do: 0
  def wxSTC_WRAPVISUALFLAG_START, do: 2
  def wxSTC_WRAPVISUALFLAG_END, do: 1
  def wxSTC_WRAPVISUALFLAG_NONE, do: 0
  def wxSTC_WRAP_CHAR, do: 2
  def wxSTC_WRAP_WORD, do: 1
  def wxSTC_WRAP_NONE, do: 0
  def wxSTC_TIME_FOREVER, do: 10_000_000
  def wxSTC_FOLDFLAG_BOX, do: 1
  def wxSTC_FOLDFLAG_LEVELNUMBERS, do: 64
  def wxSTC_FOLDFLAG_LINEAFTER_CONTRACTED, do: 16
  def wxSTC_FOLDFLAG_LINEAFTER_EXPANDED, do: 8
  def wxSTC_FOLDFLAG_LINEBEFORE_CONTRACTED, do: 4
  def wxSTC_FOLDFLAG_LINEBEFORE_EXPANDED, do: 2
  def wxSTC_FOLDLEVELNUMBERMASK, do: 4095
  def wxSTC_FOLDLEVELUNINDENT, do: 131_072
  def wxSTC_FOLDLEVELCONTRACTED, do: 65536
  def wxSTC_FOLDLEVELBOXFOOTERFLAG, do: 32768
  def wxSTC_FOLDLEVELBOXHEADERFLAG, do: 16384
  def wxSTC_FOLDLEVELHEADERFLAG, do: 8192
  def wxSTC_FOLDLEVELWHITEFLAG, do: 4096
  def wxSTC_FOLDLEVELBASE, do: 1024
  def wxSTC_FIND_POSIX, do: 4_194_304
  def wxSTC_FIND_REGEXP, do: 2_097_152
  def wxSTC_FIND_WORDSTART, do: 1_048_576
  def wxSTC_FIND_MATCHCASE, do: 4
  def wxSTC_FIND_WHOLEWORD, do: 2
  def wxSTC_PRINT_COLOURONWHITEDEFAULTBG, do: 4
  def wxSTC_PRINT_COLOURONWHITE, do: 3
  def wxSTC_PRINT_BLACKONWHITE, do: 2
  def wxSTC_PRINT_INVERTLIGHT, do: 1
  def wxSTC_PRINT_NORMAL, do: 0
  def wxSTC_INDICS_MASK, do: 224
  def wxSTC_INDIC2_MASK, do: 128
  def wxSTC_INDIC1_MASK, do: 64
  def wxSTC_INDIC0_MASK, do: 32
  def wxSTC_INDIC_ROUNDBOX, do: 7
  def wxSTC_INDIC_BOX, do: 6
  def wxSTC_INDIC_HIDDEN, do: 5
  def wxSTC_INDIC_STRIKE, do: 4
  def wxSTC_INDIC_DIAGONAL, do: 3
  def wxSTC_INDIC_TT, do: 2
  def wxSTC_INDIC_SQUIGGLE, do: 1
  def wxSTC_INDIC_PLAIN, do: 0
  def wxSTC_INDIC_MAX, do: 7
  def wxSTC_CASE_LOWER, do: 2
  def wxSTC_CASE_UPPER, do: 1
  def wxSTC_CASE_MIXED, do: 0
  def wxSTC_CHARSET_8859_15, do: 1000
  def wxSTC_CHARSET_THAI, do: 222
  def wxSTC_CHARSET_VIETNAMESE, do: 163
  def wxSTC_CHARSET_ARABIC, do: 178
  def wxSTC_CHARSET_HEBREW, do: 177
  def wxSTC_CHARSET_JOHAB, do: 130
  def wxSTC_CHARSET_TURKISH, do: 162
  def wxSTC_CHARSET_SYMBOL, do: 2
  def wxSTC_CHARSET_SHIFTJIS, do: 128
  def wxSTC_CHARSET_CYRILLIC, do: 1251
  def wxSTC_CHARSET_RUSSIAN, do: 204
  def wxSTC_CHARSET_OEM, do: 255
  def wxSTC_CHARSET_MAC, do: 77
  def wxSTC_CHARSET_HANGUL, do: 129
  def wxSTC_CHARSET_GREEK, do: 161
  def wxSTC_CHARSET_GB2312, do: 134
  def wxSTC_CHARSET_EASTEUROPE, do: 238
  def wxSTC_CHARSET_CHINESEBIG5, do: 136
  def wxSTC_CHARSET_BALTIC, do: 186
  def wxSTC_CHARSET_DEFAULT, do: 1
  def wxSTC_CHARSET_ANSI, do: 0
  def wxSTC_STYLE_MAX, do: 127
  def wxSTC_STYLE_LASTPREDEFINED, do: 39
  def wxSTC_STYLE_CALLTIP, do: 38
  def wxSTC_STYLE_INDENTGUIDE, do: 37
  def wxSTC_STYLE_CONTROLCHAR, do: 36
  def wxSTC_STYLE_BRACEBAD, do: 35
  def wxSTC_STYLE_BRACELIGHT, do: 34
  def wxSTC_STYLE_LINENUMBER, do: 33
  def wxSTC_STYLE_DEFAULT, do: 32
  def wxSTC_MARGIN_FORE, do: 3
  def wxSTC_MARGIN_BACK, do: 2
  def wxSTC_MARGIN_NUMBER, do: 1
  def wxSTC_MARGIN_SYMBOL, do: 0
  def wxSTC_MASK_FOLDERS, do: 4_261_412_864
  def wxSTC_MARKNUM_FOLDEROPEN, do: 31
  def wxSTC_MARKNUM_FOLDER, do: 30
  def wxSTC_MARKNUM_FOLDERSUB, do: 29
  def wxSTC_MARKNUM_FOLDERTAIL, do: 28
  def wxSTC_MARKNUM_FOLDERMIDTAIL, do: 27
  def wxSTC_MARKNUM_FOLDEROPENMID, do: 26
  def wxSTC_MARKNUM_FOLDEREND, do: 25
  def wxSTC_MARK_CHARACTER, do: 10000
  def wxSTC_MARK_FULLRECT, do: 26
  def wxSTC_MARK_PIXMAP, do: 25
  def wxSTC_MARK_ARROWS, do: 24
  def wxSTC_MARK_DOTDOTDOT, do: 23
  def wxSTC_MARK_BACKGROUND, do: 22
  def wxSTC_MARK_CIRCLEMINUSCONNECTED, do: 21
  def wxSTC_MARK_CIRCLEMINUS, do: 20
  def wxSTC_MARK_CIRCLEPLUSCONNECTED, do: 19
  def wxSTC_MARK_CIRCLEPLUS, do: 18
  def wxSTC_MARK_TCORNERCURVE, do: 17
  def wxSTC_MARK_LCORNERCURVE, do: 16
  def wxSTC_MARK_BOXMINUSCONNECTED, do: 15
  def wxSTC_MARK_BOXMINUS, do: 14
  def wxSTC_MARK_BOXPLUSCONNECTED, do: 13
  def wxSTC_MARK_BOXPLUS, do: 12
  def wxSTC_MARK_TCORNER, do: 11
  def wxSTC_MARK_LCORNER, do: 10
  def wxSTC_MARK_VLINE, do: 9
  def wxSTC_MARK_PLUS, do: 8
  def wxSTC_MARK_MINUS, do: 7
  def wxSTC_MARK_ARROWDOWN, do: 6
  def wxSTC_MARK_EMPTY, do: 5
  def wxSTC_MARK_SHORTARROW, do: 4
  def wxSTC_MARK_SMALLRECT, do: 3
  def wxSTC_MARK_ARROW, do: 2
  def wxSTC_MARK_ROUNDRECT, do: 1
  def wxSTC_MARK_CIRCLE, do: 0
  def wxSTC_MARKER_MAX, do: 31
  def wxSTC_CP_DBCS, do: 1
  def wxSTC_CP_UTF8, do: 65001
  def wxSTC_EOL_LF, do: 2
  def wxSTC_EOL_CR, do: 1
  def wxSTC_EOL_CRLF, do: 0
  def wxSTC_WS_VISIBLEAFTERINDENT, do: 2
  def wxSTC_WS_VISIBLEALWAYS, do: 1
  def wxSTC_WS_INVISIBLE, do: 0
  def wxSTC_LEXER_START, do: 4000
  def wxSTC_OPTIONAL_START, do: 3000
  def wxSTC_START, do: 2000
  def wxSTC_INVALID_POSITION, do: -1
  def wxSTC_USE_POPUP, do: 1
  # From "tbarbase.h": wxToolBarToolStyle
  def wxTOOL_STYLE_BUTTON, do: 1
  def wxTOOL_STYLE_SEPARATOR, do: 2
  def wxTOOL_STYLE_CONTROL, do: 3
  # From "textctrl.h"
  def wxTEXT_ATTR_TABS, do: 1024
  def wxTEXT_ATTR_RIGHT_INDENT, do: 512
  def wxTEXT_ATTR_LEFT_INDENT, do: 256
  def wxTEXT_ATTR_ALIGNMENT, do: 128

  def wxTEXT_ATTR_FONT,
    do:
      wxTEXT_ATTR_FONT_FACE()
      |> bor(
        wxTEXT_ATTR_FONT_SIZE()
        |> bor(
          wxTEXT_ATTR_FONT_WEIGHT()
          |> bor(wxTEXT_ATTR_FONT_ITALIC() |> bor(wxTEXT_ATTR_FONT_UNDERLINE()))
        )
      )

  def wxTEXT_ATTR_FONT_UNDERLINE, do: 64
  def wxTEXT_ATTR_FONT_ITALIC, do: 32
  def wxTEXT_ATTR_FONT_WEIGHT, do: 16
  def wxTEXT_ATTR_FONT_SIZE, do: 8
  def wxTEXT_ATTR_FONT_FACE, do: 4
  def wxTEXT_ATTR_BACKGROUND_COLOUR, do: 2
  def wxTEXT_ATTR_TEXT_COLOUR, do: 1
  def wxTEXT_TYPE_ANY, do: 0
  def wxTE_CAPITALIZE, do: 0
  def wxTE_RICH2, do: 32768
  def wxTE_BESTWRAP, do: 0
  def wxTE_WORDWRAP, do: 1
  def wxTE_CHARWRAP, do: 16384
  def wxTE_DONTWRAP, do: wxHSCROLL()
  def wxTE_NOHIDESEL, do: 8192
  def wxTE_AUTO_URL, do: 4096
  def wxTE_PASSWORD, do: 2048
  def wxTE_PROCESS_ENTER, do: 1024
  def wxTE_RICH, do: 128
  def wxTE_CENTRE, do: wxTE_CENTER()
  def wxTE_RIGHT, do: wxALIGN_RIGHT()
  def wxTE_CENTER, do: wxALIGN_CENTER_HORIZONTAL()
  def wxTE_LEFT, do: 0
  def wxTE_PROCESS_TAB, do: 64
  def wxTE_MULTILINE, do: 32
  def wxTE_READONLY, do: 16
  def wxTE_AUTO_SCROLL, do: 8
  def wxTE_NO_VSCROLL, do: 2
  def wxHAS_TEXT_WINDOW_STREAM, do: 0
  # From "textctrl.h": wxTextAttrAlignment
  def wxTEXT_ALIGNMENT_DEFAULT, do: 0
  def wxTEXT_ALIGNMENT_LEFT, do: 1
  def wxTEXT_ALIGNMENT_CENTRE, do: 2
  def wxTEXT_ALIGNMENT_CENTER, do: wxTEXT_ALIGNMENT_CENTRE()
  def wxTEXT_ALIGNMENT_RIGHT, do: wxTEXT_ALIGNMENT_CENTRE() + 1
  def wxTEXT_ALIGNMENT_JUSTIFIED, do: wxTEXT_ALIGNMENT_CENTRE() + 2
  # From "textctrl.h": wxTextCtrlHitTestResult
  def wxTE_HT_UNKNOWN, do: -2
  def wxTE_HT_BEFORE, do: -1
  def wxTE_HT_ON_TEXT, do: 0
  def wxTE_HT_BELOW, do: 1
  def wxTE_HT_BEYOND, do: 2
  # From "textdlgg.h"
  def wxTextEntryDialogStyle,
    do: wxOK() |> bor(wxCANCEL() |> bor(wxCENTRE() |> bor(wxWS_EX_VALIDATE_RECURSIVELY())))

  # From "toolbar.h"
  def wxTB_HORIZONTAL, do: wxHORIZONTAL()
  def wxTB_TOP, do: wxTB_HORIZONTAL()
  def wxTB_VERTICAL, do: wxVERTICAL()
  def wxTB_LEFT, do: wxTB_VERTICAL()
  def wxTB_3DBUTTONS, do: 16
  def wxTB_FLAT, do: 32
  def wxTB_DOCKABLE, do: 64
  def wxTB_NOICONS, do: 128
  def wxTB_TEXT, do: 256
  def wxTB_NODIVIDER, do: 512
  def wxTB_NOALIGN, do: 1024
  def wxTB_HORZ_LAYOUT, do: 2048
  def wxTB_HORZ_TEXT, do: wxTB_HORZ_LAYOUT() |> bor(wxTB_TEXT())
  def wxTB_NO_TOOLTIPS, do: 4096
  def wxTB_BOTTOM, do: 8192
  def wxTB_RIGHT, do: 16384
  # From "toolbook.h"
  def wxBK_BUTTONBAR, do: 256
  # From "toplevel.h"
  def wxFULLSCREEN_NOMENUBAR, do: 1
  def wxFULLSCREEN_NOTOOLBAR, do: 2
  def wxFULLSCREEN_NOSTATUSBAR, do: 4
  def wxFULLSCREEN_NOBORDER, do: 8
  def wxFULLSCREEN_NOCAPTION, do: 16

  def wxFULLSCREEN_ALL,
    do:
      wxFULLSCREEN_NOMENUBAR()
      |> bor(
        wxFULLSCREEN_NOTOOLBAR()
        |> bor(
          wxFULLSCREEN_NOSTATUSBAR()
          |> bor(wxFULLSCREEN_NOBORDER() |> bor(wxFULLSCREEN_NOCAPTION()))
        )
      )

  # From "toplevel.h"
  def wxUSER_ATTENTION_INFO, do: 1
  def wxUSER_ATTENTION_ERROR, do: 2
  # From "toplevel.h"
  def wxTOPLEVEL_EX_DIALOG, do: 8

  def wxDEFAULT_FRAME_STYLE,
    do:
      wxSYSTEM_MENU()
      |> bor(
        wxRESIZE_BORDER()
        |> bor(
          wxMINIMIZE_BOX()
          |> bor(
            wxMAXIMIZE_BOX()
            |> bor(wxCLOSE_BOX() |> bor(wxCAPTION() |> bor(wxCLIP_CHILDREN())))
          )
        )
      )

  def wxRESIZE_BORDER, do: 64
  def wxTINY_CAPTION_VERT, do: 128
  def wxTINY_CAPTION_HORIZ, do: 256
  def wxMAXIMIZE_BOX, do: 512
  def wxMINIMIZE_BOX, do: 1024
  def wxSYSTEM_MENU, do: 2048
  def wxCLOSE_BOX, do: 4096
  def wxMAXIMIZE, do: 8192
  def wxMINIMIZE, do: wxICONIZE()
  def wxICONIZE, do: 16384
  def wxSTAY_ON_TOP, do: 32768
  # From "treebase.h"
  def wxTR_DEFAULT_STYLE, do: :wxe_util.get_const(:wxTR_DEFAULT_STYLE)
  def wxTR_FULL_ROW_HIGHLIGHT, do: 8192
  def wxTR_HIDE_ROOT, do: 2048
  def wxTR_ROW_LINES, do: 1024
  def wxTR_EDIT_LABELS, do: 512
  def wxTR_HAS_VARIABLE_ROW_HEIGHT, do: 128
  def wxTR_EXTENDED, do: 64
  def wxTR_MULTIPLE, do: 32
  def wxTR_SINGLE, do: 0
  def wxTR_TWIST_BUTTONS, do: 16
  def wxTR_LINES_AT_ROOT, do: 8
  def wxTR_NO_LINES, do: 4
  def wxTR_HAS_BUTTONS, do: 1
  def wxTR_NO_BUTTONS, do: 0
  # From "treebase.h": wxTreeItemIcon
  def wxTreeItemIcon_Normal, do: 0
  def wxTreeItemIcon_Selected, do: 1
  def wxTreeItemIcon_Expanded, do: 2
  def wxTreeItemIcon_SelectedExpanded, do: 3
  def wxTreeItemIcon_Max, do: 4
  # From "utils.h"
  def wxEXEC_ASYNC, do: 0
  def wxEXEC_SYNC, do: 1
  def wxEXEC_NOHIDE, do: 2
  def wxEXEC_MAKE_GROUP_LEADER, do: 4
  def wxEXEC_NODISABLE, do: 8
  # From "utils.h"
  def wxBROWSER_NEW_WINDOW, do: 1
  # From "utils.h"
  def wxStrip_Mnemonics, do: 1
  def wxStrip_Accel, do: 2
  def wxStrip_All, do: wxStrip_Mnemonics() |> bor(wxStrip_Accel())
  # From "utils.h": wxKillError
  def wxKILL_OK, do: 0
  def wxKILL_BAD_SIGNAL, do: 1
  def wxKILL_ACCESS_DENIED, do: 2
  def wxKILL_NO_PROCESS, do: 3
  def wxKILL_ERROR, do: 4
  # From "utils.h": wxKillFlags
  def wxKILL_NOCHILDREN, do: 0
  def wxKILL_CHILDREN, do: 1
  # From "utils.h": wxShutdownFlags
  def wxSHUTDOWN_POWEROFF, do: 0
  def wxSHUTDOWN_REBOOT, do: 1
  # From "utils.h": wxSignal
  def wxSIGNONE, do: 0
  def wxSIGHUP, do: 1
  def wxSIGINT, do: 2
  def wxSIGQUIT, do: 3
  def wxSIGILL, do: 4
  def wxSIGTRAP, do: 5
  def wxSIGABRT, do: 6
  def wxSIGIOT, do: wxSIGABRT()
  def wxSIGEMT, do: wxSIGABRT() + 1
  def wxSIGFPE, do: wxSIGABRT() + 2
  def wxSIGKILL, do: wxSIGABRT() + 3
  def wxSIGBUS, do: wxSIGABRT() + 4
  def wxSIGSEGV, do: wxSIGABRT() + 5
  def wxSIGSYS, do: wxSIGABRT() + 6
  def wxSIGPIPE, do: wxSIGABRT() + 7
  def wxSIGALRM, do: wxSIGABRT() + 8
  def wxSIGTERM, do: wxSIGABRT() + 9
  # From "valtext.h"
  def wxFILTER_EXCLUDE_CHAR_LIST, do: 128
  def wxFILTER_INCLUDE_CHAR_LIST, do: 64
  def wxFILTER_EXCLUDE_LIST, do: 32
  def wxFILTER_INCLUDE_LIST, do: 16
  def wxFILTER_NUMERIC, do: 8
  def wxFILTER_ALPHANUMERIC, do: 4
  def wxFILTER_ALPHA, do: 2
  def wxFILTER_ASCII, do: 1
  def wxFILTER_NONE, do: 0
  # From "version.h"
  def wxBETA_NUMBER, do: :wxe_util.get_const(:wxBETA_NUMBER)
  def wxSUBRELEASE_NUMBER, do: :wxe_util.get_const(:wxSUBRELEASE_NUMBER)
  def wxRELEASE_NUMBER, do: :wxe_util.get_const(:wxRELEASE_NUMBER)
  def wxMINOR_VERSION, do: :wxe_util.get_const(:wxMINOR_VERSION)
  def wxMAJOR_VERSION, do: :wxe_util.get_const(:wxMAJOR_VERSION)
  # From "window.h"
  # From "window.h": wxWindowVariant
  def wxWINDOW_VARIANT_NORMAL, do: 0
  def wxWINDOW_VARIANT_SMALL, do: 1
  def wxWINDOW_VARIANT_MINI, do: 2
  def wxWINDOW_VARIANT_LARGE, do: 3
  def wxWINDOW_VARIANT_MAX, do: 4
  # From "xmlres.h": wxXmlResourceFlags
  def wxXRC_USE_LOCALE, do: 1
  def wxXRC_NO_SUBCLASSING, do: 2
  def wxXRC_NO_RELOADING, do: 4
end
