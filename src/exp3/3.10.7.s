.text
.globl main
 
main:
  LDR r1, =100 @ dividendo
  LDR r2, =10 @ divisor
  LDR r3, =0 @ quociente
  LDR r5, =0 @ resto
  MOV r4, r2 @ copia do divisor
  B checa_alinhado
 
alinhar:
  MOV r2, r2, LSL #1
  B checa_alinhado
 
checa_alinhado:
  CMP r1, r2
  BGT alinhar
  B alinhamento_finalizado
 alinhamento_finalizado:
  B checa_divisao
divisao:
  MOV r3, r3, LSL #1
  CMP r1, r2
  SUBGE r1, r1, r2
  ADDGE r3, r3, #1
   MOV r2, r2, LSR #1
  B checa_divisao
checa_divisao:
  CMP r2, r4
  BGE divisao
  MOV r5, r1
 
fim:
  SWI 0x123456
