    .text
/*
uint32_t x, y;

uint32_t mult_native(void)
{
    return x*y;
}
*/
    .globl mult_native
/* DEBUT DU CONTEXTE
Fonction :
    mult_native : feuille
Contexte :
    x   : memoire
    y   : memoire
FIN DU CONTEXTE */
mult_native:
mult_native_fin_prologue:
/* A compléter */
    lw t0, x
    lw t1, y
    mul a0, t0, t1
mult_native_debut_epilogue:
    ret
