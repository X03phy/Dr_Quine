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

## Project

### Subject

For this project, the task is to recode three different programs, each with different properties.
Each program will have to be coded in C, Assembly and one bonus language, respectively in a folder named C, ASM and Bonus, each folder containing its own Makefile with the usual rules.

### About the Programs

First program (Colleen):
- A main function
- Two different comments (one inside the main function and one outside)
- Another function in addition to the main function (which of course will be
called)

Second program (Grace):
- No main declared.
- Three defines only.
- One comment.

Third program (Sully):
- When executed the program writes in a file named Sully_X.c/Sully_X.s. The X
will be an interger given in the source. Once the file is created, the program compiles
this file and then runs the new program (which will have the name of its source file).
- Stopping the program depends on the file name: the resulting program will be ex-
ecuted only if the integer X is greater or equals than 0.
- An integer is therefore present in the source of your program and will have to evolve
by decrementing every time you create a source file from the execution of the pro-
gram.

## Resources

### Theory
- [Quines (self-replicating programs)](http://www.madore.org/~david/computers/quine.html)

### Code

- [Quine Programs (Holy Grail)](https://cs.lmu.edu/~ray/notes/quineprograms/)
- [Program That Prints Its Own Source Code | C Programming Example](https://www.youtube.com/watch?v=m8uQ0cJKDM0) -> This is not a quine !
- [Quines - The Art of Code](https://www.youtube.com/watch?v=w1CaPe6_uE4)
- [Lightning Talk: How to Write a Quine? - Dmitry Kandalov [ ACCU 2021 ]](https://www.youtube.com/watch?v=wOZd5PnUCD8)

### ASM

- [Assembly programming](https://github.com/0xAX/asm/blob/master/content/asm_1.md)
- [x86 Instructions](https://learn.microsoft.com/fr-fr/windows-hardware/drivers/debugger/x86-instructions)
- [x86 Architecture](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/x86-architecture?source=recommendations)
- [NASM - The Netwide Assembler](https://www.nasm.us/doc/nasm00.html)
- [Tomasz Żok, x86 assembly](https://www.cs.put.poznan.pl/tzok/public/cawllp-04-asm.html)
- [x86_64 NASM Assembly Quick Reference ("Cheat Sheet")](https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html)

### Makefile

- [The Perfect Makefile ](https://www.reddit.com/r/C_Programming/comments/1ghy847/the_perfect_makefile/)
- [10.3 Variables Used by Implicit Rules](https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html)
