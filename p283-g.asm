assume cs:code

code segment
 start:
     mov ax,0b800h
     mov es,ax
     mov bx,1
     mov cx,2000
 s:
     inc byte ptr es:[bx]
     add bx,2
     loop s

     mov ax,4c00h
     int 21h
code ends

end start
