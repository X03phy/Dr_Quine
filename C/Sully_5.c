#include <stdio.h>
#include <stdlib.h>


int main(void)
{
	int i;
	char buf[50];
	FILE *fptr;
	char *str;

	i = 4;
	if (i <= 0)
		return (0);

	sprintf(buf,    
Sully_    
d.c   
, i);

	fptr = fopen(name, "w");

	if (!fptr)
		return (1);

	str = "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$c%1$cint main(void)%1$c{%1$c%2$cint i;%1$c%2$cchar buf[50];%1$c%2$cFILE *fptr;%1$c%2$cchar *str;%1$c%1$c%2$ci = %3$d;%1$c%2$cif (i <= 0)%1$c%2$c%2$creturn (0);%1$c%1$c%2$csprintf(buf, %1$4cSully_%1$5cd.c%1$4c, i);%1$c%1$c%2$cfptr = fopen(name, %4$cw%4$c);%1$c%1$c%2$cif (!fptr)%1$c%2$c%2$creturn (1);%1$c%1$c%2$cstr = %4$c%6$s%4$c;%1$c%2$cfprintf(fptr, str, 10, 9, i, 34, str);%1$c%1$c%2$cfclose(fptr);%1$c%1$c%2$csprintf(buf, %4$cgcc Sully_%1$5c1$d.c -o Sully_%1$5c1$d && ./Sully_%1$5c1$d, i);%1$c%2$csystem(buf);%1$c%1$c%2$creturn (0);%1$c}%1$c";
	fprintf(fptr, str, 10, 9, i, 34, str);

	fclose(fptr);

	sprintf(buf, "gcc Sully_    
1$d.c -o Sully_    
1$d && ./Sully_    
1$d, i);
	system(buf);

	return (0);
}
