assume cs:code,ds:data
data segment
a dd 1234a678h,12345678h,1ac3b47dh, 0fedc9876h
constanta equ $-a
rez db constanta/4 dup(0)
data ends

code segment
start:
mov bx,0
mov ax, word ptr [bx]
mov ax,data

mov ds,ax
mov si,0
mov di,0
repeta:
	unu:
		mov al,byte ptr a[si]
		cmp al,byte ptr a[si+1]
		jb doi
		cmp al,byte ptr a[si+2]
		jb trei
		cmp al,byte ptr a[si+3]
		jb patru
		mov rez[di],'4'
		inc di
		jmp next
	doi:
		mov al,byte ptr a[si+1]
		cmp al,byte ptr a[si+2]
		jb trei
		cmp al,byte ptr a[si+3]
		jb patru
		mov rez[di],'3'
		inc di
		jmp next
	trei:
		mov al,byte ptr a[si+2]
		cmp al,byte ptr a[si+3]
		jb patru
		mov rez[di],'2'
		inc di
		jmp next
	patru:
		mov rez[di],'1'
		inc di
	next:
		add si,4
		cmp si,constanta
		jb repeta


mov ah,4ch
int 21h

code ends
end start