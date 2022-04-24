.text
.global main

main:
    MOV r0, #1
    MOV r1, #5
    BL foo

fim:    
    SWI 0x123456

foo:
    ADDS r0, r0, r1
    MOVPL r0, #0 @ positive or zero
    MOVMI r0, #1 @ negative
    MOV pc, lr