/*
struct cellule_t *decoupe_liste(struct cellule_t *l, struct cellule_t **l1, struct cellule_t **l2)
{
    struct cellule_t fictif1, fictif2;
    *l1 = &fictif1;
    *l2 = &fictif2;
    while (l != NULL) {
        if (l->val % 2 == 1) {
            (*l1)->suiv = l;
            *l1 = l;
        } else {
            (*l2)->suiv = l;
            *l2 = l;
        }
        l = l->suiv;
    }
    (*l1)->suiv = NULL;
    (*l2)->suiv = NULL;
    *l1 = fictif1.suiv;
    *l2 = fictif2.suiv;
    return l;
}
*/
    .text
    .globl decoupe_liste
/*
Fonction feuille : A priori pile inchangée, mais besoin de l'adresse des
variables locales => implantation des variables locales en pile.
Besoin de 2*2 mots de 32 bits dans la pile (PILE+16)
-> fictif1 à sp+0, fictif2 à sp+8
   (2 mots mémoire chacun : un pour le champ val, un pour le champ suiv)

DEBUT DU CONTEXTE
Fonction :
  decoupe_liste : feuille
Contexte :
  l             : registre a0    # paramètre de type (struct cellule_t *)
  l1            : registre a1    # paramètre de type (struct cellule_t **)
  l2            : registre a2    # paramètre de type (struct cellule_t **)
  fictif2.suiv  : pile *(sp+12)  # champ de type (cellule_t *)
  fictif2.val   : pile *(sp+8)   # champ de type (int32_t)
  fictif1.suiv  : pile *(sp+4)   # champ de type (cellule_t *)
  fictif1.val   : pile *(sp+0)   # champ de type (int32_t)
FIN DU CONTEXTE */
decoupe_liste:
    addi sp, sp, -16
decoupe_liste_fin_prologue:
    sw sp, 0(a1)
    addi t0, sp, 8
    sw t0, 0(a2)
while:
    beqz a0, endwhile
if:
    lw t0, 0(a0)
    andi t0, t0, 1
    beqz t0, else
    lw t0, 0(a1)
    sw a0, 4(t0)
    sw a0, 0(a1)
    j endif
else:
    lw t0, 0(a2)
    sw a0, 4(t0)
    sw a0, 0(a2)
endif:
    lw a0, 4(a0)
    j while
endwhile:
    lw t0, 0(a1)
    sw zero, 4(t0)
    lw t0, 0(a2)
    sw zero, 4(t0)
    lw t0, 4(sp)
    sw t0, 0(a1)
    lw t0, 12(sp)
    sw t0, 0(a2)
decoupe_liste_debut_epilogue:
    addi sp, sp, 16
    ret
