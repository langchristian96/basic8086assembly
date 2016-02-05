ASSUME  cs:code,    ds:data
data segment
msg db 'Input a filename: $'
test1 db '\ASC\4',0
filename db 15,?,16 dup(0)
foldername db 15,?,16 dup(0)
msg2 db 'Input a foldername: $'
msg3 db 'File exists in the specified folder $'
msg4 db 'File does not exist in the specified folder $'
bxx dw 0
data ends
code segment
start:
	mov     ax,     data 
	mov     ds,     ax   
	mov ah,2fh
	int 21h
	mov bxx,bx
	lea dx,msg
	mov ah,09h
	int 21h
	lea dx,filename
	mov ah,0ah
	int 21h
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	lea dx,msg2
	mov ah,09h
	int 21h
	lea dx,foldername
	mov ah,0ah
	int 21h
	
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	mov bl,foldername[1]
	mov bh,0
	inc bx
	inc bx
	mov foldername[bx],0
	lea dx,foldername[2]
	mov ah,3bh
	int 21h
	jc exit
	mov ah,4eh
	mov al,111b
	mov bl,filename[1]
	mov bh,0
	inc bx
	inc bx
	mov filename[bx],0
	lea dx,filename[2]
	int 21h
	jc exit
	mov bx,ax
	mov ah,3eh
	int 21h
	lea dx,msg3
	mov ah,09h
	int 21h
	jmp exit2
	
	
	exit:
	mov ah,09h
	lea dx,msg4
	int 21h
	
	
	exit2:
	mov ah,0eh
	mov dl,0
	int 21h
    mov ah, 4ch
    int 21h
    code ends
    end start   