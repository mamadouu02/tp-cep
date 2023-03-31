/*
void inverse_liste(struct cellule_t **l)
{
   struct cellule_t *res, *suiv;
   res = NULL;
   while (*l != NULL) {
       suiv = (*l)->suiv;
       (*l)->suiv = res;
       res = *l;
       *l = suiv;
   }
   *l = res;
}
*/
    .text
    .globl inverse_liste
/* void inverse_liste(struct cellule_t **l) */
/* DEBUT DU CONTEXTE
Fonction :
    inverse_liste : feuille
Contexte :
    l  : registre a0
    res : registre t0
    suiv : registre t1
FIN DU CONTEXTE */
inverse_liste:
inverse_liste_fin_prologue:
    li t0, 0
while:
    lw t2, 0(a0)
    beqz t2, endwhile
    lw t1, 4(t2)
    sw t0, 4(t2)
    mv t0, t2
    lw t1, 0(a0)
    j while
endwhile:
    mv t2, t0
inverse_liste_debut_epilogue:
    ret
