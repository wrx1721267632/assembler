assume cs:code,ds:data

data segment

    db 'Welcome to masm!',0

data ends

code segment

 start:
     mov dh,8
     mov dl,3
     mov cl,2
     mov ax,data
     mov ds,ax
     mov si,0
     mov di,8*160+6
     mov ax,0B800h
     mov es,ax
     call show_str

     mov ax,4c00h
     int 21h

 show_str:
     mov cl,[si]
     mov ch,0
     jcxz ok
     mov al,[si]
     mov es:[di],al
     mov al,01000010b
     mov es:[di+1],al
     add si,1
     add di,2
     loop show_str
 ok:
     ret

code ends

end start
