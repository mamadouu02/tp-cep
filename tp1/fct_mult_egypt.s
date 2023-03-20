    .text
/*
uint32_t x, y;

uint32_t mult_egypt(void)
{
    uint32_t res = 0;
    while (y != 0) {
        if (y % 2 == 1) {
            res = res + x;
        }
        x = x << 1 ;
        y = y >> 1;
    }
    return res;
}
*/
    .globl mult_egypt
/* Attention, res est une variable locale que l'on mettra dans t0 */
/* DEBUT DU CONTEXTE
Fonction :
    mult_egypt : feuille
Contexte :
    x  : memoire
    y  : memoire
    res  : registre t0
FIN DU CONTEXTE */
mult_egypt:
mult_egypt_fin_prologue:
/* A compléter */
    li t0, 0
while:
    lw t2, y
    beqz t2, endwhile
if:
    lw t1, x
    andi t3, t2, 1
    beqz t3, endif
    add t0, t0, t1
endif:
    slli t1, t1, 1
    sw t1, x, t3
    srli t2, t2, 1
    sw t2, y, t3
    j while
endwhile:
    mv a0, t0
mult_egypt_debut_epilogue:
    ret
