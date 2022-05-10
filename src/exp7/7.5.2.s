.text
.global main

main:
@ Configuração IOPMOD
    LDR	r0, =0x3ff5000 	@ IOPMOD
    LDR	r2, =0xf0	@ seta 1 nos bits [7:4]
    STR	r2, [r0]	@ seta IOPMOD[7:4] como output

@ Variáveis locais
    LDR r0, =0x3FF5008 @ IOPDATA

    ADR r3, data
    LDR r1, [r3]

    BL display_hex_led

fim:
    SWI 0x123456

@ display_led(r0, r1)
@   r0: IOPDATA address
@   r1: value
display_hex_led:
    STMFD sp!, {r2} @ Store in stack registers

    MOV r2, r1, LSL #4 @ coloca o valor nos bits [7:4]
    STR r2, [r0]

    LDMFD sp!, {r2} @ Recover registers on stack
    MOV pc, lr

data:
    .byte 0


