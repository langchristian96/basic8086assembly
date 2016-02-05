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
     mov c,0
     or c,0000000000111000b
     mov cl,5
     mov bx,a
     shr bx,cl
     and bx,0000001111000000b
     or c,bx
     mov bx,b
     mov cl,9
     shl bx,cl
     and bx,1111110000000000b
     or c,bx

     mov ax, 4c00h
     int 21h
code ends
end start