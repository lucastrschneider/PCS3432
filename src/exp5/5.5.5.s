.text
.global main

main:
    LDR r0, =0b1010100100011111 @ Input
    MOV r1, #0 @ Resposta
    B check_ok

fim:
    SWI 0x123456

check_ok:
    CMP r0, #0 @ Se r0 for zero, o loop termina
    BEQ fim

loop:
    MOVS r0, r0, LSR #1 @ Pega o último bit e coloca no carry
    EORCS r1, r1, #1 @ Caso carry seja 1
    B check_ok
