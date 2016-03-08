## Removing file associations

Windows makes it very easy to associate an extension with a program:

* Right click a file in Windows Explorer
* Click *Open with*
* Select *Select a program from a list of installed programs*, and click OK
* Select the program (or browse for it)
* Forget to untick *Always use selected program to open this type of file*
* Click OK

One simple mistake, forgetting to untick. And there's no undo.

### Removing file associations with a registry editor (e.g. regedit.exe)

* go to `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\`
* remove the subtree `.<ext>`
* go to `HKEY_CLASSES_ROOT\`
* remove the subtree `.<ext>`
* remove the subtree `<ext>_auto_file`

### Removing file associations on the command line
```
assoc .pf = ""
```