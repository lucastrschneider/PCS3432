.text
.global main

main:
    LDR r0, =0xbabe2222
    STMFD r13!, {r0}

    LDR r1, =0x12340000
    STMFD r13!, {r1}

    LDMFD r13!, {r2, r3}

fim:
    SWI 0x123456
