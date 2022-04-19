.text
.global main

main:
    ADR r1, fibonacci @ result array
    MOV r2, #12 @ s
    MOV r3, #2 @ n
    MOV r4, #0 @ f(n-2)
    MOV r5, #1 @ f(n-1)
    
    BL fibo_check

    B fim

fibo_check:
    CMP r3, r2
    BLT fibo_loop
    MOV pc, lr

fibo_loop:
    ADD r6, r5, r4
    MOV r4, r5
    MOV r5, r6
    STRB r6, [r1, r3]
    ADD r3, r3, #1
    B fibo_check
    
fim:    
    SWI 0x123456

fibonacci:
    .byte 0,1,0,0,0,0,0,0,0,0,0,0
