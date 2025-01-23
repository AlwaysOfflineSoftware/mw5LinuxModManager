#tag Module
Protected Module Mw5ModHandler
	#tag Method, Flags = &h0
		Sub ApplyEnabled()
		  Var enabledFileContent As Dictionary= New Dictionary
		  Var enabledModContent As Dictionary= New Dictionary
		  Var enabledDefaultContent As Dictionary= New Dictionary
		  Var finalContent As String
		  
		  enabledDefaultContent.Value("bEnabled")= True
		  
		  enabledFileContent.Value("gameVersion")= "1.1.361"
		  
		  For row As Integer= 0 To MainScreen.lsb_ModOrderList.RowCount-1
		    If(MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_ENABLED)="Y") Then
		      If(MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_STEAM)="Y") Then
		        enabledModContent.Value(MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_ID)._
		        ReplaceAll(" ", "").Trim)= enabledDefaultContent
		      Else
		        enabledModContent.Value(MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_NAME)._
		        ReplaceAll(" ", "").Trim)= enabledDefaultContent
		      End
		    End
		  Next 
		  
		  enabledFileContent.Value("modStatus")= enabledModContent
		  
		  finalContent= GenerateJSON(enabledFileContent,True)
		  
		  Utils.WriteFile(app.enabledModsFile, finalContent, True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ApplyLoadOrder()
		  Var tempDict As Dictionary 
		  Var tempFItem As FolderItem
		  
		  For Each modKey As String In App.modLocationMap.Keys
		    tempDict= App.modLocationMap.Value(modKey)
		    tempFItem= New FolderItem(modKey)
		    
		    Utils.WriteFile(tempFItem,GenerateJSON(tempDict,True),True)
		    
		  Next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BackupOriginal()
		  // Steam Mods
		  If(App.SteamUser And App.steamModsFile.Exists) Then
		    For Each item As FolderItem In App.steamModsFile.Children
		      If(item.DisplayName.Contains(".")) Then
		        Continue
		      Else
		        If(App.steamModsFile.child(item.Name).child("mod.json.bak").Exists Or _
		           App.steamModsFile.child(item.Name).child("mod.json").Exists= False) Then
		          Continue
		        Else
		          App.steamModsFile.child(item.Name).child("mod.json")._
		          CopyTo(App.steamModsFile.child(item.Name).child("mod.json.bak"))
		        End
		      End
		    Next
		  End
		  
		  // Manual Mods
		  If(App.manualModsFolder.Exists) Then
		    For Each item As FolderItem In App.manualModsFolder.Children
		      If(item.DisplayName.Contains(".")) Then
		        Continue
		      Else
		        If(App.manualModsFolder.child(item.Name).child("mod.json.bak").Exists Or _
		          App.manualModsFolder.child(item.Name).child("mod.json").Exists= False) Then
		          Continue
		        Else
		          App.manualModsFolder.child(item.Name).child("mod.json")._
		          CopyTo(App.manualModsFolder.child(item.Name).child("mod.json.bak"))
		        End
		      End
		    Next
		  End
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckDependancies()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckEnabled()
		  If(App.enabledModsFile.Exists) Then
		    Var enabledFileContents As String= Utils.ReadFile(App.enabledModsFile.NativePath)
		    Var name As String
		    Var steamid As String
		    Var steamMod As String
		    
		    For row As Integer=0 To MainScreen.lsb_ModOrderList.RowCount-1
		      name= MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_NAME).ReplaceAll(" ", "").Trim
		      steamMod= MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_STEAM).ReplaceAll(" ", "").Trim
		      steamid= MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_ID).ReplaceAll(" ", "").Trim
		      
		      If(steamMod<>"Y" And enabledFileContents.Contains(name)) Then
		        MainScreen.lsb_ModOrderList.CellTextAt(row,0)="Y"
		        // System.DebugLog(name + " TRUE")
		      ElseIf(steamMod="Y" And enabledFileContents.Contains(steamid)) Then
		        MainScreen.lsb_ModOrderList.CellTextAt(row,0)="Y"
		      Else
		        MainScreen.lsb_ModOrderList.CellTextAt(row,0)=" "
		        // System.DebugLog(name + " FALSE")
		      End
		      
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetJsonName(modName as String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadDependancies()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshFromDict()
		  Var modName As String
		  Var modOrder As String
		  Var modID As String
		  Var steamMod As Boolean= False
		  Var tempDict As Dictionary 
		  Var pathString() As String
		  
		  // Populate
		  For Each modKey As String In App.modLocationMap.Keys
		    pathString= modkey.Split("/")
		    tempDict= App.modLocationMap.Value(modKey)
		    If(tempDict.HasKey("displayName") And tempDict.HasKey("defaultLoadOrder")) Then
		      modName= pathString(pathString.LastIndex-1) //tempDict.Lookup("displayName","ERR")
		      modOrder= tempDict.Lookup("defaultLoadOrder","ERR")
		      modID= modName.Left(2).Lowercase + modName.Right(2).Lowercase +_
		      modName.Length.ToString
		      
		      If(App.steamUser) Then
		        If(modKey.Contains(App.steamModsFile.NativePath)) Then
		          modID= pathString(pathString.LastIndex-1)
		          modName= tempDict.Lookup("displayName","ERR")
		          MainScreen.lsb_ModOrderList.AddRow("",modID,_
		          modName.Replace(",","").Trim,_
		          modOrder.ReplaceAll(",","").ReplaceAll(".0","").Trim," ","Y")
		          App.modIDMap.Value(modID)=modName.Replace(",","").Trim
		        Else
		          MainScreen.lsb_ModOrderList.AddRow("",modID,_
		          modName.Replace(",","").Trim,_
		          modOrder.ReplaceAll(",","").ReplaceAll(".0","").Trim," "," ")
		          App.modIDMap.Value(modID)=modName.Replace(",","").Trim
		        End
		      Else
		        MainScreen.lsb_ModOrderList.AddRow("",modID,_
		        modName.Replace(",","").Trim,_
		        modOrder.ReplaceAll(",","").ReplaceAll(".0","").Trim," ")
		        App.modIDMap.Value(modID)=modName.Replace(",","").Trim
		      End
		      
		    Else
		      MainScreen.lsb_ModOrderList.AddRow("???","???",_
		      "???","???","???","Y")
		    End
		  Next
		  
		  CheckEnabled
		  MainScreen.lsb_ModOrderList.SortingColumn=3
		  MainScreen.lsb_ModOrderList.Sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadMods()
		  Var modName As String
		  Var modOrder As String
		  Var modID As String
		  Var steamMod As Boolean= False
		  Var tempDict As Dictionary 
		  Var pathString() As String
		  
		  MainScreen.lsb_ModOrderList.RemoveAllRows
		  
		  // Steam Mods
		  If(App.steamUser And App.steamModsFile.Exists) Then
		    For Each item As FolderItem In App.steamModsFile.Children
		      If(item.IsFolder= False Or item.child("mod.json").Exists= False) Then
		        Continue
		      Else
		        // System.DebugLog(App.steamModsFile.child(item.Name).child("mod.json").NativePath)
		        App.modLocationMap.Value(App.steamModsFile.child(item.Name).child("mod.json").NativePath)=_
		        ParseJSON(Utils.ReadFile(App.steamModsFile.child(item.Name).child("mod.json").NativePath))
		      End
		    Next
		  End
		  
		  // Manual Mods
		  If(App.manualModsFolder.Exists) Then
		    For Each item As FolderItem In App.manualModsFolder.Children
		      If(item.IsFolder= False Or item.child("mod.json").Exists= False) Then
		        Continue
		      Else
		        App.modLocationMap.Value(App.manualModsFolder.child(item.Name).child("mod.json").NativePath)=_
		        ParseJSON(Utils.ReadFile(App.manualModsFolder.child(item.Name).child("mod.json").NativePath))
		        
		      End
		    Next
		  End
		  
		  // Populate
		  For Each modKey As String In App.modLocationMap.Keys
		    pathString= modkey.Split("/")
		    tempDict= App.modLocationMap.Value(modKey)
		    If(tempDict.HasKey("displayName") And tempDict.HasKey("defaultLoadOrder")) Then
		      modName= pathString(pathString.LastIndex-1) //tempDict.Lookup("displayName","ERR")
		      modOrder= tempDict.Lookup("defaultLoadOrder","ERR")
		      modID= modName.Left(2).Lowercase + modName.Right(2).Lowercase +_
		      modName.Length.ToString
		      
		      If(App.steamUser) Then
		        If(modKey.Contains(App.steamModsFile.NativePath)) Then
		          modID= pathString(pathString.LastIndex-1)
		          modName= tempDict.Lookup("displayName","ERR")
		          MainScreen.lsb_ModOrderList.AddRow("",modID,_
		          modName.Replace(",","").Trim,_
		          modOrder.ReplaceAll(",","").ReplaceAll(".0","").Trim," ","Y")
		          App.modIDMap.Value(modID)=modName.Replace(",","").Trim
		        Else
		          MainScreen.lsb_ModOrderList.AddRow("",modID,_
		          modName.Replace(",","").Trim,_
		          modOrder.ReplaceAll(",","").ReplaceAll(".0","").Trim," "," ")
		          App.modIDMap.Value(modID)=modName.Replace(",","").Trim
		        End
		      Else
		        MainScreen.lsb_ModOrderList.AddRow("",modID,_
		        modName.Replace(",","").Trim,_
		        modOrder.ReplaceAll(",","").ReplaceAll(".0","").Trim," ")
		        App.modIDMap.Value(modID)=modName.Replace(",","").Trim
		      End
		      
		    Else
		      modID= "?"
		      MainScreen.lsb_ModOrderList.AddRow("???","???",_
		      "???","???","???","Y")
		    End
		  Next
		  
		  CheckEnabled
		  MainScreen.lsb_ModOrderList.SortingColumn=App.COL_ORDER
		  MainScreen.lsb_ModOrderList.Sort
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RevertAll()
		  // Steam Mods
		  If(App.SteamUser) Then
		    For Each item As FolderItem In App.steamModsFile.Children
		      If(item.IsFolder= False) Then
		        Continue
		      Else
		        If(App.steamModsFile.child(item.Name).child("mod.json.bak").Exists) Then
		          App.steamModsFile.child(item.Name).child("mod.json").remove
		          
		          App.steamModsFile.child(item.Name).child("mod.json.bak")_
		          .CopyTo(App.steamModsFile.child(item.Name).child("mod.json"))
		        End
		      End
		    Next
		  End
		  
		  // Manual Mods
		  For Each item As FolderItem In App.manualModsFolder.Children
		    If(item.IsFolder= False) Then
		      Continue
		    Else
		      If(App.manualModsFolder.child(item.Name).child("mod.json.bak").Exists) Then
		        App.manualModsFolder.child(item.Name).child("mod.json").remove
		        
		        App.manualModsFolder.child(item.Name).child("mod.json.bak")_
		        .CopyTo(App.manualModsFolder.child(item.Name).child("mod.json"))
		      End
		    End
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RevertMod(modName as String) As Boolean
		  // Steam Mods
		  If(App.SteamUser) Then
		    For Each item As FolderItem In App.steamModsFile.Children
		      If(item.IsFolder= False) Then
		        Continue
		      Else
		        If(App.steamModsFile.child(item.Name).child("mod.json.bak").Exists And _
		          item.Name=modName) Then
		          App.steamModsFile.child(item.Name).child("mod.json").remove
		          
		          App.steamModsFile.child(item.Name).child("mod.json.bak")_
		          .CopyTo(App.steamModsFile.child(item.Name).child("mod.json"))
		          Return True
		        End
		      End
		    Next
		  End
		  
		  // Manual Mods
		  For Each item As FolderItem In App.manualModsFolder.Children
		    If(item.IsFolder= False) Then
		      Continue
		    Else
		      If(App.manualModsFolder.child(item.Name).child("mod.json.bak").Exists And _
		        item.Name=modName) Then
		        App.manualModsFolder.child(item.Name).child("mod.json").remove
		        
		        App.manualModsFolder.child(item.Name).child("mod.json.bak")_
		        .CopyTo(App.manualModsFolder.child(item.Name).child("mod.json"))
		        Return True
		      End
		    End
		  Next
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveDependancies()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Startup()
		  // ~/.steam/steam/steamapps/common/MechWarrior 5 Mercenaries/MW5Mercs/Mods
		  // ~/.steam/steam/steamapps/workshop/content/784080
		  
		  App.modIDMap= New Dictionary
		  App.modLocationMap= New Dictionary
		  Var settingsNotGenerated As Boolean= True
		  
		  // Settings generation
		  App.savedConfigs= Utils.CreateFolderStructure(SpecialFolder.UserHome,_
		  ".config/AlwaysOfflineSoftware/MW5LinuxModder/")
		  
		  If(App.savedConfigs.child("settings.ini").Exists) Then
		    App.savedSettings= App.savedConfigs.child("settings.ini")
		  Else
		    Utils.WriteFile(App.savedConfigs.child("settings.ini"),"", True)
		    App.savedSettings= App.savedConfigs.child("settings.ini")
		    settingsNotGenerated= False
		  End
		  
		  
		  // Either read settings, detect Steam or continue to Setup
		  If(SharedModTools.LoadSettings(0)<>"" And settingsNotGenerated) Then
		    //Settings were not generated and are not blank
		    // Check for valid Mw5 directory
		    If(utils.ValidatePath(SharedModTools.LoadSettings(0))) Then
		      App.manualModsFolder= New FolderItem(SharedModTools.LoadSettings(0))
		      App.enabledModsFile= App.manualModsFolder.Child("modlist.json")
		    Else
		      Utils.GeneratePopup(1,"Invalid MW5 Directory!","A new settings file will need to be generated, "+_
		      "Please start the app again")
		      App.savedSettings.Remove
		      Quit(1)
		    End
		    
		    // Check for valid Steam Directory
		    If(utils.ValidatePath(SharedModTools.LoadSettings(0))) Then
		      App.steamModsFile= New FolderItem(SharedModTools.LoadSettings(1))
		    Else
		      Utils.GeneratePopup(1,"Invalid Steam Directory!",_
		      "You will be marked as a non-Steam user, if this is a mistake please correct in File>Settings")
		      App.steamUser= False
		    End
		    
		    // Check for valid launch commands
		    App.launchCommand= SharedModTools.PrivilegeCommandCheck(SharedModTools.LoadSettings(2))
		    
		    // Validation passes go to mainscreen vs Setup
		    MainScreen.show
		    OpeningScreen.close
		  Else
		    // Steam auto-detection
		    If(Utils.ValidatePath("~/.steam/steam/steamapps/common/MechWarrior 5 Mercenaries/MW5Mercs/Mods")) Then
		      System.DebugLog("Found MW5!")
		      App.manualModsFolder= SpecialFolder.UserHome.child(".steam").Child("steam")_
		      .Child("steamapps").Child("common").Child("MechWarrior 5 Mercenaries")_
		      .Child("MW5Mercs").Child("Mods")
		      App.enabledModsFile= App.manualModsFolder.child("modlist.json")
		      
		      If(Utils.ValidatePath("~/.steam/steam/steamapps/workshop/content/784080")) Then
		        System.DebugLog("Found Steam Mods!")
		        App.steamModsFile= SpecialFolder.UserHome.child(".steam").Child("steam")_
		        .Child("steamapps").Child("workshop").Child("content").Child("784080")
		        App.launchCommand="steam steam://rungameid/784080"
		        
		        App.enabledModsFile= App.manualModsFolder.Child("modlist.json")
		        SharedModTools.SaveSettings(App.manualModsFolder.NativePath,App.steamModsFile.NativePath,_
		        App.launchCommand)
		        
		        MainScreen.show
		        OpeningScreen.close
		      End
		    End
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateModDictionary(targetName as String, targetLoadOrder as Variant, steamMod as boolean)
		  Var modName As String
		  Var modOrder As String
		  Var modID As Integer
		  Var modfolderI As FolderItem
		  Var tempDict As Dictionary 
		  
		  For Each modKey As String In App.modLocationMap.Keys
		    tempDict= App.modLocationMap.Value(modKey)
		    If(tempDict.HasKey("displayName") And tempDict.HasKey("defaultLoadOrder")) Then
		      modfolderI= New FolderItem(modKey)
		      modName= modfolderI.Parent.Name
		      modOrder= tempDict.Lookup("defaultLoadOrder","ERR")
		      
		      If(targetName=modName) Then
		        tempDict.Value("defaultLoadOrder")= targetLoadOrder
		        App.modLocationMap.Value(modkey)= tempDict
		      Else
		        Continue
		      End
		    End
		  Next
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
