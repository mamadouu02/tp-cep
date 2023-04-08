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
    .globl tri_nain_opt
/* Version du tri optimisée sans respecter la contrainte de la traduction
 * systématique pour les accès mémoire (et le calcul de leurs adresses)
   Complétez le contexte ci-dessous en indiquant les registres qui contiendront
   des variables temporaires.  */
/* DEBUT DU CONTEXTE
Fonction :
    tri_nain_opt : feuille
Contexte :
    i  : registre t0
    tmp  : registre t1
    taille-1 : registre t2
    &tab[i] : registre t3
    tab[i] : registre t1
    tab[i+1] : registre t4
FIN DU CONTEXTE */
tri_nain_opt:
tri_nain_opt_fin_prologue:
    li t0, 0
    addi t2, a1, -1
while:
    bge t0, t2, endwhile
if1:
    slli t3, t0, 2
    add t3, a0, t3
    lw t1, 0(t3)
    lw t4, 4(t3)
    bge t4, t1, else1
    sw t4, 0(t3)
    sw t1, 4(t3)
if2:
    blez t0, endif2
    addi t0, t0, -1
endif2:
    j endif1
else1:
    addi t0, t0, 1
endif1:
    j while
endwhile:
tri_nain_opt_debut_epilogue:
    ret
