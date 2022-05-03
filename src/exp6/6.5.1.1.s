.text
.global main

main:
    MOV r1, #2 @ b = 2
    MOV r2, #3 @ c = 3
    MOV r3, #4 @ d = 4

@ r1, r2, r3 -> r0
func1:
    MUL r0, r1, r2
    ADD r0, r0, r3

fim:
    SWI 0x123456
