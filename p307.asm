assume cs:code

data segment
 db 'end$'
data ends

code segment
 start:
     mov dh,24
     mov dl,6
     call getstr

     mov ax,data
     mov ds,ax
     mov dx,0
     mov ah,9
     int 21h

     mov ax,4c00h
     int 21h

 getstr:
     push ax
 getstrs:
     mov ah,0
     int 16h
     cmp al,20h
     jb nochar
     mov ah,0
     call charstack
     mov ah,2
     call charstack
     jmp getstrs

 nochar:
     cmp ah,0eh
     je backspace
     cmp ah,1ch
     je enter
     jmp getstrs

 backspace:
     mov ah,1
     call charstack
     mov ah,2
     call charstack
     jmp getstrs

 enter:
     mov al,0
     mov ah,0
     call charstack
     mov ah,2
     call charstack 
     pop ax
     ret

 charstack:
     jmp short charstart

     table dw charpush,charpop,charshow
     top   dw 0

 charstart:
     push bx
     push dx
     push di
     push es

     cmp ah,2
     ja sret
     mov bl,ah
     mov bh,0
     add bx,bx
     jmp word ptr table[bx]

 charpush:
     mov bx,top
     mov [si][bx],al
     inc top
     jmp sret

 charpop:
     cmp top,0
     je sret
     dec top
     mov bx,top
     mov al,[si][bx]
     jmp sret

 charshow:
     mov bx,0b800h
     mov es,bx
     mov al,160
     mov ah,0
     mul dh
     mov di,ax
     add dl,dl
     mov dh,0
     add di,dx
     
     mov bx,0
 charshows:
     cmp bx,top
     jne noempty
     mov byte ptr es:[di],' '
     jmp sret
 noempty:
     mov al,[si][bx]
     mov es:[di],al
     mov byte ptr es:[di+2],' '
     inc bx
     add di,2
     jmp charshows
 sret:
     pop es
     pop di
     pop dx
     pop bx
     ret
code ends

end start
