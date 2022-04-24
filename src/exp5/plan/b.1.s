.text
.globl main

main:
	ADDPL r7, r3, r6    @ a.
	ADDEQ r7, r3, r6    @ b.
    MULHI r3, r7, r12   @ c.
    MULLS r3, r7, r12   @ d.
    CMPNE r6, r8        @ e.
    CMPLE r6, r8        @ f.
