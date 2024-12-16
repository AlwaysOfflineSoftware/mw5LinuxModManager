#tag DesktopWindow
Begin DesktopWindow MainScreen
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   3
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1372590079
   MenuBarVisible  =   True
   MinimumHeight   =   400
   MinimumWidth    =   800
   Resizeable      =   True
   Title           =   "MW5 Linux Modder"
   Type            =   0
   Visible         =   True
   Width           =   800
   Begin DesktopListBox lsb_ModOrderList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   True
      AllowRowReordering=   True
      Bold            =   False
      ColumnCount     =   6
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   15.0
      FontUnit        =   0
      GridLineStyle   =   1
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   322
      Index           =   -2147483648
      InitialValue    =   "Enabled	ID	Mod Name	Load Order	Depends	Steam"
      Italic          =   False
      Left            =   125
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   655
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopImageViewer imv_LoadedGame
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   80
      Image           =   155025407
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   262
      Transparent     =   False
      Visible         =   True
      Width           =   80
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopButton btn_LaunchGame
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Launch MW5"
      Default         =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   658
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Steam users can launch the game here!"
      Top             =   354
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   122
   End
   Begin DesktopButton btn_SaveLoadout
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save Preset"
      Default         =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      Italic          =   False
      Left            =   310
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Saves load order"
      Top             =   354
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   93
   End
   Begin DesktopButton btn_LoadLoadout
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load Preset"
      Default         =   False
      Enabled         =   False
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      Italic          =   False
      Left            =   415
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Loads a preset (remember to apply)"
      Top             =   354
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   93
   End
   Begin DesktopPopupMenu pop_SavedLoadouts
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      InitialValue    =   "<new>"
      Italic          =   False
      Left            =   125
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   354
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   173
   End
   Begin DesktopButton btn_DeleteLoadout
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Delete Preset"
      Default         =   False
      Enabled         =   False
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      Italic          =   False
      Left            =   520
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Deletes preset selected"
      Top             =   354
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   98
   End
   Begin DesktopSeparator sep_Line1
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   26
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   630
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   15
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   354
      Transparent     =   False
      Visible         =   True
      Width           =   16
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopButton btn_Toggle
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Toggle"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Activate or disable a mod"
      Top             =   224
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btn_Edit
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Edit"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Modify load order and dependancies"
      Top             =   186
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopBevelButton btn_Apply
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c45454500
      BevelStyle      =   1
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Apply"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   True
      Height          =   26
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   80
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopBevelButton btn_Install
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c45454500
      BevelStyle      =   1
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Install"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   True
      Height          =   26
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   96
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   80
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopBevelButton btn_Refresh
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c45454500
      BevelStyle      =   1
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Refresh"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   True
      Height          =   26
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   58
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   80
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopBevelButton btn_Donate
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c00610C00
      BevelStyle      =   1
      Bold            =   True
      ButtonStyle     =   0
      Caption         =   "Donate"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   True
      Height          =   26
      Icon            =   0
      IconAlignment   =   5
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TextColor       =   &cDCD60000
      Tooltip         =   "Please, it helps me justify working on this!"
      Top             =   354
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   80
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  Var lsbWidth As Integer= Self.lsb_ModOrderList.Width
		  
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_ENABLED).WidthActual=(lsbWidth*0.10)
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_ID).WidthActual=(lsbWidth*0.10)
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_NAME).WidthActual=(lsbWidth*0.40)
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_ORDER).WidthActual=(lsbWidth*0.15)
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_DEPENDS).WidthActual=(lsbWidth*0.15)
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_STEAM).WidthActual=(lsbWidth*0.10)
		  
		  Mw5ModHandler.BackupOriginal
		  Mw5ModHandler.ReloadMods
		  SharedModTools.populateLoadouts
		  
		  If(Self.pop_SavedLoadouts.RowCount>1) Then
		    Self.pop_SavedLoadouts.SelectedRowIndex=1
		  Else
		    Self.pop_SavedLoadouts.SelectedRowIndex=0
		  End
		  
		  If(App.steamUser And App.launchCommand="steam steam://rungameid/784080") Then
		    Me.btn_LaunchGame.Enabled= True
		  ElseIf(App.launchCommand<>"steam steam://rungameid/784080" And _
		    App.launchCommand<>"") Then
		    Me.btn_LaunchGame.Enabled= True
		  Else
		    Me.btn_LaunchGame.Enabled= False
		  End
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileSettings() As Boolean Handles FileSettings.Action
		  
		  SettingsScreen.Show
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
		  AboutScreen.Show
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpDonate() As Boolean Handles HelpDonate.Action
		  
		  System.GotoURL("https://alwaysoffline.gumroad.com/l/Thanks")
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpLicense() As Boolean Handles HelpLicense.Action
		  LicenseScreen.Show
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpNexusPage() As Boolean Handles HelpNexusPage.Action
		  System.GotoURL("https://www.nexusmods.com/mechwarrior5mercenaries/mods/1128?tab=description")
		  
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events lsb_ModOrderList
	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  If(newPosition=0) Then
		    Me.CellTextAt(Me.SelectedRowIndex,App.COL_ORDER)= "0"
		    If(Me.CellTextAt(Me.SelectedRowIndex,App.COL_STEAM)="Y") Then
		      Mw5ModHandler.UpdateModDictionary(Me.CellTextAt(Me.SelectedRowIndex,App.COL_NAME),"0",True)
		    Else
		      Mw5ModHandler.UpdateModDictionary(Me.CellTextAt(Me.SelectedRowIndex,App.COL_NAME),"0",False)
		    End
		  Else
		    Me.CellTextAt(Me.SelectedRowIndex,App.COL_ORDER)= Me.CellTextAt(newPosition,App.COL_ORDER)
		    If(Me.CellTextAt(Me.SelectedRowIndex,App.COL_STEAM)="Y") Then
		      Mw5ModHandler.UpdateModDictionary(Me.CellTextAt(Me.SelectedRowIndex,App.COL_NAME),_
		      Me.CellTextAt(newPosition,App.COL_ORDER),True)
		    Else
		      Mw5ModHandler.UpdateModDictionary(Me.CellTextAt(Me.SelectedRowIndex,App.COL_NAME),_
		      Me.CellTextAt(newPosition,App.COL_ORDER),False)
		    End
		  End
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub DoublePressed()
		  
		  If(Self.lsb_ModOrderList.SelectedRowIndex<>-1) Then
		    If(Self.lsb_ModOrderList.CellTextAt(Self.lsb_ModOrderList.SelectedRowIndex,0)="Y") Then
		      Self.lsb_ModOrderList.CellTextAt(Self.lsb_ModOrderList.SelectedRowIndex,0)=" "
		    Else
		      Self.lsb_ModOrderList.CellTextAt(Self.lsb_ModOrderList.SelectedRowIndex,0)="Y"
		    End
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  If y<=Me.RowHeight Then
		    Return True
		  Else
		    base.AddMenu(New MenuItem("Edit"))
		    base.AddMenu(New MenuItem("Revert Load Order"))
		    If(Me.CellTextAt(Me.SelectedRowIndex,App.COL_STEAM)<>"Y") Then
		      base.AddMenu(New MenuItem("Uninstall"))
		    End
		    base.AddMenu(New MenuItem("Move to Top"))
		    base.AddMenu(New MenuItem("Move to Bottom"))
		  End
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  Var modSelected As String= Me.CellTextAt(Me.SelectedRowIndex,App.COL_NAME)
		  
		  Select Case selectedItem.Text
		  Case "Edit"
		    OrderInputScreen.show
		  Case "Revert Load Order"
		    Var reverted As Boolean= Mw5ModHandler.RevertMod(modSelected)
		    Mw5ModHandler.ReloadMods
		    Utils.GeneratePopup(1, modSelected + " was reverted to backup!","") 
		  Case "Uninstall"
		    Var uninstalled As Boolean= SharedModTools.RemoveMod(modSelected)
		    
		    If(uninstalled) Then
		      Utils.GeneratePopup(1, modSelected + " was uninstalled!","") 
		    Else
		      Utils.GeneratePopup(1, "Uninstall Failed","Please check the selected mod,"_
		      + "refresh the load order and try again") 
		    End
		  Case "Move to Top"
		    SharedModTools.MoveModTo(True)
		  Case "Move to Bottom"
		    SharedModTools.MoveModTo(False)
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function RowComparison(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  Select Case column
		    
		  Case 3 ' This is our numerical value column. Let's do the work ourselves
		    If Me.CellTextAt(row1, column ).Val < Me.CellTextAt(row2, column).Val Then
		      result = -1
		    ElseIf Me.CellTextAt(row1, column).Val > Me.CellTextAt(row2, column).Val Then
		      result = 1
		    Else
		      result = 0
		    End If
		    Return True
		    
		  Else //some other column for which we let the listbox handle string comparison
		    Return False
		  End Select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_LaunchGame
	#tag Event
		Sub Pressed()
		  Try
		    Utils.ShellCommand(App.launchCommand,False,False)
		  Catch e As RuntimeException
		    Utils.GeneratePopup(1,"Something went wrong!",e.Message)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_SaveLoadout
	#tag Event
		Sub Pressed()
		  If(Self.pop_SavedLoadouts.SelectedRowIndex=0) Then
		    SaveConfigScreen.Show
		  Else
		    SharedModTools.SaveModLoadout(Self.pop_SavedLoadouts.SelectedRowText)
		  End
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_LoadLoadout
	#tag Event
		Sub Pressed()
		  If(Self.pop_SavedLoadouts.SelectedRowIndex<>0) Then
		    SharedModTools.LoadModLoadout(Self.pop_SavedLoadouts.SelectedRowText)
		  End
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_SavedLoadouts
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  If(Me.SelectedRowIndex=0) Then
		    Self.btn_LoadLoadout.Enabled= False
		    Self.btn_DeleteLoadout.Enabled= False
		  Else
		    Self.btn_LoadLoadout.Enabled= True
		    Self.btn_DeleteLoadout.Enabled= True
		  End
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_DeleteLoadout
	#tag Event
		Sub Pressed()
		  If(Self.pop_SavedLoadouts.SelectedRowIndex<>0) Then
		    App.savedConfigs.Child(Self.pop_SavedLoadouts.SelectedRowText+".txt").Remove
		    Self.pop_SavedLoadouts.RemoveRowAt(Self.pop_SavedLoadouts.SelectedRowIndex)
		    Self.pop_SavedLoadouts.SelectedRowIndex= 0
		  End
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_Toggle
	#tag Event
		Sub Pressed()
		  SharedModTools.ToggleMods
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  base.AddMenu(New MenuItem("Toggle All OFF"))
		  base.AddMenu(New MenuItem("Toggle All ON"))
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  Select Case selectedItem.Text
		  Case "Toggle All OFF"
		    SharedModTools.ToggleAllMods(False)
		  Case "Toggle All ON"
		    SharedModTools.ToggleAllMods(True)
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_Edit
	#tag Event
		Sub Pressed()
		  
		  If(Self.lsb_ModOrderList.SelectedRowIndex<>-1) Then
		    If(Self.lsb_ModOrderList.SelectedRowIndex<>-1) Then
		      OrderInputScreen.show
		    End
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_Apply
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  Me.BackgroundColor= Color.RGB(0,125,15)
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function MouseUp(X As Integer, Y As Integer) As Boolean
		  Mw5ModHandler.ApplyLoadOrder
		  Mw5ModHandler.ApplyEnabled
		  
		  If(Not App.savedConfigs.child("default.txt").Exists) Then
		    Utils.WriteFile(App.savedConfigs.child("default.txt"), "", True)
		  End
		  
		  SharedModTools.SaveModLoadout("default")
		  Me.BackgroundColor= Color.RGB(69,69,69)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_Install
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  Me.BackgroundColor= Color.RGB(0,65,125)
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function MouseUp(X As Integer, Y As Integer) As Boolean
		  Var modArchive As FolderItem= Utils.SelectTargetDialog("home",False)
		  Var installed As Boolean
		  
		  If(modArchive<>Nil And modArchive.Exists) Then
		    installed= SharedModTools.InstallMod(modArchive)
		    If(installed) Then
		      Utils.GeneratePopup(1, modArchive.Name + " was installed!","") 
		    Else
		      Utils.GeneratePopup(1, "install Failed","Please check the selected mod,"_
		      + "to make sure it is a supported format and is not corrupt") 
		    End
		  End
		  
		  Me.BackgroundColor= Color.RGB(69,69,69)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_Refresh
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  Me.BackgroundColor= Color.RGB(125,125,15)
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function MouseUp(X As Integer, Y As Integer) As Boolean
		  Mw5ModHandler.ReloadMods
		  Me.BackgroundColor= Color.RGB(69,69,69)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_Donate
	#tag Event
		Sub Pressed()
		  System.GotoURL("https://alwaysoffline.gumroad.com/l/Thanks")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
