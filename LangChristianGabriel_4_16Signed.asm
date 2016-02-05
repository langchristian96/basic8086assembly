;100*(a+b)-3/(c+d)+e

ASSUME cs: code, ds:data
;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
a dw 1
b db 12
c dw 0
d db 2
e dd 100
x dd ?

;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
   ;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov al,b	;al=b
   cbw		;ax=b
   add ax,a	;ax=ax+a=b+a
   mov a,100	;a=100
   imul a	;dx:ax=100*(a+b)
   mov word ptr x+2,dx	
   mov word ptr x,ax	;x=dx:ax
   mov al,d	;al=d
   cbw		;ax=d
   add c,ax	;c=c+ax=c+d
   mov ax,3	;ax=3
   cwd		;dx:ax=3
   idiv c	;ax=dx:ax/(c+d)=3/(c+d)
   cwd		;dx:ax=ax
   sub word ptr x,ax	
   sbb word ptr x+2,dx	;x=x-dx:ax=100*(a+b)-3/(c+d)
   mov ax,word ptr x
   mov dx,word ptr x+2	;dx:ax=x
   add ax, word ptr e
   adc dx,word ptr e+2	;dx:ax=dx:ax+e=x+e=100*(a+b)-3/(c+d)+e
   mov word ptr x,ax
   mov word ptr x+2,dx	;x=dx:ax
   
   
   

   
   
   
   
   
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
