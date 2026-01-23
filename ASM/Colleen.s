section .data
	PRINTF_FORMAT: db "section .data%1$c%2$cPRINTF_FORMAT: db %3$c%4$s%3$c, 0%1$c%1$csection .text", 0

section .text
	global main
	extern printf

main:
	endbr64
	sub    rsp, 8
	lea    rdi, [rel PRINTF_FORMAT]
	xor    eax,eax
	call   printf wrt ..plt
	xor    eax, eax
	add    rsp, 8
	ret
