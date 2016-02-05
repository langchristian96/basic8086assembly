ASSUME CS:CODE,ds:data
data segment public
data ends
public baza
extrn tablesa:byte
code segment public
start:
	baza proc
	mov ax,cx
	repeta3:
	mov bh,16
	div bh
	mov cl,al
	mov al,ah
	xlat tablesa
	mov dl,al
	mov ah,02h
	int 21h
	mov ah,0
	
	mov al,cl
	cmp al,0
	ja repeta3
	
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h	
	
	
	ret
	baza endp

code ends
end start