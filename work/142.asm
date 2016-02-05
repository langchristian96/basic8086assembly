assume cs:code,ds:data

data segment public
eroare db 'No sufix $'
extrn s1:byte,s2:byte,s3:byte
data ends

code segment public
public afis1
afis1:
cmp ch,-1
je endf
repetare:
mov dl,s1[si]
mov ah,02h
int 21h
dec ch
dec si


cmp ch,0
ja repetare

ret

endf:
lea dx,eroare
mov ah,09h
int 21h
mov dl,13
mov ah,02h

int 21h
mov dl,10
mov ah,02h
int 21h
ret


code ends
end