	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lf"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Input error! 0 <= x <= 360. To continue, press any key."
	.align 8
.LC5:
	.string	"Input error! 0 < accuracy <= 100. To continue, press any key."
	.section	.rodata.str1.1
.LC6:
	.string	"Time: %d ms"
.LC7:
	.string	"\nResult: %lf\n"
.LC8:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error opening the file.To continue, press any key."
	.section	.rodata.str1.1
.LC10:
	.string	"w"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Input error! 0 <= x <= 360. To continue, press any key.\n"
	.align 8
.LC12:
	.string	"Input error! 0 < accuracy <= 100.\n"
	.section	.rodata.str1.1
.LC13:
	.string	"%lf\n"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"For random input - enter 1, for a console one - any other key"
	.section	.rodata.str1.1
.LC15:
	.string	"%d"
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"Input the value of x in degrees: "
	.section	.rodata.str1.1
.LC17:
	.string	"Input the value of accuracy: "
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"You can see result with your data in file"
	.text
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 56
	.cfi_def_cfa_offset 80
	mov	rbx, rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	cmp	edi, 4
	je	.L38
	cmp	edi, 2
	je	.L39
.L7:
	mov	rax, QWORD PTR 40[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L40
	mov	eax, 0
	add	rsp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L38:
	.cfi_restore_state
	mov	rdi, QWORD PTR 8[rsi]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	cmp	eax, 1
	je	.L41
	mov	rdi, QWORD PTR 8[rbx]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	cmp	eax, 2
	jne	.L7
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC8[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L42
	lea	rdx, 24[rsp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	lea	rdx, 32[rsp]
	lea	rsi, .LC0[rip]
	mov	rdi, rbp
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rdi, rbp
	call	fclose@PLT
	mov	rdi, QWORD PTR 24[rbx]
	lea	rsi, .LC10[rip]
	call	fopen@PLT
	mov	rbx, rax
	test	rax, rax
	je	.L43
	movsd	xmm0, QWORD PTR 24[rsp]
	pxor	xmm1, xmm1
	comisd	xmm1, xmm0
	ja	.L14
	comisd	xmm0, QWORD PTR .LC2[rip]
	ja	.L14
	movsd	xmm1, QWORD PTR 32[rsp]
	pxor	xmm2, xmm2
	comisd	xmm2, xmm1
	jnb	.L17
	comisd	xmm1, QWORD PTR .LC4[rip]
	jbe	.L34
.L17:
	mov	rcx, rbx
	mov	edx, 34
	mov	esi, 1
	lea	rdi, .LC12[rip]
	call	fwrite@PLT
	jmp	.L7
.L41:
	lea	rdx, 24[rsp]
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_sscanf@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	pxor	xmm1, xmm1
	comisd	xmm1, xmm0
	ja	.L4
	comisd	xmm0, QWORD PTR .LC2[rip]
	jbe	.L31
.L4:
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L31:
	lea	rdx, 32[rsp]
	mov	rdi, QWORD PTR 24[rbx]
	lea	rsi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_sscanf@PLT
	movsd	xmm0, QWORD PTR 32[rsp]
	pxor	xmm1, xmm1
	comisd	xmm1, xmm0
	jnb	.L8
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L32
.L8:
	lea	rdi, .LC5[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L32:
	divsd	xmm0, QWORD PTR .LC4[rip]
	movsd	QWORD PTR 32[rsp], xmm0
	call	clock@PLT
	mov	rbp, rax
	mov	ebx, 25000000
.L11:
	movsd	xmm1, QWORD PTR 32[rsp]
	movsd	xmm0, QWORD PTR 24[rsp]
	call	task@PLT
	sub	ebx, 1
	jne	.L11
	call	clock@PLT
	mov	rdi, rax
	mov	rsi, rbp
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	mov	ecx, 1000
	cdq
	idiv	ecx
	mov	edx, eax
	lea	rsi, .LC6[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	movsd	xmm1, QWORD PTR 32[rsp]
	movsd	xmm0, QWORD PTR 24[rsp]
	call	task@PLT
	lea	rsi, .LC7[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	jmp	.L7
.L42:
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L43:
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L14:
	mov	rcx, rbx
	mov	edx, 56
	mov	esi, 1
	lea	rdi, .LC11[rip]
	call	fwrite@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L34:
	divsd	xmm1, QWORD PTR .LC4[rip]
	movsd	QWORD PTR 32[rsp], xmm1
	call	task@PLT
	lea	rdx, .LC13[rip]
	mov	esi, 1
	mov	rdi, rbx
	mov	eax, 1
	call	__fprintf_chk@PLT
	jmp	.L7
.L39:
	lea	rdi, .LC14[rip]
	call	puts@PLT
	mov	DWORD PTR 20[rsp], 0
	lea	rsi, 20[rsp]
	lea	rdi, .LC15[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 20[rsp], 1
	je	.L44
	lea	rsi, .LC16[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rsi, 24[rsp]
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	pxor	xmm1, xmm1
	comisd	xmm1, xmm0
	ja	.L22
	comisd	xmm0, QWORD PTR .LC2[rip]
	jbe	.L35
.L22:
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L44:
	mov	rdi, QWORD PTR 8[rbx]
	lea	rsi, .LC10[rip]
	call	fopen@PLT
	mov	rbx, rax
	mov	eax, 0
	call	task_rnd@PLT
	lea	rdx, .LC13[rip]
	mov	esi, 1
	mov	rdi, rbx
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L7
.L35:
	lea	rsi, .LC17[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rsi, 32[rsp]
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm1, QWORD PTR 32[rsp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jnb	.L25
	comisd	xmm1, QWORD PTR .LC4[rip]
	jbe	.L36
.L25:
	lea	rdi, .LC5[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L36:
	divsd	xmm1, QWORD PTR .LC4[rip]
	movsd	QWORD PTR 32[rsp], xmm1
	movsd	xmm0, QWORD PTR 24[rsp]
	call	task@PLT
	movsd	QWORD PTR 8[rsp], xmm0
	mov	rdi, QWORD PTR 8[rbx]
	lea	rsi, .LC10[rip]
	call	fopen@PLT
	mov	rbx, rax
	test	rax, rax
	je	.L45
	movsd	xmm0, QWORD PTR 8[rsp]
	lea	rdx, .LC13[rip]
	mov	esi, 1
	mov	rdi, rax
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	lea	rdi, .LC18[rip]
	call	puts@PLT
	jmp	.L7
.L45:
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L40:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
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
