	.text
	.globl main
main:
    LDR r3, =0x4000
    LDR r4, =0x20

    @ valores que serão carregados
    LDR r9, =0x5
    LDR r6, =0x6

    LDR r0, =0x7
    LDR r1, =0x4100
    STR r0, [r1]

    LDR r0, =0x8
    LDR r1, =0x4000
    STR r0, [r1]

    LDR r1, =0x4020

    STRB r9, [r3, r4]         @ [[r3] + [r4] = 0x4020] = r9, r3 = 0x4000
    LDR r0, [r1]

    LDRB r8, [r3, r4, LSL #3] @ r8 = [[r3] + [r4 * 8] = 0x4100], r3 = 0x4000
    
    LDR  r7, [r3], r4         @ r7 = [0x4000], r3 = [0x4020]
    
    STRB r6, [r3], r4, ASR #2 @ [0x4020] = r6, r3 = r3 + r4/4 = 0x4028
    LDR r0, [r1]

	SWI	0x123456
