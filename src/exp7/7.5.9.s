.text
.global main

main:
    LDR	r0, =0x3ff5000 	@ IOPMOD
    LDR	r2, =0x1FC00	@ seta 1 nos bits [16:10] e 0 nos bits [3:0]
    STR	r2, [r0]	@ seta IOPMOD[16:10] como output e IOPMOD[3:0] como input
    
    LDR r0, =0x3FF5008 @ IOPDATA
    MOV r1, #0 @ registrador para armazenar valor de IOPDATA
loop:
    BL read_dip_switch
    BL display_hex_seven_seg
    B loop

@ read_dip_switch(r0) -> r1
@   r0 IOPDATA address
@   r1 value read
read_dip_switch:
    @ Faze a leitura do IOPDATA
    LDR r1, [r0]
    @ Remove os bits que não pertencem ao DIP switch
    AND r1, r1, #0x0F

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

@ valor de cada um dos displays
seven_seg_array:
    .byte 0b1011111, 0b0000110, 0b0111011, 0b0101111, 0b1100110, 0b1101101, 0b1111101, 0b0000111, 0b1111111, 0b1101111, 0b1110111, 0b1111100, 0b1011001, 0b0111110, 0b1111001, 0b1110001
