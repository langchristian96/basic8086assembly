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
   mov ah,0	;ax=b
   add ax,a	;ax=ax+a=b+a
   mov a,100	;a=100
   mul a	;dx:ax=ax*a=100*(a+b)
   mov word ptr x+2,dx
   mov word ptr x,ax	;x=dx:ax=100*(a+b)
   mov al,d	;al=d
   mov ah,0	;ax=d
   add c,ax	;c=c+ax=c+d
   mov ax,3	;ax=3
   mov dx,0	;dx:ax=3
   div c	;ax=dx:ax/(c+d)
   mov dx,0	
   sub word ptr x,ax
   sbb word ptr x+2,dx	;x=x-dx:ax=100*(a+b)-3/(c+d)
   mov ax,word ptr x	
   mov dx,word ptr x+2	;dx:ax=x
   add ax, word ptr e
   adc dx,word ptr e+2	;dx:ax=dx:ax+e=100*(a+b)-3/(c+d)+e
   mov word ptr x,ax
   mov word ptr x+2,dx	;x=dx:ax=100*(a+b)-3/(c+d)+e
   
   
   

   
   
   
   
   
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
