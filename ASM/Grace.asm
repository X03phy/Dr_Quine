%define KID "Grace_kid.asm"
%define MODE "w"
%define PRINTF_FORMAT "%%define KID %3$c%4$s%3$c%1$c%%define MODE %3$c%5$s%3$c%1$c%%define PRINTF_FORMAT %3$c%6$s%3$c%1$c%1$csection .data%1$c%2$ckid: db KID, 0%1$c%2$cmode: db MODE, 0%1$c%2$cprintf_format: db PRINTF_FORMAT, 0%1$c%1$csection .text%1$c%2$cglobal main%1$c%2$cextern fopen%1$c%2$cextern fprintf%1$c%2$cextern fclose%1$c%1$c%%macro CODE 0%1$cmain:%1$c%2$cendbr64%1$c%2$cpush   rbx%1$c%1$c%2$clea    rdi, [rel kid]%1$c%2$clea    rsi, [rel mode]%1$c%2$ccall   fopen wrt ..plt%1$c%1$c%2$ctest   rax, rax%1$c%2$cjz     .ret%1$c%1$c%2$cmov    rbx, rax%1$c%1$c%2$cmov    rdi, rax%1$c%2$clea    rsi, [rel printf_format]%1$c%2$cmov    edx, 10%1$c%2$cmov    ecx, 9%1$c%2$cmov    r8, 34%1$c%2$clea    r9, [rel kid]%1$c%2$clea    r10, [rel mode]%1$c%2$clea    r11, [rel printf_format]%1$c%2$cpush   r11%1$c%2$cpush   r10%1$c%2$ccall   fprintf wrt ..plt%1$c%2$cpop    r10%1$c%2$cpop    r11%1$c%1$c%2$cmov    rdi, rbx%1$c%2$ccall   fclose wrt ..plt%1$c%2$cxor    eax, eax%1$c%1$c.ret:%1$c%2$cpop    rbx%1$c%2$cret%1$c%%endmacro%1$c%1$c; There is no place for me other than the battlefield. To live as I please, and die a senseless death. That is who I am. Not a mere man of flesh. War is part of my existence.%1$c%1$cCODE%1$c"

section .data
	kid: db KID, 0
	mode: db MODE, 0
	printf_format: db PRINTF_FORMAT, 0

section .text
	global main
	extern fopen
	extern fprintf
	extern fclose

%macro CODE 0
main:
	endbr64
	push   rbx

	lea    rdi, [rel kid]
	lea    rsi, [rel mode]
	call   fopen wrt ..plt

	test   rax, rax
	jz     .ret

	mov    rbx, rax

	mov    rdi, rax
	lea    rsi, [rel printf_format]
	mov    edx, 10
	mov    ecx, 9
	mov    r8, 34
	lea    r9, [rel kid]
	lea    r10, [rel mode]
	lea    r11, [rel printf_format]
	push   r11
	push   r10
	call   fprintf wrt ..plt
	pop    r10
	pop    r11

	mov    rdi, rbx
	call   fclose wrt ..plt
	xor    eax, eax

.ret:
	pop    rbx
	ret
%endmacro

; There is no place for me other than the battlefield. To live as I please, and die a senseless death. That is who I am. Not a mere man of flesh. War is part of my existence.

CODE
