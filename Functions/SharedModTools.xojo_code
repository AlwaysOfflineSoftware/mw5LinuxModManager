#tag Module
Protected Module SharedModTools
	#tag Method, Flags = &h0
		Sub LoadModLoadout(profileName as String)
		  Var jsonText As String= Utils.ReadFile(App.savedConfigs.child(profileName + ".txt"))
		  
		  App.modLocationMap= ParseJSON(jsonText)
		  
		  Mw5ModHandler.RefreshFromDict()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateLoadouts()
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
