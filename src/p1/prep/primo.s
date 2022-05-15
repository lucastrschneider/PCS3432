.text
.globl main
 
main:
    @ LDR r1, =1077098821 @ não primo
    @ LDR r1, =31543 @ primo
    @ LDR r1, =34147 @ primo
    LDR r1, =11260851 @ não primo
    BL primo
    B fim

fim:
    SWI 0x123456

@ primo(r1) -> r2
@   r1: numero testado
@   r2: 1 se primo, 0 se não
primo:
    STMFD sp!, {r1, r3, r4, r5, lr} @ Guarda registradores na pilha

    @ Caso especial se o número for 0
    CMP r1, #0
    MOVEQ r2, #0
    BEQ primo_end

    @ Guarda em r5 o valor da metade do numero testado
    MOV r2, #2
    BL divide
    MOV r5, r3

    primo_loop:
        @ Se o iterador já tiver passado da metade, então é primo
        CMP r2, r5
        MOVGT r2, #1
        BGT primo_end

        BL divide

    primo_cond:
        CMP r4, #0

        @ Se tiver resto não nulo
        ADDNE r2, r2, #1
        BNE primo_loop
        
        @ Se tiver resto nulo
        MOVEQ r2, #0
        BEQ primo_end

    primo_end:        
        LDMFD sp!, {r1, r3, r4, r5, lr} @ Restaura pilha
        MOV pc, lr

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
