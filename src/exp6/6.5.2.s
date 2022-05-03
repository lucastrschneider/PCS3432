.text
.global main

main:
    ADR r0, tamanho
    LDRB r1, [r0]
    ADR r0, dados

    BL bubble_sort

    B fim

@ bubble_sort(r0, r1)
@   r0: input data
@   r1: input size 
bubble_sort:
    STMFD sp!, {r1, r2, r3, r4, r5, lr} @ Store in stack registers

    MOV r2, r1 @ tamanho atual do array
bubble_loop_1:
    MOV r3, #0 @ contador do loop interno
    bubble_loop_2:
        ADD r5, r0, r3, LSL #2
        
        ADD r3, r3, #1
        CMP r3, r2
        BGE bubble_loop_2_done
        
        BL check_and_swap

        B bubble_loop_2

    bubble_loop_2_done:

    SUBS r2, r2, #1
    BNE bubble_loop_1

bubble_loop_1_done:
    LDMFD sp!, {r1, r2, r3, r4, r5, lr} @ Recover registers on stack
    MOV pc, lr  @ End function

@ check_next(r5):
@   r5: address to check with next position
check_and_swap:
    STMFD sp!, {r1, r2, r3, lr} @ Store in stack registers

    LDMIA r5, {r1, r2}
    CMP r1, r2
    BLE check_and_swap_end
    MOV r3, r1
    MOV r1, r2
    MOV r2, r3
    STMIA r5, {r1, r2}
check_and_swap_end:
    LDMFD sp!, {r1, r2, r3, lr}
    MOV pc, lr

fim:
    SWI 0x123456


tamanho:
    .word 12

dados:
    .word -4,57,2,16,1,98,8,15,5,58,12,4
