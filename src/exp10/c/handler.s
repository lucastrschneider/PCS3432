.global handler_timer
.text

handler_timer:
    LDR r0, TIMER0X
    MOV r1, #0x0
    STR r1, [r0] @Escreve no registrador TIMER0X para limpar o pedido de interrupção
    
    @ Inserir código que sera executado na interrupção de timer aqui
    @ (chaveamento de processos, ou alternar LED por exemplo)
    
    mov pc, lr @retorna

TIMER0X: .word 0x101E200c @timer 0 interrupt clear register
