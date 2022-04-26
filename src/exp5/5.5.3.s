.text
.global main

main:
    MOV r5, #11 @ Tamanho do array
    LDR r0, =dados+4 @ A série está localizada em r0

    LDR r1, [r0] @ Guarda o maior valor do array
    MOV r2, #1 @ contador do loop
    B loop

fim:
    SWI 0x123456

loop:
    CMP r2, r5
    BGE done

    LDR r3, [r0, r2, LSL #2]
    CMP r3, r1
    MOVGT r1, r3

    ADD r2, r2, #1

    B loop

done:
    ADR r0, dados
    STR r1, [r0]
    B fim

dados:
    .word 0, 1,28,3,153,5,6,56,8,9,11,10
