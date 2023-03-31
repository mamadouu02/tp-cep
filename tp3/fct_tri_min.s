/*
void tri_min(int32_t tab[], uint32_t taille)
{
    uint32_t i, j, ix_min;
    int32_t tmp;
    for (i = 0; i < taille - 1; i++) {
        for (ix_min = i, j = i + 1; j < taille; j++) {
            if (tab[j] < tab[ix_min]) {
                ix_min = j;
            }
        }
        tmp = tab[i];
        tab[i] = tab[ix_min];
        tab[ix_min] = tmp;
    }
}
*/
    .text
    .globl tri_min
/* void tri_min(int32_t tab[], uint32_t taille) */
/* DEBUT DU CONTEXTE
Fonction :
    tri_min : feuille
Contexte :
    tab  : registre a0
    taille  : registre a1
    i  : registre t0
    j  : registre t1
    ix_min  : registre t2
    tmp  : registre t3
FIN DU CONTEXTE */
tri_min:
tri_min_fin_prologue:
    li t0, 0
loop_i:
    addi t4, a1, -1
    sltu t5, t0, t4
    beqz t5, endloop_i
    mv t2, t0
    addi t1, t0, 1
loop_j:
    sltu t5, t1, a1
    beqz t5, endloop_j
if:
    slli t4, t1, 2
    slli t5, t2, 2
    lw t4, 0(t4)
    lw t5, 0(t5)
    ble t5, t4, endif
    mv t2, t1
endif:
    addi t1, t1, 1
    j loop_j
endloop_j:
    slli t4, t0, 2
    slli t5, t2, 2
    lw t3, 0(t4)
    lw t6, 0(t5)
    sw t6, 0(t4)
    sw t3, 0(t5)
    addi t0, t0, 1
    j loop_i
endloop_i:
tri_min_debut_epilogue:
    ret
