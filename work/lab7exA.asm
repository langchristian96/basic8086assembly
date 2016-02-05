ASSUME cs: code, ds:data;6
   ;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
		a dw 1234h,5678h,90h
		len1 equ $-a
		b dw 4h,0abcdh,10h,1122h
		len2 equ $-b
		c db 7 dup(?)

   ;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
   ;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov es,ax
   mov si,offset a

   mov cx,len1
   mov di,offset c
   

   CLD
   Again:
		MOVSB
		inc si
		dec cx
		LOOP Again
   mov si,offset b
   mov ax,seg b
   mov ds,ax
   mov cx,len2
   CLD
   Again2:
		MOVSB
		inc si
		dec cx
		LOOP Again2
	
	
	
	repeta:
		mov cx,7
		mov dx,0
		
		mov si,offset c
		Again3:
			jmp cnt
			inter:
				mov dx,1
				mov byte ptr [si-1],al
				mov byte ptr [si],bl
				jmp Again4
				
			cnt:
				lodsb
				mov bl,al
				inc si
				lodsb
				cmp bl,al
				jg inter
			Again4:
			
			LOOP Again3
		
		
		
		
		cmp dx,1
		jl repeta
	
   
   
   

   
   
   
   
   
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
