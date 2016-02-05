assume cs:code,ds:data
data segment
filen db 'fisier.txt',0
buffer db 100 dup(0)

data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov ah,3dh
	mov al,2
	lea dx,filen
	int 21h
	jc exit
	mov bx,ax
	mov ah,3fh
	mov cx,100
	lea dx,buffer
	int 21h
	mov si,0
	repeta:
	inc si
	
	
	cmp buffer[si],0
	jne repeta
	
	
	mov buffer[si],' '
	mov buffer[si+1],'p'
	mov buffer[si+2],'i'
	mov buffer[si+3],'p'
	mov buffer[si+4],'i'
	mov ah,42h
	mov dx,0
	mov cx,0
	mov al,0
	int 21h
	mov ah,40h
	mov cx,si
	add cx,5
	lea dx,buffer
	int 21h
	exit:
	mov ah,4ch
	int 21h
code ends
end start