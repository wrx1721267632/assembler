assume cs:code

code segment
 start:
     mov ax,10
     shl ax,1
     mov bx,ax
     shl ax,1
     shl ax,1
     add ax,bx
code ends

end start
