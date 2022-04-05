.text
.globl main
main:
	LDR r0, =-4
    LDR r1, =-2
preparingRegisters:
    MOV r4, #0
    MOVS r2, r0
    RSBMI r2, r0, #0
    MOVMI r4, #1
    MOVS r3, r1
    EORMI r4, r4, #1
    RSBMI r3, r1, #0
multiplication:
    UMULL r6, r7, r2, r3
    CMP r4, #0
    BNE invert @ se r4 != 0
    B fim
invert:
    MVN r7, r7
    MVN r6, r6
    ADDS r6, r6, #1
    ADC r7, r7, #0
fim:
    SWI 0x1234

