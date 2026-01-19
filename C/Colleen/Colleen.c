#include <stdio.h>


void foo(void) {}


int main()
{
	foo(); // This function does absolutely nothing
	char *str = "#include <stdio.h>%c%c%cvoid foo(void) {}%c%c%cint main()%c{%cfoo(); // This function does absolutely nothing%cchar *str =%c%s%c;%cprintf(str, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, str, 34, 10, 10, 10, 10, 10);%creturn (0);%c}%c/* Goodbye Colleen :( */%c";
	printf(str, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, str, 34, 10, 10, 10, 10, 10);
	return (0);
}

/* Goodbye Colleen :( */
