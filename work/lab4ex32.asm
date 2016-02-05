ASSUME cs: code, ds:data
   ;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
a db 1
b db 12
c dd 0
d db 2
x dw ?


   ;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
   ;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov al,a
   mul b
   mov dx,0
   sub ax, word ptr c
   sbb dx, word ptr c+2
   mov bx,ax
   mov al,d
   mov ah,0
   mov cx,ax
   mov ax,bx
   div cx
   mov x,ax
 
   
   
   
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
