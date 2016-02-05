ASSUME  cs:code,    ds:data
data segment
readstring db 'Read a string from the keyboard: $'
string db 10,?,11 dup(?)

data ends
code segment
start:
	mov     ax,     data 
	mov     ds,     ax   
	
    mov ah, 4ch
    int 21h
    code ends
    end start   