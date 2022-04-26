.text
.global main

main: 
        MOV r6, #0xA
        MOV r4, r6

loop:
        SUBS r4, r4, #1
        MULNE r7, r6, r4
        MOVNE r6, r7
        BNE loop

fim:    
        SWI 0x123456  
