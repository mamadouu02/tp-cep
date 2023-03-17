    .text
/*
uint32_t x, y;

uint32_t mult_egypt(void)
{
    uint32_t res = 0;
    while (y != 0) {
        if (y % 2 == 1) {
            res = res + x;
        }
        x = x << 1 ;
        y = y >> 1;
    }
    return res;
}
*/
    .globl mult_egypt
/* Attention, res est une variable locale que l'on mettra dans t0 */
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
mult_egypt:
mult_egypt_fin_prologue:
/* A compléter */
mult_egypt_debut_epilogue:
    ret
