.text
.global main

main:
    LDR	r0, =0x3ff5000 	@ IOPMOD
    LDR	r2, =0xf0	@ seta 1 nos bits [7:4] e 0 nos bits [3:0]
    STR	r2, [r0]	@ seta IOPMOD[7:4] como output e IOPMOD[3:0] como input
    
    LDR r0, =0x3FF5008 @ IOPDATA
    MOV r1, #0 @ registrador para armazenar valor de IOPDATA

    LDR r1, [r0]
    AND r1, r1, #0x0F @ Pegando valores dos switches

    BL display_hex_led
    B fim

@ display_led(r0, r1)
@   r0: IOPDATA address
@   r1: value
display_hex_led:
    STMFD sp!, {r2} @ Store in stack registers

    MOV r2, r1, LSL #4 @ coloca o valor nos bits [7:4]
    STR r2, [r0]

    LDMFD sp!, {r2} @ Recover registers on stack
    MOV pc, lr

fim:
    SWI 0x123456
