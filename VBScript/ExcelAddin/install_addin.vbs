
 Set oWSH = CreateObject("WScript.Shell")
 vbsInterpreter = "cscript.exe"

 Call ForceConsole()

 Function printf(txt)
    WScript.StdOut.WriteLine txt
 End Function

 Function printl(txt)
    WScript.StdOut.Write txt
 End Function

 Function scanf()
    scanf = LCase(WScript.StdIn.ReadLine)
 End Function

 Function wait(n)
    WScript.Sleep Int(n * 1000)
 End Function

 Function ForceConsole()
    If InStr(LCase(WScript.FullName), vbsInterpreter) = 0 Then
        oWSH.Run vbsInterpreter & " //NoLogo " & Chr(34) & WScript.ScriptFullName & Chr(34)
        WScript.Quit
    End If
 End Function



 
 'Find the User Library Path
Set objExcel = CreateObject("Excel.Application")
printl objExcel.UserLibraryPath

' Copy the file to the path
dim filesys
set filesys=CreateObject("Scripting.FileSystemObject")
If filesys.FileExists("HelloWorld.xlam") Then
	filesys.CopyFile "HelloWorld.xlam", objExcel.UserLibraryPath
End If

'Note that a workbook is added prior to calling the Add method in this example. The Add-in Manager in Excel is not available unless there is at least one visible workbook open.
'https://support.microsoft.com/en-us/kb/280290
objExcel.Workbooks.Add
wait(1)

' Register the file as an add-in
Dim AI 'As objExcel.AddIn
Set AI = objExcel.AddIns.Add(objExcel.UserLibraryPath & "HelloWorld.xlam", True)
'AI.Installed = True
objExcel.Addins("HelloWorld").Installed = True

' Confirm that the add-in is installed
For Each AddIn In objExcel.AddIns

    printl AddIn.Name
	printl AddIn.Installed
    
Next

'If you don't do this, Excel stays open and when a subsequent instance of Excel is opened, the Add-In is not enabled
objExcel.Quit

wait(3)