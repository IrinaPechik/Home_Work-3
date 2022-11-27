	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lf"
.LC3:
	.string	"Input error! 0 <= x <= 360. To continue, press any key."
.LC5:
	.string	"Input error! 0 < accuracy <= 100. To continue, press any key."
.LC6:
	.string	"Time: %d ms"
.LC7:
	.string	"\nResult: %lf\n"
.LC8:
	.string	"r"
.LC9:
	.string	"Error opening the file.To continue, press any key."
.LC10:
	.string	"w"
.LC11:
	.string	"Input error! 0 <= x <= 360. To continue, press any key.\n"
.LC12:
	.string	"Input error! 0 < accuracy <= 100.\n"
.LC13:
	.string	"%lf\n"
.LC14:
	.string	"For random input - enter 1, for a console one - any other key"
.LC15:
	.string	"%d"
.LC16:
	.string	"Input the value of x in degrees: "
.LC17:
	.string	"Input the value of accuracy: "
.LC18:
	.string	"You can see result with your data in file"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rsi
	sub	rsp, 56
	.cfi_def_cfa_offset 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	cmp	edi, 4
	jne	.L2
	mov	rdi, QWORD PTR 8[rsi]
	call	atoi@PLT
	cmp	eax, 1
	jne	.L3
	mov	rdi, QWORD PTR 16[rbx]
	xor	eax, eax
	lea	rdx, 24[rsp]
	lea	rsi, .LC0[rip]
	call	__isoc99_sscanf@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	xorps	xmm1, xmm1
	comisd	xmm1, xmm0
	ja	.L22
	comisd	xmm0, QWORD PTR .LC2[rip]
	ja	.L22
	mov	rdi, QWORD PTR 24[rbx]
	xor	eax, eax
	lea	rdx, 32[rsp]
	lea	rsi, .LC0[rip]
	call	__isoc99_sscanf@PLT
	movsd	xmm0, QWORD PTR 32[rsp]
	xorps	xmm1, xmm1
	comisd	xmm1, xmm0
	jnb	.L25
	movsd	xmm1, QWORD PTR .LC4[rip]
	comisd	xmm0, xmm1
	ja	.L25
	divsd	xmm0, xmm1
	mov	ebx, 25000000
	movsd	QWORD PTR 32[rsp], xmm0
	call	clock@PLT
	mov	rbp, rax
.L11:
	movsd	xmm1, QWORD PTR 32[rsp]
	movsd	xmm0, QWORD PTR 24[rsp]
	call	task@PLT
	dec	ebx
	jne	.L11
	call	clock@PLT
	mov	rsi, rbp
	mov	rdi, rax
	call	difftime@PLT
	mov	ecx, 1000
	mov	edi, 1
	lea	rsi, .LC6[rip]
	cvttsd2si	eax, xmm0
	cdq
	idiv	ecx
	mov	edx, eax
	xor	eax, eax
	call	__printf_chk@PLT
	movsd	xmm1, QWORD PTR 32[rsp]
	movsd	xmm0, QWORD PTR 24[rsp]
	call	task@PLT
	lea	rsi, .LC7[rip]
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
	jmp	.L7
.L3:
	cmp	eax, 2
	jne	.L7
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC8[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L42
	mov	rdi, rax
	lea	rdx, 24[rsp]
	lea	rsi, .LC0[rip]
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	lea	rdx, 32[rsp]
	mov	rdi, rbp
	xor	eax, eax
	lea	rsi, .LC0[rip]
	call	__isoc99_fscanf@PLT
	mov	rdi, rbp
	call	fclose@PLT
	mov	rdi, QWORD PTR 24[rbx]
	lea	rsi, .LC10[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L42
	movsd	xmm0, QWORD PTR 24[rsp]
	xorps	xmm2, xmm2
	comisd	xmm2, xmm0
	ja	.L14
	comisd	xmm0, QWORD PTR .LC2[rip]
	jbe	.L36
.L14:
	mov	rsi, rbp
	lea	rdi, .LC11[rip]
	call	fputs@PLT
	jmp	.L43
.L36:
	movsd	xmm1, QWORD PTR 32[rsp]
	comisd	xmm2, xmm1
	jnb	.L17
	movsd	xmm2, QWORD PTR .LC4[rip]
	comisd	xmm1, xmm2
	jbe	.L37
.L17:
	mov	rsi, rbp
	lea	rdi, .LC12[rip]
	call	fputs@PLT
	jmp	.L7
.L37:
	divsd	xmm1, xmm2
	movsd	QWORD PTR 32[rsp], xmm1
	call	task@PLT
	mov	esi, 1
	mov	rdi, rbp
	mov	al, 1
	lea	rdx, .LC13[rip]
	call	__fprintf_chk@PLT
	jmp	.L7
.L2:
	cmp	edi, 2
	jne	.L7
	lea	rdi, .LC14[rip]
	call	puts@PLT
	xor	eax, eax
	lea	rsi, 20[rsp]
	lea	rdi, .LC15[rip]
	mov	DWORD PTR 20[rsp], 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 20[rsp], 1
	jne	.L20
	mov	rdi, QWORD PTR 8[rbx]
	lea	rsi, .LC10[rip]
	call	fopen@PLT
	mov	rbp, rax
	xor	eax, eax
	call	task_rnd@PLT
	mov	rdi, rbp
	mov	esi, 1
	mov	al, 1
	lea	rdx, .LC13[rip]
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L7
.L20:
	lea	rsi, .LC16[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 24[rsp]
	lea	rdi, .LC0[rip]
	call	__isoc99_scanf@PLT
	movsd	xmm1, QWORD PTR 24[rsp]
	xorps	xmm0, xmm0
	comisd	xmm0, xmm1
	ja	.L22
	comisd	xmm1, QWORD PTR .LC2[rip]
	jbe	.L38
.L22:
	lea	rdi, .LC3[rip]
	jmp	.L41
.L38:
	lea	rsi, .LC17[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 32[rsp]
	lea	rdi, .LC0[rip]
	call	__isoc99_scanf@PLT
	movsd	xmm1, QWORD PTR 32[rsp]
	xorps	xmm0, xmm0
	comisd	xmm0, xmm1
	jnb	.L25
	movsd	xmm0, QWORD PTR .LC4[rip]
	comisd	xmm1, xmm0
	jbe	.L39
.L25:
	lea	rdi, .LC5[rip]
	jmp	.L41
.L39:
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR 24[rsp]
	movsd	QWORD PTR 32[rsp], xmm1
	call	task@PLT
	mov	rdi, QWORD PTR 8[rbx]
	lea	rsi, .LC10[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	call	fopen@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	test	rax, rax
	mov	rbp, rax
	jne	.L28
.L42:
	lea	rdi, .LC9[rip]
.L41:
	call	puts@PLT
.L43:
	call	getchar@PLT
	jmp	.L7
.L28:
	mov	rdi, rax
	lea	rdx, .LC13[rip]
	mov	esi, 1
	mov	al, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	lea	rdi, .LC18[rip]
	call	puts@PLT
.L7:
	mov	rax, QWORD PTR 40[rsp]
	xor	rax, QWORD PTR fs:40
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
	add	rsp, 56
	.cfi_def_cfa_offset 24
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1081507840
	.align 8
.LC4:
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
