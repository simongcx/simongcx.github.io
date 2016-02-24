dim service, Process
 

Dim objWMIService, objProcess, colProcess
Dim strComputer, strList

strComputer = "."

Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 

Set colProcess = objWMIService.ExecQuery ("Select * from Win32_Process")


Set fso = CreateObject("Scripting.FileSystemObject")

FileName = "currentlyrunningprocesses.txt"

Set MyFile = fso.OpenTextFile(FileName, 2, True)


For Each objProcess in colProcess
   MyFile.WriteLine objProcess.Name
Next

MyFile.Close


