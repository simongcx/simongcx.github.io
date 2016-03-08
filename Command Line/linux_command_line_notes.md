TTY = Teletypewriter – a native terminal device
PTY = Pseudo Teletypewriter - is a terminal device which is emulated by an other program (example: xterm, screen, or ssh are such programs
PTS = Pseudo Terminal Slave

# info
info reads documentation in the info format
n goes to the next page.
p goes to the previous page.
u goes to the upper page.
l goes to the last visited node
Moving the cursor over a link (a word preceded by a * ) and pressing the enter key follows a cross reference.
q quits from info

# ctrl + c
Used to cancel a running command


# x11vnc
To run x11vnc in the background and forever, use the following command:
```
x11vnc -forever -bg
```
To run x11vnc with a tray icon:
```
x11vnc -gui tray
```

# Redirection
Redirection operator | Description
---------------------|------------
`>` | Writes the command output to a file or a device, such as a printer, instead of the Command Prompt window.
`<` | Reads the command input from a file, instead of reading input from the keyboard.
`>>` | Appends the command output to the end of a file without deleting the information that is already in the file.
`>&` | Writes the output from one handle to the input of another handle.
`<&` | Reads the input from one handle and writes it to the output of another handle.
&#124; | Reads the output from one command and writes it to the input of another command. Also known as a pipe.



Handle | Numeric equivalent of handle | Description
-------|------------------------------|------------
STDIN | 0 | Keyboard input
STDOUT | 1 | Output to the Command Prompt window
STDERR | 2 | Error output to the Command Prompt window

```
echo test > myfile.txt
echo test 1> myfile.txt
```
The command `echo test` writes "test" to stdout. The `>` redirects this to myfile.txt.

`1>` means redirect stdout to myfile.txt.

`2>` means redirect the stderr to.

`2>&1` means redirect the stderr to stdout

# ps
```
ps ax -l -u simon
ps x -l -u simon
```