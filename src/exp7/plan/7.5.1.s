.text
.global main

main:
    LDR	r0, =0x3ff5000 	@ IOPMOD
    LDR	r2, =0xf0	@ seta 1 nos bits [7:4]
    STR	r2, [r0]	@ seta IOPMOD[7:4] como output
    
    LDR r0, =0x3FF5008 @ IOPDATA
    MOV r1, #0 @ contador

loop:
    BL display_value
    BL update_ascending
    BL delay
    B loop

display_value:
    STMFD sp!, {r2} @ Store in stack registers

    MOV r2, r1, LSL #4 @ coloca o valor nos bits [7:4]
    STR r2, [r0]

    LDMFD sp!, {r2} @ Recover registers on stack
    MOV pc, lr

update_ascending:
    ADD r1, r1, #1
    CMP r1, #0xF
    MOVGT r1, #0
    MOV pc, lr

update_descending:
    SUBS r1, r1, #1
    MOVMI r1, #0xF
    MOV pc, lr

delay:
    STMFD sp!, {r2} @ Store in stack registers

    LDR r2, =0xfffff
    delay_loop:
        SUBS r2, r2, #1
        BPL delay_loop

    LDMFD sp!, {r2} @ Recover registers on stack
    MOV pc, lr
