    .intel_syntax noprefix

    .section .rodata

ans_msg:
    .string      "sin(%lf) ~= %lf.\n"         # Формат вывода ответа

double:
    .string      "%lf"                      # Формат для ввода вещественного числа
end_msg:
    .string      "\n"                         # перевод строки
minus_accuracy:
    .double   -0.000001
accuracy:
    .double   0.000001
coef:
    .double   0.001
pi: 
    .double   6.283185307    
minus_one:
    .double   -1
one:
    .double   1
.section .data
x:
    .double   0
y:
    .double   0
res:
    .double   0
length:
    .int   0  
    
    
#-------------------------------------------------------------------------------
# Подпрограмма ввода строки
.section .text
input_input:
    push	rbp
    mov	rbp, rsp
    
    mov	rbp, rsp
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT



    call	rand@PLT
    movsx	rdx, eax
    imul	rdx, rdx, 274877907
    shr	rdx, 32
    sar	edx, 5
    mov	ecx, eax
    sar	ecx, 31
    sub	edx, ecx
    imul	ecx, edx, 500
    mov    r11, 0
    sub	eax, ecx
    mov	edx, eax
    mov	rax, QWORD PTR length[rip]
    and    rdx, 127
    mov    length[rip], rdx
    mov    rdx, length[rip]
    cvtsi2sd  xmm0, rdx
    movsd x[rip], xmm0
    
    call	rand@PLT
    movsx	rdx, eax
    imul	rdx, rdx, 274877907
    shr	rdx, 32
    sar	edx, 5
    mov	ecx, eax
    sar	ecx, 31
    sub	edx, ecx
    imul	ecx, edx, 500
    mov    r11, 0
    sub	eax, ecx
    mov	edx, eax
    mov	rax, QWORD PTR length[rip]
    and    rdx, 127
    mov    length[rip], rdx
    mov    rdx, length[rip]
    cvtsi2sd  xmm1, rdx
    mulsd  xmm1,  coef[rip]
    movsd  xmm0, x[rip]
    addsd  xmm0, xmm1
    movsd  x[rip], xmm0
    
    leave
    ret   



#-------------------------------------------------------------------------------
# Подпрограмма поиска ответа
    .section .text
    .global  find
create_ans:         
    push	rbp
    mov	rbp, rsp           
                   
    movsd   xmm0, x[rip]
    
    movsd   xmm2, x[rip]
    movsd   xmm1, pi[rip]
    divsd   xmm2, xmm1                  # xmm2 = x / (2 * Pi)
    comisd xmm2, y[rip]
    ja  next
    movsd   xmm3, minus_one[rip]
    mulsd   xmm2, xmm3                  # xmm0 *= -1
    addsd   xmm2, one[rip]
    inc rax
    
next:
    cvttsd2si   eax, xmm2               # eax = (int)(x / (2 * Pi))
    cvtsi2sd    xmm2, rax               # xmm2 = (int)(x / (2 * Pi))
    mulsd       xmm2, xmm1              # xmm2 = 2 * Pi * (int)(x / (2 * Pi))
    divsd       xmm0, xmm2              # xmm0 = x - 2 * Pi * (int)(x / (2 * Pi))
    
    movsd   res[rip], xmm0              # Нулевой член ряда - x.
    movsd   y[rip], xmm0  
    mov     r11, 1                      # Итератор

check:
    comisd	xmm0,  QWORD PTR accuracy[rip]
    ja	create_step

    comisd	xmm0, QWORD PTR minus_accuracy[rip]
    jb	create_step
    
    jmp    create_end
    
create_step:    
    movsd   xmm1, minus_one[rip]
    mulsd   xmm0, xmm1                  # xmm0 *= -1
    movsd   xmm1, y[rip]  
    mulsd   xmm0, xmm1
    mulsd   xmm0, xmm1                  # xmm0 *= x * x

    cvtsi2sd   xmm1, r11
    mov        r12, 2
    cvtsi2sd   xmm2, r12
    mulsd   xmm1, xmm2                  # xmm1 = 2 * i
    movsd   xmm2, xmm1                  # xmm2 = 2 * i
    mov        r12, 1
    cvtsi2sd   xmm3, r12                # xmm3 = 1.0
    addsd   xmm2, xmm3                  # xmm2 = 2 * i + 1
    mulsd   xmm1, xmm2                  # xmm1 = 2i * (2i + 1)
    
    divsd   xmm0, xmm1                  # xmm0 /= 2i * (2i + 1)
    
    movsd   xmm1, res[rip]
    addsd   xmm1, xmm0                  # xmm1 = res + xmm0
    inc r11
    
    movsd   res[rip], xmm1
    
    jmp check
create_end:
    pop	rbp
    ret
   
#-------------------------------------------------------------------------------
# Подпрограмма вывода
    .section .text
    .global print
print:
    push    rbp
    mov     rbp, rsp
    
    # Вывод результата и x.
   movsd xmm0, x[rip]
    movsd xmm1, res[rip]
    lea   rdi,  ans_msg[rip]
    mov   rax,  2
    call  printf
    
    pop	rbp
    ret

#-------------------------------------------------------------------------------
# Главная функция программы
    .section .text
    .global main
main:
    push    rbp
    mov     rbp, rsp

    call    input_input                        # считываем строку
    call    create_ans                         # получаем ответ
    call    print                              # вывод ответа
    
main_end: 
    mov     eax, 0
    mov     rsp, rbp                           # удалить локальные переменные
    pop     rbp                                # восстановить кадр вызывающего
    ret
    