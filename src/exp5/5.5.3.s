.text
.global main

main:
    MOV r5, #11 @ Tamanho do array
    ADR r0, series @ A série está localizada em r0

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
    ADR r0, result
    STR r1, [r0]
    B fim

result:
    .space 4

series:
    .word 1,28,3,153,5,6,56,8,9,11,10
