#include <stdio.h> // printf()

void foo(void)
{
	char *str;

	str = "#include <stdio.h> // printf()%1$c%1$cvoid foo(void)%1$c{%1$c%2$cchar *str;%1$c%1$c%2$cstr = %3$c%4$s%3$c;%1$c%2$cprintf(str, 10, 9, 34, str);%1$c}%1$c%1$cint main()%1$c{%1$c%2$cfoo(); // Main system, activating combat mode.%1$c%1$c%2$creturn (0);%1$c}%1$c%1$c/* There is no place for me other than the battlefield. To live as I please, and die a senseless death. That is who I am. Not a mere man of flesh. War is part of my existence. */%1$c";
	printf(str, 10, 9, 34, str);
}

int main()
{
	foo(); // Main system, activating combat mode.

	return (0);
}

/* There is no place for me other than the battlefield. To live as I please, and die a senseless death. That is who I am. Not a mere man of flesh. War is part of my existence. */
