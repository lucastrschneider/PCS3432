.text
.globl main
main:
	LDR	r0, =0xF631024C	     @ comentarios vem depois de @ ou entre /* ... */		
	LDR	r1, =0x17539ABD
	BL	swap    @ desvia para funcao, coloca o enderenco de retorno em R14 ou LR (link register).		
    SWI	0x123456     @ no simulador (target sim) nao existe codigo a ser rodado quando se faz uma SWI sw. interrupt e portanto, gera erro.		
swap:
	EOR r0, r0, r1
    EOR r1, r0, r1
    EOR r0, r0, r1		
	MOV	pc, lr	     @ retorna da funcao		
