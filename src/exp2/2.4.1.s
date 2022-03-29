.text
.globl main
main:
	MOV	r0, #15	     @ comentarios vem depois de @ ou entre /* ... */		
	MOV	r1, #20
	BL	firstfunc    @ desvia para funcao, coloca o enderenco de retorno em R14 ou LR (link register).		
	MOV	r0, #0x18		
	LDR	r1, =0x20026		
	SWI	0x123456     @ no simulador (target sim) nao existe codigo a ser rodado quando se faz uma SWI sw. interrupt e portanto, gera erro.		
firstfunc:
	ADDS	r0, r0, r1   @ O S em ADDS coloca as flags N Z C V no CPSR		
	MOV	pc, lr	     @ retorna da funcao		
