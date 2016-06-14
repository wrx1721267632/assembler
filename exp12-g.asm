assume cs:code

code segment
 start:
     mov ax,0
     mov es,ax
     mov word ptr es:[0*4],200h
     mov word ptr es:[0*4+2],0

     int 0
     mov ax,4c00h
     int 21h
code ends

end start
