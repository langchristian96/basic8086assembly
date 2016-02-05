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
   mov al,b
   mov ah,0
   add ax,a
   mov a,100
   mul a
   mov word ptr x+2,dx
   mov word ptr x,ax
   mov al,d
   mov ah,0
   add c,ax
   mov ax,3
   mov dx,0
   div c
   mov dx,0
   sub word ptr x,ax
   sbb word ptr x+2,dx
   mov ax,word ptr x
   mov dx,word ptr x+2
   add ax, word ptr e
   adc dx,word ptr e+2
   mov word ptr x,ax
   mov word ptr x+2,dx
   
   
   

   
   
   
   
   
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
