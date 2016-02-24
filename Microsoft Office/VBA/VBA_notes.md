# Functions and Subroutines
## Use of parentheses
The use of `Call` statement is optional when you wish to call a subroutine or function. The purpose of the Call statement when used with a Sub is to allow you to enclose the argument list in parentheses. However, if a subroutine does not pass any arguments, then you still should not use parentheses when calling a Sub using the `Call` statement.
```
Call MySubroutine
```
If a subroutine has arguments, you must use parentheses when using the `Call` statement. If there is more than one argument, you must separate the arguments with commas.
```
Call MySubroutine(intUsageFee, intTimeInHours, "StringLiteral")
```
However, if you omit the `Call` statement you cannot use parentheses. Instead the name of the subroutine is followed by the parameters separated by spaces.
```
MySubroutine intUsageFee, intTimeInHours, "StringLiteral"
```
If you want a returned value, you can assign the function to a variable. Note that if there is one or more arguments, you must use the parentheses.
```
returnval = MyFunction
returnval = MyFunction()
returnval = MyFunction(intUsageFee, intTimeInHours, "StringLiteral")
```
If a procedure (function or sub) is called with arguments, and the call is on a line with other statements or keywords, the arguments must be enclosed in parentheses. This to distinguish the arguments belonging to the procedure call from the rest of the line. So:
```
If CheckConditions(A, B, C) = DONT_PROCEED Then
	Exit Sub
End If
```

# Referencing ranges
## Referencing cells not in the activesheet
These work:
```
myrange = Worksheets("Sheet1").Range("B1:B10")
myrange = Range(Cells(1, 2), Cells(10, 2))
```
But this doesn’t:
```
myrange = Worksheets("Sheet1").Range(Cells(1, 2), Cells(10, 2))
```
The reason is that Cells defaults to being of the active worksheet. Hence the following works:
```
myrange = Worksheets("Sheet1").Range(Worksheets("Sheet1").Cells(1, 2), Worksheets("Sheet1").Cells(10, 2))
```
Source: http://stackoverflow.com/questions/28170078/how-do-i-refer-to-a-range-in-another-worksheet-in-my-code
##Switching between addresses and row/column numbers
Getting the address of a single cell specified by row/column numbers:
```
MsgBox Cells(1, 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
```
Getting the address of a range of multiple cells specified by row/column numbers:
```
MsgBox Range(Cells(1, 1), Cells(2, 2)).Address(RowAbsolute:=False, ColumnAbsolute:=False)
```
Getting the row and column numbers from an address:
```
MsgBox Range("A1").Row & ", " & Range("A1").Column
```
## Selecting a range based on Cells
This doesn’t work:
```
Dim testrange As Range
Set testrange = ActiveSheet.Range(Cells(1, 1))
```
But this does:
```
Dim testrange As Range
Set testrange = ActiveSheet.Range(Cells(1, 1),Cells(1,1))
```
# The Range Object
## Getting a cell by index
An alternative to iterating through a range is to access specific cells by reference. The references are left to right, then top to bottom.
```
Dim myRange As Range
Set myRange = Range("A1:B2")
Debug.Print myRange(1).Value
Debug.Print myRange(2).Value
Debug.Print myRange(3).Value
Debug.Print myRange(4).Value
```
## Getting the number of cells in a range
```
Dim myRange As Range
Set myRange = Range("A1:B2")
Debug.Print myRange.Count
```
## Looping through a range object by index
Use the Count property of the range object.
```
Function concat(rng As Range)
concat = ""
For i = 1 To rng.Count
	concat = concat & rng(i).Value
Next
End Function
```

# Dealing with the file system
## Getting specific folders
```
Debug.Print "Desktop:", CreateObject("WScript.Shell").specialfolders("Desktop")
Debug.Print "AppData:", Environ("AppData")
Debug.Print "UserProfile:", Environ("USERPROFILE")
Debug.Print "Public:", Environ("PUBLIC")
Debug.Print "AllUsersProfile:", Environ("ALLUSERSPROFILE")
Debug.Print "LocalAppData:", Environ("LOCALAPPDATA")
Debug.Print "SystemDrive:", Environ("SystemDrive")
Debug.Print "SystemRoot:", Environ("SystemRoot")
Debug.Print "HomeDrive:", Environ("HOMEDRIVE")
Debug.Print "HomePath:", Environ("HOMEPATH")
Debug.Print "WinDir:", Environ("windir")
Debug.Print "CommonProgramFiles:", Environ("CommonProgramFiles")
```

# Custom ribbons and quick access
Sources:
http://blog.contextures.com/archives/2014/10/02/add-your-own-icon-to-an-excel-custom-ribbon-tab/
https://www.youtube.com/watch?v=xR3wA7TTPG4
http://stackoverflow.com/questions/8850836/how-to-add-a-custom-ribbon-tab-using-vba

* You can’t directly create a custom ribbon or quick access icons in VBA
* The configuration of custom ribbons and quick access icons is stored in a file called “Excel.officeUI” at the following path “C:\Users\<username>\AppData\Local\Microsoft\Office”
* It is possible to overwrite this file using VBA (and it may be possible to edit it using XML)
* It doesn’t seem to be possible to edit the Custom UI of a workbook that’s originally created via the dialogs in Excel using the Custom UI Editor (possibly because the custom UI that’s created in the Excel dialogs uses a different file and folder naming convention, and possibly because it uses a different relationship type)
* The following relationship type was not found to work http://schemas.microsoft.com/office/2006/relationships/ui/extensibility, however http://schemas.microsoft.com/office/2007/relationships/ui/extensibility does


http://openxmldeveloper.org/blog/b/openxmldeveloper/archive/2006/05/26/customuieditor.aspx
https://msdn.microsoft.com/en-us/library/office/ff861787.aspx

# Scheduled Execution
## Application.OnTime event
Example
```
Private Sub Say_Good_Morning()
    MsgBox "Automatic Scheduled Event: Good Morning"
End Sub

Private Sub Add_Schedule()
    'Application.OnTime Schedule_Time,"Sub Procedure Name"
    Application.OnTime VBA.Now + TimeValue("00:00:01"), "Say_Good_Morning"
End Sub
```
# Application.Wait event
```
Application.Wait (Now + TimeValue("00:00:03"))
```
# Data import

## From Text

If you record a data import *From Text* the resulting *Query Table* will have a TextFileColumnDataTypes property set within the `with` statement. This will be an array of integers, as follows:
```
.TextFileColumnDataTypes = Array(4,2,1)
```
These integers are derived from the data type names as follows:

Data type name | Data type value
---------------|----------------
General        |              1
Text           |              2
Date MDY       |              3
Date DMY       |              4
Date YMD       |              5
Date MYD       |              6
Date DYM       |              7
Date YDM       |              8
Skip           |              9

It is worth noting that this does not result in errors in the event that a *Date* data type is applied to a column that does not contain date values.

# Thoughts on VBA distribution
* Microsoft Office would benefit from some kind of package manager or app store where users can sell (or make freely available) addins for Microsoft Office products. The benefits of such a system would be:
	* A single place for users to obtain additional functionality
	* A distribution channel for addins
	* Additional confidence for users in installing addins (on the presumption that the app store undertook some malware scanning)
	* Easy setup of the users environment (ideally a single-click deploy of all add-on previously used to a fresh Office install)
* The absence of a package manager means that each Office document with VBA ends up including all the code it needs to run, rather than *requiring* other modules which are then auto-installed by the package manager

# Miscellaneous
## Running in the background
A VBA procedure will take focus until it's complete, with the exception of displaying a modeless user form, input box, or some other method of queuing user interaction. But those are all initiated by a VBA procedure, and it will continue once they're answered/dismissed.
http://www.mrexcel.com/forum/excel-questions/366014-can-visual-basic-applications-run-background.html


