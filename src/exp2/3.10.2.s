.text
.globl main
main:
	LDR	r0, =0xFFFFFFFF	     @ comentarios vem depois de @ ou entre /* ... */		
	LDR	r1, =0x80000000
	BL	firstfunc    @ desvia para funcao, coloca o enderenco de retorno em R14 ou LR (link register).		
    MOV	r0, #0x18		
	LDR	r1, =0x20026		
	SWI	0x123456     @ no simulador (target sim) nao existe codigo a ser rodado quando se faz uma SWI sw. interrupt e portanto, gera erro.		
firstfunc:
	MULS	r2, r0, r1   @ O S em ADDS coloca as flags N Z C V no CPSR		
	MOV	pc, lr	     @ retorna da funcao		
