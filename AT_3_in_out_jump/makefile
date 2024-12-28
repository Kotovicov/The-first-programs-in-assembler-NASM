question: question.o
	gcc -g -o question question.o -no-pie
question.o: question.asm
	nasm -f elf64 -g -F dwarf question.asm -l question.lst
