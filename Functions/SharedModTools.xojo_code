#tag Module
Protected Module SharedModTools
	#tag Method, Flags = &h0
		Function InstallMod(modToInstall as FolderItem, batchmode as Boolean = False) As Boolean
		  Var itemArr() As String= modToInstall.Name.Split(".")
		  Var last As Integer= itemArr.LastIndex
		  
		  Var command7zzs As String= """"+SpecialFolder.Resources.NativePath _
		  + "7zzs"" x % -o" + """"+App.manualModsFolder.NativePath+""" -y"
		  
		  System.DebugLog(itemArr(last))
		  If(itemArr(last)="zip") Then
		    modToInstall.Unzip(App.manualModsFolder)
		    Mw5ModHandler.ReloadMods
		    Return True
		  ElseIf(itemArr(last)="7z") Then
		    System.DebugLog(command7zzs.Replace("%",""""+modToInstall.NativePath+""""))
		    Utils.ShellCommand(command7zzs.Replace("%",""""+modToInstall.NativePath+""""), False, False)
		    Mw5ModHandler.ReloadMods
		    Return True
		  ElseIf(itemArr(last)="rar") Then
		    System.DebugLog(command7zzs.Replace("%",""""+modToInstall.NativePath+""""))
		    Utils.ShellCommand(command7zzs.Replace("%",""""+modToInstall.NativePath+""""), False, False)
		    Mw5ModHandler.ReloadMods
		    Return True
		  Else
		    
		    If(Not batchmode) Then
		      Utils.GeneratePopup(3,"Unsupported archive format",_
		      "Please extract manually and archive as a zip file")
		    End
		    
		    Return False
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadModLoadout(profileName as String)
		  Var jsonText As String= Utils.ReadFile(App.savedConfigs.child(profileName + ".txt"))
		  
		  App.modLocationMap= ParseJSON(jsonText)
		  
		  Mw5ModHandler.RefreshFromDict()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadSettings(lineNumber as Integer) As String
		  Var settingsArr() As String= Utils.ReadFile(App.savedSettings).Split(EndOfLine)
		  
		  Try
		    If(settingsArr.Count>lineNumber) Then
		      Return settingsArr(lineNumber)
		    Else
		      Return ""
		    End
		  Catch e As RuntimeException
		    Utils.GeneratePopup(1,"Something Went Wrong!","A new settings file will need to be generated" +_
		    EndOfLine + e.Message)
		    App.savedSettings.Remove
		    Quit(1)
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveModTo(Top as Boolean, designatedPlace as integer = 99)
		  Var modlist As DesktopListBox= MainScreen.lsb_ModOrderList
		  
		  If(top) Then
		    modlist.CellTextAt(modlist.SelectedRowIndex,App.COL_ORDER)= "0"
		  Else
		    modlist.CellTextAt(modlist.SelectedRowIndex,App.COL_ORDER)= designatedPlace.ToString
		  End
		  
		  MainScreen.lsb_ModOrderList.SortingColumn=App.COL_ORDER
		  MainScreen.lsb_ModOrderList.Sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateLoadouts()
		  MainScreen.pop_SavedLoadouts.RemoveAllRows
		  MainScreen.pop_SavedLoadouts.AddRow("<new>")
		  
		  For Each item As FolderItem In App.savedConfigs.Children
		    If(item.DisplayName="settings.ini") Then
		      Continue
		    Else
		      MainScreen.pop_SavedLoadouts.AddRow(item.Name.Replace(".txt",""))
		      
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveMod(modToRemove as String) As Boolean
		  If(App.manualModsFolder.Child(modToRemove).Exists) Then
		    App.modLocationMap.Remove(App.manualModsFolder.Child(modToRemove).child("mod.json").NativePath)
		    App.manualModsFolder.Child(modToRemove).RemoveFolderAndContents
		    Mw5ModHandler.ReloadMods
		    Return True
		  Else
		    Return False
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveModLoadout(profileName as String)
		  Var FileContent As String= GenerateJSON(App.modLocationMap, True)
		  
		  Utils.WriteFile(App.savedConfigs.Child(profileName + ".txt"),FileContent,True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveSettings(manualLocation as String, steamLocation as String, launcher as String)
		  utils.WriteFile(App.savedSettings,manualLocation,True)
		  utils.WriteFile(App.savedSettings,steamLocation+ EndOfLine, False)
		  utils.WriteFile(App.savedSettings,launcher, False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleAllMods(activate as Boolean)
		  For row As Integer=0 To MainScreen.lsb_ModOrderList.LastRowIndex
		    If(activate) Then
		      MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_ENABLED)="Y"
		    Else
		      MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_ENABLED)=" "
		    End
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleMods()
		  If(MainScreen.lsb_ModOrderList.SelectedRowIndex<>-1) Then
		    If(MainScreen.lsb_ModOrderList.CellTextAt(MainScreen.lsb_ModOrderList.SelectedRowIndex,0)="Y") Then
		      MainScreen.lsb_ModOrderList.CellTextAt(MainScreen.lsb_ModOrderList.SelectedRowIndex,0)=" "
		    Else
		      MainScreen.lsb_ModOrderList.CellTextAt(MainScreen.lsb_ModOrderList.SelectedRowIndex,0)="Y"
		    End
		  End
		End Sub
	#tag EndMethod


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
