;take three character input. Print in reverse order using push and pop 
.model small
.stack 100h
.data
msg1 DB 'Enter three characters: $'
msg2 DB 0DH,0AH,'Reversed order: $'

.code
main proc
    mov AX, @data
    mov DS, AX

    ; Print message to enter characters
    LEA DX, msg1
    mov AH, 9
    int 21H  

    ; Take first character input and store it in AX (AL will hold the character)
    mov AH, 1
    int 21H
    mov BX, AX  ; Move AX (which holds the first character in AL) to BX
    PUSH BX      ; Push the first character from BX onto stack

    ; Take second character input and store it in AX (AL will hold the character)
    mov AH, 1
    int 21H
    mov CX, AX  ; Move AX (which holds the second character in AL) to CX
    PUSH CX      ; Push the second character from CX onto stack

    ; Take third character input and store it in AX (AL will hold the character)
    mov AH, 1
    int 21H
    PUSH AX      ; Push the third character from AX onto stack

    ; Print new line and message
    LEA DX, msg2
    mov AH, 9
    int 21H  

    ; Pop and print third character (Last entered, first to be popped)
    POP AX  ; Pop the third character into AX
    mov DL, AL
    mov AH, 2
    int 21H  

    ; Pop and print second character
    POP BX  ; Pop the second character into BX
    mov DL, BL
    mov AH, 2
    int 21H  

    ; Pop and print first character (First entered)
    POP CX  ; Pop the first character into CX
    mov DL, CL
    mov AH, 2
    int 21H  

    ; Exit program
    MOV AH, 4Ch
    INT 21H  

main endp
end main
