
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
	n dd 4
	counter dd 0
	result1 db "ABCD"
	result1len equ $-result1
	result2 db 0ah,0
	result2len equ $-result2

.code
	
	main:
		
		mov esi,1
		mov edi,1
		sub [n],2
		mov ecx,n

		loop1:
			mov edx,edi
			add edi,esi
			mov esi,edx
			dec ecx
			jnz loop1

	
	exit:
		push 0 
		CALL ExitProcess
		

	end main


