ASSUME  cs:code,    ds:data
data segment
msg db 'Input number(must fit on byte): $'
a db 0
b db 0
c db 0
buffer db 4,?,5 dup(0)
res dw 0

data ends
code segment
start:
	mov     ax,     data 
	mov     ds,     ax   
	lea dx,msg
	mov ah,09h
	int 21h
	lea dx,buffer
	mov ah,0ah
	int 21h
	mov cl,buffer[1]
	mov ch,0
	mov si,2
	repeta:
	mov bh,10
	mov al,a
	mul bh
	sub buffer[si],'0'
	mov bl,buffer[si]
	mov bh,0
	add ax,bx
	mov a,al
	inc si
	
	
	loop repeta
	
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
	
	lea dx,msg
	mov ah,09h
	int 21h
	lea dx,buffer
	mov ah,0ah
	int 21h
	mov cl,buffer[1]
	mov ch,0
	mov si,2
	repeta2:
	mov bh,10
	mov al,b
	mul bh
	sub buffer[si],'0'
	mov bl,buffer[si]
	mov bh,0
	add ax,bx
	mov b,al
	inc si
	
	
	loop repeta2
	
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
	
	lea dx,msg
	mov ah,09h
	int 21h
	lea dx,buffer
	mov ah,0ah
	int 21h
	mov cl,buffer[1]
	mov ch,0
	mov si,2
	repeta3:
	mov bh,10
	mov al,c
	mul bh
	sub buffer[si],'0'
	mov bl,buffer[si]
	mov bh,0
	add ax,bx
	mov c,al
	inc si
	
	
	loop repeta3
	
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
	mov al,b
	add al,a
	mov ah,0
	adc ah,0
	mov bl,c
	mov bh,0
	add ax,bx
	mov res,ax
	
	mov cx,0
	repeta4:
	inc cx
	mov bh,10
	div bh
	add ah,'0'
	mov bl,ah
	mov bh,0
	push bx
	mov ah,0
	
	cmp al,0
	jne repeta4
	
	repeta5:
	pop dx
	mov ah,02h
	int 21h
	
	loop repeta5
	
    mov ah, 4ch
    int 21h
    code ends
    end start   