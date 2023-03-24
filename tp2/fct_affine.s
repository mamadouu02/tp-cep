/*
uint32_t affine(uint32_t a, uint32_t b, uint32_t x)
{
   return mult(x, a) + b;
}
*/

    .text
    .globl affine
    /* uint32_t affine(uint32_t a, uint32_t b, uint32_t x) */
/* DEBUT DU CONTEXTE
Fonction :
    affine : non feuille
Contexte :
    a  : registre a0; pile *(sp+0)
    b  : registre a1; pile *(sp+4)
    x  : registre a2; pile *(sp+8)
    ra  : pile *(sp+16)
FIN DU CONTEXTE */
affine:
/* A compléter */
    addi sp, sp, -4*4
    sw ra, 3*4(sp)
    sw a1, 1*4(sp)
affine_fin_prologue:
    mv a1, a0
    mv a0, a2
    jal mult
    lw a1, 1*4(sp)
    add a0, a0, a1
affine_debut_epilogue:
    lw ra, 3*4(sp)
    addi sp, sp, 4*4
    ret
