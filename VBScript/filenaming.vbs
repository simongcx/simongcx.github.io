SCRNAME = Wscript.ScriptFullName			'fully qualified name of this script
SCRDESC = "Swap Names"						'text that appears in context menu

Set wso = CreateObject("Wscript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

'process each file selected by the user

For Each arg In Wscript.Arguments


Next

Function newformatcheck(strData)
     
    Set RE = CreateObject("vbscript.regexp")
    With RE
        .MultiLine = False
        .Global = False
        .IgnoreCase = True
        .Pattern = "[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}"
    End With
     
    Set REMatches = RE.Execute(strData)
    newformatcheck = ""
    On Error Resume Next
    newformatcheck = REMatches(0)
    On Error GoTo 0
End Function

Function reverseformat(date)
	reverseformat = mid(date,7,4) & "-" & mid(date,4,2) & "-" & left(date,2) & "-" & mid(date,12,2) & "-" & mid(date,15,2) & " "
End Function

strFolder = InputBox("Please enter the directory")

'Alternative folder input method:
'Set objShell  = CreateObject( "Shell.Application" )
'Set objFolder = objShell.BrowseForFolder( 0, "Select Folder", 0, myStartFolder )

'If IsObject( objfolder ) Then strFolder = objFolder.Self.Path

'MsgBox strFolder

'Create the filesystem object
Set FSO = CreateObject("Scripting.FileSystemObject")
'Get a reference to the folder you want to search
set FLD = FSO.GetFolder(strFolder)
	
For Each Fil In FLD.Files
	If newformatcheck(Fil.Name) = "" Then
		'msgbox Fil.DateLastModified
		timeanddatestamp = reverseformat(Fil.DateLastModified)
		'MsgBox Fil.Name
		If MsgBox("Do you want to rename: " & Fil.Name & vbCrLf & vbCrLf & _
              "To: " & timeanddatestamp & Fil.Name,vbYesNo + vbQuestion,"Rename?") = vbYes Then
			Fil.Name = timeanddatestamp & Fil.Name
		End If
	End If
Next
