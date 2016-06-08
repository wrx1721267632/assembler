assume cs:code

code segment
    
    mov ax,20H
    mov ds,ax
    mov dx,0
    mov cx,64
  s:mov [dx],dl
    inc dx
    loop s

    mov ax,4cooH
    int 21h

code ends

end
