assume cs:code,ds:data
data segment public

data ends
code segment public
extrn afis:proc
	start:
	mov ax,data
	mov ds,ax
	mov ch,32
	repeta:
	call afis 
	mov dl,' '
	mov ah,02h
	int 21h
	mov dl,ch
	
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	mov dl,10
	mov ah,02h
	int 21h
	inc ch
	cmp ch,126
	jbe repeta
	
	
	
	
	
	mov ah,4ch
	int 21h
code ends
end start