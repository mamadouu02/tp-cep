/*
int exo3(int32_t x) {
  int32_t val_fx = ma_fonction(x, 2*x);
  int32_t val_fy = ma_fonction(2*x, x);
    if (val_fy > val_fx) {
        return 2*x;
    } else {
        return x;
    }
}
*/
    .text
    .globl exo3
/* DEBUT DU CONTEXTE
Fonction :
    exo3 : non feuille
Contexte :
    x : registre a0; pile *(sp+0)
    val_fx : registre t1; pile *(sp+4)
    val_fy : registre t2; pile *(sp+8)
    ra : pile *(sp+12)
FIN DU CONTEXTE */
exo3:
exo3_fin_prologue:
exo3_debut_epilogue:
    ret


/* Pour éviter les problèmes avec les interruptions */
mon_vecteur:
    mret
