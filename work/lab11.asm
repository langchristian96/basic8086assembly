ASSUME  cs:code,    ds:data
data segment 
s db 100,?,101 dup(0)
n db ?
msg db 'Input string: $'
msg2 db 'Input byte: $'
cont db 0
lin db 1
data ends
code segment 
	start:
	mov     ax,     data 
	mov     ds,     ax
	mov dx,offset msg
	mov ah,09h
	int 21h
	lea dx,s
	mov ah,0ah
	int 21h
	
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h	
	mov dx,offset msg2
	mov ah,09h
	int 21h
	mov ah,08h
	int 21h
	
	mov n,al
	
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h	

	sub n,'0'
	mov bx,2
	
	afis:
	
	mov ch,n
	
	mov dl,lin
	add dl,'0'
	inc lin
	mov ah,02h
	int 21h
	mov dl,':'
	mov ah,02h
	int 21h
	rep2:
	mov ah,02h
	mov dl,s[bx]
	int 21h
	inc bx
	inc cont
	dec ch
	mov dl,cont
	cmp dl,s[1]
	jae nxt
	cmp ch,0
	ja rep2
	nxt:
	mov ch,s[1]
	
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h	
	
	cmp cont,ch
	jb afis
	
	
	
	
	
    mov ah, 4ch
    int 21h
    code ends
    end start   