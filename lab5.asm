
; display 10x10 solid box of aesterisks using emu8086 code
.model small
.stack 100h
.data
a db 'Star related problem'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a 
    int 21h
    
    mov cx,10
    
    lev:
    
    
    mov dl,'*'
    mov ah,2
    int 21h  
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     loop lev
     
     exit:
     mov ah, 4ch
     int 21h
     main endp
end main




