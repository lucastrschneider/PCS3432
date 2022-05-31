    .text
    .global divide
@ divide(r0, r1) -> r2, r3
@   r0: dividendo
@   r1: divisor
@   r2: quociente
@   r3: resto
divide:
    STMFD sp!, {r0, r1, r5, r6, r7} @ Guarda registradores na pilha

    MOV r5, r1 @ Cópia do divisor
    MOV r2, #0 @ Reseta quociente

    @ Alinha dividendo e divisor
    CLZ r6, r0
    CLZ r7, r1
    SUBS r6, r7, r6
    MOVPL r1, r1, LSL r6

    B divide_cond

    divide_loop:
        MOV r2, r2, LSL #1
        CMP r0, r1
        SUBGE r0, r0, r1
        ADDGE r2, r2, #1
        MOV r1, r1, LSR #1

    divide_cond:
        CMP r1, r5
        BGE divide_loop
    
    MOV r3, r0 @ Retorna valor do resto
    LDMFD sp!, {r0, r1, r5, r6, r7} @ Restaura pilha
    MOV pc, lr
