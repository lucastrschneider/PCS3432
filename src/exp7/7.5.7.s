.text
.global main

main:
    LDR	r0, =0x3ff5000 	@ IOPMOD
    LDR	r2, =0x0	@ seta  0 nos bits [3:0]
    STR	r2, [r0]	@ seta IOPMOD[3:0] como input

    LDR r0, =0x3FF5008 @ IOPDATA
    MOV r1, #0 @ registrador para armazenar valor de IOPDATA

    BL read_dip_switch
    B done

@ read_dip_switch(r0) -> r1
@   r0 IOPDATA address
@   r1 value read
read_dip_switch:
    @ Faze a leitura do IOPDATA
    LDR r1, [r0]
    @ Remove os bits que não pertencem ao DIP switch
    AND r1, r1, #0x0F

    MOV pc, lr

done:
    STR r1, data

fim: 
    SWI 0x123456

data:
    .byte 0
