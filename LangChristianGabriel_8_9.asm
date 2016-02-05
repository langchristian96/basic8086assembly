;Print the name and content of the current directory (the name of all files and subdirectories).
assume cs:code,ds:data
data segment
	buffer db 64 dup('$') ; buffer for the directory
	file_spec db "*.*",0 ; file specification
	
	DTA db 128h dup(0)	; disk transfer address
	
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	mov es,ax
	mov ah, 47h	;function for current directory
    mov dl, 0	;default drive                
    mov si, offset buffer 
    int 21h	; puts into the buffer the current directory
	mov  ah, 9
    mov  dx, offset buffer
    int  21h	;prints the current directory
	mov dx,offset dta
	mov ah,1ah	;sets the disk transfer address DTA
	int 21h
	mov dx,offset file_spec	;moves into dx the file specification
	mov cx,10h	;attribute value for directory
	mov ah,4eh	;find first matching file
	int 21h
	jc quit	;if error, quits
	printName:
		lea si,dta+30	;prints the name of each file, which is found at the offset dta+30
		nextChar:
			lodsb
			mov dl,al
			mov ah,02h	;prints the character from dl
			mov al,0h
			int 21h
			cmp dl,0h
			jnz nextChar
			
		mov dl, 13	;prints newline
		mov ah,02h
		int 21h
		mov dl, 10
		mov ah,02h
		int 21h	; end of printing new line
		mov dx,offset file_spec	;moves into dx the file specification
		mov cx,0h
		mov ah,4fh	;find the next matching file
		int 21h
		jnc printName	;if no error, jump to printName
		
	
	quit:
	mov ax,4c00h
	int 21h
code ends
end start