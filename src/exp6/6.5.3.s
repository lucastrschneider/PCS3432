.text
.global main

main:
    ADR r3, N @ N = 4
    LDR r0, [r3]

    ADR r1, quadrado @ M = matrix

    MUL r3, r0, r0
    ADD r3, r3, #1
    MUL r2, r3, r0
    MOV r2, r2, LSR #1

    BL magicSquare
    B fim

magicSquare:
    STMFD sp!, {r0, r1, r2, lr} @ Store in stack registers
    
    MOV r9, #1

    BL check_rows
    AND r9, r9, r10

    BL check_columns
    AND r9, r9, r10

    BL check_main_diagonal
    AND r9, r9, r10
    
    BL check_second_diagonal
    AND r9, r9, r10
    
    LDMFD sp!, {r0, r1, r2, lr} @ Recover registers on stack
    MOV pc, lr

@ rows check? r10 = 1
check_rows:
    STMFD sp!, {r0, r1, r2}
    MOV r6, r0 

    rows_loop:
        CMP r6, #0
        MOVLE r10, #1
        BLE rows_loop_end

        MOV r3, #0 @ i = 0
        MOV r4, #0 @ Soma da linha

        row_loop:
            CMP  r3, r0
            BGE row_loop_fim

            LDR r5, [r1], #4
            ADD r4, r4, r5

            ADD r3, r3, #1 @ i++
            B row_loop

        row_loop_fim:
            
        CMP r2, r4

        MOVNE r10, #0
        BNE rows_loop_end

        SUB r6, r6, #1
        B rows_loop
    
    rows_loop_end:
        LDMFD sp!, {r0, r1, r2}
        MOV pc, lr

@ columns check? r10 = 1
check_columns:
    STMFD sp!, {r0, r1, r2}

    MOV r3, #0 @ contador loop principal
    columns_loop:
        CMP r3, r0
        MOVGE r10, #1
        BGE columns_loop_end

        @ ler colunas, acumular e comparar com r2
        MOV r6, #0 @ acumulador
        MOV r7, #0 @ contador
        ADD r4, r1, r3, LSL #2
        column_read_loop:
            CMP r7, r0
            BGE column_read_loop_end
            LDR r5, [r4], r0, LSL #2

            ADD r6, r6, r5

            ADD r7, r7, #1
            B column_read_loop
        column_read_loop_end:
            CMP r6, r2
            MOVNE r10, #0
            BNE columns_loop_end

        ADD r3, r3, #1
        B columns_loop
    columns_loop_end:
        LDMFD sp!, {r0, r1, r2}
        MOV pc, lr

@ main diagonals check? r0 = 1
check_main_diagonal:
    STMFD sp!, {r0, r1, r2}

    MOV r3, #0 @ i = 0
    MOV r4, r1 @ endereco de a[i, i]
    MOV r6, #0 @ Acc
    
    main_diagonal_loop:    
        CMP r3, r0
        BGE main_diagonal_loop_end

        LDR r5, [r4]
        
        ADD r4, r4, r0, LSL #2
        ADD r4, r4, #4
        
        ADD r6, r6, r5

        ADD r3, r3, #1
        B main_diagonal_loop

    main_diagonal_loop_end:
        CMP r6, r2
        MOVNE r10, #0
        MOVEQ r10, #1
        
    check_main_diagonal_end:
        LDMFD sp!, {r0, r1, r2}
        MOV pc, lr

@ second diagonals check? r0 = 1
check_second_diagonal:
    STMFD sp!, {r0, r1, r2}

    ADD r5, r1, r0, LSL #2
    SUB r5, r5, #4
     
    MOV r4, #0 @ acumulador
    MOV r3, #0 @ contador
    second_diagonal_loop:
        CMP r3, r0
        BGE second_diagonal_loop_end
        
        @ le e acumula valor da diagonal
        LDR r6, [r5]
        ADD r4, r4, r6
        
        @ atualiza endereço
        ADD r5, r5, r0, LSL #2
        SUB r5, r5, #4

        ADD r3, r3, #1
        B second_diagonal_loop
    second_diagonal_loop_end:
        CMP r4, r2
        MOVNE r10, #0
        MOVEQ r10, #1
        
    LDMFD sp!, {r0, r1, r2}
    MOV pc, lr

fim:
    SWI 0x123456

N:
    .word 3

quadrado:
    .word 2,7,6,9,5,1,4,3,8
