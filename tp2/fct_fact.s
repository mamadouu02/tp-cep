/*
uint32_t fact(uint32_t n)
{
    if (n <= 1) {
        return 1;
    } else {
        return n * fact(n - 1);
    }
}
*/

    .text
    .globl fact
    /* uint32_t fact(uint32_t n) */
/* DEBUT DU CONTEXTE
Fonction :
    fact : non feuille
Contexte :
    n  : registre a0; pile *(sp+0)
    ra  : pile *(sp+4)
FIN DU CONTEXTE */
fact:
/* A compléter */
    addi sp, sp, -8
    sw ra, 4(sp)
    sw a0, 0(sp)
fact_fin_prologue:
    slti t0, a0, 2
    beqz t0, recursion
    li a0, 1
    j fact_debut_epilogue
recursion:
    addi a0, a0, -1
    jal fact
    lw t0, 0(sp)
    mul a0, a0, t0
fact_debut_epilogue:
    lw ra, 1(sp)
    addi sp, sp, 8
    ret
