.text
.global main

main:
    ADR r1, array_1 @ int a[]
    MOV r2, #12 @ int s 
    MOV r3, #0 @ r3 será nosso i = 0

    MOV r4, #0
    BL init_Indices

check_a:

    ADR r1, array_2 @ int a[]
    MOV r2, #12 @ int s
    MOV r3, r1 @ r3 será nosso ponteiro
    
    BL init_Pointers

check_b:
    B fim

init_Indices:
    CMP r3, r2 @ Compara i à s
    MOVGE pc, lr
    STRB r4, [r1, r3]
    ADD r3, r3, #1
    B init_Indices
    
    
init_Pointers:
    MOV r4, #0
    ADD r5, r1, r2
loop_init_Pointers:
    STRB r4, [r3], #1
    CMP r3, r5
    BLT loop_init_Pointers
    MOV pc, lr

fim:    
    SWI 0x123456

array_1:
    .byte 1,2,3,4,5,6,7,8,9,10,11,12

array_2:
    .byte 1,2,3,4,5,6,7,8,9,10,11,12
    