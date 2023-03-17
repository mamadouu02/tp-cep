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
tri_nain:
tri_nain_fin_prologue:
tri_nain_debut_epilogue:
    ret
