assume cs:code

data segment
 time db 'yy/mm/dd hh:mm:ss','$'
 table db 9,8,7,4,2,0
data ends

code segment
 start:
     mov ax,data 
     mov ds,ax
     mov si,offset table
     mov di,offset time
     
     mov cx,6
 s:
     push cx
     mov al,[si]
     out 70h,al
     in  al,71h

     mov ah,al
     mov cl,4
     shr ah,cl
     and al,00001111b

     add ah,30h
     add al,30h

     mov [di],ah
     mov [di+1],al
     inc si
     add di,3

     pop cx
     loop s

     mov dx,offset time
     mov ah,9
     int 21h

     mov ax,4c00h
     int 21h

code ends

end start
