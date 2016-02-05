assume cs:code, ds:data
data segment
    a dw 1010111001101100b
    b dw 0111110100100110b
    c dw ?
data ends

code segment
start:
     mov ax, data ; we load in ds the address of data segment
     mov ds, ax
     mov ax,a
     and ax,1
     mov bx,ax
     mov ax,a
     shl ax,1
     and ax,0000000000000100b
     or ax,10b
     or bx,ax

     or bx,0000000000000010b
     or bx,0000000000010000b
     mov c,bx
     mov bx,a
     mov cl,5
     shr bx,5
     and bx,0000001111000000b
     or c,bx
     mov bx,b
     mov cl,7
     shl bx,cl
     not bx
     and bx,1111110000000000b
     or c,bx
     

     mov ax, 4c00h
     int 21h
code ends
end start