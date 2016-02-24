dim service, Process
 
set service = GetObject ("winmgmts:")

Const ForReading = 1, ForWriting = 2, ForAppending = 8
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0
Dim fso, MyFile, FileName, TextLine

Set fso = CreateObject("Scripting.FileSystemObject")

FileName = "currentlyrunningprocesses.txt"

Set MyFile = fso.OpenTextFile(FileName, ForWriting, True)

for each Process in Service.InstancesOf ("Win32_Process")
	MyFile.WriteLine Process.Name & ", " & Process.ExecutablePath
next

MyFile.Close