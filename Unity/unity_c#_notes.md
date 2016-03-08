# Coding conventions

* Class names always start with a Capital letter (PascalCase)
* Therefore, because classes and scripts are closely related in Unity, script names start with a Capital letter
* Public and protected fields of a class start with a lower case letter*
* Public and protected properties of a class start with a Capital letter, but Unity regularly uses lower case itself, so you can just adopt the rule:Properties and fields start with a lower case letter
* Methods or functions always start with a capital letter (PascalCase)
* Private properties and fields of a class start with an _ (_underscoredCamelCase)
* Parameter names start with a lower case letter
* All identifiers are written in camelCase -	where the first letter of every new word after the first one is a	Capital letter.

\* .NET conventions say that any publicly accessible member of a class should start with a Capital letter - be it member, property or field.  Therefore you will often encounter strange things in Unity when integrating with .NET libraries as the convention is different.  I've finally opted for using Unity conventions in my code, but there will sadly be some inconsistency no matter which approach you take.

# Similarities to UnityScript

* Use of the `as` keyword to cast

# Dynamically created meshes

Vertices = an array of points in space

Triangles = an array of indices of the verticesarray

UV – an array of Vector2, one for each vertex

# Generics

Here is a useful generic point struct:
```c#
public struct Point<T>
{
   public T X;
   public T Y;
}
```
You can use the generic point for integer coordinates, for example:
```c#
Point<int> point;
point.X = 1;
point.Y = 2;
```
Or for charting coordinates that require floating point precision:
```c#
Point<double> point;
point.X = 1.2;
point.Y = 3.4;
```
## Generic methods

A generic method is a method that is declared withtype parameters.

A generic method is defined like this like this:
```c#
return-type MethodName<type-parameter-list>(parameter-list)
```
An example is as follows:
```c#
static void Swap<T>(ref T lhs, ref T rhs) {
	T temp;
	temp = lhs;
	lhs = rhs;
	rhs = temp;
}
```
The above example swaps the first argument withthe second argument. It can be called with any parameter type.