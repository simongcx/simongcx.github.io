# General notes

## SpriteRenderer
```
SpriteRenderer renderer = gameObject.GetComponent<SpriteRenderer>();
```
## Definingvariables

Unlike pure Javascript defining variables is required:
```javascript
var x;
```
Variables can (and should) also be typed:
```javascript
var x : int;
var myString : String;
var myGameObject : GameObject;
```
## Parameters
Unlike Javascript, parameters can (and should) be typed:
```javascript
function myfunction(x : int) {
	Debug.Log(x);
}
```
## DontDestroyOnLoad

## Accessing things

Getting a component of the GameObject which the script is attached to:
```javascript
var rb = GetComponent.<Rigidbody>();
```
Finding a GameObject by name:
```javascript
var player = GameObject.Find("MainHeroCharacter");
```
Finding a single GameObject by tag:
```javascript
cursor = GameObject.FindWithTag("Cursor");
```
Getting a list of all GameObjects with a tag:
```javascript
enemies = GameObject.FindGameObjectsWithTag("Enemy");
```
## Defining classes that aren't GameObjects
In UnityScript, each .js file is a class that inherits Monobehaviour. Monobehaviour objects cannot be instantiated via the new keyword, and hence are not suited for data classes (i.e. those that are not attached to GameObjects).

Classes that don't inherit Monobehaviour are created as follows:
```javascript
class foo {
	var bar : int;
}
```
The foo class is available in other scripts just by using foo – the filename is not required.

## Pragmastrict
Under `#pragmastrict` it is necessary to define all variables. This means that it is not possible to access multi-dimensional arrays in the following format:
```javascript
multiarray[x][y] = "hello";
```
Whilst multiarray can be defined as an array, the compiler doesn't know the type of what multiarray[x] is. The alternative is:
```javascript
var innerArray : Array = multiarray[x];
innerArray[y] = "hello";
```
## Implicitdowncast warning
To remove the implicit downcast warning, use the as keyword, e.g.:
```javascript
scoreValue = score.GetComponent(GUIText) as GUIText;
```
## Resources
All assets that are in a folder named "Resources"anywhere in the Assets folder can be accessed via the `Resources.Load` functions. Multiple "Resources" folders may exist and when loading objects each will be examined.

Example:
```javascript
var rules = Resources.Load("rules")as TextAsset;
Debug.Log(rules.text);
```
Note in the above example that the file is actually named “rules.json”, but for the purposes of the `Resources.Load` call, the extension is **not** included.

## Different usage of script files

### Monobehaviour classes

These are intended to be added as components to `GameObjects` and hence instantiated. Have `Start()` and `Update()` methods.

### Script files containing one-or-more non-Monobehaviour classes

I am using these to create data structure classes. The classes themselves are instantiated via other scripts, but the script itself isn't instantiated via attachment to a `GameObject`.

### Scriptfiles used to hold game state

I am using these to hold game state. They are not instantiated as such, but still exist by virtue of being in the Assets folder. The variables within them are declared with the static keyword and are accessible via the name of the script file without extension.

For example, to access a static variable in a filecalled GameStateManager.js, the following codes is used:
```javascript
var mapheight : int = GameStateManager.mapheight;
```
### Script files with utility functions

I am using script files with one or morenon-Monobehaviour classes to store utility functions. The script is not attached to any GameObject, and the classes are not instantiated.
```javascript
#pragma strict

public static class Utilities 
{
	//A static method can be invokedwithout an object
	//of a class. Note that staticmethods cannot access
	//non-static member variables
	public static function Add(num1: int, num2 : int) {
		return num1 + num2;
	}
}
```
The static function in the above is accessed inother scripts as follows:
```javascript
var x : int = Utilities.Add (5, 6);
```
## Lists, Javascript Arrays and built in arrays

### Javascript Arrays

Dynamically sized, weakly typed.
```javascript
var myarray = new Array();
```
As Javascript arrays are weakly typed, when using pragma strict, it is necessary to type the values the come from the array, e.g.
```javascript
var current_dog = dogs[0] as Dog;
current_dog.bark = 55.0;
```
It is possible to do this typing inline:
```javascript
(theArray[0] as Dog).bark = 55.0;
```
Note that Javascript arrays are approximate 10x slower than Lists.
### Builtin array
Statically sized, strongly typed.
```javascript
var myarray = int[];
```
### List
Dynamically sized, strongly typed.
```javascript
import System.Collections.Generic;
var blah = new List.<int>();
```
Full documentation here:

[http://msdn.microsoft.com/en-us/library/6sh2ey19.aspx](http://msdn.microsoft.com/en-us/library/6sh2ey19.aspx)

List of dictionaries (note the space between the two >s):
```javascript
var myVariable = List.<Dictionary.<String, String> >();
```
## Dictionary

## WaitForSeconds
`WaitForSeconds` can be used to wait for a certain number of seconds before the next line is executed. To allow the UI to be updated in-between, the `yield` keyword is used.
```javascritpt
yield WaitForSeconds (5);
```
## Yield

Any function with the `yield` keyword in it will executed on a separate thread. Any caller of a function that has the `yield` keyword will not wait for the completion of that function before moving onto the next line.

A coroutine is a function that can suspend its execution (`yield`) until the given `YieldInstruction` finishes.

## Showingand hiding GameObjects
```javascript
GameObject.renderer.enabled = false;
GameObject.renderer.enabled = true;
```
# GUI
## Hiding/ showing GUI
```javascript
GUIElement.enabled = false;
GUIElement.enabled = true;
```
## Preventing a click from going through GUI buttons
By default GUI buttons are transparent to clicks: a click on the button triggers a click on any GameObject underneath, which is potentially a problem for any GameObjects with clickhandlers.
The solution is `GUIUtility.hotControl`.When a GUI button is clicked on, the `GUIUtility.hotControl` is set to something other than zero, so the click handler for the GameObject can be wrapped with the following code:
```javascript
if (GUIUtility.hotControl == 0) {
	UpdateMouseInput();
}
```
# 2D
Controlling z-index in 2D games
* Order in layer / sortingOrder (called	“Order in layer” in Unity, but sortingOrder is the property of the renderer object)
* Sorting Layer
* transform.position.z

Note that “Layers” are not used to control z-index.

## Sortinglayer

Sorting layers cannot be dynamically created

There is probably a limit to the number of sortinglayers. The limit to the number of tags is 10001

# Differencesof UnityScript to Javascript

## Variadicfunctions
UnityScript does not allow variadic functions, and does not provide a `.arguments` property within functions.

## Class declarations
UnityScript allows class declarations.

## Arrays
UnityScript arrays have Add, Javascript arrays have push.

## Randomnumbers
```javascript
Random.value;
```
vs
```javascript
Math.random();
```
# Annoyancesof Unity
* Calling UnityScript Javascript
* Can't use the `GameObject.Find` method for a GameObject which is set inactive