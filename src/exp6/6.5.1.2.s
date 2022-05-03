.text
.global main

main:
    ADR r0, b
    MOV r1, #2
    STR r1, [r0]

    ADR r0, c
    MOV r1, #3
    STR r1, [r0]
    
    ADR r0, d
    MOV r1, #4
    STR r1, [r0]

    BL func1

    B fim

@ b, c, d -> a
func1:
    STMFD sp!, {r0, r1, r2, r3} @ Store in stack registers
    
    ADR r0, b
    LDR r1, [r0]

    ADR r0, c
    LDR r2, [r0]

    MUL r3, r1, r2

    ADR r0, d
    LDR r1, [r0]

    ADD r3, r3, r1

    ADR r0, a
    STR r3, [r0]

    LDMFD sp!, {r0, r1, r2, r3} @ Recover registers on stack

    MOV pc, lr

fim:
    SWI 0x123456

a:
    .word 0

b:
    .word 0

c:
    .word 0

d:
    .word 0