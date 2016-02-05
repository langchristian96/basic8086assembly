;0-(h+yy)+(d+m)
;Unsigned version
ASSUME cs: code, ds:data
;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
m db 10		;m - [0,100]
h dw 200	;h - [100,300]	
yy dw 152	;yy - [0,256]
d db 7		;d - [-3,15]
res dw 0	;rezultat

;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov ax,0	;ax=0
   mov al,d	;al=d
   add al,m	;al=al+m=d+m
   mov ah,0	;ah=0
   mov bx,0	;bx=0
   mov cx,h	;cx=h
   add cx,yy	;cx=cx+yy=h+yy
   sub bx,cx	;bx=bx-cx=0-(h+yy)
   add bx,ax	;bx=bx+ax=0-(h+yy)+(d+m)
   mov res,bx	res=bx=0-(h+yy)+(d+m)
   
   
   
   
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
