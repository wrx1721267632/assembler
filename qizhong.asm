assume cs:code

data segment
 s1 db 96,97,68,67,79,80,85,86,54,77
    db 31,32,95,98,66,67,75,74,77,88
    db 99,22,33,54,45,46,64,78,79,90
 s2 db 100,90,89,80,79,70,69,60,59,0
 s3 db '100~90:00,89~80:00,79~70:00,69~60:00,59~00:00$'
data ends

code segment
 start:
     mov ax,data
     mov ds,ax
     mov bx,offset s3
     mov cx,5
     mov di,offset s2
 s:
     add bx,7
     call ones
     add di,2
     loop s

     mov dx,offset s3
     mov ah,9
     int 21h

     mov ax,4c00h
     int 21h

 ones:
     push cx
    
     mov cx,30
     mov si,0
     mov al,[di]
     mov ah,[di+1]
     mov dl,0
 s0:
     cmp [si],al
     ja next
     cmp [si],ah
     jb next
     inc dl
 next:
     inc si
     loop s0
     
     mov al,10
     cmp dl,al
     jb s9
     mov al,dl
     mov ah,0
     mov dl,10
     div dl
     add al,30h
     mov [bx],al
     mov dl,ah
 s9:
     inc bx
     add dl,30h
     mov [bx],dl
     inc bx
     
     pop cx
     ret

code ends

end start
