.text
.global main

main:
    ADR r0, b
    LDR r1, [r0]

    ADR r0, c
    LDR r2, [r0]
    
    ADR r0, d
    LDR r3, [r0]

    BL func1
    
    ADR r0, a
    STR r4, [r0]

    B fim

@ r1, r2, r3 -> r4
func1:
    STMFD sp!, {lr} @ Store in stack registers
    
    MUL r0, r1, r2
    BL func2

    LDMFD sp!, {lr} @ Recover registers on stack
    MOV pc, lr

@ r0, r3 -> r4
func2:
    ADD r4, r0, r3
    MOV pc, lr

fim:
    SWI 0x123456

a:
    .word 0

b:
    .word 2

c:
    .word 3

d:
    .word 4