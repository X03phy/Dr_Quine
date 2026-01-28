section .data
	printf_format: db "" 0

section .text
	global main
	extern sprintf
	extern fopen
	extern fprintf
	extern fclose
	extern system

main:
	ret

