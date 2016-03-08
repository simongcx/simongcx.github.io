# General things

## Single HTML file

From:[https://forums.html5dev-software.intel.com/viewtopic.php?f=29&t=5526](https://forums.html5dev-software.intel.com/viewtopic.php?f=29&t=5526)

Generally mobile applications are single page applications - The DOM is loaded through one html file (index.html) and subsequent modifications to the DOM and/or other logic arehandled through javascript either locally or through ajax calls. Unlike regular websites you don't want to load pages sequentially as required, instead you load the DOM once and show/modify/hide elements or bring new content through JavaScript. 

For your case, looks like you want to create multiple pages in your app. That you can create using divs. Any ofthe UI frameworks - App Framework, jQuery Mobile or Bootstrap helps you create responsive UI with multiple pages. All the pages (divs) remain in the same index.html file.

## Templates

Use Templates → Blank Cordova Starter

# Plugins

## Cordova-plugin-local-notifications

How to install in XDK:

* Go to Project page → Plugins and Permissions → Third Party Plugins
* Click “Get Plugin from the Web”
* Enter the following details:
  * Name: LocalNotification
  * Plugin ID: de.appplant.cordova.plugin.local-notification
  * Repo URL: https://github.com/katzer/cordova-plugin-local-notifications.git