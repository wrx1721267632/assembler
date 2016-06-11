assume cs:code, ds:data, ss:stack

data segment
    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
data ends

stack segment
    dw 0,0,0,0,0,0,0,0
stack ends

code segment
 start:
     mov ax,stack
     mov ss,ax
     mov sp,16
     mov ax,data
     mov ds,ax
     mov cx,4
     mov bx,0
 s:
     push cx
     mov si,0
     mov cx,4
 s0:
     mov al,[bx+3+si]
     and al,11011111B
     mov [bx+3+si],al
     inc si
     loop s0
     
     add bx,16
     pop cx
     loop s

     mov ax,4c00h
     int 21h
code ends

end start
