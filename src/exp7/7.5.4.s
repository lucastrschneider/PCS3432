.text
.global main

main:
    LDR	r0, =0x3ff5000 	@ IOPMOD
    LDR	r3, =0x1FC00	@ seta 1 nos bits [16:10]
    STR	r3, [r0]	@ seta IOPMOD[7:4] como output
    
    LDR r0, =0x3FF5008 @ IOPDATA

    ADR r3, data @ Array a ser mostrado no DISPLAY
    MOV r2, #16 @ Tamanho do array
    MOV r5, #0 @ contador

    loop_display:
        CMP r5, r2
        BGE fim
        LDRB r1, [r3, r5] @ valor para ser mostrado no display

        BL display_hex_seven_seg

        end_loop_display:
            BL delay
            ADD r5, r5, #1
            B loop_display

fim:
    SWI 0x123456

@ delay()
delay:
    STMFD sp!, {r2} @ Store in stack registers

    LDR r2, =0x5fffff
    delay_loop:
        SUBS r2, r2, #1
        BPL delay_loop

    LDMFD sp!, {r2} @ Recover registers on stack
    MOV pc, lr

@ display_hex_seven_seg(r0, r1)
@   r0: IOPDATA
@   r1: value
display_hex_seven_seg:
    STMFD sp!, {r2, r3} @ Store in stack registers

    ADR r2, seven_seg_array @ endereco da tabela de valores
    LDRB r3, [r2, r1] @ pega o valor do registrador correto para cada número
    
    MOV r3, r3, LSL #10
    
    CMP r1, #0
    MOVLT r3, #0
    CMP r1, #15
    MOVGT r3, #0

    STR r3, [r0]

    LDMFD sp!, {r2, r3} @ Recover registers on stack
    MOV pc, lr

data:
    .byte 0, 1, 2, -3, 4, 5, 6, 20, 21, 22, 10, 11, 12, 13, 14, 15

@ valor de cada um dos displays
seven_seg_array:
    .byte 0b1011111, 0b0000110, 0b0111011, 0b0101111, 0b1100110, 0b1101101, 0b1111101, 0b0000111, 0b1111111, 0b1101111, 0b1110111, 0b1111100, 0b1011001, 0b0111110, 0b1111001, 0b1110001
