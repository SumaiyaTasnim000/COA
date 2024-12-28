;switch case on user input of odd/even number and print odd/even respectively. Typing number out of range of 1-4 would print invalid message  

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Enter a number (1-4): $'
MSG2 DB 0AH,0DH,'The result is: $'
ODD_MSG DB 'Odd$', 0DH, 0AH
EVEN_MSG DB 'Even$', 0DH, 0AH
INVALID_MSG DB 0AH,0DH,'Invalid input!$', 0DH, 0AH
.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Take input
    MOV AH, 01H
    INT 21H
    SUB AL, '0'       ; Convert ASCII to numeric value

    ; Check input validity and jump to appropriate label
    CMP AL, 1
    JE ODD
    CMP AL, 3
    JE ODD
    CMP AL, 2
    JE EVEN
    CMP AL, 4
    JE EVEN
    JMP INVALID_INPUT

ODD:
    LEA DX, MSG2      ; Display "The result is:"
    MOV AH, 09H
    INT 21H
    LEA DX, ODD_MSG   ; Display "Odd"
    JMP DISPLAY

EVEN:
    LEA DX, MSG2      ; Display "The result is:"
    MOV AH, 09H
    INT 21H
    LEA DX, EVEN_MSG  ; Display "Even"
    JMP DISPLAY

INVALID_INPUT:
    LEA DX, INVALID_MSG  ; Display "Invalid input!"
    JMP DISPLAY

DISPLAY:
    ; Display the final message
    MOV AH, 09H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
