assume cs:code,ds:data
data segment public

c db ?

data ends
public c,computeExpr
extrn a:byte,b:byte,res:word,buffer:byte,msg:byte

code segment public
	extrn readInteger:proc
	computeExpr PROC far
	
	
	call readInteger	
	
	mov c,al
	
	mov ah,0
	sub res,ax
	ret
	computeExpr endp 
	
	
code ends
end