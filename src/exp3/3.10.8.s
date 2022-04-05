.text
.globl main
main:
	LDR r1, =0b10110100
    MOV r0, #0
    MOV r2, #0
    B primeira_parte
primeira_parte:
    BL shiftTwice
    BL insertIntoR2ZeroParts

    BL shiftTwice
    BL insertIntoR2ZeroParts

    BL shiftTwice
    BL insertIntoR2ZeroParts

    BL shiftTwice
    BL insertIntoR2ZeroParts

    BL insertIntoR2OneParts

    BL insertIntoR2OneParts

    BL insertIntoR2OneParts

    BL insertIntoR2OneParts

    B fim

shiftTwice:
    MOVS r1, r1, ROR #0x1
    MOV r0, r0, RRX
    MOVS r1, r1, ROR #0x1
    MOV r0, r0, RRX
    MOV pc, lr

insertIntoR2ZeroParts:
    MOV r2, r2, LSL #1
    MOVS r0, r0, LSL #1
    MOV r2, r2, LSL #1
    ADC r2, r2, #0
    MOVS r0, r0, LSL #1
    MOV r2, r2, LSL #1
    ADC r2, r2, #0
    MOV pc, lr

insertIntoR2OneParts:
    MOV r2, r2, LSL #1
    ADD r2, r2, #1
    MOVS r1, r1, LSL #1
    MOV r2, r2, LSL #1
    ADC r2, r2, #0
    MOVS r1, r1, LSL #1
    MOV r2, r2, LSL #1
    ADC r2, r2, #0
    MOV pc, lr
fim:
    SWI 0x1234

