section .data
	printf_format: db "section .data%1$c%2$cprintf_format: db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$c%2$cglobal main%1$c%2$cextern printf%1$c%1$c; What is your Duty? To serve Emperor's Will. What is Emperor's Will? That we fight and die.%1$c%1$cfoo:%1$c%2$clea    rdi, [rel printf_format]%1$c%2$cmov    esi, 10%1$c%2$cmov    edx, 9%1$c%2$cmov    ecx, 34%1$c%2$clea    r8, [rel printf_format]%1$c%2$ccall   printf wrt ..plt%1$c%1$c%2$cret%1$c%1$cmain:%1$c%2$ccall   foo ; For the Emperor!%1$c%1$c%2$cxor    eax, eax%1$c%2$cret%1$c", 0

section .text
	global main
	extern printf

; What is your Duty? To serve Emperor's Will. What is Emperor's Will? That we fight and die.

foo:
	lea    rdi, [rel printf_format]
	mov    esi, 10
	mov    edx, 9
	mov    ecx, 34
	lea    r8, [rel printf_format]
	call   printf wrt ..plt

	ret

main:
	call   foo ; For the Emperor!

	xor    eax, eax
	ret
