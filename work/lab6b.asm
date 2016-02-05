ASSUME cs: code, ds:data
   ;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
n db 15
x dw 2


   ;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
   ;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
  
   mov bx,1
   mov cx,1
   mov dx,0
   dec n
   dec n
   repeat:
			add x,bx
			add x,cx
			mov ax,cx
			add cx,bx
			mov bx,ax
			dec n
			cmp n,0
			ja repeat
   
			
			
			
		
   
	
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
