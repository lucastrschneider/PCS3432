.text
.global main

main:
    MOV r0, #1 @ 1: byte; 2: half-word; 4: word
    MOV r1, #10 @ value

    BL push_stack

    B fim

@ push to stack without multiple store
@ r0 - 1: byte; 2: half-word; 4: word
@ r1 - data
push_stack:
    MOV r2, #0

    CMP r0, #1
    STREQ r2, [sp] 
    STREQB r1, [sp]

    CMP r0, #2
    STREQ r2, [sp] 
    STREQH r1, [sp]

    CMP r0, #4
    STREQ r1, [sp]
    
    SUB sp, sp, #4
    MOV pc, lr

fim:
    SWI 0x123456