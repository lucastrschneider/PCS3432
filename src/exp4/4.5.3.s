.text
.global main

main:
    ADR r1, first_array
    ADR r2, second_array
    MOV r3, #0 @ R3 será nosso i, começando com zero
    MOV r4, #5 @ C
for:
    CMP r3, #11 @ compara i e 11
    BGE fim @ Caso r3 seja maior ou igual a 11, então sai do loop
    LDRB r5, [r2, r3] @ r5 = second_array[i]
    ADD r5, r5, r4 @ r5 = second_array[i] + C
    STRB r5, [r1, r3] @ first_array[i] = r5
    ADD r3, r3, #1 @ i = i + 1
    B for @ Volta ao loop
fim:
    SWI 0x123456

first_array:
    .byte 0,0,0,0,0,0,0,0,0,0,0,0
second_array:
    .byte 0,1,2,3,4,5,6,7,8,9,10,0
    