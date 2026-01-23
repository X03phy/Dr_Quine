section .data
	PRINTF_FORMAT: db "section .data%1$c%2$cPRINTF_FORMAT: db %3$c%4$s%3$c, 0%1$c%1$c%1$csection .text%1$c%2$cglobal main%1$c%2$cextern printf%1$c%1$c%1$cfoo:%1$c%2$cret", 0


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
