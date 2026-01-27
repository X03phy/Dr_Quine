#include <stdio.h> // FILE, sprintf(), fopen(), fprintf(), fclose()
#include <stdlib.h> // system()

#define BUF_SIZE 39

int main(void)
{
	int i;
	char buf[BUF_SIZE];
	FILE *fptr;
	char *str;

	i = 5;

	i = i - 1;
	sprintf(buf, "Sully_%d.c", i);

	fptr = fopen(buf, "w");

	if (!fptr)
		return (1);

	str = "#include <stdio.h> // FILE, sprintf(), fopen(), fprintf(), fclose()%1$c#include <stdlib.h> // system()%1$c%1$c#define BUF_SIZE 39%1$c%1$cint main(void)%1$c{%1$c%2$cint i;%1$c%2$cchar buf[BUF_SIZE];%1$c%2$cFILE *fptr;%1$c%2$cchar *str;%1$c%1$c%2$ci = %3$d;%1$c%1$c%2$ci = i - 1;%1$c%2$csprintf(buf, %4$cSully_%5$cd.c%4$c, i);%1$c%1$c%2$cfptr = fopen(buf, %4$cw%4$c);%1$c%1$c%2$cif (!fptr)%1$c%2$c%2$creturn (1);%1$c%1$c%2$cstr = %4$c%6$s%4$c;%1$c%2$cfprintf(fptr, str, 10, 9, i, 34, 37, str);%1$c%1$c%2$cfclose(fptr);%1$c%1$c%2$cif (i < 0)%1$c%2$c%2$creturn (0);%1$c%1$c%2$csprintf(buf, %4$cgcc Sully_%5$c1$d.c -o Sully_%5$c1$d && ./Sully_%5$c1$d%4$c, i);%1$c%2$csystem(buf);%1$c%1$c%2$creturn (0);%1$c}%1$c";
	fprintf(fptr, str, 10, 9, i, 34, 37, str);

	fclose(fptr);

	if (i < 0)
		return (0);

	sprintf(buf, "gcc Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d", i);
	system(buf);

	return (0);
}
