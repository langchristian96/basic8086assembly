;Lang Christian-Gabriel, gr. 911, 17.12.2015, homework for lab 10, problem 12
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