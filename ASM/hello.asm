section .data
	PRINTF_FORMAT: db "section .data%1$c%2$cPRINTF_FORMAT: db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$c%2$cglobal main%1$c%2$cextern printf%1$c%1$cfoo:%1$c%2$cret%1$c%1$cmain:%1$c%2$cendbr64%1$c%2$csub    rsp, 8%1$c%2$clea    rdi, [rel PRINTF_FORMAT]%1$c%2$cmov    esi, 10%1$c%2$cmov    edx, 9%1$c%2$cmov    ecx, 34%1$c%2$clea    r8, [rel PRINTF_FORMAT]%1$c%2$c", 0

section .text
	global main
	extern printf

foo:
	ret

main:
	endbr64
	sub    rsp, 8
	lea    rdi, [rel PRINTF_FORMAT]
	mov    esi, 10
	mov    edx, 9
	mov    ecx, 34
	lea    r8, [rel PRINTF_FORMAT]
	xor    eax,eax
	call   printf wrt ..plt
	call   foo
	xor    eax, eax
	add    rsp, 8
	ret
