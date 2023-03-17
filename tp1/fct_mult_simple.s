    .text
/*
uint32_t x, y, res;

uint32_t mult_simple(void)
{
    res = 0;
    while (y != 0) {
        res = res + x;
        y--;
    }
    return res;
}
*/
    .globl mult_simple
/* DEBUT DU CONTEXTE
Fonction :
    mult_simple : feuille
Contexte :
    x : memoire
    y : memoire
    res : memoire
FIN DU CONTEXTE */
mult_simple:
mult_simple_fin_prologue:
/* A compléter */
    sw zero, res, t3
while:
    lw t2, y
    beqz t2, endwhile
    lw t0, res
    lw t1, x
    add t0, t0, t1
    sw t0, res, t3
    addi t2, t2, -1
    sw t2, y, t3
    j while
endwhile:
    lw a0, res
mult_simple_debut_epilogue:
    ret


    .data
    .globl res
    .comm res, 4
/* uint32_t res; */
