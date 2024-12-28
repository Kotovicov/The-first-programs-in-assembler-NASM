section .data
message: db "Hello world!",10

section .bss

section .text
    global main 
main:
	mov rax, 1	; 1 = запись
	mov rdi, 1	; 1 = в устройство стандарт. вывода
	mov rsi, message	; выводимая строка
	mov rdx, 13	; длина текста с /n
	syscall

	mov rax, 60;
	syscall
