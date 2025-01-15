;From user input of a charactr, Print ASCII code of character in binary and number of 1 bits present
.model small
.stack 100h
.data
msg1 DB 'Type a Character:$'
msg2 DB 0DH,0AH,'The ASCII code of $'
msg3 DB ' In Binary is $'
msg4 DB 0DH,0AH, 'The number of 1 bits is $'


.code
main proc
    mov AX,@data
    mov DS,AX 
    LEA DX,msg1 ;loads the message address into DX
    mov AH,9    ;sets the DOS interrupt to print a string
    int 21H
    
    ;take user input
    mov AH,1
    int 21H
    
    
    XOR BX,BX  ;clears BX to ensure no old data affects the result
    mov BL,AL  ;stores the ASCII value of the entered character in BL
     
    ;print msg3
    LEA DX,msg2
    mov AH,9
    int 21H
    
    
    mov DL,BL   ;Move ASCII value from BL to DL for printing
    mov AH,2
    int 21H
    
    ;print msg3
    LEA DX,msg3
    mov AH,9
    int 21H
    
    mov CX,8  ;Set loop counter to 8 because ASCII values are 8-bit
    mov BH,0  ;Used to count number of 1 present
    
    binary:
    SHL BL,1 ;Shift left
    JNC zero ;Jump to 'zero' if carry flag CF = 0. CF=0/1 value after each shift, the value is printed
    inc BH   ;If CF = 1, increase 1-bit count
    mov DL,31h ;Set DL to '1'
    JMP display 
    
    zero:
    mov DL,30h  ;30h = 0 in ASCII, so 0 is printed if the carry flag was 0. 
    
    ;to count no of 0s
    ;binary:
    ;SHL BL,1   ; Shift left (move bits one by one)
    ;JC one     ; If CF = 1, jump to 'one' (bit is 1)
    ;INC BH     ; If CF = 0, increase 0-bit count
    ;MOV DL,30h ; Set DL to '0'
    ;JMP display

    ;one:
    ;MOV DL,31h ; Set DL to 1 
    
   display:
    mov AH,2    ; DOS function to print single character
    int 21H     ; Print 1 or 0
    loop binary ; Repeat for all 8 bits
    ADD BH,30h  ;Convert count of 1s to ASCII
    
    ;print msg4
    LEA DX,msg4     
    MOV AH,9
    int 21H 
    
   ;Prints count of 1s.    
    mov DL,BH
    mov AH,2
    int 21h
    
    
   