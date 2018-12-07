# General concepts
## Minimum code required
In the 1930s Alan Turing developed the model to solve a famous problem posed by David Hilbert in 1928.
The problem, known as the Entscheidungsproblem (German for “decision problem”) asked for an algorithm that could determine the truth or falsehood of a mathematical statement. To solve the problem, Turing first needed a formal model of an algorithm. For this, he invented the machine model that is now known as a Turing machine and defined an algorithm as any Turing Machine that is guaranteed to eventually halt on any input.
With the model, Turing was able to show that any machine could be simulated by a universal machine with a few very simple operations. The operations he used can be viewed as equivalent to

* being able to define and use procedures
* being able to make decisions using if
* being able to do simple arithmetic and comparisons

Turing also proved that there are some problems that cannot be solved by any algorithm. The most famous example of which is that it is impossible for a program to determine in general if another program will run forever or eventually finish executing.

Source: adapted from David Evans, Introduction to Computing: Explorations in Language, Logic, and Machines, available free from http://www.computingbook.org.
## Abstraction
In computer science, we take the notion of abstraction very concretely, deﬁning it to be a statement of ‘‘what the entity does’’ and ignoring the details of ‘‘how it does it.’’ This functional description must capture all that needs to be known in order to use the entity’s services, and nothing more. All the work, cleverness, information, and drama that went into the entity’s implementation are concealed from the client who is supposed to use it, since they are simply irrelevant. The articulation, use, and implementation of such abstractions are the bread and butter of our professional practice: Every hardware and software developer is routinely deﬁning abstractions (also called ‘‘interfaces’’) and then implementing them, or asking other people to implement them. The abstractions are often built layer upon layer, resulting in higher and higher levels of capabilities.

Source: Nand2Tetris, Noam Nisan and Shimon Schocken, Introduction

## Universality/generality
## Recursion
## Dimensions of programming
### Efficiency
### Features
### Elegance
#### Clarity
#### Simplicity
#### Generality
#### Extensibility
### Correctness

#Multi-threading
## Thread safety
A piece of code is thread-safe if it only manipulates shared data structures in a manner that guarantees safe execution by multiple threads at the same time.

# Functional programming
## Argument vs Parameter

Definition 1:
Parameters refer to the local names in the callee
Arguments refer to the values passed by the caller

Definition 2:
Arguments are specific instances of a parameters

My definition:
Parameters are the inputs to a function from the function's perspective. The function says “I'm defined with three input parameters”.
Arguments are the inputs to a function from the caller's perspective. The caller says “I'm going to call this such and such function with the following arguments”

## Procedural Abstraction
## Recursive procedures
## Overloading
## Optional parameters
## Anonymous functions
## Function doc-strings
Function doc-strings should make clear the following:
* The purpose of the function
* The format of the parameters
* The format of the return value(s)
* Side-effects: none OR list of variables modified
* Global variables read: none OR list of variables or files read
* Functions called

## Arity
The arity of a function or operation is the number of arguments or operands the function or operation accepts.
* A nullary function takes no arguments.
* A unary function takes one argument.
* A binary function takes two arguments.
* A ternary function takes three arguments.
* An n-ary function takes n arguments.
A function accepting a variable number of arguments is called variadic.

# Operators
## Logical operators
## Arithmetic operators
## Concatenation operators
## Comparison operators

# Control flow statements
## Conditional statements
## Loops
### Count-controlled loops
### Condition-controlled loops
### Collection-controlled loops
### General iteration
### Continuation with next iteration
### Early exit from loops

# Variables
## Declaration statements
## Assignment statements
## Object variables
## Scope and lifetime
## Global variables

# Arrays
## Static array
## Dynamic array
## Multi-dimensional arrays

# Data types
## Static vs dynamic typing
## Strong vs weak typing
## Type conversion
### Explicit conversion
### Implicit conversion

# Object oriented programming
## My personal OOP epiphany
It avoids you having to pass multiple parameters from function to function, as you can use variables that are "global" to the objects namespace, but aren't globals.
By grouping a set of functions that use common variables into a single object, you can avoid having to pass parameters from one function to the next.
## Properties
## Methods
## Object model/hierarchy
## Collections
## Immutability/mutability
## Inheritance
## Collections
## Abstract Classes and Abstract Base Classes
## Mixin
From the Wikipedia article “A mixin is a class which contains a combination of methods from other classes. How such combination is done depends on the language, but it is not by inheritance”.
However, in Python a Mixin appears to be class with useful methods that is never intended to be the superclass for anything, but is intended to be inherited from by a wide range of different classes such that those classes benefit from the Mixin's methods. Note that in Python, the mechanism is by inheritance.
## Interface

# User Interfaces
There are three key ways to interface with an application:
* command line interface (CLI);
* graphical user interface (GUI or UI); and
* application programming interface (API).
GUIs are entirely intended to be used by human user (although access by other applications is possible); CLIs are intended to be used both by a human user, and also called by other applications; and APIs are intended to be used by other applications.

#  Graphical User Interface
## GUI widgets
### Command input
### Data input-output
### Informational
### Containers
### Navigational
### Special windows

#  String manipulation

#  Regular expressions
#  Error handling

# Testing
## Regression testing
## User Acceptance Testing
## Unit test
##Continuous Integration Testing

# Code analysis
## Static Code Analysis
## Dynamic Code Analysis
## Call Graph

# Persistence

# Parsing, Interpreters and Compilers

# Patterns
## Singleton pattern
The singleton pattern is a design pattern that restricts the instantiation of a class to one object. This is useful when exactly one object is needed to coordinate actions across the system. The concept is sometimes generalized to systems that operate more efficiently when only one object exists, or that restrict the instantiation to a certain number of objects. The term comes from the mathematical concept of a singleton.
## Dependency injection

# Anti-patterns

# Code formatting
## Indent Style
An indent style is a convention governing the indentation of blocks of code to convey a program's structure.
The common styles are the Allman and Kernigan and Richie (K&R) with its derivative the One True Brace Style (OTBS). The difference between K&R style and Allman style is that K&R style places the opening brace on the same line as the control statement.
Note that for both the Allman and K&R styles, the opening brace is on a subsequent line for functions and classes.
http://en.wikipedia.org/wiki/Indent_style

# LBYL vs EAFP
## LBYL
Look before you leap. This coding style explicitly tests for pre-conditions before making calls or lookups. This style contrasts with the EAFP approach and is characterized by the presence of many if statements.
In a multi-threaded environment, the LBYL approach can risk introducing a race condition between “the looking” and “the leaping”. For example, the code, if key in mapping: return mapping[key] can fail if another thread removes key from mapping after the test, but before the lookup. This issue can be solved with locks or by using the EAFP approach.
## EAFP
Easier to ask for forgiveness than permission. This common Python coding style assumes the existence of valid keys or attributes and catches exceptions if the assumption proves false. This clean and fast style is characterized by the presence of many try and except statements. The technique contrasts with the LBYL style common to many other languages such as C.

# Programming paradigms
http://en.wikipedia.org/wiki/Comparison_of_programming_paradigms
Main programming paradigms:
Imperative programming – defines computation as statements that change a program state
Procedural programming, structured programming – specifies the steps the program must take to reach the desired state.
Declarative programming – defines computation logic without defining its control flow.
Functional programming – treats computation as the evaluation of mathematical functions and avoids state and mutable data
Object-oriented programming (OOP) – organizes programs as objects: data structures consisting of datafields and methods together with their interactions.
Event-driven programming – the flow of the program is determined by events, such as sensor outputs or user actions (mouse clicks, key presses) or messages from other programs or threads.
Automata-based programming – a program, or part, is treated as a model of a finite state machine or any other formal automata.

# Interpreted vs Compiled languages
I've been given to understand that Python is an interpreted language...

> This popular meme is incorrect, or, rather, constructed upon a misunderstanding of (natural) language levels: a similar mistake would be to say "the Bible is a hardcover book". Let me explain that simile...
"The Bible" is "a book" in the sense of being a class of (actual, physical objects identified as) books; the books identified as "copies of the Bible" are supposed to have something fundamental in common (the contents, although even those can be in different languages, with different acceptable translations, levels of footnotes and other annotations) -- however, those books are perfectly well allowed to differ in a myriad of aspects that are not considered fundamental -- kind of binding, color of binding, font(s) used in the printing, illustrations if any, wide writable margins or not, numbers and kinds of builtin bookmarks, and so on, and so forth.
It's quite possible that a typical printing of the Bible would indeed be in hardcover binding -- after all, it's a book that's typically meant to be read over and over, bookmarked at several places, thumbed through looking for given chapter-and-verse pointers, etc, etc, and a good hardcover binding can make a given copy last longer under such use. However, these are mundane (practical) issues that cannot be used to determine whether a given actual book object is a copy of the Bible or not: paperback printings are perfectly possible!
Similarly, Python is "a language" in the sense of defining a class of language implementations which must all be similar in some fundamental respects (syntax, most semantics except those parts of those where they're explicitly allowed to differ) but are fully allowed to differ in just about every "implementation" detail -- including how they deal with the source files they're given, whether they compile the sources to some lower level forms (and, if so, which form -- and whether they save such compiled forms, to disk or elsewhere), how they execute said forms, and so forth.
The classical implementation, CPython, is often called just "Python" for short -- but it's just one of several production-quality implementations, side by side with Microsoft's IronPython (which compiles to CLR codes, i.e., ".NET"), Jython (which compiles to JVM codes), PyPy (which is written in Python itself and can compile to a huge variety of "back-end" forms including "just-in-time" generated machine language). They're all Python (=="implementations of the Python language") just like many superficially different book objects can all be Bibles (=="copies of The Bible").
If you're interested in CPython specifically: it compiles the source files into a Python-specific lower-level form (known as "bytecode"), does so automatically when needed (when there is no bytecode file corresponding to a source file, or the bytecode file is older than the source or compiled by a different Python version), usually saves the bytecode files to disk (to avoid recompiling them in the future). OTOH IronPython will typically compile to CLR codes (saving them to disk or not, depending) and Jython to JVM codes (saving them to disk or not -- it will use the .class extension if it does save them).
These lower level forms are then executed by appropriate "virtual machines" also known as "interpreters" -- the CPython VM, the .Net runtime, the Java VM (aka JVM), as appropriate.
So, in this sense (what do typical implementations do), Python is an "interpreted language" if and only if C# and Java are: all of them have a typical implementation strategy of producing bytecode first, then executing it via a VM/interpreter.
More likely the focus is on how "heavy", slow, and high-ceremony the compilation process is. CPython is designed to compile as fast as possible, as lightweight as possible, with as little ceremony as feasible -- the compiler does very little error checking and optimization, so it can run fast and in small amounts of memory, which in turns lets it be run automatically and transparently whenever needed, without the user even needing to be aware that there is a compilation going on, most of the time. Java and C# typically accept more work during compilation (and therefore don't perform automatic compilation) in order to check errors more thoroughly and perform more optimizations. It's a continuum of gray scales, not a black or white situation, and it would be utterly arbitrary to put a threshold at some given level and say that only above that level you call it "compilation"!-)

Alex Martelli
http://stackoverflow.com/questions/2998215/if-python-is-interpreted-what-are-pyc-files?rq=1

> For me personally, I am somewhat curious of the idea of calling a language interpreted or compiled. It's an implementation decision, not part of the language specification. If you want to talk about compiled or interpreted JavaScript, ask it in the context of an actual implementation of the language spec.
http://stackoverflow.com/questions/9623813/is-javascript-compiled-or-an-interpreted-language

## Other (to cover)
Closure
Name binding
Late binding
Refactoring
Debugging
Memoization
Mutability
Comments
Random numbers
Constants
Enumerations
Expressions
Pointers
Stack
Stack overflow
