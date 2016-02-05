ASSUME cs: code, ds:data
   ;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
a dd 0
x dd ?


   ;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
   ;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov cx,0
   mov ax,word ptr a
   mov dx, word ptr a+2
   repeta:
		mov bx,1
		and bx,ax
		add cx,bx
		shr ax,1
		mov bx,1
		and bx,dx
		add cx,bx
		shr dx,1
		cmp ax,0
		ja repeta
		cmp dx,0
		ja repeta
	mov bx,32
	sub bx,cx
	cmp bx,cx
	ja repi
	repii:
		
		mov ax,word ptr a
		mov dx, word ptr a+2
		mov ch,2
		sar dx,1
		rcr ax,1
		sar dx,1
		rcr ax,1
		mov word ptr a,ax
		mov word ptr a+2,dx
		
		mov bx,1
		cmp bx,0
		ja endprg
	
	
	repi:
	
	
	
	   mov ax,word ptr a
	   mov dx,word ptr a+2
	   xor dx,101010000b
	   
	   xor ax,0000001000000000b
	   
	   mov word ptr a,ax
	   mov word ptr a+2,dx
	endprg:
	      mov ax,4C00h
		  int 21h
		
   
	
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   ;finalul executiei programului
code ENDS
END start
