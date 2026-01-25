all:
	nasm -f elf64 Colleen.asm -o Colleen.o
	gcc Colleen.o -o Colleen
	nasm -f elf64 Grace.asm -o Grace.o
	gcc Grace.o -o Grace

clean:
	rm Colleen Colleen.o
	rm Grace Grace.o
