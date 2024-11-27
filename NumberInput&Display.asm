;take a input from user and store it in the memory. show the input digit in the next line in the dos prompt 


.model small
.stack 100h
.data
    input_msg db 'Input number of 2 digits: $'
    output_msg db 'Output number: $'
    newline db 0Dh, 0Ah, '$'
.code
main proc
    
    mov ax, @data
    mov ds, ax

    lea dx, input_msg
    mov ah, 9h
    int 21h

    mov ah, 8h
    int 21h
    mov bl, al   

    mov dl, al
    mov ah, 2h
    int 21h

   
    mov ah, 8h
    int 21h
    mov bh, al   

    mov dl, al
    mov ah, 2h
    int 21h

    lea dx, newline
    mov ah, 9h
    int 21h

    lea dx, output_msg
    mov ah, 9h
    int 21h

   
    mov dl, bl    
    mov ah, 2h
    int 21h

    mov dl, bh    
    mov ah, 2h
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main
                                                                     