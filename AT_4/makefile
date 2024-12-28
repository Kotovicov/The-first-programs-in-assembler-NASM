test1: test1.o printb.o
	gcc -g -o test1 test1.o printb.o -no-pie
test1.o: test1.asm
	nasm -f elf64 -g -F dwarf test1.asm -l test1.lst
printb: printb.c
	gcc -c printb.c
