.model small
.stack 100h
.data  
msg1 dw 'First msg is $';
msg2 dw 'Second msg is $';
 
 .code
 main proc
      JMP MORNING  ;jmp label called
     MORNING:
    mov ah,2
    mov dl,al
    int 21h
    mov al,65  ;ASCII val of A is 65
    mov cl,al
    mov ah,2
    mov dl,cl
    int 21h
    ADD al,32   ;ASCII val of a is 32
    mov ah,2
    mov dl,al
    int 21h
     JMP EXIT ;removing this jmp exit would result in infinite printing out.
   
   EXIT:
   mov ah,4ch
   int 21h
   main endp
 end main
    

