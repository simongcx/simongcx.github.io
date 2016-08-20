# Components of a Chrome Extension

* Content scripts
* Background scripts
* Popup scripts
* Popup page

# When are scripts run?

Background scripts are run once when the extension is loaded. However, a typical use case is to add event listeners such that parts of the background script code are run later upon particular events.

Content scripts are run each time a matching page is loaded.

Popup scripts are run each time the popup page is loaded.

# How to communicate between the different types of scripts

Message passing
https://developer.chrome.com/extensions/messaging

# Content scripts
Content scripts are very useful as they are in the context of a loaded web page, and therefore have access to that webpage's DOM, etc. However, they only have limited access to the Chrome Extension API. For example, they are not able to add/edit/remove cookies. To access the other parts of the API it is necessary to put the relevant code in a background script, and then make requests from the content script to the background script.