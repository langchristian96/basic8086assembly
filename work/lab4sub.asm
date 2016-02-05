ASSUME cs: code, ds:data
   ;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
a dd 1234h
b dd 0AABBCCDDh
x dd ?


   ;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
   ;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov ax,word ptr a
   mov dx,word ptr a+2
   sub ax,word ptr b
   sbb dx,word ptr b+2
   mov word ptr x,ax
   mov word ptr x+2,dx
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
