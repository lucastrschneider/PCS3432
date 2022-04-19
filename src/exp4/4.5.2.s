.text
.globl main

main:
    MOV r1, #15 @ y
    ADR r2, array
    MOV r5, #5 @ primero indice na memoria

    # Carrega na memoria na quinta posicao
    MOV r3, #3
    STR r3, [r2, r5, LSL #2]    

    @ Pos indexado
    ADD r4, r2, r5, LSL #2 @ r4 contem o endereco de array[5]
    LDR r0, [r4], r5, LSL #2 @ r0 contem o valor de array[5] e atualiza o valor de r4 para apontar para array[10]
    ADD r0, r0, r1
    STR r0, [r4], #0

checa_pos:
    @ Muda o valor de y para checar o pre indexado
    MOV r1, #10 @ y

    @ Pre indexado
    MOV r4, r2
    LDR r0, [r4, r5, LSL #2]!
    ADD r0, r0, r1
    STR r0, [r4, r5, LSL #2]

checa_pre:
fim:
    SWI 0x1234

array:
    .space 100
