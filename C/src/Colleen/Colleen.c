#include <stdio.h>


void foo(void) {}


int main()
{
	char *str;

	foo(); // This function does absolutely nothing

	str = "#include <stdio.h>%c%c%cvoid foo(void) {}%c%c%cint main()%c{%c%cchar *str;%c%c%cfoo(); // This function does absolutely nothing%c%c%cstr = %c%s%c;%c%cprintf(str, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 10, 9, 10, 10, 9, 34, str, 34, 10, 9, 10, 10, 9, 10, 10, 10, 10);%c%c%creturn (0);%c}%c%c/* Goodbye Colleen :( */%c";
	printf(str, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 10, 9, 10, 10, 9, 34, str, 34, 10, 9, 10, 10, 9, 10, 10, 10, 10);

	return (0);
}

/* Goodbye Colleen :( */
