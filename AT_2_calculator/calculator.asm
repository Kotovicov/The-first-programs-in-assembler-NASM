; calculator + - / *
extern printf
section .data
	number1		dq 60
	number2		dq 30
	;neg_num 	dq -12
	fmt			db "The numbers are %ld and %ld",10,0
	fmtint		db "%s %ld",10,0
	sumi	db	"sum =",0
	difi	db	"difference =",0
	multi	db	"product =",0
	divi	db	"integer quotient =",0

section .bss
	resulti resq 1
	modulo	resq 1

section	.text
	global main 
main:
	push	rbp
	mov		rbp,rsp	
; output numbers
	mov rdi, fmt 
	mov rsi, [number1]
	mov rdx, [number2]
	mov rax, 0
	call printf
; summa
	mov rax, [number1]
	add rax, [number2]	; Сложение number2 с rax.
	mov [resulti], rax	; Перемещение суммы в переменную result.
	; displaying the result
		mov rdi, fmtint
		mov rsi, sumi
		mov rdx, [resulti]
		mov rax, 0
		call printf

; Вычитание-----------------------------------------------------------
	mov rax, [number1]
	sub rax, [number2]	; Вычитание number2 из rax.
	mov [resulti], rax	
	; displaying the result	
		mov rdi, fmtint
		mov rsi, difi
		mov rdx, [resulti]
		mov rax, 0
		call printf

; Умножение----------------------------------------------------------
	mov rax, [number1]
	imul qword [number2]	; Умножение rax на number2.
	mov	[resulti], rax		
	; вывод результата
		mov rdi, fmtint
		mov rsi, multi
		mov rdx, [resulti]
		mov rax, 0
		call printf

; Деление------------------------------------------------------------
		mov rax, [number1]
		mov rdx, 0	; В rdx должен быть 0 перед idiv.
		idiv qword [number2]; Деление rax на number2, остаток в rdx.
		mov [resulti], rax
		mov [modulo], rdx	; Запись содержимого rdx в modulo.

; Вывод результата.
		mov rdi, fmtint
		mov rsi, divi
		mov rdx, [resulti]
		mov rax, 0
		call printf
;		mov rdi, fmtint
;		mov rsi, remi
;		mov rdx, [modulo]
;		mov rax, 0
;		call printf
mov rsp,rbp
pop rbp
ret