;Two byte strings S1 and S2 are given, having the same length. Obtain the string D so that each element of D represents the maximum of the corresponding elements from S1 and S2.
;Exemple:
;S1: 1, 3, 6, 2, 3, 7
;S2: 6, 3, 8, 1, 2, 5
;D: 6, 3, 8, 2, 3, 7
ASSUME cs: code, ds:data
   ;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
s1 db 1,3,6,2,3,7
len equ $-s1	; no offset(constant)
s2 db 6,3,8,1,2,5
d db len DUP(?)



   ;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
   ;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov si,offset s1	;put the address of s1, the first source string, into DS:SI
   mov di,offset d	;put the address of d,the destination string, into ES:DI
   
   mov cx,len
   repeat:
		mov al,byte ptr [si]	;al<-the byte from offset si
		mov bl,byte ptr[si+len]	;bl<-the byte from offset si(goes to the second string)
		cmp al,bl
		ja repi	;if al>bl al->the byte from offset DI
		mov [di],bl	;if al<=bl bl->the byte from offset DI
		jmp end_prg	;if al<=bl jump to end_prg
		
		repi:
			mov [di],al	;if al>bl al->the byte from offset di
		end_prg:	
			inc si	;si:=si+1
			inc di	;di:=di+1
			dec cx	;cx:=cx-1
			cmp cx,0
			ja repeat	;if cx>0 jump to repeat
			
   
	      mov ax,4C00h
		  int 21h
		
   
	
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   ;finalul executiei programului
code ENDS
END start

