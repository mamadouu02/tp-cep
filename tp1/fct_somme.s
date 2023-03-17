/*
uint32_t somme(void)
{
    uint32_t i;
    uint32_t res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/
    .text
    .globl somme
/* DEBUT DU CONTEXTE
Fonction :
    somme : feuille
Contexte :
    res : registre t0
    i : registre t1
FIN DU CONTEXTE */
somme:
somme_fin_prologue:
/* A compléter */
    li t0, 0
    li t1, 1
loop:
    slti t2, t1, 11
    beqz t2, endloop
    add t0, t0, t1
    addi t1, t1, 1
    j loop
endloop:
    mv a0, t0
somme_debut_epilogue:
    ret
