Option Explicit
'On Error Resume Next
dim fsoObject, oShell, topfolder, f, topfolderpath, FileName, MyFile, x
set fsoObject = WScript.CreateObject("Scripting.FileSystemObject")
Set oShell = CreateObject("WScript.Shell")
topfolderpath = oShell.ExpandEnvironmentStrings("%USERPROFILE%")
set topfolder = fsoObject.GetFolder(topfolderpath)



FileName = "output.txt"
Set MyFile = fsoObject.OpenTextFile(FileName, 2, True)

with topfolder
	MyFile.WriteLine "Path: " & .Path
	MyFile.WriteLine "Attributes: " & .Attributes
	MyFile.WriteLine "DateCreated: " & .DateCreated
	MyFile.WriteLine "DateLastAccessed: " & .DateLastAccessed
	MyFile.WriteLine "DateLastModified: " & .DateLastModified
	MyFile.WriteLine "Drive: " & .Drive
	MyFile.WriteLine "IsRootFolder: " & .IsRootFolder
	MyFile.WriteLine "Name: " & .Name
	MyFile.WriteLine "ParentFolder: " & .ParentFolder
	MyFile.WriteLine "Path: " & .Path
	MyFile.WriteLine "ShortName: " & .ShortName
	MyFile.WriteLine "ShortPath: " & .ShortPath
	'MyFile.WriteLine "Size: " & .Size
	MyFile.WriteLine "Type: " & .Type
end with

for each f in topfolder.SubFolders
	'WScript.Echo f.Path
	MyFile.WriteLine f.Path
next

function recursivefolderexploration(folderobj, recursionlevel)

	dim f, i
	dim space
	space = " "
	
	for i = 1 to recursionlevel
		space = space & " "
	next
	
	for each f in folderobj.SubFolders
	
		'WScript.Echo space & f.ShortName
		MyFile.WriteLine space & f.ShortName
		recursivefolderexploration f, recursionlevel + 1
		
	next

end function

on error resume next ' Need to wrap this in an error handler as get permission denied error when looping through folderobj.SubFolders
recursivefolderexploration topfolder, 0
on error goto 0

MyFile.Close

WScript.Echo "Press [ENTER] to continue..."
WScript.StdIn.ReadLine

