ASSUME  cs:code,    ds:data
data segment
filename db '20143.txt',0
buffer db 100 dup(0)

data ends
code segment
start:
	mov     ax,     data 
	mov     ds,     ax   
	mov ah,3dh
	mov al,2
	lea dx,filename
	int 21h
	mov bx,ax
	mov ah,3fh
	mov cx,100
	lea dx,buffer
	int 21h
	mov si,0
	repeta:
	mov al,buffer[si]
	sub al,'0'
	mov bl,10
	mul bl
	mov bl,buffer[si+1]
	sub bl,'0'
	add al,bl
	mov cl,al
	dec cl
	mov bl,al
	repeta2:
	
	mov al,bl
	mov ah,0
	div cl
	cmp ah,0
	je endf
	dec cl
	
	cmp cl,2
	jae repeta2
	afis:
	mov dl,buffer[si]
	mov ah,02h
	int 21h
	mov dl,buffer[si+1]
	mov ah,02h
	int 21h
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
	
	endf:
	inc si
	inc si
	inc si
	cmp buffer[si],0
	jne repeta
	
	
	
	
    mov ah, 4ch
    int 21h
    code ends
    end start   