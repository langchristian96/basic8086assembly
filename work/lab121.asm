;Lang Christian-Gabriel, gr. 911, 17.12.2015, homework for lab 10, problem 12

ASSUME  cs:code,    ds:data
data segment
msg db 'Input several numbers in base 2: $'
buffer db 60,?,61 dup(?)
nr db 0
tables db '0123456789ABCDEF'
cont db 0
data ends


code segment
start:
	extrn afis:proc
	mov     ax,     data 
	mov     ds,     ax 
	mov ah,09h
	lea dx,msg
	int 21h	;print msg
	lea dx,buffer
	mov ah,0ah
	int 21h	;input string of several numbers in base2
	mov cl,buffer[1]	;move into ch the number of elements of the string
	mov ch,0
	mov si,2	
	
	mov dl,10	;newline
	mov ah,02h
	int 21h
	mov dl,13	
	mov ah,02h
	int 21h	;newline end
	repeta:	;parse every element of the array
		mov cont,0
		cmp buffer[si],32	;if the element if space 
		je egal	;jump to egal
		jmp negal	;otherwise jump to negal
		egal:
			
			mov al,nr	;if the element is space print the previous number in base 16
			mov ah,0
			mov bh,16
			div bh	
			inc cont
			mov dh,al	;move in dh the quotient
			mov al,ah	;move into al the rest so you can use xlat
			mov bx,offset tables
			xlat tables
			mov dl,al	;move into dl the character 
			mov nr,dh
			mov dh,0
			push dx	;push into stack the character that must be printed
				

			cmp nr,0	;if the nr is different from 0 go back to egal
			jne egal
		printing:	;prints the number, getting each character from stack
		pop dx
		call afis
		dec cont
		cmp cont,0
		jne printing
		mov dl,'h'	;print h at the end of the number(base 16)
		mov ah,02h
		int 21h
		mov dl,10	;newline
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h	;end newline
		
		mov nr,0	;initialize the new number with 0
		jmp fin		;jumps over negal to fin
		negal:
			sub buffer[si],'0'	;if buffer[si] is a number in base 2, it converts the character into the actual number
			mov al,nr	
			mov ah,2	
			mul ah	;converts the binary given number to base 10
			add al,buffer[si]	; adds the last unit
			mov nr,al
		fin:
			inc si
			loop repeta
	mov cont,0	
	egal2:
		
		mov al,nr	;must print the final number as well
		mov ah,0
		mov bh,16
		div bh
		mov dh,al
		mov al,ah
		mov bx,offset tables
		xlat tables
		mov dl,al
			
		mov nr,dh
		mov dh,0
		push dx	;push into stack the character that must be printed
		inc cont
		cmp nr,0
		jne egal2
	
	printing2:	;prints the number, getting each character from stack
	pop dx
	call afis
	dec cont
	cmp cont,0
	jne printing2
	mov dl,'h'	;puts h to the end of the number(base 16)
	mov ah,02h
	int 21h
    mov ah, 4ch
    int 21h
    code ends
    end start   