/*
uint32_t res;

uint32_t sommeMem(void)
{
    uint32_t i;
    res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/

    .globl sommeMem
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
sommeMem:
sommeMem_fin_prologue:
/* A compléter */
sommeMem_debut_epilogue:
    ret

    .data
    .globl res
/* uint32_t res;
  La variable globale res étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
*/
