

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
.code

	main:

		; GetStdHandle(-11) to get output handle
		push -11
		call GetStdHandle

		; eax contains the handle
		push 0
		push 0
		push hellolen
		push offset hello
		push eax
		call WriteConsoleA

		push 0
		CALL ExitProcess

	end main

