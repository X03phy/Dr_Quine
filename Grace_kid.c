#include <stdio.h>

#define KID "Grace_kid.c"
#define STR "#include <stdio.h>%c%c#define KID %c%s%c%c#define STR %c%s%c%c#define Q(x) int main(){FILE *fptr;fptr = fopen(KID, %cw%c);if (!fptr){return 1;}fprintf(fptr, STR, 10, 10, 34, KID, 34, 10, 34, STR, 34, 10, 34, 34, 10, 10, 10);fclose(fptr);return 0;}%c%cQ(x)%c"
#define Q(x) int main(){FILE *fptr;fptr = fopen(KID, "w");if (!fptr){return 1;}fprintf(fptr, STR, 10, 10, 34, KID, 34, 10, 34, STR, 34, 10, 34, 34, 10, 10, 10);fclose(fptr);return 0;}

Q(x)
