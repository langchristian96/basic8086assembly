assume cs:code,ds:data
data segment public
cont db 0
data ends

code segment public
	public afis
	afis proc
	mov al,ch
	mov bl,10
	repeta2:
	mov ah,0
	div bl
	mov dl,ah
	add dl,'0'
	mov dh,0
	push dx
	inc cont
	
	cmp al,0
	ja repeta2
	
	
	repeta3:
	pop dx
	dec cont
	mov ah,02h
	int 21h
	
	cmp cont,0
	ja repeta3
	
	ret
	afis endp
	
code ends
end