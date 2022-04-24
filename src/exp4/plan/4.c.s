.text
.globl main

main:
    ADR r0, array_a
    ADR r1, array_b
    MOV r3, #0
    BL copy_reverse_array

fim:
	SWI	0x123456

copy_reverse_array:
    RSBS r5, r3, #7
    LDR r4, [r1, r5, LSL #2]
    STR r4, [r0, r3, LSL #2]
    ADD r3, r3, #1
    BNE copy_reverse_array
    MOV pc, lr

array_a: .word 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
array_b: .word 0x10,0x20,0x30,0x40,0x50,0x60,0x70,0x80
