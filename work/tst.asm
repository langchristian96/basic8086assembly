assume cs:code,ds:data

data segment
sir dw 2152h,-6,'xy',0f5b2h,-129
cont equ ($-sir)/2
tabela db '0123456789abcdef'
nr db 0
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	mov bx,0
	mov dl,byte ptr bx
	
	
	
	
	mov ah,4ch
	int 21h

code ends
end start