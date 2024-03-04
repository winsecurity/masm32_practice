
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
	n dq 6
	counter dd 0
	result1 db "number is odd",0ah,0
	result1len equ $-result1
	result2 db "number is even",0ah,0
	result2len equ $-result2

.code
	
	main:
		
		
		mov eax,DWORD PTR [n]
		mov edx,DWORD PTR [n+4]
		mov ebx,2

		idiv ebx
		; quotient goes to eax, remainder in edx
		cmp edx,1
		je printodd
		jne printeven
		
		printodd:
			push -11
			call GetStdHandle
			; eax contains the handle
			push 0
			push 0
			push result1len
			push offset result1
			push eax
			call WriteConsoleA
			jmp main2

		printeven:
			push -11
			call GetStdHandle
			; eax contains the handle
			push 0
			push 0
			push result2len
			push offset result2
			push eax
			call WriteConsoleA


	main2:
		push 0 
		CALL ExitProcess
		mov eax,edx

	end main


