# Dr_Quine
This project is about making you discover the recursion theorem of Kleene !

## Introduction

A **quine program**, or **quine**, is a program that outputs its own source code when run. A quine is not allowed to “step outside itself” by, for example, printing out the contents of the file in which it is contained or using introspective capabilities to print its own representation. Instead, it must compute its own source code.

## The Basic Idea

The classic way to produce a self-printing program has two steps:

- Initialize a string variable, with a placeholder for interpolation.
- Print the string, interpolating the string into itself.

The trick is getting the string just right. How you do this varies from language to language depending on how variables are declared, the method of interpolation, the possible need for semicolons and newlines, the kinds of quotes required, and so on. Dealing with quotes is interesting; you need to find a way to specify that a quote character is to be printed without actually using a quote character.

## Examples

### C

#### Old-style (K&R)

This is the classic.
```c
main(){char*s="main(){char*s=%c%s%c;printf(s,34,s,34);}";printf(s,34,s,34);}
```

#### C99

Modern C needs should have the #include directive, which means the code needs a newline. Here it is with a few additional newlines, just to make the code be not so wide. There's no new line at the very end, though.
```c
#include <stdio.h>
int main(){
char*s="#include <stdio.h>%cint main(){%cchar*s=%c%s%c;%cprintf(s,10,10,34,s,34,10);return 0;}";
printf(s,10,10,34,s,34,10);return 0;}
```

## Resources

### Theory


### Code

- [Quine Programs (Holy Grail)](https://cs.lmu.edu/~ray/notes/quineprograms/)
- [Program That Prints Its Own Source Code | C Programming Example](https://www.youtube.com/watch?v=m8uQ0cJKDM0) -> This is not a quine !
- [Quines - The Art of Code](https://www.youtube.com/watch?v=w1CaPe6_uE4)
- [Quines (self-replicating programs)](http://www.madore.org/~david/computers/quine.html)
- [Lightning Talk: How to Write a Quine? - Dmitry Kandalov [ ACCU 2021 ]](https://www.youtube.com/watch?v=wOZd5PnUCD8)

### Makefile

- https://www.reddit.com/r/C_Programming/comments/1ghy847/the_perfect_makefile/
- https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html


### ASM

- [Assembly programming](https://github.com/0xAX/asm/blob/master/content/asm_1.md)
- [x86 Instructions](https://learn.microsoft.com/fr-fr/windows-hardware/drivers/debugger/x86-instructions)
- [x86 Architecture](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/x86-architecture?source=recommendations)
