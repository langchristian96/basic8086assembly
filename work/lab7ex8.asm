ASSUME cs: code, ds:data
   ;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
sir DB 2,4,2,5,2,2,4,4 

len equ $-sir
c dw 3 dup(?)

   ;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
   ;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov es,ax

   mov si,offset sir
   mov bx,0
   ;for computing the array of words c we sort the array sir in ascending order using bubble sort
   ;and then we put on the low byte of the first word of the array c the character from the byte from sir
   ;also, we initialize with 1 the low byte of the first element from c
   ;we parse the array sir and we check if the element of the actual position is equal to the next element
   ;if it is we increase the high byte of the actual word of the array c
   ;otherwise we move to the next word of the array c and set the low word with the new character
   ;and we put the value one to the high byte of the actual word
   
   
   
   ;bubble sort
   parcurgere:
		mov bx,0
		mov cx,len
		dec cx
		
		
		mov si,offset sir
		again:
			
			
				
				
			
				
				mov al,byte ptr ds:[si]
				
				mov ah,byte ptr ds:[si+1]
				
				
				cmp al,ah
				jbe endprg
				mov byte ptr [si],ah
				mov byte ptr [si+1],al

				
				mov bx,1
				
			endprg:
			inc si
			dec cx
			cmp cx,0
			ja again
	cmp	bx,1
	jne sfarsit	
	jmp parcurgere
	sfarsit:
	;end bubble sort
	
	
	
	mov si,offset sir
	mov cx,len
	dec cx;we compare an element with the next one from the array so cx must be len-1
	
	mov di,offset c
	mov bh, byte ptr[si]
	mov byte ptr [di],bh;we put the first character from the string sir on the low byte of the first word of the array c
	mov byte ptr [di+1],1h;we initialize the high byte of the first word of the array c with 1
	calcul:
		mov dh,byte ptr [si+1];we move into dh the next character
		cmp byte ptr [si],dh;if the characters are equal we jump to egal
		je egal
		
		jmp dif;otherwise we jump to dif
		egal:
		inc byte ptr[di+1];if they are equal we increase the high byte of the current word of the array c with 1
		inc si;we move to the next byte of the string sir
		jmp sf;we jump to sf (end)
		dif:
		
		inc di
		inc di;if they are different we move to the low byte of the next word of the array c
		inc si;we move to the next byte of the string sir
		mov byte ptr [di+1],1h;we initialize the high word with 1
		mov bh, byte ptr[si];we set the value of the low byte of the current word of the array c with the value of the new byte from the string sir
		mov byte ptr [di],bh
		sf:
		Loop calcul;if it hasn't finished parsing the entire string sir, it moves to calcul again
   

   
   
   
   
   
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
