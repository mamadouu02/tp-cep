/*
uint32_t fact_papl(uint32_t n)
{
    if (n <= 1) {
        return 1;
    } else {
        uint64_t tmp = n*fact_papl(n-1);
        if ((tmp >> 32) > 0)
            erreur_fact(n);
        return (uint32_t)tmp;
    }
}
*/

    .text
    .globl fact_papl
    /* uint32_t fact_papl(uint32_t n) */
/* DEBUT DU CONTEXTE
Fonction :
    fact_papl : non feuille
Contexte :
    n  : registre a0; pile *(sp+0)
    tmp  : pile *(sp+4) / *(sp+8)
    ra  : pile *(sp+12)
FIN DU CONTEXTE */
fact_papl:
/* A compléter */
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 0(sp)
fact_papl_fin_prologue:
    slti t0, a0, 2
    beqz t0, recursion
    li a0, 1
    j fact_papl_debut_epilogue
recursion:
    addi a0, a0, -1
    jal fact_papl
    lw t2, 0(sp)
    mulhu t1, t2, a0
    mul t0, t2, a0
if:
    bnez t1, endif
    j erreur_fact
endif:
    mv a0, t0
fact_papl_debut_epilogue:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret
