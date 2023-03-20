/*
uint8_t res8;

uint8_t somme8(void)
{
    uint8_t i;
    res8 = 0;
    for (i = 1; i <= 30; i++) {
        res8 = res8 + i;
    }
    return res8;
}
*/

    .globl somme8
/* DEBUT DU CONTEXTE
Fonction :
    somme8 : feuille
Contexte :
    res8  : memoire
    i  : registre t0
FIN DU CONTEXTE */
somme8:
somme8_fin_prologue:
/* A compléter */
    sw zero, res, t2
    li t0, 1
loop:
    slti t2, t0, 31
    beqz t2, endloop
    lw t1, res
    add t1, t1, t0
    sw t1, res, t2
    addi t0, t0, 1
    j loop
endloop:
    lw a0, res
somme8_debut_epilogue:
    ret

    .data
    .globl res8
    .comm res8, 1
/* uint8_t res8;
  La variable globale res8 étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
*/
