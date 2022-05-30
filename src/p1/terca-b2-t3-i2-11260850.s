.text
.globl main

main:
    MOV r0, #3 @ valor de entrada

pronto:
    ADR r5, dados @ endereco do primeiro elemento
    MOV r6, #0 @ indice para ler vetor

loop:
    LDR r1, [r5, r6, LSL #2] @ valor lido atualmente
    
    @ checa se chegamos ao final do vetor
    CMP r1, #0
    MOVEQ r1, #-1
    BEQ fim

    @ divide r1 por r0
    MOV r2, r0
    BL divide

    @ checa se valor em r1 eh divisivel por r0
    CMP r4, #0
    MOVEQ r1, r6
    BEQ fim

    ADD r6, r6, #1
    B loop

fim:
    SWI 0x123456

@ divide(r1, r2) -> r3, r4
@   r1: dividendo
@   r2: divisor
@   r3: quociente
@   r4: resto
divide:
    STMFD sp!, {r1, r2, r5, r6, r7} @ Guarda registradores na pilha

    MOV r5, r2 @ Cópia do divisor
    MOV r3, #0 @ Reseta quociente

    @ Alinha dividendo e divisor
    CLZ r6, r1
    CLZ r7, r2
    SUBS r6, r7, r6
    MOVPL r2, r2, LSL r6

    B divide_cond

    divide_loop:
        MOV r3, r3, LSL #1
        CMP r1, r2
        SUBGE r1, r1, r2
        ADDGE r3, r3, #1
        MOV r2, r2, LSR #1

    divide_cond:
        CMP r2, r5
        BGE divide_loop
    
    MOV r4, r1 @ Retorna valor do resto
    LDMFD sp!, {r1, r2, r5, r6, r7} @ Restaura pilha
    MOV pc, lr

dados:
    @ .word 5, 0
    .word 0x1, 0x2, 3, 4, 5, 6, 7, 0x8, 0x9, 0
