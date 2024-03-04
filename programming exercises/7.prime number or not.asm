
.386
.model flat,stdcall


includelib masm32\lib\kernel32.lib

GetStdHandle PROTO STDCALL :DWORD

ExitProcess PROTO STDCALL :DWORD
WriteConsoleA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD,:DWORD

;extrn GetStdHandle@4 :PROC :DWORD
;extrn WriteConsole@20 PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD


.data
	hello db "Hello World",0ah,0
	hellolen equ $-hello
	n dd 10
	counter dd 0
	result1 db "is primenumber",0ah,0
	result1len equ $-result1
	result2 db "not a prime number",0ah,0
	result2len equ $-result2

.code
	
	main:
		
		mov ecx,2
		mov eax,n

		loop1:
			xor edx,edx
			idiv ecx
			mov eax,n
			cmp edx,0
			je notprime
			inc ecx
			cmp ecx,n
			jne loop1


		isprime:
			push -11
			call GetStdHandle
			; eax contains the handle
			push 0
			push 0
			push result1len
			push offset result1
			push eax
			call WriteConsoleA
			jmp exit


		notprime:
			push -11
			call GetStdHandle
			; eax contains the handle
			push 0
			push 0
			push result2len
			push offset result2
			push eax
			call WriteConsoleA
			jmp exit

	
	exit:
		push 0 
		CALL ExitProcess
		

	end main


