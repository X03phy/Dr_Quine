section .data
	KID: db "Grace_kid.c", 0
	MODE: db "w", 0
	STR: db "section .data%1$c%2$cKID: db %3$c%4$s%3$c, 0%1$c%2$cMODE: db %3$c%5$s%3$c, 0%1$c%2$cSTR: db %3$c%6$s%3$c, 0%1$c%1$c%2$csection .text", 0

section .text
	global main
	extern fopen
	extern fprintf
	extern fclose

main:
	endbr64
	push   rbx

	lea    rdi, [rel KID]
	lea    rsi, [rel MODE]
	call   fopen wrt ..plt

	mov    rbx, rax
	mov    rdi, rax
	lea    rsi, [rel STR]
	mov    edx, 10
	mov    ecx, 9
	mov    r8, 34
	lea    r9, [rel KID]
	lea    r10, [rel MODE]
	lea    r11, [rel STR]
	call   fprintf wrt ..plt

	mov    rdi, rbx
	call   fclose wrt ..plt

	pop   rbx
	ret

; There is no place for me other than the battlefield. To live as I please, and die a senseless death. That is who I am. Not a mere man of flesh. War is part of my existence.
