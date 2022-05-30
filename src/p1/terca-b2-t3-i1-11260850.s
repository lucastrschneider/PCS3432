.text
.globl main

main:
    ADR r0, dados

pronto:
    LDR r1, [r0]

fim:
    SWI 0x123456

dados:
    .word 0x1, 0x2, 3, 4, 5, 6, 7, 0x8, 0x9, 0
