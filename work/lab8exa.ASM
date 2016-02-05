assume cs:code,ds:data
data segment
	msg db '1 for baseten, 2 for basetwo: $'
	a dw 1234
	ten dw 10
	
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	mov ah,09h
	mov dx, offset msg
	int 21h
	mov ah,01h
	int 21h
	
	cmp al,'1'
	je baseten
	jmp basetwo
	
	
	baseten:
		
		mov dx,0h
		mov ax,a
		repe1:
		mov cx,ax
		div ten
		add dx,'0'
		mov dl,dh
		mov ah,05h
		int 21h
		mov ax,cx
		cmp ax,0
		jne repe1
		jmp endpr
		
		
	basetwo:
		mov dx,0
		mov ax,a
		repe2:
		mov cx,2
		div cx
		add dx,'0'
		mov bx,ax
		mov dl,dh
		mov ah,05h
		int 21h
		mov ax,bx
		cmp ax,0
		jne repe2
		
		
	
	endpr:
	mov ax,4c00h
	int 21h
code ends
end start