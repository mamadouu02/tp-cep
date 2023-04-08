/*
bool abr_est_present_tail_call(uint32_t val, struct noeud_t *abr)
{
   if (abr == NULL) {
       return false;
   } else if (val == abr->val) {
       return true;
   } else if (val < abr->val) {
       return abr_est_present_tail_call(val, abr->fg);
   } else {
       return abr_est_present_tail_call(val, abr->fd);
   }
}
*/
    .text
    .globl abr_est_present_tail_call
/* DEBUT DU CONTEXTE
Fonction :
    abr_est_present_tail_call : feuille
Contexte :
    val  : registre a0
    abr : registre a1
FIN DU CONTEXTE */
abr_est_present_tail_call:
abr_est_present_tail_call_fin_prologue:
if:
    bnez a1, elsif1
    li a0, 0
    j endif
elsif1:
    lw t0, 0(a1)
    bne a0, t0, elsif2
    li a0, 1
    j endif
elsif2:
    bge a0, t0, else
    lw a1, 4(a1)
    j abr_est_present_tail_call
    j endif
else:
    lw a1, 8(a1)
    j abr_est_present_tail_call
endif:
abr_est_present_tail_call_debut_epilogue:
    ret
