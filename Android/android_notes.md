# adb
adb = Android Debug Bridge
Documentation here: http://developer.android.com/tools/help/adb.html
Add *android-sdk\tools* and *android-sdk\platform-tools* to the system path
Enable developer mode on the Android device (clicking the build number six times in Settings → System → About phone)
At the windows shell run adb logcat to see the device log

## Debugging BOOT_COMPLETED using adb

adb shell am broadcast -a android.intent.action.BOOT_COMPLETED

OR

How to test BOOT_COMPLETED without restart emulator or real device? It's easy. Try this:
```
adb -s device-or-emulator-id shell am broadcast -a android.intent.action.BOOT_COMPLETED
```
How to get device id? Get list of connected devices with id's:
```
adb devices
```

# Logcat to text file
To save LogCat to a text file open up a terminal window and type:
```
adb logcat -d > logcat.txt
```
