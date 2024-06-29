#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Opening()
		  // ~/.steam/steam/steamapps/common/MechWarrior 5 Mercenaries/MW5Mercs/Mods
		  // ~/.steam/steam/steamapps/workshop/content/784080
		  
		  BaseDir= SpecialFolder.UserHome.child(".steam").Child("steam")_
		  .Child("steamapps")
		  
		  savedConfigs= Utils.CreateFolderStructure(SpecialFolder.UserHome,_
		  ".config/AlwaysOfflineSoftware/MW5LinuxModder/")
		  
		  If(Not savedConfigs.child("settings.ini").Exists) Then
		    Utils.WriteFile(savedConfigs.child("settings.ini"),"", True)
		  End
		  
		  savedSettings= savedConfigs.child("settings.ini")
		  
		  Var settingsArr() As String= Utils.ReadFile(App.savedSettings.NativePath).Split(EndOfLine)
		  
		  If(settingsArr(0)="") Then
		    manualModsFile= BaseDir.Child("common").Child("MechWarrior 5 Mercenaries")_
		    .Child("MW5Mercs").Child("Mods")
		    
		    steamModsFile= BaseDir.Child("workshop").Child("content").Child("784080")
		  Else
		    manualModsFile= New FolderItem(settingsArr(0))
		    steamModsFile= New FolderItem(settingsArr(1))
		  End
		  
		  If(manualModsFile.Exists) Then
		    enabledModsFile= manualModsFile.child("modlist.json")
		  Else
		    Utils.ErrorHandler(3,"No Mod Dir found", "Please create a mod dir in Mechwarrior Steam directory")
		    Quit()
		  End
		  
		  modIDMap= New Dictionary
		  modLocationMap= New Dictionary
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		BaseDir As folderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		enabledModsFile As Folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		manualItemList() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		manualModsFile As Folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		modIDMap As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		modLocationMap As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		savedConfigs As Folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		savedSettings As Folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		steamItemList() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		steamModsFile As Folderitem
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
