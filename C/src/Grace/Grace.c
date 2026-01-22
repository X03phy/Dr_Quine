#include <stdio.h> // FILE, fopen(), fprintf(), fclose()

#define KID "Grace_kid.c"
#define STR "#include <stdio.h> // FILE, fopen(), fprintf(), fclose()%1$c%1$c#define KID %2$c%3$s%2$c%1$c#define STR %2$c%4$s%2$c%1$c#define Q(x) int main(){FILE *fptr;fptr = fopen(KID, %2$cw%2$c);if (!fptr){return 1;}fprintf(fptr, STR, 10, 34, KID, STR);fclose(fptr);return 0;}%1$c%1$c/* Poussez-vous, excusez-moi ! Poussez-moi excusez-vous ! */%1$c%1$cQ(x)%1$c"
#define Q(x) int main(){FILE *fptr;fptr = fopen(KID, "w");if (!fptr){return 1;}fprintf(fptr, STR, 10, 34, KID, STR);fclose(fptr);return 0;}

/* Poussez-vous, excusez-moi ! Poussez-moi excusez-vous ! */

Q(x)
