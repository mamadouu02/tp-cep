/*
uint32_t exo4_c(int32_t tab[], uint32_t taille, int32_t elem)
{
    uint32_t count = 0;
    for (uint32_t i = 0; i < taille; i++) {
        if (tab[i] != elem) {
            count++;
        }
    }
    return count;
}
*/
    .text
    .globl exo4
/* DEBUT DU CONTEXTE
Fonction :
    exo4 : feuille
Contexte :
    tab : registre a0; memoire
    taille : registre a1
    elem : registre a2
    count : registre t0
    i : registre t1
FIN DU CONTEXTE */
exo4:
exo4_fin_prologue:
    li t0, 0
    li t1, 0
loop:
    bge t1, a1, endloop
if:
    slli t2, t1, 2
    add t2, a0, t2
    lw t2, 0(t2)
    beq t2, a2, endif
    addi t0, t0, 1
endif:
    addi t1, t1, 1
    j loop
endloop:
    mv a0, t0
exo4_debut_epilogue:
    ret


/* Pour éviter les problèmes avec les interruptions */
mon_vecteur:
    mret
