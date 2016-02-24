
MsgBox("Version 0.0.0.7")

Set WshShell = CreateObject("WScript.Shell")

set IE = CreateObject("InternetExplorer.Application") 
IE.visible = true

WshShell.AppActivate IE.Application

IE.navigate "http://www.google.com/" & html 
while ie.busy:wend 

Const OLECMDID_SAVEAS = 4 
Const OLECMDEXECOPT_DONTPROMPTUSER = 2 

WScript.Sleep 500

IE.ExecWB OLECMDID_SAVEAS, OLECMDEXECOPT_DONTPROMPTUSER , "ie2.htm" 

Do
    bResult = WshShell.AppActivate("Save As")
    If bResult = True Then
		'MsgBox("Got here")
        WshShell.SendKeys "{Enter}" 
        ' or "%K" for Alt+k, for OK and "%N" (Alt+N) for Cancel
        Exit Do 
    End If 
	WScript.Sleep 500
Loop 


WScript.Sleep 500

'WshShell.SendKeys "why is this not working?"

WshShell.SendKeys "%s"

'WScript.Sleep 500

IE.Quit



'"http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=hello+world"