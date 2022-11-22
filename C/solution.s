	.file	"solution.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"%lf"
	.text
	.globl	files_input
	.type	files_input, @function
files_input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	ret
	.size	files_input, .-files_input
	.globl	random_input
	.type	random_input, @function
random_input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	edi, 0
	mov	eax, 0
	call	time@PLT
	mov	edi, eax
	mov	eax, 0
	call	srand@PLT
	mov	eax, 0
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1759218605
	shr	rdx, 32
	sar	edx, 12
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 10000
	sub	eax, ecx
	mov	edx, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, edx
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	mov	rax, QWORD PTR -8[rbp]
	movsd	QWORD PTR [rax], xmm0
	nop
	leave
	ret
	.size	random_input, .-random_input
	.globl	console_input
	.type	console_input, @function
console_input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	nop
	leave
	ret
	.size	console_input, .-console_input
	.section	.rodata
.LC3:
	.string	"w"
.LC4:
	.string	"sin(%lf) ~= %lf.\n"
	.text
	.globl	files_print
	.type	files_print, @function
files_print:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -40[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rdx
	lea	rdx, .LC4[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 2
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	ret
	.size	files_print, .-files_print
	.globl	console_print
	.type	console_print, @function
console_print:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	rax, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 2
	call	printf@PLT
	nop
	leave
	ret
	.size	console_print, .-console_print
	.globl	getAns
	.type	getAns, @function
getAns:
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -24[rbp], xmm0
	mov	QWORD PTR -32[rbp], rdi
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR .LC5[rip]
	divsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	DWORD PTR -12[rbp], eax
	cmp	DWORD PTR -12[rbp], 0
	jle	.L7
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -12[rbp]
	movsd	xmm0, QWORD PTR .LC5[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	jmp	.L8
.L7:
	mov	eax, DWORD PTR -12[rbp]
	sub	eax, 1
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR .LC5[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
.L8:
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR [rax], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -16[rbp], 1
	jmp	.L9
.L10:
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	xmm1, QWORD PTR .LC6[rip]
	xorpd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	mov	eax, DWORD PTR -16[rbp]
	add	eax, eax
	add	eax, 1
	imul	eax, DWORD PTR -16[rbp]
	add	eax, eax
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR -8[rbp]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -16[rbp], 1
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movsd	QWORD PTR [rax], xmm0
.L9:
	movsd	xmm0, QWORD PTR -8[rbp]
	comisd	xmm0, QWORD PTR .LC7[rip]
	ja	.L10
	movsd	xmm0, QWORD PTR .LC8[rip]
	comisd	xmm0, QWORD PTR -8[rbp]
	ja	.L10
	nop
	nop
	pop	rbp
	ret
	.size	getAns, .-getAns
	.section	.rodata
	.align 8
.LC9:
	.string	"Something wrong!\n You should set names of two files."
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -36[rbp], 3
	jne	.L12
	mov	rdx, QWORD PTR -48[rbp]
	lea	rax, -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	files_input
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, -16[rbp]
	mov	rdi, rdx
	movq	xmm0, rax
	call	getAns
	mov	rdx, QWORD PTR -48[rbp]
	lea	rcx, -16[rbp]
	lea	rax, -24[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	files_print
	jmp	.L13
.L12:
	cmp	DWORD PTR -36[rbp], 1
	jne	.L14
	lea	rax, -24[rbp]
	mov	rdi, rax
	call	random_input
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, -16[rbp]
	mov	rdi, rdx
	movq	xmm0, rax
	call	getAns
	lea	rdx, -16[rbp]
	lea	rax, -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	console_print
	jmp	.L13
.L14:
	cmp	DWORD PTR -36[rbp], 2
	jne	.L15
	lea	rax, -24[rbp]
	mov	rdi, rax
	call	console_input
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, -16[rbp]
	mov	rdi, rdx
	movq	xmm0, rax
	call	getAns
	lea	rdx, -16[rbp]
	lea	rax, -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	console_print
	jmp	.L13
.L15:
	cmp	DWORD PTR -36[rbp], 4
	jne	.L16
	mov	rdx, QWORD PTR -48[rbp]
	lea	rax, -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	files_input
	mov	DWORD PTR -28[rbp], 0
	jmp	.L17
.L18:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, -16[rbp]
	mov	rdi, rdx
	movq	xmm0, rax
	call	getAns
	add	DWORD PTR -28[rbp], 1
.L17:
	cmp	DWORD PTR -28[rbp], 99999999
	jle	.L18
	mov	rdx, QWORD PTR -48[rbp]
	lea	rcx, -16[rbp]
	lea	rax, -24[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	files_print
	jmp	.L13
.L16:
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	puts@PLT
.L13:
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1079574528
	.align 8
.LC5:
	.long	1413754136
	.long	1075388923
	.align 16
.LC6:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC7:
	.long	-500134854
	.long	1044740494
	.align 8
.LC8:
	.long	-500134854
	.long	-1102743154
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
