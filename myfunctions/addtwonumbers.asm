; addtwonumbers(int a,int b) -> int
			addtwonumbers PROC
				push ebp
				mov ebp, esp
				push esi
				push edi
				push ebx
				; function variable
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
		
