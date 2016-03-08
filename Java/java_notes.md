# Terminology about Java

SE = Standard Edition

EE = Enterprise Edition

ME = Micro Edition

SDK = Software Development Kit

JRE = Java Runtime Environment

# Keyword summary

| **Keyword**      | **Meaning**                              |
| ---------------- | ---------------------------------------- |
| Private / Public |                                          |
| Static           |                                          |
| Final            | the final keyword is used in several different			contexts to define an entity which cannot later be changed:							final classes cannot be subclassed				final methods cannot be overridden or				hidden by subclasses				final variables can only be initialised				once  (Note: If the variable is a reference, this means that the				variable cannot be re-bound to reference another object. But the				object that it references is still mutable, if it was originally				mutable.) |
| Void             | All methods have to have a return type			specified, even if it's void. |
| Super            | Used to invoke the method of a superclass |
| Extends          | Extends is for extending a class         |
| Implements       | Implements is for implementing an interface |
| Protected        |                                          |
| Throws           |                                          |

# Interfaces

Although classes can only extend one class, they can implement many interfaces. As such, interfaces are a convenient way to get common functionality into classes.

# Field variables (or Instance variables)

# Main method

# Classpath

When the Java VM runs your program it searches for application .class files using the paths listed in your CLASSPATH environment variable. To run a simple Java application, you do not need to set a CLASSPATH environment variable; the Java VM looks for classes in the current working directory by default. However, if your program uses classes that are not in the current working directory, then you need to explicitly set your CLASSPATH environment variable to list all the directories containing classes used by this application. In addition, if your program uses classes contained in a JAR (Java ARchive) file, then the JAR file must be listed in your CLASSPATH. A JAR file is a single file that contains many .class files.

# Thread

## Join method

The calling thread wait for the thread that this is called on to die.

If a time is specified, the calling thread waitsat most that number of milliseconds for the thread that it is calledon to die, otherwise continues.

# Free functions and class methods

A free function is a non-member function. Java hasno support for free functions.

However, methods can be invoked without instantiating a class provided such methods are static. Hence it is possible to implement procedural programming paradigms in Java.

Here's an example:

callingmethodsofclasswithoutinstantiatingclass.java

```java

packagecallingmethodsofclasswithoutinstantiatingclass;

public class CallingMethodsOfClassWithoutInstantiatingClass {

	public static void main(String[]args) {

		String mystring = "hello";

		thisiswhereisamstoringmethods.printstring(mystring);

	}

}
```

callingmethodsofclasswithoutinstantiatingclass.java
```java

packagecallingmethodsofclasswithoutinstantiatingclass;

public class thisiswhereisamstoringmethods {

	public static voidprintstring(String inputstring) {

		System.out.println(inputstring);

	}

}
```