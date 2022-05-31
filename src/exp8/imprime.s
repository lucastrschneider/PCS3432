	.file	"imprime.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.align	2
	.global	imprime
	.type	imprime, %function
imprime:
.LFB2:
	.file 1 "imprime.c"
	.loc 1 7 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
.LCFI0:
	stmfd	sp!, {fp, ip, lr, pc}
.LCFI1:
	sub	fp, ip, #4
.LCFI2:
	sub	sp, sp, #8
.LCFI3:
	str	r0, [fp, #-16]
	.loc 1 10 0
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	.loc 1 12 0
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L2
	.loc 1 13 0
	b	.L1
.L2:
	.loc 1 16 0
	ldr	r0, [fp, #-16]
	ldr	r1, .L3
	bl	int2str
	.loc 1 17 0
	ldr	r0, .L3
	bl	puts
	.loc 1 19 0
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	mov	r0, r3
	bl	imprime
.L1:
	.loc 1 20 0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L4:
	.align	2
.L3:
	.word	N_str
.LFE2:
	.size	imprime, .-imprime
	.align	2
	.global	main
	.type	main, %function
main:
.LFB3:
	.loc 1 22 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
.LCFI4:
	stmfd	sp!, {fp, ip, lr, pc}
.LCFI5:
	sub	fp, ip, #4
.LCFI6:
	.loc 1 23 0
	mov	r0, #5
	bl	imprime
	.loc 1 25 0
	mov	r3, #0
	.loc 1 26 0
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.LFE3:
	.size	main, .-main
	.comm	N_str,50,1
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.byte	0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0x0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI0-.LFB2
	.byte	0xd
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x8e
	.uleb128 0x2
	.byte	0x8d
	.uleb128 0x3
	.byte	0x8b
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xc
	.uleb128 0xb
	.uleb128 0x4
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI4-.LFB3
	.byte	0xd
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0x8e
	.uleb128 0x2
	.byte	0x8d
	.uleb128 0x3
	.byte	0x8b
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xc
	.uleb128 0xb
	.uleb128 0x4
	.align	2
.LEFDE2:
	.text
.Letext0:
	.section	.debug_info
	.4byte	0x14e
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.ascii	"GNU C 3.4.3\000"
	.byte	0x1
	.ascii	"imprime.c\000"
	.ascii	"/home/student/src/exp8\000"
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.ascii	"long int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x3
	.ascii	"long long int\000"
	.byte	0x8
	.byte	0x5
	.uleb128 0x3
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x3
	.ascii	"unsigned int\000"
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.ascii	"unsigned char\000"
	.byte	0x1
	.byte	0x8
	.uleb128 0x3
	.ascii	"short int\000"
	.byte	0x2
	.byte	0x5
	.uleb128 0x3
	.ascii	"char\000"
	.byte	0x1
	.byte	0x8
	.uleb128 0x3
	.ascii	"short unsigned int\000"
	.byte	0x2
	.byte	0x7
	.uleb128 0x3
	.ascii	"long long unsigned int\000"
	.byte	0x8
	.byte	0x7
	.uleb128 0x4
	.4byte	0x115
	.byte	0x1
	.ascii	"imprime\000"
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5b
	.uleb128 0x5
	.ascii	"N\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x6
	.ascii	"lixo\000"
	.byte	0x1
	.byte	0x8
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0x7
	.byte	0x1
	.ascii	"main\000"
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.4byte	0x6a
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5b
	.uleb128 0x8
	.4byte	0x13d
	.4byte	0xa6
	.uleb128 0x9
	.4byte	0x81
	.byte	0x31
	.byte	0x0
	.uleb128 0xa
	.ascii	"N_str\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x12d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	N_str
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x2d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x152
	.4byte	0xde
	.ascii	"imprime\000"
	.4byte	0x115
	.ascii	"main\000"
	.4byte	0x13d
	.ascii	"N_str\000"
	.4byte	0x0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"",%progbits
.LASF0:
	.ascii	"long unsigned int\000"
	.ident	"GCC: (GNU) 3.4.3"
