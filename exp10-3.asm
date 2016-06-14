assume cs:code

data segment
    db 10 dup (0)
data ends

code segment

 start:
     mov ax,12666
     mov bx,data
     mov ds,bx
     mov si,0
     call dtoc
     
     mov dh,8
     mov dl,3
     mov cl,2
     call show_str

     mov ax,4c00h
     int 21h

 dtoc:
     push ax
     push bx
     push cx
     push dx
     push si

     mov bx,0
 x:
     mov dx,0
     mov cx,10
     div cx
     mov cx,ax
     add dx,'0'
     push dx
     inc bx
     jcxz f
     jmp x

 f:
     mov cx,bx

 x1:
     pop ds:[si]
     inc si
     loop x1

     pop si
     pop dx
     pop cx
     pop dx
     pop ax
     
     ret

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

 sx:
     mov cl,ds:[si]
     mov ch,0
     jcxz ok
     mov al,cl
     mov es:[di],ax
     inc si
     add di,2
     jmp sx

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
