	.file	"main.c"
	.intel_syntax noprefix
	.text						# начинаем новую секцию
	.section	.rodata
.LC0:
	.string	"%lf"
	.align 8
.LC3:
	.string	"Input error! 0 <= x <= 360. To continue, press any key."
	.align 8
.LC5:
	.string	"Input error! 0 < accuracy <= 100. To continue, press any key."
.LC6:
	.string	"Time: %d ms"
.LC7:
	.string	"\nResult: %lf\n"
.LC8:
	.string	"r"
	.align 8
.LC9:
	.string	"Error opening the file.To continue, press any key."
.LC10:
	.string	"w"
	.align 8
.LC11:
	.string	"Input error! 0 <= x <= 360. To continue, press any key.\n"
	.align 8
.LC12:
	.string	"Input error! 0 < accuracy <= 100.\n"
.LC13:
	.string	"%lf\n"
	.align 8
.LC14:
	.string	"For random input - enter 1, for a console one - any other key"
.LC15:
	.string	"%d"
	.align 8
.LC16:
	.string	"Input the value of x in degrees: "
.LC17:
	.string	"Input the value of accuracy: "
	.align 8
.LC18:
	.string	"You can see result with your data in file"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp						# / Cохраняем rbp  на стек
	mov	rbp, rsp					# | rbp := rsp
	sub	rsp, 112					# \ rsp -= 112

	mov	DWORD PTR -100[rbp], edi	# rdi - argc
	mov	QWORD PTR -112[rbp], rsi	# rsi - argv

	# ./main.c: 16 if (argc == 4) 
	cmp	DWORD PTR -100[rbp], 4		# cmp argc 4
	jne	.L2							# если не равно -> .L2

	# ./main.c: 18 if (atoi(argv[1]) == 1) 
	mov	rax, QWORD PTR -112[rbp]	
	add	rax, 8						
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L3
	# ./main.c: 19 sscanf(argv[2], "%lf", &x);
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, -72[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_sscanf@PLT
	#./main.c: 20 if (x < 0 || x > 360) 
	movsd	xmm1, QWORD PTR -72[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	ja	.L4
	movsd	xmm0, QWORD PTR -72[rbp]
	comisd	xmm0, QWORD PTR .LC2[rip]
	jbe	.L32
.L4:
	# ./main.c: 21 printf("Input error! 0 <= x <= 360. To continue, press any key.\n");
	lea	rdi, .LC3[rip]
	call	puts@PLT
	# ./main.c: 22 getchar();
	call	getchar@PLT
	# ./main.c: 23 return 0
	mov	eax, 0
	jmp	.L31
.L32:
	# ./main.c: 25 sscanf(argv[3], "%lf", &accuracy);
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, -80[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_sscanf@PLT
	# ./main.c: 27 if (accuracy <= 0 || accuracy > 100) {
	movsd	xmm1, QWORD PTR -80[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jnb	.L8
	movsd	xmm0, QWORD PTR -80[rbp]
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L33
.L8:
	# ./main.c: 28 printf("Input error! 0 < accuracy <= 100. To continue, press any key.\n");
	lea	rdi, .LC5[rip]
	call	puts@PLT
	# ./main.c: 29 getchar();
	call	getchar@PLT
	# ./main.c: 30 return 0;
	mov	eax, 0
	jmp	.L31
.L33:
	# ./main.c: 32 accuracy = accuracy / 100;
	movsd	xmm0, QWORD PTR -80[rbp]
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -80[rbp], xmm0
	# ./main.c: 34 time_t t_start = clock();
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	# ./main.c: 35 for (int i = 0; i < 25000000; ++i) {
	mov	DWORD PTR -4[rbp], 0
	jmp	.L11
.L12:
	# ./main.c: 36 task(x, accuracy);
	movsd	xmm0, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -72[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	# ++i
	add	DWORD PTR -4[rbp], 1
.L11:
	cmp	DWORD PTR -4[rbp], 24999999 # cmp i and 24999999
	jle	.L12

	# ./main.c: 38 time_t t_end = clock();
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax

	# ./main.c: 39 printf("Time: %d ms", (int) (difftime(t_end, t_start)) / 1000);
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT

	# ./main.c: 41 printf("\nResult: %lf\n", task(x, accuracy));
	movsd	xmm0, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -72[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	lea	rdi, .LC7[rip]
	mov	eax, 1
	call	printf@PLT

	# ./main.c: 42 return 0;
	mov	eax, 0
	jmp	.L31
.L3:
	# ./main.c: 45 if (atoi(argv[1]) == 2) {
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2
	jne	.L2

	# ./main.c: 47 FILE *input = fopen(argv[2], "r");
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	# ./main.c: 49 if (input == NULL)
	cmp	QWORD PTR -16[rbp], 0
	jne	.L13
	# ./main.c: 50 printf("Error opening the file.To continue, press any key.\n");
	lea	rdi, .LC9[rip]
	call	puts@PLT
	# ./main.c:51  getchar();
	call	getchar@PLT
	# ./main.c: 52 return 0;
	mov	eax, 0
	jmp	.L31
.L13:
    # ./main.c 55 fscanf(input, "%lf", &x);
	lea	rdx, -72[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	# ./main.c 57 fscanf(input, "%lf", &accuracy);
	lea	rdx, -80[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	# ./main.c 59 fclose(input);
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	# ./main.c 62 FILE* output = fopen(argv[3], "w");
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	# ./main.c 64 if (output == NULL) {
	cmp	QWORD PTR -24[rbp], 0
	jne	.L14
	# ./main.c 65 printf("Error opening the file.To continue, press any key.\n");
	lea	rdi, .LC9[rip]
	call	puts@PLT
	# ./main.c 66  getchar()
	call	getchar@PLT
	# ./main.c 67 return 0;
	mov	eax, 0
	jmp	.L31
.L14:
	# ./main.c 69 if (x < 0 || x > 360) {
	movsd	xmm1, QWORD PTR -72[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	ja	.L15
	movsd	xmm0, QWORD PTR -72[rbp]
	comisd	xmm0, QWORD PTR .LC2[rip]
	jbe	.L34
.L15:
	# ./main.c 70 fprintf(output, "%s", "Input error! 0 <= x <= 360. To continue, press any key.\n");
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, rax
	mov	edx, 56
	mov	esi, 1
	lea	rdi, .LC11[rip]
	call	fwrite@PLT
	# ./main.c 71 getchar();
	call	getchar@PLT
	# ./main.c 72 return 0;
	mov	eax, 0
	jmp	.L31
.L34:
	# ./main.c 74 if (accuracy <= 0 || accuracy > 100)
	movsd	xmm1, QWORD PTR -80[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jnb	.L18
	movsd	xmm0, QWORD PTR -80[rbp]
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L35
.L18:
	# ./main.c 75  fprintf(output, "%s", "Input error! 0 < accuracy <= 100.\n");
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, rax
	mov	edx, 34
	mov	esi, 1
	lea	rdi, .LC12[rip]
	call	fwrite@PLT
	# ./main.c 76 return 0;
	mov	eax, 0
	jmp	.L31
.L35:
	# ./main.c: 78 accuracy = accuracy / 100;
	movsd	xmm0, QWORD PTR -80[rbp]
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -80[rbp], xmm0
	# ./main.c: 80 fprintf(output, "%lf\n", task(x, accuracy));
	movsd	xmm0, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -72[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	mov	rax, QWORD PTR -24[rbp]
	lea	rsi, .LC13[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	# ./main.c: 81 return 0;
	mov	eax, 0
	jmp	.L31
.L2:
# ./main.c: 85 if (argc == 2) {
	cmp	DWORD PTR -100[rbp], 2
	jne	.L21
	# ./main.c: 88 printf("For random input - enter 1, for a console one - any other key\n");
	lea	rdi, .LC14[rip]
	call	puts@PLT
	# ./main.c: 89 int choice = 0;
	mov	DWORD PTR -84[rbp], 0
	# ./main.c: 90 scanf("%d", &choice);
	lea	rax, -84[rbp]
	mov	rsi, rax
	lea	rdi, .LC15[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	# ./main.c: 92 if (choice == 1) {
	mov	eax, DWORD PTR -84[rbp]
	cmp	eax, 1
	jne	.L22
	# ./main.c: 94  FILE* output = fopen(argv[1], "w");
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -64[rbp], rax
	# ./main.c: 95 fprintf(output, "%lf\n", task_rnd());
	mov	eax, 0
	call	task_rnd@PLT
	mov	rax, QWORD PTR -64[rbp]
	lea	rsi, .LC13[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	# ./main.c: 96 fclose(output);
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	fclose@PLT
	# ./main.c: 97 return 0;
	mov	eax, 0
	jmp	.L31
.L22:
# ./main.c: 101  printf("Input the value of x in degrees: ");
	lea	rdi, .LC16[rip]
	mov	eax, 0
	call	printf@PLT
	# ./main.c: 103  scanf("%lf", &x);
	lea	rax, -72[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	# ./main.c: 104 if (x < 0 || x > 360) 
	movsd	xmm1, QWORD PTR -72[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	ja	.L24
	movsd	xmm0, QWORD PTR -72[rbp]
	comisd	xmm0, QWORD PTR .LC2[rip]
	jbe	.L36
.L24:
# ./main.c: 105 printf("Input error! 0 <= x <= 360. To continue, press any key.\n");
	lea	rdi, .LC3[rip]
	call	puts@PLT
	# ./main.c: 106 getchar();
	call	getchar@PLT
	# ./main.c: 107 return 0;
	mov	eax, 0
	jmp	.L31
.L36:
# ./main.c: 110 printf("Input the value of accuracy: ");
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	# ./main.c: 112 scanf("%lf", &accuracy);
	lea	rax, -80[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	# ./main.c: 113 if (accuracy <= 0 || accuracy > 100) {
	movsd	xmm1, QWORD PTR -80[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jnb	.L27
	movsd	xmm0, QWORD PTR -80[rbp]
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L37
.L27:
	# ./main.c: 114 printf("Input error! 0 < accuracy <= 100. To continue, press any key.\n");
	lea	rdi, .LC5[rip]
	call	puts@PLT
	# ./main.c: 115 getchar();
	call	getchar@PLT
	# ./main.c: 116 return 0;
	mov	eax, 0
	jmp	.L31
.L37:
	# ./main.c: 118 accuracy = accuracy / 100;
	movsd	xmm0, QWORD PTR -80[rbp]
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -80[rbp], xmm0
	# ./main.c: 120 result = task(x, accuracy);
	movsd	xmm0, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -72[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	movq	rax, xmm0
	mov	QWORD PTR -48[rbp], rax
	# ./main.c: 122 output = fopen(argv[1], "w");
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	# ./main.c: 124  if (output == NULL) {
	cmp	QWORD PTR -56[rbp], 0
	jne	.L30
	# ./main.c: 125 printf("Error opening the file.To continue, press any key.\n");
	lea	rdi, .LC9[rip]
	call	puts@PLT
	# ./main.c: 126 getchar();
	call	getchar@PLT
	# ./main.c:127 return 0;
	mov	eax, 0
	jmp	.L31
.L30:
	# ./main.c: 130 fprintf(output, "%lf\n", result);
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rdx
	lea	rsi, .LC13[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	# ./main.c: 132 fclose(output);
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	# ./main.c: 133 printf("You can see result with your data in file\n");
	call	fclose@PLT
	lea	rdi, .LC18[rip]
	call	puts@PLT
	# ./main.c: 134 return 0;
	mov	eax, 0
	jmp	.L31
.L21:
	# ./main.c:136 return 0;
	mov	eax, 0
.L31:
	leave		# /выход из функции
	ret			# \
	.size	main, .-main
	.section	.rodata
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
