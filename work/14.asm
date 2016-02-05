assume cs:code,ds:data
data segment public
public s1,s2,s3
s1 db 'casa',0
len1 equ $-s1-1
c12 db 0
s2 db 'bucatareasa',0
len2 equ $-s2-1
s3 db 'sa',0
len3 equ $-s3-1
data ends

code segment public

extrn afis1:proc
start:
	mov ax,data
	mov ds,ax
	OneTwo:
	mov ch,-1
	mov si,len1
	mov di,len2
	repeta:
	dec si
	dec di
	inc ch
	mov ah,s1[si]
	cmp ah,s2[di]
	je repeta
	mov si,len1-1
	mov di,len2-1
	mov c12,ch
	call afis1
	
	
	
	
	
	
	
	
	
	
	
	mov ah,4ch
	
	int 21h

code ends
end start