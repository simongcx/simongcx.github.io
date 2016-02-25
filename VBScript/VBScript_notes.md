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

# IDEs / Tools

* Notepad++ <https://notepad-plus-plus.org/>
* VbsEdit (intrusive nags) <http://www.vbsedit.com/>
* H-two-O (compiler) <https://sourceforge.net/projects/htwoo/files/htwoo-version-3/>
* SciTE <http://www.scintilla.org/SciTE.html>
