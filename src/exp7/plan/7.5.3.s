.text
.global main

main:
    LDR	r0, =0x3ff5000 	@ IOPMOD
    LDR	r3, =0x1FC00	@ seta 1 nos bits [16:10]
    STR	r3, [r0]	@ seta IOPMOD[7:4] como output
    
    LDR r0, =0x3FF5008 @ IOPDATA

    ADR r3, data
    LDR r1, [r3] @ valor para ser mostrado no display

    CMP r1, #0xF
    BGT fim

    ADR r2, table @ endereco da tabela de valores

    LDR r3, [r2, r1, LSL #2] @ pega o valor do registrador correto para cada número

    MOV r3, r3, LSL 10
    STR r3, [r0]

fim:
    SWI 0x123456

data:
    .word 10

@ valor de cada um dos displays
table:
    .word 