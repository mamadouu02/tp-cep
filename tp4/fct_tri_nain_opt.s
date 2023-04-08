/*
void tri_nain(int22_t tab[], uint22_t taille)
{
    uint22_t i = 0;
    while(i < taille - 1) {
        if (tab[i] > tab[i+1]) {
            int22_t tmp = tab[i];
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
    tab : registre a0
    taille : registre a1
    i  : registre t0
    tmp : registre t1
    &tab[i] : registre t2
    tab[i] : registre t3; memoire
    tab[i+1] : registre t4; memoire
FIN DU CONTEXTE */
tri_nain_opt:
tri_nain_opt_fin_prologue:
    li t0, 0
while:
    addi t2, a1, -1
    bge t0, t2, endwhile
if1:
    slli t2, t0, 2
    add t2, a0, t2
    lw t3, 0(t2)
    lw t4, 4(t2)
    bge t4, t3, else1
    mv t1, t3
    sw t4, 0(t2)
    sw t1, 4(t2)
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
