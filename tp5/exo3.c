#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

int32_t ma_fonction(int32_t x, int32_t y) {
    return x*x + 5*y - x*y;
}

extern uint32_t exo3(int32_t x);

uint32_t exo3_c(int32_t x) {
  int32_t val_fx = ma_fonction(x, 2*x);
  int32_t val_fy = ma_fonction(2*x, x);
    if (val_fy > val_fx) {
        return 2*x;
    } else {
        return x;
    }
}

int main(void)
{
    int32_t x = 7;
    int32_t res_c = exo3_c(x);
    int32_t res_as = exo3(x);
    printf("Pour la fonction, x² - 5y - xy, exo3 calculé en C : %" PRIu32 " et en assembleur : %" PRIu32 "\n", res_c, res_as);
    return 0;
}
