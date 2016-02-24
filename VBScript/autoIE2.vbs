
Set WshShell = CreateObject("WScript.Shell")

set IE = CreateObject("InternetExplorer.Application") 
IE.visible = true

WshShell.AppActivate IE.Application

IE.navigate "http://www.google.com/" & html 
while ie.busy:wend 

Const OLECMDID_SAVEAS = 4 
Const OLECMDEXECOPT_DONTPROMPTUSER = 2 

WScript.Sleep 500

WshShell.SendKeys "^s"

Do 
    bResult = WshShell.AppActivate("Save Webpage") 
    If bResult = True Then 
		'MsgBox("Got here")
        'WshShell.SendKeys "{Enter}" 
        ' or "%K" for Alt+k, for OK and "%N" (Alt+N) for Cancel
        Exit Do 
    End If 
    WScript.Sleep 500 
Loop 


WScript.Sleep 500


WshShell.SendKeys "%s"

WScript.Sleep 500

IE.Quit