assume cs:code,ds:data

data segment
    db "Beginner's All-purpose Symbolic Instruction Code.",0
data ends

code segment 
 start:
     mov ax,data
     mov ds,ax
     mov si,0
     call letters

     mov ax,4c00h
     int 21h

 letters:
     push cx
     push si
 s:
     mov cl,[si]
     mov ch,0
     jcxz ok
     cmp cl,'a'
     jb next
     cmp cl,'z'
     and cl,11011111b
     mov [si],cl
 next:
     inc si
     jmp s
 ok:
     pop si
     pop cx
     ret

code ends

end start
