ASSUME ds:data,cs:code
data segment public
msg db 'Input string of numbers: $'
buffer db 40,?,41 dup(0)
tablesa db '0123456789abcdef'
data ends
extrn baza:proc
public tablesa
code segment
start:
	mov ax,data
	mov ds,ax
	lea dx,msg
	mov ah,09h
	int 21h
	lea dx,buffer
	mov ah,0ah
	int 21h
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h	
	mov si,2
	jmp nxt2
	repeta2:
	;
	mov ax,cx
	repeta3:
	mov bh,16
	div bh
	mov cl,al
	mov al,ah
	xlat tablesa
	mov dl,al
	mov ah,02h
	int 21h
	mov ah,0
	
	mov al,cl
	cmp al,0
	ja repeta3
	
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h	
	
	
	
	
	
	;
	
	nxt2:
	mov cx,0
	repeta:
	sub buffer[si],'0'
	mov al,cl
	mov bh,10
	mul bh
	add al,buffer[si]
	mov ah,0
	mov cx,ax
	push cx
	inc si
	cmp buffer[si],0
	je nxt
	cmp buffer[si],' '
	jne repeta
	cmp buffer[si],' '
	je repeta2
	
	nxt:
	;
	mov ax,cx
	repeta4:
	mov bh,16
	div bh
	mov cl,al
	mov al,ah
	xlat tablesa
	mov dl,al
	mov ah,02h
	int 21h
	mov ah,0
	
	mov al,cl
	cmp al,0
	ja repeta4
	
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h	
	
	
	
	;
	mov ah,4ch
	int 21h


code ends
end start