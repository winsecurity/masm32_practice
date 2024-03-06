.386
.model flat,stdcall


includelib masm32\lib\kernel32.lib

;GetStdHandle PROTO STDCALL :DWORD

ExitProcess PROTO STDCALL :DWORD
;WriteConsoleA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD,:DWORD

;extrn GetStdHandle@4 :PROC :DWORD
;extrn WriteConsole@20 PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD


.data
	pebaddress dd 0
	ldr dd 0
	ntdllbase dd 0

.code
	
	main:
		
		; addtwonumbers(int a,int b) -> int
		

		push 3
		push 5
		call addtwonumbers	
		push 0 
		call ExitProcess

		addtwonumbers PROC
			push ebp
			mov ebp, esp
			push esi
			push edi
			push ebx
			sub esp, 4

			mov esi, DWORD PTR [ebp+8]
			mov edi, DWORD PTR [ebp+12]
			add esi, edi
			mov DWORD PTR [ebp-16], esi
			mov eax, DWORD PTR [ebp-16]
			
			add esp, 4
			pop ebx
			pop edi 
			pop esi
			pop ebp
			ret 8


		addtwonumbers endp
		
	end main

