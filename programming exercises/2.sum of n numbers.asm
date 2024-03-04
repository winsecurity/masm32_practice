.386
.model flat,stdcall


.data
	n dd 10
	counter dd 0

.code
	
	main:
		
		; edx starts from 0 and keeps summing upto n numbers
		mov edx,0

		; ecx stores the number of numbers
		mov ecx,n
		loop1:

			; keep adding all numbers to edx
			add edx,ecx
			dec ecx

			; checking if ecx is 0, if its 0 we break else we continue
			cmp ecx,0
			jne loop1


		mov eax,edx
	end main
