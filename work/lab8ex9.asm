assume cs:code,ds:data
data segment
	currentFolder db 100 dup('$')
	file_spec db '*.*',0
	
	DTA db 128h dup(0)
	
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	mov es,ax
	mov ah, 47h
    mov dl, 0                
    mov si, offset currentFolder 
    int 21h
	mov  ah, 9h
    mov  dx, offset currentFolder
    int  21h
	mov dl, 13
	mov ah,02h
	int 21h
	mov dl, 10
	mov ah,02h
	int 21h
	mov dx,offset dta
	mov ah,1ah
	int 21h
	mov dx,offset file_spec
	mov cx,1
	mov ah,4eh
	int 21h


	jc quit
	printName:
		lea si,dta+30
		
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h
		nextChar:
			lodsb
			mov dl,al
			mov ah,02h
			mov al,0h
			int 21h
			cmp dl,0h
			jnz nextChar
			
		mov dl, 13
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h
		mov dx,offset file_spec
		mov cx,0h
		mov ah,4fh
		int 21h
		jnc printName
		
	
	quit:
	mov ax,4c00h
	int 21h
code ends
end start