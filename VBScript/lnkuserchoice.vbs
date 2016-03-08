Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.LNK\UserChoice","","REG_SZ"
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.LNK\UserChoice\Progid","Applications\notepad.exe","REG_SZ"
Set WshShell = Nothing