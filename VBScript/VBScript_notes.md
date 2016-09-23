# Differences to VBA
## Named arguments
You cannot use named arguments e.g. (`Unit:=...`) in VBScript.

# Difference between wscript and cscript
http://stackoverflow.com/questions/8678441/difference-between-wscript-and-cscript
In Windows, an executable is either a console application or a Windows application (or a SFU or Native application, but that doesn't matter here).
The kernel checks a flag in the executable to determine which.
When starting using CreateProcess, if it is a console application, the kernel will create a console window for it if the parent process doesn't have one, and attach the STDIN and STDOUT and STDERR to the console.
If it is a Windows application, no console will be created and STDIN, STDOUT and STDERR will be closed by default.
WSCRIPT.EXE and CSCRIPT.EXE are almost exactly identical, except that one is flagged as a windows application and the other is flagged as a console application. (Guess which way around!)
So the answer is: If you want your script to have a console window, use CSCRIPT.EXE. If you want it to NOT have a console window, use WSCRIPT.EXE.
This also affects some behaviors, such as the `WScript.Echo` command. In a CSCRIPT.EXE this writes a line to the console window. In WSCRIPT.EXE it shows a messagebox (which blocks execution of the rest of the script).
## Double clicking in Windows Explorer
The script will be run by the default script host.
## Running from the command line
Just type the name of the script (extension optional). This will run the script with the default script host.
Alternatively, type cscript or wscript and then the script name (extension required).

# Error handling

## Handling options

The options for handling errors are:

```vb
On Error Goto <label>
On Error Resume Next
```

To reset the handling:

```
On Error Goto 0
```

## How to use `On Error Resume Next` sensibly

```vb
On Error Resume Next
'do something that may raise an error here
If Err.Number <> 0 Then
    Wscript.Echo "Error: " & Err.Number
    Wscript.Echo "Error (Hex): " & Hex(Err.Number)
    Wscript.Echo "Source: " &  Err.Source
    Wscript.Echo "Description: " &  Err.Description
    Err.Clear
    'also handle the error other than just echoing it
End If
On Error Goto 0
```

## Err.Clear

The Clear method is called automatically whenever any of the following statements executes:
- Any type of Resume statement
- Exit Sub, Exit Function, or Exit Property
- Any On Error statement

```vb
Sub ClearErr()
  ' Produce overflow error
  On Error Resume Next
  zero = 0
  result = 8 / zero
  MsgBox (Err.Description)
  Err.Clear
  MsgBox (Err.Description)
  On Error GoTo 0
End Sub
```

## Resume

```vb
Sub ResumeStatementDemo()
    On Error GoTo ErrorHandler   ' Enable error-handling routine.
    x = 32
    y = 0
    z = x / y   ' Creates a divide by zero error
    Debug.Print "Out of error handler"
    Exit Sub   ' Exit Sub to avoid error handler.
ErrorHandler:     ' Error-handling routine.
    Debug.Print "In error handler"
    y = 1 ' Sets the value of y to 1
    Resume   ' Resume execution at same line

End Sub
```


# IDEs / Tools

* Notepad++ <https://notepad-plus-plus.org/>
* VbsEdit (intrusive nags) <http://www.vbsedit.com/>
* H-two-O (compiler) <https://sourceforge.net/projects/htwoo/files/htwoo-version-3/>
* SciTE <http://www.scintilla.org/SciTE.html>
