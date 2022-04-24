.text
.global main

main:
    LDR r1, =0b10101100100100000000110101100101 @ entrada
    MOV r2, #0 @ resultado
    MOV r3, #0 @ contador para números de shifts
    LDR r4, =0b1011 @ sequência a ser detectada
    MOV r5, #4 @ tamanho da sequência

    RSB r6, r5, #32 @ o quanto tem que shiftar para a direita

    BL fsm_loop

fim:    
    SWI 0x123456

fsm_loop:
    CMP r3, r6
    MOVGT pc, lr @ retorna para função

    MOV r7, r1, LSL r3
    MOV r7, r7, LSR r6

    CMP r7, r4

    MOV r2, r2, LSL #1
    ADDEQ r2, r2, #1 @ Adiciona 1 ao final de r2 se for igual

    ADD r3, r3, #1
    B fsm_loop
    