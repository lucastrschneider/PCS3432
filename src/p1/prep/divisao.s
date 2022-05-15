.text
.globl main
 
main:
    LDR r1, =487 @ dividendo
    LDR r2, =29 @ divisor
    BL divide
    B fim

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
