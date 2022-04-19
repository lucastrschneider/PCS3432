.text
.globl main

main:
	MOV r0, #0 @ x
    MOV r1, #2 @ y
    ADR r2, array
    MOV r5, #5 @ indice na memoria

    # Carrega na memoria
    MOV r3, #3
    STR r3, [r2, #20]

    @ Pos indexado
    ADD r4, r2, r5, LSL #2 @ r4 contem o endereco de array[5]
    LDR r0, [r4], #0
    ADD r0, r0, r1

    @ Pre indexado
    LDR r0, [r2, r5, LSL #2]
    ADD r0, r0, r1

fim:
    SWI 0x1234

array:
    .space 100
