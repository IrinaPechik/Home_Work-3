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
	.section	.text.startup,"ax",@progbits
	.p2align 4
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
	mov	rbx, rsi
	sub	rsp, 56
	.cfi_def_cfa_offset 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	cmp	edi, 4
	je	.L42
	cmp	edi, 2
	je	.L43
.L7:
	mov	rax, QWORD PTR 40[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L44
	add	rsp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L42:
	.cfi_restore_state
	mov	rdi, QWORD PTR 8[rsi]
	mov	edx, 10
	xor	esi, esi
	call	strtol@PLT
	sub	eax, 1
	je	.L45
	mov	rdi, QWORD PTR 8[rbx]
	xor	esi, esi
	mov	edx, 10
	call	strtol@PLT
	cmp	eax, 2
	jne	.L7
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC8[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L40
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
	mov	rcx, rax
	test	rax, rax
	je	.L40
	movsd	xmm0, QWORD PTR 24[rsp]
	pxor	xmm2, xmm2
	comisd	xmm2, xmm0
	ja	.L15
	comisd	xmm0, QWORD PTR .LC2[rip]
	ja	.L15
	movsd	xmm1, QWORD PTR 32[rsp]
	comisd	xmm2, xmm1
	jnb	.L18
	movsd	xmm2, QWORD PTR .LC4[rip]
	comisd	xmm1, xmm2
	jbe	.L36
.L18:
	mov	edx, 34
	mov	esi, 1
	lea	rdi, .LC12[rip]
	call	fwrite@PLT
	jmp	.L7
.L45:
	mov	rdi, QWORD PTR 16[rbx]
	xor	eax, eax
	lea	rdx, 24[rsp]
	lea	rsi, .LC0[rip]
	call	__isoc99_sscanf@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	pxor	xmm4, xmm4
	comisd	xmm4, xmm0
	ja	.L24
	comisd	xmm0, QWORD PTR .LC2[rip]
	jbe	.L33
.L24:
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L43:
	lea	rdi, .LC14[rip]
	call	puts@PLT
	xor	eax, eax
	lea	rsi, 20[rsp]
	lea	rdi, .LC15[rip]
	mov	DWORD PTR 20[rsp], 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 20[rsp], 1
	je	.L46
	lea	rsi, .LC16[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 24[rsp]
	lea	rdi, .LC0[rip]
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	pxor	xmm3, xmm3
	comisd	xmm3, xmm0
	ja	.L24
	comisd	xmm0, QWORD PTR .LC2[rip]
	ja	.L24
	lea	rsi, .LC17[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 32[rsp]
	lea	rdi, .LC0[rip]
	call	__isoc99_scanf@PLT
	movsd	xmm1, QWORD PTR 32[rsp]
	pxor	xmm5, xmm5
	comisd	xmm5, xmm1
	jnb	.L27
	movsd	xmm0, QWORD PTR .LC4[rip]
	comisd	xmm1, xmm0
	jbe	.L38
.L27:
	lea	rdi, .LC5[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L33:
	mov	rdi, QWORD PTR 24[rbx]
	xor	eax, eax
	lea	rdx, 32[rsp]
	lea	rsi, .LC0[rip]
	call	__isoc99_sscanf@PLT
	movsd	xmm0, QWORD PTR 32[rsp]
	pxor	xmm6, xmm6
	comisd	xmm6, xmm0
	jnb	.L27
	movsd	xmm1, QWORD PTR .LC4[rip]
	comisd	xmm0, xmm1
	ja	.L27
	divsd	xmm0, xmm1
	mov	ebx, 25000000
	movsd	QWORD PTR 32[rsp], xmm0
	call	clock@PLT
	mov	rbp, rax
	.p2align 4,,10
	.p2align 3
.L11:
	movsd	xmm1, QWORD PTR 32[rsp]
	movsd	xmm0, QWORD PTR 24[rsp]
	call	task@PLT
	sub	ebx, 1
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
	mov	edi, 1
	mov	eax, 1
	lea	rsi, .LC7[rip]
	call	__printf_chk@PLT
	jmp	.L7
.L38:
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
	je	.L40
	lea	rdx, .LC13[rip]
	mov	esi, 1
	mov	rdi, rax
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	lea	rdi, .LC18[rip]
	call	puts@PLT
	jmp	.L7
.L46:
	mov	rdi, QWORD PTR 8[rbx]
	lea	rsi, .LC10[rip]
	call	fopen@PLT
	mov	rbp, rax
	xor	eax, eax
	call	task_rnd@PLT
	mov	rdi, rbp
	mov	esi, 1
	lea	rdx, .LC13[rip]
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L7
.L40:
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L15:
	mov	edx, 56
	mov	esi, 1
	lea	rdi, .LC11[rip]
	call	fwrite@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L7
.L36:
	divsd	xmm1, xmm2
	mov	QWORD PTR 8[rsp], rax
	movsd	QWORD PTR 32[rsp], xmm1
	call	task@PLT
	mov	rcx, QWORD PTR 8[rsp]
	mov	esi, 1
	lea	rdx, .LC13[rip]
	mov	eax, 1
	mov	rdi, rcx
	call	__fprintf_chk@PLT
	jmp	.L7
.L44:
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
