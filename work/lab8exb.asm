assume cs:code,ds:data
data segment
	buffer db 30 dup(0)
	file_spec db "*.*",0
	DTA db 128h dup(0)
	
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	mov es,ax
	
    mov dx,offset DTA
    mov ah,1Ah
    int 21h ; set DTA location

    mov dx,offset file_spec
    mov cx,0
    mov ah,4Eh
    int 21h
    jc  quit

print_name:
    lea si, DTA + 30

next_char:
    lodsb
	mov dl,al
	mov ah,02h
	mov al,0h
    int 21h
    cmp dl,0
    jnz next_char

    mov dl, 13
	mov ah,02h
    int 21h
    mov dl, 10
	mov ah,02h
    int 21h

    mov dx, offset file_spec
    mov cx,0
    mov ah, 4fh
    int 21h
    jnc print_name

quit:   
    mov ax, 4c00h
    int 21h
code ends
end start