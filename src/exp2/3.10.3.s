.text
.globl main
main:
    LDR r3, =0x3
	MOV r1, r3, LSL	#5	
	SWI	0x123456     @ no simulador (target sim) nao existe codigo a ser rodado quando se faz uma SWI sw. interrupt e portanto, gera erro.		
