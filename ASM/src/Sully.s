section .data
	holy_variable: dq 5
	filename_format: db "Sully_%d.s", 0
	mode: db "w", 0
	code_format: db "section .data%1$c%2$choly_variable: dq %4$d%1$c%2$cfilename_format: db %3$c%5$s%3$c, 0%1$c%2$cmode: db %3$c%6$s%3$c, 0%1$c%2$ccode_format: db %3$c%7$s%3$c, 0%1$c%2$cexec_format: db %3$c%8$s%3$c, 0%1$c%1$csection .bss%1$c%2$cbuf: resb 200%1$c%1$csection .text%1$c%2$cglobal main%1$c%2$cextern sprintf%1$c%2$cextern fopen%1$c%2$cextern fprintf%1$c%2$cextern fclose%1$c%2$cextern system%1$c%1$cmain:%1$c%2$cpush   rbx%1$c%1$c%2$cdec    dword [rel holy_variable]%1$c%1$c%2$clea    rdi, [rel buf]%1$c%2$clea    rsi, [rel filename_format]%1$c%2$cmov    edx, dword [rel holy_variable]%1$c%2$ccall   sprintf wrt ..plt%1$c%1$c%2$clea    rdi, [rel buf]%1$c%2$clea    rsi, [rel mode]%1$c%2$ccall   fopen wrt ..plt%1$c%2$cjnz    .file_ok%1$c%2$cmov    eax, 1%1$c%2$cjmp    .ret%1$c%1$c.file_ok:%1$c%2$cmov    rbx, rax%1$c%1$c%2$cmov    rdi, rbx%1$c%2$clea    rsi, [rel code_format]%1$c%2$clea    edx, 10%1$c%2$clea    ecx, 9%1$c%2$cmov    r8d, 34%1$c%2$cmov    r9d, dword [rel holy_variable]%1$c%2$clea    r10, [rel filename_format]%1$c%2$clea    r11, [rel mode]%1$c%2$cpush   r12%1$c%2$cpush   r13%1$c%2$clea    r12, [rel code_format]%1$c%2$clea    r13, [rel exec_format]%1$c%2$cpush   r13%1$c%2$cpush   r12%1$c%2$cpush   r11%1$c%2$cpush   r10%1$c%2$ccall   fprintf wrt ..plt%1$c%2$cpop    r10%1$c%2$cpop    r11%1$c%2$cpop    r12%1$c%2$cpop    r13%1$c%2$cpop    r13%1$c%2$cpop    r12%1$c%2$cmov    rdi, rbx%1$c%2$ccall   fclose wrt ..plt%1$c%1$c%2$cmov    eax, dword [rel holy_variable]%1$c%2$ccmp    eax, 0%1$c%2$cjge    .exec%1$c%2$cxor    eax, eax%1$c%2$cjmp    .ret%1$c%1$c.exec:%1$c%2$clea    rdi, [rel buf]%1$c%2$clea    rsi, [rel exec_format]%1$c%2$cmov    edx, dword [rel holy_variable]%1$c%2$ccall   sprintf wrt ..plt%1$c%1$c%2$clea    rdi, [rel buf]%1$c%2$ccall   system wrt ..plt%1$c%1$c%2$cxor    eax, eax%1$c%1$c.ret:%1$c%2$cpop    rbx%1$c%2$cret%1$c", 0
	exec_format: db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc Sully_%1$d.o -o Sully_%1$d && rm -f Sully_%1$d.o && ./Sully_%1$d", 0

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

	mov    eax, dword [rel holy_variable]
	cmp    eax, 0
	jge    .exec
	xor    eax, eax
	jmp    .ret

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
