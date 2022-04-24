	.text
	.globl main
main:
    LDR r7, =0xFF03FC06
    LDR r0, =0x24
    STR r7, [r0]    @ adiciona no endereco 0x24 o valor do registrador r7

	LDRSB sp, [r0]  @ signed byte, sp=0x6, 6
    LDRSH sp, [r0]  @ signed halfword, sp=FFFFFC06, -1018
    LDR sp,[r0]     @ word, sp=FF03FC06, -16516090
    LDRB sp,[r0]    @ unsigned byte, sp=0x6, 6

	SWI	0x123456

    STR r6, [r4,#4] 
    LDR r3, [r12], #6 
    LDRB r4, [r3,r2]! 
    LDRSH r12, [r6] 