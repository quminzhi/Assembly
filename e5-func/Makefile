PROJECT=e5
all:
	nasm -f elf32 ${PROJECT}.asm -o ${PROJECT}.o
	ld -m elf_i386 ${PROJECT}.o -o ${PROJECT}
clean:
	rm -rf ${PROJECT}.o ${PROJECT}
