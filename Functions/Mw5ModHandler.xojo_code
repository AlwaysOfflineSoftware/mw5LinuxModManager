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
		  Var modID As Integer
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
		      
		      If(modKey.Contains(App.steamModsFile.NativePath)) Then
		        MainScreen.lsb_ModOrderList.AddRow("",modID.ToString,_
		        modName.Replace(",","").Trim,_
		        modOrder.ReplaceAll(",","").ReplaceAll(".0","").Trim,"Y")
		        App.modIDMap.Value(modID)=modName.Replace(",","").Trim
		        modID= modID+1
		      Else
		        MainScreen.lsb_ModOrderList.AddRow("",modID.ToString,_
		        modName.Replace(",","").Trim,_
		        modOrder.ReplaceAll(",","").ReplaceAll(".0","").Trim," ")
		        App.modIDMap.Value(modID)=modName.Replace(",","").Trim
		        modID= modID+1
		      End
		      
		    Else
		      MainScreen.lsb_ModOrderList.AddRow("???","???",_
		      "???","???","???","Y")
		      modID= modID+1
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
		  MainScreen.lsb_ModOrderList.SortingColumn=3
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
