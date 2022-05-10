.text
.global main

main:
    LDR	r0, =0x3ff5000 	@ IOPMOD
    LDR	r2, =0xf0	@ seta 1 nos bits [7:4] e 0 nos bits [3:0]
    STR	r2, [r0]	@ seta IOPMOD[7:4] como output e IOPMOD[3:0] como input
    
    LDR r0, =0x3FF5008 @ IOPDATA
    MOV r1, #0 @ registrador para armazenar valor de IOPDATA
loop:
    LDR r1, [r0]
    MOV r1, r1, LSL #4
    STR r1, [r0]
    B loop
