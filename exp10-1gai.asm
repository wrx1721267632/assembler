assume cs:code

data segment

    db 'fghfghf',0

data ends

code segment

 start:
     mov dh,8
     mov dl,3
     mov cl,2
     mov ax,data
     mov ds,ax
     mov si,0
     call show_str

     mov ax,4c00h
     int 21h

 show_str:
     push ax
     push cx
     push dx
     push es
     push si
     push di
     
     mov ax,0b800h
     mov es,ax

     mov cx,dx
     dec dh
     mov al,160
     mul dh
     add dl,dl
     mov dh,0
     add ax,dx
     mov di,ax
     mov ah,cl

 x:
     mov cl,ds:[si]
     mov ch,0
     jcxz ok
     mov al,cl
     mov es:[di],ax
     inc si
     add di,2
     jmp x

 ok:
     pop di
     pop si
     pop es
     pop dx
     pop cx
     pop ax
     ret

code ends

end start
