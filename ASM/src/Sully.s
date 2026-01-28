section .data
	holy_variable: dq 5
	filename_format: db "Sully_%d.s", 0
	mode: db "w" 0
	code_format: db "" 0
	exec_format: db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc Sully_%1$d.o -o Sully_%1$d", 0

section .bss
	buf: resb 200

section .text
	global main
	extern sprintf
	extern fopen
	extern fprintf
	extern fclose
	extern system

main:
	push   rbx
	dec    dword [rel holy_variable]

	lea    rdi, [rel buf]
	lea    rsi, [rel filename_format]
	mov    edx, dword [rel holy_variable]
	call   sprintf wrt ..plt

	lea    rdi, [rel buf]
	lea    rsi, [rel mode]
	call   fopen wrt ..plt
	jnz    .file_ok
	mov    eax, 1
	jmp    .ret

.file_ok:
	mov    rbx, rax

	mov    rdi, rbx
	lea    rsi, [rel code_format]
	lea    edx, 10
	lea    ecx, 9
	mov    r8d, 34
	mov    r9d, dword [rel holy_variable]
	lea    r10, [rel filename_format]
	lea    r11, [rel mode]
	push   r12
	push   r13
	lea    r12, [rel code_format]
	lea    r13, [rel exec_format]
	push   r13
	push   r12
	push   r11
	push   r10
	call   fprintf wrt ..plt
	pop    r10
	pop    r11
	pop    r12
	pop    r13
	pop    r13
	pop    r12
	mov    rdi, rbx
	call   fclose wrt ..plt

	cmp    eax, 0
	jge    .exec
	xor    eax, eax
	jl     .ret

.exec:
	lea    rdi, [rel buf]
	lea    rsi, [rel exec_format]
	mov    edx, dword [rel holy_variable]
	call   sprintf wrt ..plt

	lea    rdi, [rel buf]
	call   system wrt ..plt

	xor    eax, eax

.ret:
	pop    rbx
	ret
