
# Installing an addin

## Installation process for Excel 2013

* Copy file to: C:\Users\<username>\AppData\Roaming\Microsoft\AddIns
* In Excel navigate to File -> Options -> Addins
* Click Manage Excel Add-Ins Go...
* Click Browse
* Select File
* Click OK

## Troubleshooting installation

* Digitally sign the macro
  * Create certificate using SelfCert.exe (you'll probably need to Google this) (e.g. https://www.howto-outlook.com/howto/selfcert.htm)
  * In the Visual Basic Editor (Alt + F11), click Tools > Digital Signature
* Set the Trust Center settings
	* File > Options > Trust Center > Trust Center Settings... > Macro Settings
* Make sure the file is in a *Trusted Location*
  * File > Options > Trust Center > Trust Center Settings... > Trusted Locations > Add new location
* Make sure the file is not blocked due to being received from the Internet
  * Right click on the file in Windows Explorer
  * Click *Properties*
  * Click *Unblock*


Source: https://www.excelcampus.com/tools/how-to-install-an-excel-add-in-guide/
