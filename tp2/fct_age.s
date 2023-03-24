/*
uint32_t age(uint32_t annee_naissance)
{
    uint32_t age;
    age = 2023 - annee_naissance;
    return age;
}
*/

    .text
    .globl age
    /* uint32_t age(uint32_t annee_naissance) */
/* DEBUT DU CONTEXTE
  Fonction :
    age : feuille
  Contexte : # contexte imposé
    annee_naissance  : registre a0
    age              : pile *(sp+0)  # de type uint32_t
FIN DU CONTEXTE */
age:
/* A compléter */
    addi sp, sp, -1
age_fin_prologue:
    lw t0, 0(sp)
    li t1, 2023
    sub t0, t1, a0
    sw t0, 0(sp)
    lw a0, 0(sp)
age_debut_epilogue:
    addi sp, sp, 1
    ret
