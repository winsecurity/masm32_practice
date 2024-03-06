; comparetwostrings( addressofstring1, address
			; ofstring2, lengthofstring1tocheckwithstring2)
			comparetwostrings PROC
				push ebp
				mov ebp, esp
				push esi
				push edi 
				push ecx 
				push edx
				push ebx
				sub esp, 4*2
				
				; first parameter - adddressofstring1
				mov esi, DWORD PTR [ebp+8]

				; second parameter - addressofstring2
				mov edi, DWORD PTR [ebp+12]

				; third parameter - lengthofstring1
				mov ecx, DWORD PTR [ebp+16]
				xor edx, edx
				xor ebx,ebx

				loop1:
					push ecx
					mov cl, BYTE PTR [esi+edx]
					mov bl, BYTE PTR [edi+edx]
					cmp cl,bl
					jne notequal
					pop ecx
					dec ecx
					inc edx
				
					cmp ecx,0
					jne loop1
					mov eax,1
					jmp epilogue

				notequal:
					pop ecx
					mov eax,0
					jmp epilogue



				epilogue:
					add esp, 4*2
					pop ebx
					pop edx
					pop ecx
					pop edi
					pop esi
					pop ebp
					ret 12

			comparetwostrings endp
