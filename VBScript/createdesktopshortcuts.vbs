
function createDesktopShortcut(name, path)

	Set shortcut = CreateObject("WScript.Shell").CreateShortcut(CreateObject("WScript.Shell").SpecialFolders("Desktop") & + "\" + name + ".lnk")
	shortcut.Description = name
	shortcut.TargetPath = path
	shortcut.Arguments = "/Arguments:Shortcut"
	shortcut.Save

end function


Set objFSO = CreateObject("Scripting.FileSystemObject")

for each spec in CreateObject("WScript.Shell").SpecialFolders
	'msgbox spec
	'Wscript.Echo "Absolute path: " & objFSO.GetAbsolutePathName(spec)
	'Wscript.Echo "Parent folder: " & objFSO.GetParentFolderName(spec)
	'Wscript.Echo "File name: " & objFSO.GetFileName(spec)
	'Wscript.Echo "Base name: " & objFSO.GetBaseName(spec)
	'Wscript.Echo "Extension name: " & objFSO.GetExtensionName(spec)
	
	createDesktopShortcut objFSO.GetFileName(spec), spec
next
