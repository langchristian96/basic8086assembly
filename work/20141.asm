ASSUME  cs:code,    ds:data
data segment
filename db '20141.txt',0
number db 10 dup(0)
cont db 0
rez db 0
data ends
code segment
start:
	mov     ax,     data 
	mov     ds,     ax   
	
	mov ah,3dh
	lea dx,filename
	mov al,2
	int 21h
	mov bx,ax
	mov ah,3fh
	mov cx,10
	lea dx,number
	int 21h
	mov si,0
	
	repeta:
	cmp byte ptr number[si],'9'
	jbe nxt
	sub number[si],'a'
	add number[si],10
	mov al,rez
	mov bl,16
	mul bl
	mov rez,al
	mov al,number[si]
	add rez,al
	
	
	
	jmp endf
	nxt:
	mov al,rez
	mov bl,16
	mul bl
	mov rez,al
	sub byte ptr number[si],'0'
	mov al,byte ptr number[si]
	add rez,al
	
	
	endf:
	inc si
	cmp byte ptr number[si],0
	jne repeta
	
	
	mov al,rez
	mov ah,0
	repeta2:
	mov bl,10
	
	div bl
	mov cl,ah
	mov ch,0
	add cx,'0'
	push cx
	inc cont
	mov ah,0
	cmp ax,0
	jne repeta2
	
	repeta3:
	pop dx
	mov ah,02h
	int 21h
	dec cont
	
	cmp cont,0
	jne repeta3
	
	
    mov ah, 4ch
    int 21h
    code ends
    end start   