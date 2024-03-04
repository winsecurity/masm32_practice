```
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

.code
	
	main:
		
		mov ecx,n
		mov edx,1

		loop1:
			imul edx,[n]
			dec n
			cmp n,0
			jne loop1


		mov eax,edx

	end main


```
