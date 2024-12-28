
extern printb

section .data
	var db "81234567890123456789012345678901"
section .bss
	inform resd 1

section .text
	global main
main:
	push rbp
	mov rbp, rsp

	; mov eax, [0x100]
	mov eax, var
	mov [inform], eax
	syscall

	mov rax,[inform]
	mov rdi, rax
	call printb
	
	mov eax, [inform]
	sal eax,23
	sar eax,23 

	mov rdi, rax
	call printb

	mov ebx, [inform]
	sal ebx,10
	sar ebx,19

	mov rdi, rbx
	call printb


	mov ecx, [inform]
	sar ecx,22

	mov rdi, rcx
	call printb


	leave
	ret
	;mov rax, 60
	;syscall
