ASSUME cs: code, ds:data
   ;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
s1 db 1,3,6,2,3,7
len equ $-s1
s2 db 6,3,8,1,2,5
d db len DUP(?)



   ;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
   ;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov si,offset s1
   mov di,offset d
   mov cx,len
   repeat:
		mov al,byte ptr [si]
		mov bl,byte ptr[si+len]
		cmp al,bl
		ja repi
		mov [di],bl
		jmp end_prg
		
		repi:
			mov [di],al
		end_prg:	
			inc si
			inc di
			dec cx
			cmp cx,0
			ja repeat
			
   
	      mov ax,4C00h
		  int 21h
		
   
	
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   ;finalul executiei programului
code ENDS
END start
