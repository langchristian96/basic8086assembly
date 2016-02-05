.686
.model flat, stdcall
.data

stringg db 'mark'
len equ $-stringg
buffer db 'marqqqmarmareeee'

cont db 0

.code
start:
	mov si,0
	mov di,0
	repeta:
	mov al,buffer[si]
	
	cmp al,stringg[di]
	jne nxt
	inc di
	jmp nxt2
	nxt:
	mov di,0
	nxt2:
	mov ax,di
	cmp al,len
	jne crest
	inc cont
	mov di,0
	crest:
	inc si
	
	cmp buffer[si],0
	jne repeta
	
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
	mov dl,cont
	cmp dl,0
	je nucontine
	jmp contine
	nucontine:
	mov ah,02h
	mov dl,'N'
	int 21h
	mov ah,02h
	mov dl,'U'
	int 21h
	
	jmp exit
	contine:
	mov ah,02h
	mov dl,'D'
	int 21h
	mov ah,02h
	mov dl,'A'
	int 21h
	
	
	exit:
    mov ah, 4ch
    int 21h

    end start   