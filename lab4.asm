 ; model small;
 .stack 100h;
 .data
 .code
 main proc
    ;display prompt
    MOV AH,2        ;to display character functio, a handler is called
    MOV DL,'?'      ;character is ?
    INT 21H         ;display character using interrupt 21H
   
   
    ;input a character
    MOV AH,1       ;input key function
    INT 21H        ;ASCII code in AL
    mov BL,AL      ;save it in bl
     
    mov AH,2       ;display character function
    mov DL,0dh     ;carriage return
    int 21h        ;execute
    mov DL,0ah     ;line feed 
    int 21h        ;execute   
 
    
    ;display character
    mov DL,BL
    int 21H
    
    
    ;return to DOS
    mov AH,4ch    ;handover the handler
    int 21H


