# Design principles
## Some useful design rules I've picked up along the way (and suffered from not using)
- Don't reference global variables from within a function. A function should only reference variables created within it or passed to it. To avoid having to pass too many variables to a function, encapsulate multiple variables into objects.
- Don't use from [modulename] import *. Functions in imported modules should be accessed via modulename.functionname, and likewise classes in imported modules should be accessed via modulename.classname.
* Method should only access the properties of the same parent object.
* When declaring a variable that will have a compound structure, add a comment to give an example structure.
* Don't declare variables outside of functions or classes
* Most functions should be compliant with functional programming, including the following:
	* read data only from parameters passed (not accessing globals)
	* not modifying any of the parameters passed, where these parameters are passed by reference
	* return a value
	* Functions should be a maximum of 20 lines of code

## From Python Training for HP OSO 1999 by Guido van Rossum
> Be consistent (but not too consistent)
> Use white space judiciously
> Write appropriate comments
> Write helpful docstrings (not novels)
> Indicate unfinished business

# Other bits and pieces

## Terminating a python script
There are various methods to terminate a python script.
Using the OS module:
```Python
import os
os._exit(errorcode)
```
Using the sys modul:
```Python
import sys
sys.exit()
```
Raising a system exit error:
```Python
raise SystemExit
```
Using the in-built quit function:
```Python
quit()
```


# Procedures
## Variable length argument lists
The special syntax, `*args` and `**kwargs` in function definitions is used to pass a variable number of arguments to a function. The single asterisk form (`*args`) is used to pass a non-keyworded, variable-length argument list, and the double asterisk form (`**kwargs`) is used to pass a keyworded, variable-length argument list.
* `args` is short for arguments
* `kwargs` is short for keyword arguments
* In the function, args is a tuple and is accessed without the asterisk unless it is being passed to another function.
* In the function, kwargs is a dictionary and is accessed without the double asterisk unless it is being passed to another function.
* `args` and `kwargs` are actually only named as such by convention, and can be named anything e.g. a

`*args` example:
```Python
def simplestarargs(*args):
    for item in args:
        print item

simplestarargs(1,2,3)
```
`**kwargs` example:
```Python
def simplekwargs(**kwargs):
    for key in kwargs:
        print key, kwargs[key]

simplekwargs(arg1="blob",arg2="blab",arg3="blib",arg4="blimp")
```

### Using *args and **kwargs when calling a function
This special syntax can be used, not only in function definitions, but also when calling a function.
```Python
def test_var_args_call(arg1, arg2, arg3):
    print "arg1:", arg1
    print "arg2:", arg2
    print "arg3:", arg3

args = ("two", 3)
test_var_args_call(1, *args)
```

Results:
```Python
arg1: 1
arg2: two
arg3: 3
```

Here is an example using the keyworded form when calling a function:
```Python
def test_var_args_call(arg1, arg2, arg3):
    print "arg1:", arg1
    print "arg2:", arg2
    print "arg3:", arg3

kwargs = {"arg3": 3, "arg2": "two"}
test_var_args_call(1, **kwargs)
```
Results:
```Python
arg1: 1
arg2: two
arg3: 3
```
### Argument unpacking
The equivalent of variable length argument lists in reverse: a function with a defined set of parameters is passed either a tuple or a dictionary, i.e. the `*args` or `**kwargs` is in the function call.
```Python
def draw_point(x, y):
    print x
    print y

point_foo = (3, 4)
point_bar = {'y': 3, 'x': 2}

draw_point(*point_foo)
draw_point(**point_bar)
```
## Named arguments
With functions with named arguments, it is possible to call the function relying on order of arguments (i.e. the call does not specify the name). However, you can't pass a non-keyword argument after a keyword argument.
```Python
def namedargs(x='',y='',z=''):
    return x + y + z

print namedargs('a','b','c')
print namedargs('a')
print namedargs(x='a','b','c') # this will produce a non-keyword arg after keyword arg syntax error
```

## Lambda functions


# Modules
## Import
Python comes with a heap of functions built in. That is, they are available when you run the Python interpreter, without having to explicitly import anything further. The `range()` and `int()` functions are examples – they are available whenever you run Python. However, a Python installation also comes with other modules which are available for loading, but which are not loaded automatically (loading everything every time would use up time and memory on the computer, and if the module’s functions aren’t being used, that would be wasted effort). The random module is an example.
## Installation tools
Setuptools
pip

#  Datatypes
## Tuples

A tuple is an immutable list. A tuple can not be changed in any way once it is created. You can’t add elements to a tuple. You can’t remove elements from a tuple. You can't change the value of any element of a tuple.

A tuple is defined in the same way as a list, except that the whole set of elements is enclosed in parentheses instead of square brackets.

The elements of a tuple have a defined order, just like a list.

Tuples indices are zero-based, just like a list, so the first element of a non-empty tuple is always `t[0]`.

Tuples are faster than lists. If you’re defining a constant set of values and all you’re ever going to do with it is iterate through it, use a tuple instead of a list.

# Immutability
With an immutable type, changes to the object referred to by the name must use that name. With a mutable type, changes to the object referred to by the name do not necessarily use that name.
For example, the only way to change the value of `myint` in the below, is by using an assignment statement, i.e. `myint = `
```Python
myint = 5
myotherint = myint
myotherint = 6
print myint # prints 5
myint = 7
```
However, the value associated with “mylist” in the below can change without a “mylist = “ reference
```Python
mylist = ['a','b']
myotherlist = mylist
myotherlist.append('c')
print mylist # prints ['a','b','c']
```
An object’s mutability is determined by its type; for instance, numbers, strings and tuples are immutable, while dictionaries and lists are mutable.
User-defined types (i.e. classes) are generally mutable. There are some exceptions, such as simple sub-classes of an immutable type.

# Object-oriented programming
## `__init__`
* `__init__` is called immediately after an instance of the class is created
* `__init__` is not the the constructor of the class (something in other programming languages) as the object has already been constructed by the time `__init__` is called, and you already have a valid reference to the new instance of the class
* `__init__` is not required, but is useful to set properties at the time the instance of the class is created
* the `__init__` method never returns a value
* if an `__init__` method is used, it must (strong should) explicitly call the ancestor's `__init__` method (if it defines one)

An example of a class without `__init__` and how it could be used:
```Python
class simpleclass():
    property1 = ""
    def method1(self):
        print self.property1

instance1 = simpleclass()
instance1.method1()
instance1.property1 = 'hello'
instance1.method1()
```
An example of a class with an `__init__` and how it could be used:
```Python
class simpleclasswithinit():
    def __init__(self, property1):
        self.property1 = property1
    def method1(self):
        print self.property1

instance1 = simpleclasswithinit('blob')
instance1.method1() # prints 'blob'
instance1.property1 = 'hello'
instance1.method1() # prints 'hello'
```
## self
* When defining your class methods, you must explicitly list self as the first argument for each method (including `__init__`)
* When you call a method of an ancestor class from within your class, you must include the `self` argument
* When you call your class method from outside the class, you do not specify anything for the `self` argument. Python automatically adds the instance reference for you
* When referring to properties of the object within the class, they must be referred to with `self.<property>`
* When calling object methods within the class, they must be referred to with `self.<method>()`

## Adding properties not defined in the class statement
It is possible to add properties to an object that are not defined in the class statement. For example:
```Python
class Employee:
    pass

john = Employee() # Create an empty employee record

# Fill the fields of the record
john.name = 'John Doe'
john.dept = 'computer lab'
john.salary = 1000
```
## Inheritance


### Subclassing with `*args` and `**kwargs`
```Python
class Base(object):
    def __init__(self, *args, **kwargs): pass

class A(Base):
    def __init__(self, *args, **kwargs):
        print "A"
        super(A, self).__init__(*args, **kwargs)
```

## Abstract Base Classes
In a language that supports inheritance, an abstract class, or abstract base class (ABC), is a class that cannot be instantiated because it is either labelled as abstract or it simply specifies abstract methods (or virtual methods).
An abstract method is one with only a signature and no implementation body. It is often used to specify that a subclass must provide an implementation of the method.
```Python
class Abstract(object):
    def spam(self):
        raise NotImplementedError
```
## Mixins
From the Wikipedia article “A mixin is a class which contains a combination of methods from other classes. How such combination is done depends on the language, but it is not by inheritance”.
However, in Python a Mixin appears to be class with useful methods that is never intended to be the superclass for anything, but is intended to be inherited from by a wide range of different classes such that those classes benefit from the Mixin's methods. Note that in Python, the mechanism is by inheritance.


#  Namespaces and importing
* There is a namespace per module.
* variables that are global within a module are local to that module
* When Python imports a module, it first checks the module registry (sys.modules) to see if the module is already imported. If that’s the case, Python uses the existing module object as is.
* no matter how many times you import the module, the outer-scope code in the imported module runs only once (barring unload & reload, of course). There will not be two instances of a module in memory. The effect of subsequent imports is only to bring things into the local namespace. Note that this is the case for any type of import (`import [modulename]`, `from modulename import functionname`, `from modulename import *`)
* when you do a `from [modulename] import *` into a module that already has in it a name defined that's coming in from modulename, the variable in use will be overwritten by the one coming in
* `from [modulename] import *` basically "snapshots" all names from the module at that point in time -- if you ever rebind any of those names, the snapshot will have grown stale and all sort of problems will ensue
* use `dir()` to list the objects in the current namespace, and `dir([modulename])` to list the objects in the namespace of a particular module

## How do I share global variables across modules?
The canonical way to share information across modules within a single program is to create a special configuration module (often called config or cfg). Just import the configuration module in all modules of your application; the module then becomes available as a global name. Because there is only one instance of each module, any changes made to the module object get reflected everywhere.
### For example:
File: config.py
```Python
x = 0   # Default value of the 'x' configuration setting
```
File: mod.py
```Python
import config
config.x = 1
```
File: main.py
```Python
import config
import mod
print config.x
```
Module variables are also often used to implement the Singleton design pattern, for the same reason.

# Web scraping
## Without javascript interpretation
Use urllib2 or requests and beautiful soup or lxml
Alternatives:
Scrapy
## With javascript interpretation
### PyQt Qwebview
Use `QwebView.page().mainFrame().evaluateJavaScript(<your javascript here>);` to insert javascript into the page to emulate the users activity.
Input values into a form:
```Javascript
document.getElementById(<your id>).value = <your value>;
```
Click on an element:
```Javascript
document.getElementById(<your id>).click();
```
As the website may not be designed for programatic access, elements may not have unique identifiers. To get around this, xpath can be used:
```Javascript
document.evaluate(<xpath query>, document, null, 9, null).singleNodeValue;
```
Note that the on_loadFinished function of QwebView should be used to ensure that pages have finished loading before the javascript is run.
Where elements are inside a frame, they must be addressed via the frame:
```Javascript
frames['<frame name>'].document.getElementById(<your id>);
```
Where an attribute contains multiple space separated values (as is common in HTML class attributes), it is possible to xpath query by a particular class as follows:
```Xpath
/bookstore/book[contains(concat(' ',@class,' '),' foo ') and not(contains(concat(' ',@class,' '),' bar '))]
```

http://stackoverflow.com/questions/14208166/how-to-put-result-of-javascript-function-into-python-variable-pyqt
```Python
#!/usr/bin/env python
#-*- coding:utf-8 -*-

from PyQt4 import QtCore, QtGui, QtWebKit  

getJsValue = """ 
w = document.getElementsByTagName('p')[0];
myWindow.showMessage(w.innerHTML);
"""  

class myWindow(QtWebKit.QWebView):  
    def __init__(self, parent=None):
        super(myWindow, self).__init__(parent)

        self.page().mainFrame().addToJavaScriptWindowObject("myWindow", self)

        self.loadFinished.connect(self.on_loadFinished)

        self.load(QtCore.QUrl('http://jquery.com'))

    @QtCore.pyqtSlot(str)  
    def showMessage(self, message):
        print "Message from website:", message

    @QtCore.pyqtSlot()
    def on_loadFinished(self):
        self.page().mainFrame().evaluateJavaScript(getJsValue) 

if __name__ == "__main__":
    import sys

    app = QtGui.QApplication(sys.argv)
    app.setApplicationName('myWindow')

    main = myWindow()
    main.show()

    sys.exit(app.exec_())
```


### Selenium
Really good documentation here: http://selenium-python.readthedocs.org/

### Ghost.py
http://jeanphix.me/Ghost.py/


# Unicode

`<string>.decode(<encoding>)` converts a string to a unicode object, based on the encoding of the string. To use this correctly you need to know the encoding of the string.

If you try to call `.decode` on a unicode object, you will get an error like this:
`UnicodeEncodeError: 'ascii' codec can't encode character`

This is because Python will try to convert the unicode object to a string (using the default encoding, usually ascii) before then decoding with the encoding you provide with the parameter to the decode call. As the unicode object contains non-ascii characters the error is encountered. This error can be counter-intuitive, as the programmer is trying to decode, but get an error about encoding.

`<unicode object>.encode(<encoding>)` converts a unicode object to a string with a particular encoding.

## Diagnosing Unicode problems

To diagnose what Unicode you have, use `repr` (and see also script with lots of ways to diagnose and represent).
Remember that you IDE/command line might not be able to show Unicode characters.

## Unicode and MySQL
To deal with Unicode properly in MySQL, ensure the following:
* Make sure the database, table and column are set to UTF-8
* Make sure that the connection in Python is set to UTF-8
* To deal with 4 byte Unicode characters, make sure MySQL is 5.5.3 or higher and use the character set utf8mb4

### utf8mb4
The Version 1.2.5 Windows installer of the MySQLdb module does not support a connection setup with a characterset of utf8mb4, like this:
```Python
con = MySQLdb.connect(
    host=host,
    port=3306,
    user=user,
    passwd=password,
    db=dbname,
    charset = 'utf8mb4',
    use_unicode=True
)
```
It gives this error:
```Python
OperationalError: (2019, ""Can't initialize character set utf8mb4 (path: C:\\mysql\\\\share\\charsets\\)"")
```
To use utf8mb4, add the following code in Python:
```Python
import codecs
codecs.register(lambda name: codecs.lookup('utf8') if name == 'utf8mb4' else None)
```
In order to insert 4 byte UTF-8 characters from Windows you can use an alternatives to MySQLdb, such as the MySQL connector, available here: http://dev.mysql.com/downloads/connector/python/

Sources:
http://stackoverflow.com/questions/28540772/using-utf8mb4-in-mysql
https://mathiasbynens.be/notes/mysql-utf8mb4
http://miningthedetails.com/blog/python/TwitterStreamsPythonMySQL/
http://stackoverflow.com/questions/21517358/django-mysql-unknown-encoding-utf8mb4

## UCS-2 vs UCS-4
In a UCS-2 build, Python uses 2 bytes internally for each unicode character over \U0000ffff code point.

# subprocess

## On Windows
On Windows, this doesn't work
`subprocess.call(['dir'])`

But this does:
`subprocess.call(['dir'], shell=True)`

dir is a built in command of the shell in Windows and thus not a file available for execution as a program, which is probably why subprocess cannot find it.

This also works:

`subprocess.call(['cmd','/c''dir'], shell=True)`

The '/c' terminates the command line after execution (the '/k' switch returns the command line after execution).

#  LBYL vs EAFP
## LBYL
Look before you leap. This coding style explicitly tests for pre-conditions before making calls or lookups. This style contrasts with the EAFP approach and is characterized by the presence of many if statements.
In a multi-threaded environment, the LBYL approach can risk introducing a race condition between “the looking” and “the leaping”. For example, the code, if key in mapping: return mapping[key] can fail if another thread removes key from mapping after the test, but before the lookup. This issue can be solved with locks or by using the EAFP approach.
## EAFP
Easier to ask for forgiveness than permission. This common Python coding style assumes the existence of valid keys or attributes and catches exceptions if the assumption proves false. This clean and fast style is characterized by the presence of many try and except statements. The technique contrasts with the LBYL style common to many other languages such as C.
#  Threading
# Sharing global variable between threads
Need to use the global keyword in any thread that writes to the global variable.
```Python
from threading import Thread
import time
a = 0  #global variable

def thread1(threadname):
    #read variable "a" modify by thread 2

def thread2(threadname):
    global a
    while 1:
        a += 1
        time.sleep(1)

thread1 = Thread( target=thread1, args=("Thread-1", ) )
thread2 = Thread( target=thread2, args=("Thread-2", ) )

thread1.join()
thread2.join()
```

# Python path

This is how `sys.path` is populated on Windows (from https://docs.python.org/2/using/windows.html):

An empty entry is added at the start, which corresponds to the current directory.
* If the environment variable PYTHONPATH exists, as described in Environment variables, its entries are added next. Note that on Windows, paths in this variable must be separated by semicolons, to distinguish them from the colon used in drive identifiers (C:\ etc.).
* Additional “application paths” can be added in the registry as subkeys of \SOFTWARE\Python\PythonCore\version\PythonPath under both the HKEY_CURRENT_USER and HKEY_LOCAL_MACHINE hives. Subkeys which have semicolon-delimited path strings as their default value will cause each path to be added to sys.path. (Note that all known installers only use HKLM, so HKCU is typically empty.)
* If the environment variable PYTHONHOME is set, it is assumed as “Python Home”. Otherwise, the path of the main Python executable is used to locate a “landmark file” (Lib\os.py) to deduce the “Python Home”. If a Python home is found, the relevant sub-directories added to sys.path (Lib, plat-win, etc) are based on that folder. Otherwise, the core Python path is constructed from the PythonPath stored in the registry.
* If the Python Home cannot be located, no PYTHONPATH is specified in the environment, and no registry entries can be found, a default path with relative entries is used (e.g. .\Lib;.\plat-win, etc).

Other notes on the Python path
* In a default installation of Python on Windows, the PYTHONPATH is not set.
* The PYTHONPATH can be set in Control Panel > System and Security > System > Advanced system settings > Environment variables
* Environment variables are stored in HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment
* PYTHONPATH != sys.path (PYTHONPATH is an environment variable that's used to populate the Python path, which can be accessed within Python from sys.path)

## Setting the PYTHONPATH on the Windows command line

Set the PYTHONPATH only for session
```Batchfile
set PYTHONPATH=C:\Python27;C:\MyFolder;etc
```
Update Python Path (persists only for session)
```bat
set PYTHONPATH=%PYTHONPATH%;C:\MyFolder;etc
```

Set Python Path (permanently)
```Batchfile
setx PYTHONPATH C:\Python27;C:\MyFolder;etc
```
Update Python Path (permanently)
```Batchfile
setx PYTHONPATH %PYTHONPATH%;C:\MyFolder;etc
```

Add the /M switch to set the Python Path at the SYSTEM scope
```Batchfile
setx PYTHONPATH /M C:\Python27;C:\MyFolder;etc
```

To see the Python path on the command line, use:
```Batchfile
echo %PYTHONPATH%
```
Note that you won't see the new value when you `echo %PATH%` just after setting it in cmd, you need to close cmd and open again.

As %PYTHONPATH% returns the concatenation of SYSTEM and USER values, take care if there are both SYSTEM and USER values for PYTHONPATH.

setx is built into Windows 7, but for older versions may only be available if you install the Windows Resource Kit

## Adding to the Python path using pth files

* Navigate to the Python installation directory (e.g. C:\Python27)
* Open Lib/site-packages.
* Add an .pth empty file to this folder.
* Add the required paths to the file, one per each line.

## Dynamically adding to the Python path
```Python
import sys
sys.path.append('/path/to/dir')
```
Note, this is not persistent

# Packages

## __init__.py

The __init__.py file makes Python treat directories containing it as packages.

Furthermore, this is the first file to be loaded in a module, so you can use it to execute code that you want to run each time a module is loaded, or specify the submodules to be exported.

If a .py (e.g. foo.py) file is in a folder on the PYTHONPATH it can be imported with `import foo`.

If a .py file is in a folder that itself is on the PYTHONPATH it can be imported with `from foldername import filename`, but only if there's an __init__.py file in the folder.

#  Miscellaneous
## Multi-line strings

Backslash method
```Python
sql = "select * from some_table \
where id > 10"
```
Triple-quote method
```Python
sql = """select * from some_table
where id > 10"""
```
Parentheses method
```Python
sql = ("select * from some_table " # <-- no comma, whitespace at end
       "where id > 10 "
       "order by name")
```
This method has the advantage of allowing indenting. Note that no comma in the above (that would be a tuple).


## Installing Setuptools
* Securely download ez_setup.py.
* Run cmd as administrator
* Run the following
* `C:\> C:\python27\python ez_setup.py`

## Installing Pip
* Securely download get-pip.py.
* Run cmd as administrator
* Run the following
* `C:\> C:\python27\python get-pip.py`

## Installing using Pip and easy_install

`C:\> C:\python27\scripts\pip install <packagename>`

`C:\> C:\python27\scripts\easy_install <packagename>`

But probably better to add `C:\python27\scripts\` to the Windows PATH.

It is possible to install a git, see:

https://pip.pypa.io/en/latest/reference/pip_install.html#vcs-support