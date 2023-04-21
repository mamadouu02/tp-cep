#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

int32_t tab[100];

extern uint32_t exo4(int32_t tab[], uint32_t taille, int32_t elem);

uint32_t exo4_c(int32_t tab[], uint32_t taille, int32_t elem)
{
    uint32_t count = 0;
    for (uint32_t i = 0; i < taille; i++) {
        if (tab[i] != elem) {
            count++;
        }
    }
    return count;
}

static void init_tab(int32_t tab[], uint32_t taille)
{
    printf("Exemple de tableau : [");
    for (uint32_t i = 0; i < taille - 1; i++) {
        tab[i] = (random() % 19) - 9;
		printf("%" PRId32 ", ", tab[i]);
    }
    printf("%" PRId32 "]\n", tab[taille - 1]);
}


int main(void) {
    uint32_t taille = 17;
    int32_t elem = -8;
    srandom(0xbaffe);
    init_tab(tab, taille);
    uint32_t res_c = exo4_c(tab, taille, elem);
    uint32_t res_as = exo4(tab, taille, elem);
    printf("exo4 avec elem = %" PRId32 " calculé en C : %" PRIu32 " et en assembleur : %" PRIu32 "\n", elem, res_c, res_as);
    return 0;
}
