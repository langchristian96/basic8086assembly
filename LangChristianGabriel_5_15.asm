; The words A and B are given. Obtain the word C in the following way:
;- the bits 0-2 of C have the value 0
;- the bits 3-5 of C have the value 1
;- the bits 6-9 of C are the same as the bits 11-14 of A
;- the bits 10-15 of C are the same as the bits 1-6 of B

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
     mov c,0	;we put 0s on all positions
     or c,0000000000111000b	; we set the value 1 on the bits 3-5 of c
     mov cl,5
     mov bx,a	
     shr bx,cl	;we move the bits to the right so we can have bits 11-14 of a on position 6-9
     and bx,0000001111000000b	;we keep only the 6-9 bits
     or c,bx	; we add the bits 6-9 of a to c
     mov bx,b
     mov cl,9
     shl bx,cl	;we move the bits 1-6 of b to the right so they are on the position 10-15
     and bx,1111110000000000b	;we keep only the 10-15 bits
     or c,bx	;we add the bits 10-15 of b to c

     mov ax, 4c00h
     int 21h
code ends
end start