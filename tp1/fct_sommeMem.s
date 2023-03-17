/*
uint32_t res;

uint32_t sommeMem(void)
{
    uint32_t i;
    res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/

    .globl sommeMem
/* DEBUT DU CONTEXTE
Fonction :
    sommeMem : feuille
Contexte :
    res : memoire
    i : registre t0
FIN DU CONTEXTE */
sommeMem:
sommeMem_fin_prologue:
/* A compléter */
    sw zero, res, t2
    li t0, 1
loop:
    slti t1, t0, 11
    beqz t1, endloop
    lw t1, res
    add t1, t1, t0
    sw t1, res, t2
    addi t0, t0, 1
    j loop
endloop:
    lw a0, res
sommeMem_debut_epilogue:
    ret

    .data
    .globl res
    .comm res, 4
/* uint32_t res;
  La variable globale res étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
*/
