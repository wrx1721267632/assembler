assume cs:code

code segment
 start:
     mov ax,cs
     mov ds,ax
     mov si,offset do0
     mov ax,0
     mov es,ax
     mov di,200h
     mov cx,offset do0end-offset do0
     cld
     rep movsb

     mov es:[7ch*4],200h
     mov word ptr es:[7ch*4+2],0

     mov ax,4c00h
     int 21h
 do0:
     mov al,160
     mul dh
     add dl,dl
     mov dh,0
     add ax,dx
     mov di,ax

     mov ax,0b800h
     mov es,ax
 s:
     mov al,[si]
     mov ah,0
     cmp ax,0
     je ok
     mov ah,cl
     mov es:[di],ax
     inc si
     inc di
     inc di
     jmp s
 ok:
     iret
 do0end:
     nop
code ends

end start
