.text
.global main

main:
    MOV r0, #0
    ADR r1, a
    ADR r2, b
    B loop

fim:    
    SWI 0x123456

loop:
    CMP r0, #8
    BGE fim

    RSB r3, r0, #7
    LDR r3, [r2, r3, LSL #2]
    STR r3, [r1, r0, LSL #2]

    ADD r0, r0, #1
    B loop

a:
    .word 0,0,0,0,0,0,0,0

b:
    .word 1,2,3,4,5,6,7,8
