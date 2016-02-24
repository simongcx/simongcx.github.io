Option Explicit
On Error Resume Next
dim fsoObject, drive1, drive2
set fsoObject = WScript.CreateObject("Scripting.FileSystemObject")
set drive1 = fsoObject.GetDrive(fsoObject.GetDriveName("c:"))

msgbox "FreeSpace: " & drive1.FreeSpace
msgbox "AvailableSpace: " & drive1.AvailableSpace
msgbox "DriveLetter: " & drive1.DriveLetter
'DriveType, FileSystem, FreeSpace, IsReady,
'Path, RootFolder, SerialNumber, ShareName,
'TotalSize, VolumeName.
