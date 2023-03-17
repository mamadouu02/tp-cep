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
    nom_de_fonction : feuille ou non feuille
Contexte :
    parametre_0        : registre a0
    parametre_1        : registre ai; pile *(sp+n)        # 2 possibilités
    parametre_64_bits  : registres t0 / t1                # 2 registres necessaires
    variable_locale0   : registre t0
    variable_locale1   : pile *(sp+k)
    ra                 : pile *(sp+p)                     # cas particulier d'un registre à sauver
    variable_64_bits   : pile *(sp+k1) / *(sp+k2)         # 2 registres necessaires
    variable_globale0  : memoire
    variable_globale1  : memoire, section nom_de_section  # ex de section : .data, .bss, .text, .rodata
FIN DU CONTEXTE */
tri_min:
tri_min_fin_prologue:
tri_min_debut_epilogue:
    ret

