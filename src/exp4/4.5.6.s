.text
.global main

main:
    MOV r1, #22 @ n
    MOV r3, #2 @ x
    MOV r4, #0 @ f(x-2)
    MOV r5, #1 @ f(x-1)
    
    BL fibo_check

    B fim

fibo_check:
    CMP r3, r1
    BLE fibo_loop
    MOV pc, lr

fibo_loop:
    ADD r0, r5, r4
    MOV r4, r5
    MOV r5, r0
    ADD r3, r3, #1
    B fibo_check
    
fim:    
    SWI 0x123456
