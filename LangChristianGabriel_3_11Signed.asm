;0-(h+yy)+(d+m)
;Signed version
ASSUME cs: code, ds:data
;spunem asamblorului care sunt segmentele folosite de noi
data SEGMENT 
m db 10		;m - [0,100]
h dw 200	;h - [100,300]	
yy dw 152	;yy - [0,256]
d db -2		;d - [-3,15]
res dw 0	;rezultat


;data - segmentul de date in care vom defini variabilele
data ENDS
code SEGMENT
;code - numele segmentului de cod
start:
   mov ax,data    ;adresa segmentului de date se copiaza in ax
   mov ds,ax    ;continutul lui ax se copiaza in ds
   mov bx,h 	; bx=h
   
   add bx,yy	; bx=bx+yy=h+yy
   mov res,bx	;res=bx=h+yy
   neg res	;res=0-res=0-(h+yy)

   
   mov al,d	; al=d
   add al,m	; al=al+m=d+m

   cbw
   

   add res,ax	;res=res+ax=0-(h+yy)+(d+m)

   
   
   ; .......
   ;aici avem instructiunile programului nostru
   ;........
   mov ax,4C00h
   int 21h   ;finalul executiei programului
code ENDS
END start
