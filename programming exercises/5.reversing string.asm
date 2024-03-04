
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
	result1 db "ABCD"
	result1len equ $-result1
	result2 db 0ah,0
	result2len equ $-result2

.code
	
	main:
		
		

		push -11
		call GetStdHandle
		; eax contains the handle
		push 0
		push 0
		push result1len
		push offset result1
		push eax
		call WriteConsoleA


		push -11
		call GetStdHandle
		; eax contains the handle
		push 0
		push 0
		push result2len
		push offset result2
		push eax
		call WriteConsoleA

		; esi starts from 0 index, edi from last index
		mov esi,0
		mov edi,result1len-1
		xor eax,eax
		xor edx,edx

		loop1:
			; exchanging the starting index and last index byte's
			
			; copy first index byte into al
			mov al,BYTE PTR [result1+esi]
			; exchange this value with last index value
			xchg BYTE PTR [result1+edi],al
			; now al contains last index value, put in starting index
			mov BYTE PTR [result1+esi],al
			inc esi
			dec edi
			cmp esi,edi
			jng loop1
		
		
		push -11
		call GetStdHandle
		; eax contains the handle
		push 0
		push 0
		push result1len
		push offset result1
		push eax
		call WriteConsoleA

	main2:
		push 0 
		CALL ExitProcess
		

	end main


