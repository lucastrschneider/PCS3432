.text
.globl main
main:
	LDR r0, =0x87
    MOV r1, #0x0
absolute:
    MOVS r1, r0
    RSBMI r1, r0, #0
fim:
    SWI 0x1234

