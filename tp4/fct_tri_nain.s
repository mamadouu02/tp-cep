/*
void tri_nain(int32_t tab[], uint32_t taille)
{
    uint32_t i = 0;
    while(i < taille - 1) {
        if (tab[i] > tab[i+1]) {
            int32_t tmp = tab[i];
            tab[i] = tab[i+1];
            tab[i + 1] = tmp;
            if (i > 0) {
                i = i - 1;
            }
        } else {
            i = i + 1;
        }
    }
}
*/

    .text
/*  void tri_nain(int32_t tab[], uint32_t taille) */
    .globl tri_nain
/* DEBUT DU CONTEXTE
Fonction :
    tri_nain : non feuille
Contexte :
    tab  : registre a0
    taille  : registre a1
    i  : registre t0
    tmp  : registre t1
FIN DU CONTEXTE */
tri_nain:
tri_nain_fin_prologue:
    li t0, 0
while:
    addi t2, a1, -1
    bge t0, t2, endwhile
if1:
    slli t2, t0, 4
    add t2, a0, t2
    lw t3, 0(t2)
    lw t4, 4(t2)
    bge t4, t3, else1
    mv t1, t3
    sw t4, 0(t2)
    sw t1, 4(t2)
if2:
    bgez t0, endif2
    addi t0, t0, -1
endif2:
    j endif1
else1:
    addi t0, t0, 1
endif1:
endwhile:
tri_nain_debut_epilogue:
    ret
