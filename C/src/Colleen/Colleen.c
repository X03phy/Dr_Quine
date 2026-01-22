#include <stdio.h> // printf()


void foo(void) {}


int main()
{
	char *str;

	foo(); // This function does absolutely nothing

	str = "#include <stdio.h> // printf()%1$c%1$c%1$cvoid foo(void) {}%1$c%1$c%1$cint main()%1$c{%1$c%2$cchar *str;%1$c%1$c%2$cfoo(); // This function does absolutely nothing%1$c%1$c%2$cstr = %3$c%4$s%3$c;%1$c%2$cprintf(str, 10, 9, 34, str);%1$c%1$c%2$creturn (0);%1$c}%1$c%1$c/* Ça va être tout noir ! */%1$c";
	printf(str, 10, 9, 34, str);

	return (0);
}

/* Ça va être tout noir ! */
