assume cs:code,ds:data
data segment
    db 8,11,8,1,8,5,63,38
data ends

code segment
 start:
     mov ax,data
     mov ds,ax
     mov si,0
     mov cx,8
     mov ax,0
    
 s:
     cmp byte ptr [si],8
     jna s1
     inc ax
 s1:
     inc si
     loop s

     mov ax,4c00h
     int 21h
code ends

end start
