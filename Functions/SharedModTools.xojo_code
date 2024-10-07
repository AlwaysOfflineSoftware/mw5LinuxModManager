#tag Module
Protected Module SharedModTools
	#tag Method, Flags = &h0
		Function InstallMod(modToInstall as FolderItem, batchmode as Boolean = False) As Boolean
		  Var itemArr() As String= modToInstall.Name.Split(".")
		  Var last As Integer= itemArr.LastIndex
		  
		  Var command7zzs As String= """"+SpecialFolder.Resources.NativePath _
		  + "7zzs"" x % -o" + """"+App.BaseDir.NativePath+""" -y"
		  
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
		      Utils.ErrorHandler(3,"Unsupported archive format",_
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
