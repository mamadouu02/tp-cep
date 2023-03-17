#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

uint32_t fact_papl(uint32_t);

void erreur_fact(uint32_t n)
{
   printf("Fact(%" PRIu32 ") ne tient pas sur 32 bits !\n", n);
   // la fonction exit arrete proprement le programme
   exit(1);
}

int main()
{
   uint32_t n = 14;
   printf("Fact(%" PRIu32 ") = %" PRIu32 "\n", n, fact_papl(n));
   return 0;
}

