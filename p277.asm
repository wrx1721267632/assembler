assume cs:code

code segment
 start:
     mov ax,0b800h
     mov es,ax
     mov ah,'a'
 s:  
     mov es:[160*12+40*2],ah
     inc ah
     cmp ah,'z'
     call yanshi
     jna s

     mov ax,4c00h
     int 21h

 yanshi:
     push dx
     push ax

     mov dx,10h
     mov ax,0
 s1:
     sub ax,1
     sbb dx,0
     cmp ax,0
     jne s1
     cmp dx,0
     jne s1
     
     pop ax
     pop dx
     ret
code ends

end start
