# Functions
Defining a function using the function statement/declaration:
```Javascript
function eatCake(){
    alert("So delicious and moist");
};
eatCake();
```
Defining an anonymous function assigned to a variable:
```Javascript
var eatCakeAnon = function(){
    alert("So delicious and moist");
};
eatCakeAnon();
```
The above is an anonymous function, as it uses the function operator/expression to create the function rather than the function statement.
Anonymous functions can also be used without assigning them to variables, for example:
```Javascript
(function (msg){alert(msg)})('SO');

(function (){alert("blob")})();
```
Functions can also be defined via a function constructor:
```Javascript
var sum = new Function('a','b', 'return a + b;');
alert(sum(10, 20)); //alerts 30
```
## Function declaration vs function expression
This is a function declaration:
```Javascript
function abc(){}
```
This is an anonymous function expression:
```Javascript
var xyz = function(){};
```
This is a named function expression:
```Javascript
var xyz = function abc(){};
```
Differences:
* Function declarations are defined at parse-time, function expressions are defined at run-time
* Functions defined by function declaration can be accessed both before and after the declaration within the same code block

# Closures
Whenever you see the function keyword within another function, the inner function has access to variables in the outer function.
A closure is formed when one of those inner functions is made accessible outside of the function in which it was contained, so that it may be executed after the outer function has returned. At which point it still has access to the local variables, parameters and inner function declarations of its outer function. Those local variables, parameter and function declarations (initially) have the values that they had when the outer function returned and may be interacted with by the inner function.
Changes to variables that are within the closure that occur are made after the closure is declared will change the closure:
```Javascript
function func1() {
    var mystring = "hello";
    var func2 = function () {
        console.log(mystring);
    };
    mystring = "goodbye";
    return func2;
}

func3 = func1();

func3(); // “goodbye”
```

In the below example, two closures created in the same function share a common variable. Calling each of the closures changes that shared variable.
```Javascript
function func1() {
    var mystring = "hello";
    var func2 = function () {
        console.log(mystring);
        mystring = "gutentag";
    };
    var func3 = function () {
        console.log(mystring);
        mystring = "goodbye";
    };
    return [func2,func3];
}

myarray = func1();

myarray[0](); // hello

myarray[1](); //gutentag

myarray[0](); //goodbye
```

Note that subsequent calls to the function that created the closure do not have any effect:
```Javascript
function func1(myvar) {
    var func2 = function () {
        console.log(myvar);
    };
    return func2;
}

func3 = func1("hello");

func3(); // hello

func4 = func1("goodbye");

func3(); // hello
```

To create multiple different closures from the same function scope (which is often done when iterating through an array), the closure must be created in a function that is passed the variables (rather than relying on its access to them via its parents scope) and returns a  function.
For example:
```Javascript
function lockingscope(){
    for (var i = 0; i < myarray.length; i++) {

	var message = myarray[i];

	var closureconstructor = function(input) {
	    var showmessage = function() {
		alert(input);
	    }
	    return showmessage;
	}

	var clickfunc = closureconstructor(message);
	var button = document.createElement("button");
	button.addEventListener("click", clickfunc);
	button.appendChild(document.createTextNode(i));
	document.getElementById("mydiv").appendChild(button);
    }
}
```
It is worth noting that the following will not produce the required results, as the closure constructor is relying on the variable scope of its parent, rather than being passed the variables:
```Javascript
function dontrelyonparentsscope(){
    for (var i = 0; i < myarray.length; i++) {

	var message = myarray[i];

	var closureconstructor = function() {
	    var showmessage = function() {
		alert(message);
	    }
	    return showmessage;
	}

	var clickfunc = closureconstructor(message);
	var button = document.createElement("button");
	button.addEventListener("click", clickfunc);
	button.appendChild(document.createTextNode(i));
	document.getElementById("mydiv").appendChild(button);
    }
}
```
# Apply
Calls a function with a given this value and arguments provided as an array (or an array like object).
Here's an example using apply to use an array to provide the arguments:
```Javascript
function sum(a,b) {
    return a + b;
}

var g = [1,2];

console.log(sum.apply(null,g));
```

# Global Variables
To get all global variables, use:
```Javascript
Object.keys( window );
```
# Variable scope
* To declare a global variable outside a function or statement (e.g. if statement), declare with or without the var statement
* To declare a global variable in a statement (e.g. if statement), use the var statement
* To declare a global variable inside a function, don't use the var statement
* To declare a local variable inside a function, use the var statement

# By reference or by value?
Strings, numbers, arrays: by value
```Javascript
myarray = ['a','b','c'];

function addtoarray(array) {
    array.push('d');
}

console.log(myarray); //['a','b','c']
```
Objects: by reference (but be careful of object's functions)
```Javascript
function myobject() {
	this.value = 5;
}
myobject.prototype.add = function() {
	this.value++;
}
var o = new myobject();
alert(o.value); // o.value = 5
o.add();
alert(o.value); // o.value = 6
function objectchanger(fnc) {
	fnc(); // runs the function being passed in
}
objectchanger(o.add);
alert(o.value); // sorry, still just 6
```
The problem here is the use of the ‘this’ keyword. It’s a handy short-hand for referring to the current object context. When passing a function as a parameter, though, the context is lost.
# Objects
Adding a function to an object:
```Javascript
var myObject = {
    "key" : function(){alert("hello")};
};
myObject.key()
```
# Object oriented Javascript
Approaches to objected oriented Javascript:
* Object literal pattern
* Pseudo classical pattern
* Prototype pattern (is this the same thing as Pseudo classical?)
* Factory pattern
* Parasitic Constructor Pattern
* OLOO Pattern
* Dynamic Prototype Pattern
* Constructor Pattern

Pattern name | Uses “new” | Uses return | instanceOf works | Methods copied to all instances | Private methods and properties
-------------|---------------

https://john-dugan.com/object-oriented-javascript-pattern-comparison/
http://javascript.info/tutorial/oop

## Pseudo classical pattern

```Javascript
// inheritance function that will be used by all
function inherit(proto) {
  function F() {}
  F.prototype = proto;
  return new F;
}

// Animal
function Animal(name) {
  this.name = name;
}
 
// Animal methods
Animal.prototype = {
  canWalk: true,
  sit: function() {
    this.canWalk = false;
    console.log(this.name + ' sits down.');
  }
};
 
// Rabbit
function Rabbit(name) {
  this.name = name;
}
 
// inherit
Rabbit.prototype = inherit(Animal.prototype);
 
// Rabbit methods
Rabbit.prototype.sit = function() {
  this.canWalk = false;
  console.log(this.name + ' sits and wiggles his ears');
};
Rabbit.prototype.jump = function() {
  this.canWalk = true;
  console.log(this.name + ' jumps!');
};
 
// Usage
var rabbit = new Rabbit('Sniffer');
 
rabbit.sit();   // Sniffer sits and wiggles his ears (note that parent is overridden)
rabbit.jump();  // Sniffer jumps!
```
# Error logging
```Javascript
alert(“hello world”);
document.write("hello world"); 
document.writeln(“hello world”);
console.log(“hello world”);
```
# Semicolons
Semicolons are optional(ish). Good practise is to use them at the end of every line.
Semicolons are not required at the end of blocks (for, while, do, if, function):
```Javascript
if (i > 0){
 i--;
}
```
and
```Javascript
function foo() {
  alert("bar");
}
```
But blocks can be part of variable assignment, in which case semicolons are required:
```Javascript
var foo = function() {
  alert("bar");
};
```
# Arrays
How to clear an array. DO NOT USE:
``` Javascript
A = [];
```
This creates another array. Instead use:
```Javascript
A.length = 0;
```
Using assignment creates a reference to the array:
```Javascript
var arr1 = ['a','b','c'];
var arr2 = arr1;
arr2.push('d');  //now, arr1 = ['a','b','c','d']
```
The concat method does not change the existing arrays, but returns a new array, containing the values of the joined arrays.
To add an array (b) to an existing array (a), use:
```Javascript
Array.prototype.push.apply(a,b);
```
# Quirks
* `<object>.offsetLeft;` is a read-only property
* you can't retrieve the style values using ob.style.width unless they've been set using an inline style
* sometimes not using var in for loops seems to cause errors, so always do as follows
```Javascript
for (var x = 0; x < 10; x++) {
	<do something>
}
```
* objects and arrays are mutable. This can make them very tricky to debug. For example, if you `console.log` an object in Google Chrome, then edit the object, then have an error, the properties of the object shown in the console will be as they were at the time of the error, not as they were at the time they were console.logged

## Indentation and new line standards
* Opening curly bracket should be on the same line as the statement that opened it, separated by one space
* Closing curly bracket should be at the same indentation level as the statement that called it:
```Javascript
function sayhello() {
    alert('hello')
}
```

# What Javascript is missing
* A pause/sleep/wait function
* For item in array

# AJAX

## Useful AJAX functions
```Javascript
xmlhttp.getAllResponseHeaders();
xmlhttp.getResponseHeader(“name”);
```

# this
In JavaScript this always refers to the “owner” of the function we're executing, or rather, to the object that a function is a method of. When we define our faithful function doSomething() in a page, its owner is the page, or rather, the window object (or global object) of JavaScript. An onclick property, though, is owned by the HTML element it belongs to.

# Equivalents of Python code
## Equivalent of Python's `quit()`
```Javascript
throw "stop execution";
```

# Dates
## Incrementing a date by one day
```Javascript
var d = new Date();
d.setDate(d.getDate() + 1);
```