ASSUME  cs:code,    ds:data
data segment

data ends
code segment
start:
	mov     ax,     data 
	mov     ds,     ax   
	
    mov ah, 4ch
    int 21h
    code ends
    end start   