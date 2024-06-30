#tag Module
Protected Module Mw5ModHandler
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
		        If(App.steamModsFile.child(item.Name).child("mod.json.bak").Exists) then
		          Continue
		        Else
		          App.steamModsFile.child(item.Name).child("mod.json")._
		          CopyTo(App.steamModsFile.child(item.Name).child("mod.json.bak"))
		        End
		      End
		    Next
		  End
		  
		  // Manual Mods
		  If(App.manualModsFile.Exists) Then
		    For Each item As FolderItem In App.manualModsFile.Children
		      If(item.DisplayName.Contains(".")) Then
		        Continue
		      Else
		        If(App.manualModsFile.child(item.Name).child("mod.json.bak").Exists) Then
		          Continue
		        Else
		          App.manualModsFile.child(item.Name).child("mod.json")._
		          CopyTo(App.manualModsFile.child(item.Name).child("mod.json.bak"))
		        End
		      End
		    Next
		  End
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckEnabled()
		  
		  If(App.enabledModsFile.Exists) Then
		    Var enabledFileContents As String= Utils.ReadFile(App.enabledModsFile.NativePath)
		    Var name As String
		    
		    For row As Integer=0 To MainScreen.lsb_ModOrderList.RowCount-1
		      name= MainScreen.lsb_ModOrderList.CellTextAt(row,2).Trim
		      // System.DebugLog(name)
		      If(enabledFileContents.Contains(name)) Then
		        MainScreen.lsb_ModOrderList.CellTextAt(row,0)="Y"
		      Else
		        MainScreen.lsb_ModOrderList.CellTextAt(row,0)=" "
		      End
		      
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshFromDict()
		  Var modName As String
		  Var modOrder As String
		  Var modID As Integer
		  Var steamMod As Boolean= False
		  Var tempDict As Dictionary 
		  
		  // Populate
		  For Each modKey As String In App.modLocationMap.Keys
		    tempDict= App.modLocationMap.Value(modKey)
		    If(tempDict.HasKey("displayName") And tempDict.HasKey("defaultLoadOrder")) Then
		      modName= tempDict.Lookup("displayName","ERR")
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
		  Var modID As Integer
		  Var steamMod As Boolean= False
		  Var tempDict As Dictionary 
		  
		  MainScreen.lsb_ModOrderList.RemoveAllRows
		  
		  // Steam Mods
		  If(App.steamUser And App.steamModsFile.Exists) Then
		    For Each item As FolderItem In App.steamModsFile.Children
		      If(item.DisplayName.Contains(".")) Then
		        Continue
		      Else
		        // System.DebugLog(App.steamModsFile.child(item.Name).child("mod.json").NativePath)
		        
		        App.modLocationMap.Value(App.steamModsFile.child(item.Name).child("mod.json").NativePath)=_
		        ParseJSON(Utils.ReadFile(App.steamModsFile.child(item.Name).child("mod.json").NativePath))
		      End
		    Next
		  End
		  
		  // Manual Mods
		  If(App.manualModsFile.Exists) Then
		    For Each item As FolderItem In App.manualModsFile.Children
		      If(item.DisplayName.Contains(".")) Then
		        Continue
		      Else
		        // System.DebugLog(App.manualModsFile.child(item.Name).child("mod.json").NativePath)
		        
		        App.modLocationMap.Value(App.manualModsFile.child(item.Name).child("mod.json").NativePath)=_
		        ParseJSON(Utils.ReadFile(App.manualModsFile.child(item.Name).child("mod.json").NativePath))
		      End
		    Next
		  End
		  
		  // Populate
		  For Each modKey As String In App.modLocationMap.Keys
		    tempDict= App.modLocationMap.Value(modKey)
		    If(tempDict.HasKey("displayName") And tempDict.HasKey("defaultLoadOrder")) Then
		      modName= tempDict.Lookup("displayName","ERR")
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
		Sub RevertToOriginal()
		  // Steam Mods
		  If(App.SteamUser) Then
		    For Each item As FolderItem In App.steamModsFile.Children
		      If(item.DisplayName.Contains(".")) Then
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
		  For Each item As FolderItem In App.manualModsFile.Children
		    If(item.DisplayName.Contains(".")) Then
		      Continue
		    Else
		      If(App.manualModsFile.child(item.Name).child("mod.json.bak").Exists) Then
		        App.manualModsFile.child(item.Name).child("mod.json").remove
		        
		        App.manualModsFile.child(item.Name).child("mod.json.bak")_
		        .CopyTo(App.manualModsFile.child(item.Name).child("mod.json"))
		      End
		    End
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateModDictionary(targetName as String, targetLoadOrder as Variant, steamMod as boolean)
		  Var modName As String
		  Var modOrder As String
		  Var modID As Integer
		  Var tempDict As Dictionary 
		  
		  For Each modKey As String In App.modLocationMap.Keys
		    tempDict= App.modLocationMap.Value(modKey)
		    If(tempDict.HasKey("displayName") And tempDict.HasKey("defaultLoadOrder")) Then
		      modName= tempDict.Lookup("displayName","ERR")
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
