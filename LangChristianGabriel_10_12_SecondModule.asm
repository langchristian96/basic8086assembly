;Read from the standard input several numbers, in base 2. Print on the screen these numbers in base 16.

;second module

ASSUME  cs:code,    ds:data
data segment

data ends
public afis
code segment
	afis proc
	
	mov ah,02h	;prints the character from dl, given in the other module
	int 21h
	ret
	afis endp
    code ends
    end 