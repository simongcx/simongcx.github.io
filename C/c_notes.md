##% codes
For `printf` and `scanf`

| Code    | Used for                                 |
| ------- | ---------------------------------------- |
| %c      | char single character                    |
| %d (%i) | int signed integer                       |
| %e (%E) | float or double exponential format       |
| %f      | float or double signed decimal           |
| %g (%G) | float or double                          |
| %o      | int unsigned octal value                 |
| %p      | pointer address stored in pointer        |
| %s      | array of char sequence of characters (C style string) |
| %u      | int unsigned decimal                     |
| %x (%X) | int unsigned hex value                   |

## & operator
The amersand operator access the memory address of a variable.

## Pointers
### The * operator
The * operator is used when declaring the pointer and when getting what the pointer points to, but not when setting the pointer.
```c
int myinteger;
int * mypointer; // * operator used when declaring the pointer

myinteger = 1;
mypointer = &myinteger; // * operator not used when setting what the pointer points to

printf("%d\n", *mypointer); // * operator used to get what the pointer points to
```
### Setting a pointer

```c
int * myFunction() {
    static int temparray[] = {2,3,4};
    return temparray;
}

int myinteger = 0;
int * mypointer;
int myarray[] = {1,2,3};

mypointer = &myinteger; // & required as the pointer points to the memory address of myinteger
printf("%d\n", *mypointer);
mypointer = myarray; // no & required as arrays are similar to pointers
printf("%d\n", *mypointer);
mypointer = myFunction(); // no & required as pointer is return type
printf("%d\n", *mypointer);
```

## Keywords
### C keywords
There are 32 keywords in C
Types: void, int, char, float, double
Type modifiers: unsigned/signed, long/short
Declaration modifiers: auto/static, const/volatile
Complex types: stuct, enum, union
Flow control: if, else, while, do, for, continue, break, switch, case, default, goto, return
Other: register, typedef, extern, sizeof

### Static
* A static variable inside a function keeps its value between invocations.
* A static global variable or a function is "seen" only in the file (compilation unit) it's declared in

## Strings
### * vs []
Both of the below are valid C-style strings. However, the pointer method places the string in read-only memory.
```c
char *s = "Hello world";
char s[] = "Hello world";
```
Hence the following is only possible with a string defined with square brackets:
```c
s[0] = 'J';
```
### String literals
```c
char *s = "Hello world";
char s[] = "Hello world";
char s[] = {'H','e','l','l','o',' ','W','o','r','l','d','\0'};
```



## Things learnt the hard way

* `"b"` is a string literal, whilst `'b'` is a character literal - they are not interchangeable
* `strlen` returns the length of a string **excluding** the null terminator

## Reference

* Compiling on Windows: `g++ helloworld.cpp -o helloworld.exe`
* ​

