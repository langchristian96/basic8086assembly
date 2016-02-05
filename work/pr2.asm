assume cs:code,ds:data
data segment
numef db 'cacat',50 dup(0)
extensie db 'asm',0

data ends

code segment
start:
	mov ax,data
	mov ds,ax
	mov si,0
	repeta2:
	inc si
	
	cmp numef[si],0
	jne repeta2
	
	mov di,0
	mov numef[si],'.'
	inc si
	repeta:
	mov ch,extensie[di]
	mov numef[si],ch
	inc si
	inc di
	cmp extensie[di],0
	jne repeta
	mov ah,3ch
	mov cx,2
	lea dx,numef
	int 21h
	
	mov ah,4ch
	int 21h

code ends
end start