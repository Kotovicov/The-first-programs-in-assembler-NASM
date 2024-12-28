section .data
	answer db "20",0
	question db "How mach 15 + 5 = ?",10,0
	good db "Very nice answer!",10,0
	notgood db "Wrong answer!",10,0
	inputlen equ 2 ; длина буфера

section .bss
	input resb inputlen+1
	;res resb 10

section .text
	global main
main:
	push rbp
	mov rbp, rsp
	;-------------- вывод вопроса
	mov rax, 1 ; write
	mov rdi, 1 ;stdout
	mov rsi, question 
	mov rdx, 20
	syscall
	;-------------- ввод
	mov rsi, input;input
	;mov rdx, inputlen+1
	mov rax, 0 ; чтение
	mov rdi, 1 ; стандартный ввод
	syscall

	;mov rax, [res]

	;mov rsi, rax 
	;mov rax, 1 ; write
	;mov rdi, 1 ;stdout
	;mov rdx, 20
	;syscall
	;-------------- проверка 20=input ?
	;movzx rsi, byte [answer]

	mov ax, [answer]
	mov bx, [input]
	cmp ax, bx
	je greater ; если cmp выполнено -> перейти в greater
; не выполнено cmp
mov rax, 1 ; write
mov rdi, 1 ; stdout
mov rsi, notgood 
mov rdx, 14
syscall
	jmp exit
greater: ; -> если выполнено cmp
	mov rax, 1 ; write
	mov rdi, 1 ;stdout
	mov rsi, good 
	mov rdx, 18
	syscall

exit:
mov rsp,rbp
pop rbp
ret