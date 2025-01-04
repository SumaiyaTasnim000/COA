;From user input, convert upper to lower and viceversae
.model small
.stack 100h
.data
    prompt db 'Enter a character: $'
    msg_upper db 'Converted to upper case: $'
    msg_lower db 'Converted to lower case: $'
    msg_not_letter db 'Input is not a letter. $'
    input_char db ?
.code
main proc
    ; print prompt
    lea dx, prompt
    mov ah, 9
    int 21h
    ; read input character
    mov ah, 1
    int 21h
    mov bl, al ; save input character in BL for later use

    ; check if input is a letter
    cmp bl, 'A'   ;If input is less than 'A',it's not a letter
    jb not_letter ;Therefore jump to not_letter
    cmp bl, 'Z'   ;Checks if input is between A-Z
    jbe upper_case ;Therefore jump to upper_case
    cmp bl, 'a'    ; If input is less than 'a', it's not a letter 
    jb not_letter
    cmp bl, 'z'     ;If input is greater than 'z', it's not a letter
    ja not_letter

lower_case:
    ; convert to upper case
    and bl, 11011111b ;11011111b is used in the AND operation to clear bit 5, which converts lowercase to uppercase
    ; print result
    mov ah, 9
    lea dx, msg_upper
    int 21h
    mov ah, 2  ;print the uppercase output
    mov dl, bl ; Move character from BL to DL to print back on screen
    int 21h
    jmp exit_program 
    
upper_case:
    ; convert to lower case
    or bl, 00100000b  ;00100000b is used in the OR operation to set bit 5, which converts uppercase to lowercase
    ; print result
    mov ah, 9
    lea dx, msg_lower
    int 21h
    mov ah, 2 ;print the lowercase output
    mov dl, bl
    int 21h
    jmp exit_program  
    
not_letter:
    ; print error message
    mov ah, 9
    lea dx, msg_not_letter
    int 21h

exit_program:
    ; exit program
    mov ah, 4ch
    int 21h
main endp
end main







