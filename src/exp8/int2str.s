    .text
    .global int2str

@ Converte inteiro para string
@ r0 - inteiro
@ r1 - ponteiro para string (retornado a cada chamada com valor novo)
int2str:
    @ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4

    @ salva variaveis locais
    sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]

    mov r1, #10

    @ divide r0 por 10
    bl divide

    @ salva o resto na pilha
    sub sp, sp, #4
    str r3, [fp, #-24]

    @ restaura o endereço da string
    ldr r1, [fp, #-20]

    @ Checa condição de saída
    cmp r2, #0
    beq vamos_sair

    mov r0, r2
    bl int2str

vamos_sair:
    ldr r3, [fp, #-24]
    add r3, r3, #0x30
    strb r3, [r1]
    mov r3, #0
    strb r3, [r1, #1]
    add r1, r1, #1

    add sp, sp, #12

    ldmfd sp, {fp, sp, pc}
