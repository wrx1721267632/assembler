assume cs:code

code segment

 start:
     mov ax,4240h
     mov dx,000fh
     mov cx,0ah
     call divdw

     mov ax,4c00h
     int 21h

 divdw:
     push bx
     push ax
     
     mov ax,dx
     mov dx,0
     div cx ;将被除数高位与除数相除，得到最终商的高位
     mov bx,ax
     pop ax
     div cx ;此次div运算，dx中存放上一次运算得到的商与ax构成了这次的被除数
     mov cx,dx
     mov dx,bx
     pop bx
     ret

code ends

end start
