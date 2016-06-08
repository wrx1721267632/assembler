assume cs:codesg 

codesg segment 

    mov ax,0 
    mov ds,ax 
    mov bx,200H 
    mov al,0 
    mov cx,40H
  s:mov [bx],al 
    inc bx 
    inc ax 
    loop s 

    mov ax,4c00h 
    int 21h 

codesg ends 

end
