	.file	"task.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	task
	.type	task, @function
task:
.LFB39:
	.cfi_startproc
	endbr64
	mulsd	xmm0, QWORD PTR .LC0[rip]
	movq	xmm6, QWORD PTR .LC2[rip]
	divsd	xmm0, QWORD PTR .LC1[rip]
	movapd	xmm2, xmm0
	andpd	xmm2, xmm6
	comisd	xmm2, xmm1
	jbe	.L8
	movapd	xmm5, xmm0
	xorpd	xmm5, XMMWORD PTR .LC3[rip]
	movapd	xmm4, xmm0
	mov	eax, 3
	mulsd	xmm5, xmm0
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	xmm2, xmm2
	movapd	xmm7, xmm5
	lea	edx, -1[rax]
	cvtsi2sd	xmm2, eax
	pxor	xmm3, xmm3
	add	eax, 2
	cvtsi2sd	xmm3, edx
	divsd	xmm7, xmm2
	movapd	xmm2, xmm7
	divsd	xmm2, xmm3
	mulsd	xmm0, xmm2
	movapd	xmm2, xmm0
	addsd	xmm4, xmm0
	andpd	xmm2, xmm6
	comisd	xmm2, xmm1
	ja	.L4
	movapd	xmm0, xmm4
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	movapd	xmm4, xmm0
	movapd	xmm0, xmm4
	ret
	.cfi_endproc
.LFE39:
	.size	task, .-task
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"Generated data:\nx = %lf\naccuracy(in percentages) = %lf\nYou can see result in file\n"
	.text
	.p2align 4
	.globl	task_rnd
	.type	task_rnd, @function
task_rnd:
.LFB40:
	.cfi_startproc
	endbr64
	sub	rsp, 24
	.cfi_def_cfa_offset 32
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC4[rip]
	mulsd	xmm0, QWORD PTR .LC5[rip]
	movsd	QWORD PTR [rsp], xmm0
	call	rand@PLT
	pxor	xmm1, xmm1
	movsd	xmm0, QWORD PTR [rsp]
	lea	rsi, .LC8[rip]
	cvtsi2sd	xmm1, eax
	mov	edi, 1
	mov	eax, 2
	divsd	xmm1, QWORD PTR .LC4[rip]
	mulsd	xmm1, QWORD PTR .LC6[rip]
	addsd	xmm1, QWORD PTR .LC7[rip]
	movsd	QWORD PTR 8[rsp], xmm1
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR [rsp]
	movq	xmm6, QWORD PTR .LC2[rip]
	mulsd	xmm0, QWORD PTR .LC0[rip]
	movsd	xmm1, QWORD PTR 8[rsp]
	divsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, QWORD PTR .LC1[rip]
	movapd	xmm2, xmm0
	andpd	xmm2, xmm6
	comisd	xmm2, xmm1
	jbe	.L17
	movapd	xmm5, xmm0
	xorpd	xmm5, XMMWORD PTR .LC3[rip]
	movapd	xmm4, xmm0
	mov	eax, 3
	mulsd	xmm5, xmm0
	.p2align 4,,10
	.p2align 3
.L13:
	pxor	xmm2, xmm2
	movapd	xmm7, xmm5
	lea	edx, -1[rax]
	cvtsi2sd	xmm2, eax
	pxor	xmm3, xmm3
	add	eax, 2
	cvtsi2sd	xmm3, edx
	divsd	xmm7, xmm2
	movapd	xmm2, xmm7
	divsd	xmm2, xmm3
	mulsd	xmm0, xmm2
	movapd	xmm2, xmm0
	addsd	xmm4, xmm0
	andpd	xmm2, xmm6
	comisd	xmm2, xmm1
	ja	.L13
	movapd	xmm0, xmm4
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore_state
	movapd	xmm4, xmm0
	add	rsp, 24
	.cfi_def_cfa_offset 8
	movapd	xmm0, xmm4
	ret
	.cfi_endproc
.LFE40:
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
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 16
.LC3:
	.long	0
	.long	-2147483648
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
