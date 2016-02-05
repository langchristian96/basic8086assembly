ASSUME  cs:code,    ds:data
data segment public
a db ?
b db ?
res dw 0
msg db 'Input number(must be byte) $'
buffer  db 3,?,4 dup(?)
rez dw ?
data ends
public a,b,msg,res,buffer
public readInteger
extrn computeExpr:PROC,c:byte
code segment public
	start:
	mov     ax,     data 
	mov     ds,     ax
	mov es,ax
	jmp endpr
	readInteger proc far
	public readInteger
	
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h	
	mov cx,4
	mov si,2
	zero:
	mov buffer[si],0
	inc si
	loop zero
	mov ah,09h
	lea dx,msg
	int 21h
	mov ah,0ah
	lea dx,buffer
	int 21h
	mov bl,buffer[1]
	mov bh,0
	add bx,offset buffer
	add bx,2
	mov byte ptr [bx],0
	mov si,2
	mov cx,0
	repeta:
		mov bl,buffer[si]
		sub bl,'0'
		mov bh,0
		mov buffer[si],bl
		inc cx
		inc si
	cmp buffer[si],0
	jne repeta
	mov si,2
	mov ax,0
	constr:
	mov bx,10
	mul bx
	mov dl,buffer[si]
	mov dh,0
	add ax,dx
	inc si
	loop constr
	
	
	
	ret 
	readInteger endp
	endpr:
	call readInteger
	mov a,al
	
	call readInteger
	mov b,al
	
	
	mov al,a
	
	mov bl,b
	mul bl
	add res,ax
	
	call computeExpr
	mov ax,res
	mov rez,ax
	mov ax,0
	
	
    mov ah, 4ch
    int 21h
    code ends
    end start   