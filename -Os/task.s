	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
.LFB24:
	.cfi_startproc
	endbr64
	mulsd	xmm0, QWORD PTR .LC0[rip]
	movq	xmm6, QWORD PTR .LC3[rip]
	mov	eax, 3
	divsd	xmm0, QWORD PTR .LC1[rip]
	movapd	xmm7, xmm0
	movapd	xmm3, xmm0
	xorps	xmm7, XMMWORD PTR .LC2[rip]
	movapd	xmm4, xmm0
.L2:
	movapd	xmm2, xmm3
	andps	xmm2, xmm6
	comisd	xmm2, xmm1
	jbe	.L5
	movapd	xmm2, xmm7
	cvtsi2sd	xmm5, eax
	lea	edx, -1[rax]
	add	eax, 2
	mulsd	xmm2, xmm0
	divsd	xmm2, xmm5
	cvtsi2sd	xmm5, edx
	divsd	xmm2, xmm5
	mulsd	xmm3, xmm2
	addsd	xmm4, xmm3
	jmp	.L2
.L5:
	movapd	xmm0, xmm4
	ret
	.cfi_endproc
.LFE24:
	.size	task, .-task
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC8:
	.string	"Generated data:\nx = %lf\naccuracy(in percentages) = %lf\nYou can see result in file\n"
	.text
	.globl	task_rnd
	.type	task_rnd, @function
task_rnd:
.LFB25:
	.cfi_startproc
	endbr64
	sub	rsp, 24
	.cfi_def_cfa_offset 32
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC4[rip]
	mulsd	xmm0, QWORD PTR .LC5[rip]
	movsd	QWORD PTR [rsp], xmm0
	call	rand@PLT
	movsd	xmm0, QWORD PTR [rsp]
	mov	edi, 1
	lea	rsi, .LC8[rip]
	cvtsi2sd	xmm1, eax
	divsd	xmm1, QWORD PTR .LC4[rip]
	mov	al, 2
	mulsd	xmm1, QWORD PTR .LC6[rip]
	addsd	xmm1, QWORD PTR .LC7[rip]
	movsd	QWORD PTR 8[rsp], xmm1
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR [rsp]
	movsd	xmm1, QWORD PTR 8[rsp]
	divsd	xmm1, QWORD PTR .LC9[rip]
	add	rsp, 24
	.cfi_def_cfa_offset 8
	jmp	task
	.cfi_endproc
.LFE25:
	.size	task_rnd, .-task_rnd
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1413754136
	.long	1074340347
	.align 8
.LC1:
	.long	0
	.long	1080459264
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 16
.LC3:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC4:
	.long	4290772992
	.long	1105199103
	.align 8
.LC5:
	.long	0
	.long	1081507840
	.align 8
.LC6:
	.long	4294263609
	.long	1079574527
	.align 8
.LC7:
	.long	3794832442
	.long	1044740494
	.align 8
.LC9:
	.long	0
	.long	1079574528
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
