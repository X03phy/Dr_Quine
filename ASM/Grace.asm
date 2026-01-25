section .data
	KID: db "Grace_kid.c", 0
	MODE: db "w", 0
	STR: db "Hello world", 10, 0

section .text
	global main
	extern fopen
	extern fprintf
	extern fclose

main:
	endbr64
	sub    rsp, 8

	lea    rdi, [rel KID]
	lea    rsi, [rel MODE]
	call   fopen wrt ..plt

	mov    rdi, rax
	lea rsi, [rel STR]
	call   fprintf wrt ..plt

	add rsp, 8
	ret
