calculator: calculator.o
	gcc -g -o calculator calculator.o -no-pie
calculator.o: calculator.asm
	nasm -f elf64 -g -F dwarf calculator.asm -l calculator.lst
