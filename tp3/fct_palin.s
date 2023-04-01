/*
bool palin(const char *ch)
{
    uint32_t inf, sup;
    inf = 0;
    sup = strlen(ch) - 1;
    while (inf < sup && ch[inf] == ch[sup]) {
        inf++;
        sup--;
    }
    return inf >= sup;
}
*/
    .text
    .globl palin
    /* bool palin(char *ch) */
/* DEBUT DU CONTEXTE
Fonction :
    palin : non feuille
Contexte :
    ch  : registre a0; pile *(sp+0)
    inf  : pile *(sp+4)
    sup  : pile *(sp+8)
    ra  : pile *(sp+12)
FIN DU CONTEXTE */
palin:
    addi sp, sp, -16
    sw ra, 12(sp)
palin_fin_prologue:
    sw zero, 4(sp)
    sw a0, 0(sp)
    jal strlen
    addi t0, a0, -1
    sw t0, 8(sp)
    lw a0, 0(sp)
while:
    lw t0, 4(sp)
    lw t1, 8(sp)
    bge t0, t1, endwhile
    add t2, a0, t0
    lbu t2, 0(t2)
    add t3, a0, t1
    lbu t3, 0(t3)
    bne t2, t3, endwhile
    addi t0, t0, 1
    addi t1, t1, -1
    sw t0, 4(sp)
    sw t1, 8(sp)
    j while
endwhile:
    sltu a0, t0, t1
    not a0, a0
palin_debut_epilogue:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret
