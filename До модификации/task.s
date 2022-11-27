	.file	"task.c"
	.intel_syntax noprefix
	.text					# начинаем новую секцию
	.globl	task
	.type	task, @function
task:
	endbr64
	push	rbp				# Cохраняем rbp  на стек
	mov	rbp, rsp			# rbp := rsp
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	QWORD PTR -48[rbp], xmm1
	# ./task.c: 8 x = x * M_PI / 180;
	movsd	xmm1, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR .LC0[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	# ./task.c: 10 double s = x;
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	# ./task.c:11 double d = x;
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
	# ./task.c: 12 for(int n = 3; fabs(d) > accuracy; n += 2)
	mov	DWORD PTR -20[rbp], 3
	jmp	.L2
.L3:
	# ./task.c: s += d *= -x*x/n/(n-1);
	movsd	xmm0, QWORD PTR -40[rbp]
	movq	xmm1, QWORD PTR .LC2[rip]
	xorpd	xmm0, xmm1
	mulsd	xmm0, QWORD PTR -40[rbp]
	cvtsi2sd	xmm1, DWORD PTR -20[rbp]
	divsd	xmm0, xmm1
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -16[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	# n += 2
	add	DWORD PTR -20[rbp], 2
.L2:
	# ./task.c: 12 - fabs(d) > accuracy
	movsd	xmm0, QWORD PTR -16[rbp]
	movq	xmm1, QWORD PTR .LC3[rip]
	andpd	xmm0, xmm1
	comisd	xmm0, QWORD PTR -48[rbp]
	ja	.L3
	# ./task.c: 14 return s;
	movsd	xmm0, QWORD PTR -8[rbp]
	# вызодим из функции
	pop	rbp
	ret
	.size	task, .-task
	.section	.rodata
	.align 8
.LC8:
	.string	"Generated data:\nx = %lf\naccuracy(in percentages) = %lf\nYou can see result in file\n"
	.text
	.globl	task_rnd
	.type	task_rnd, @function
task_rnd:
	endbr64
	push	rbp		# Cохраняем rbp  на стек
	mov	rbp, rsp	# rbp := rsp
	sub	rsp, 16		# rsp -= 16
	# ./task.c: 19 srand(clock());
	call	clock@PLT
	mov	edi, eax
	call	srand@PLT
	# ./task.c: 21 x = (double)rand()/(double)RAND_MAX * 360;
	call	rand@PLT
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC5[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	# ./task.c: 24  accuracy = (double)rand()/(double)RAND_MAX * (100 - 0.00000001) + 0.00000001;
	call	rand@PLT
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC6[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC7[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	# ./task.c: 25 printf("Generated data:\nx = %lf\naccuracy(in percentages) = %lf\nYou can see result in file\n", x, accuracy);
	movsd	xmm0, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	lea	rdi, .LC8[rip]
	mov	eax, 2
	call	printf@PLT
	# ./task.c: 27 return task(x, accuracy/100);
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	# выходим из функции
	movq	xmm0, rax
	call	task
	leave
	ret
	.size	task_rnd, .-task_rnd
	.section	.rodata
	.align 8
.LC0:
	.long	1413754136
	.long	1074340347
	.align 8
.LC1:
	.long	0
	.long	1080459264
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
