
set RawProc = GetObject("winmgmts:" & "Win32_PerfRawdata_Perfproc_process." & "name='EXCEL'")
set CookedProc = GetObject("winmgmts:" & "Win32_Perfformatteddata_Perfproc_process." & "name='EXCEL'")


Dim fso, MyFile, FileName, TextLine

Set fso = CreateObject("Scripting.FileSystemObject")

FileName = "performancelog.txt"

Set MyFile = fso.OpenTextFile(FileName, 2, True)

dim counter

counter = 0

While (counter < 1000)
    MyFile.WriteLine Now() & "," & RawProc.IODataOperationsPerSec & "," & CookedProc.IODataOperationsPerSec 
    Wscript.Sleep 1000
    counter = counter + 1

    RawProc.Refresh_
    CookedProc.Refresh_

Wend


MyFile.Close
