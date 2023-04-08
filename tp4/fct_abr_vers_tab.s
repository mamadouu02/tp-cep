/*
void abr_vers_tab(struct noeud_t *abr)
{
    if (abr != NULL) {
        abr_vers_tab(abr->fg);
        *ptr = abr->val;
        ptr++;
        struct noeud_t *fd = abr->fd;
        free(abr);
        abr_vers_tab(fd);
    }
}
*/

    .text
    .globl abr_vers_tab
/* DEBUT DU CONTEXTE
Fonction :
    abr_vers_tab : non feuille
Contexte :
    abr  : pile *(sp+0); memoire
    fd  : pile *(sp+4)
    ra  : pile *(sp+8)
    ptr : memoire
FIN DU CONTEXTE */
abr_vers_tab:
    addi sp, sp, -12
    sw ra, 8(sp)
abr_vers_tab_fin_prologue:
if:
    beqz a0, endif
    sw a0, 0(sp)
    lw a0, 4(sp)
    jal abr_vers_tab
    lw a0, 0(sp)
    lw t0, ptr
    lw t1, 0(a0)
    sw t1, 0(t0)
    addi t0, t0, 4
    sw t0, ptr, t1
    lw t0, 8(a0)
    sw t0, 4(sp)
    jal free
    lw a0, 4(sp)
    jal abr_vers_tab
endif:
abr_vers_tab_debut_epilogue:
    lw ra, 8(sp)
    addi sp, sp, 12
    ret

    .data
    .globl ptr
    .comm ptr, 4