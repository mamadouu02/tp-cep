/*
bool abr_est_present(uint32_t val, struct noeud_t *abr)
{
   if (abr == NULL) {
       return false;
   } else if (val == abr->val) {
       return true;
   } else if (val < abr->val) {
       return abr_est_present(val, abr->fg);
   } else {
       return abr_est_present(val, abr->fd);
   }
}
*/

    .text
    .globl abr_est_present
/* DEBUT DU CONTEXTE
Fonction :
    abr_est_present : non feuille
Contexte :
    val  : registre a0
    abr : registre a1
    ra : pile *(sp+0)
FIN DU CONTEXTE */
abr_est_present:
    addi sp, sp, -4
    sw ra, 0(sp)
abr_est_present_fin_prologue:
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
    jal abr_est_present
    j endif
else:
    lw a1, 8(a1)
    jal abr_est_present
endif:
abr_est_present_debut_epilogue:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
