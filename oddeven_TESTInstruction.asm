 ;Odd/even from user input using Test instruction
.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter a number (0-9): $'   ; Prompt message
    MSG2 DB 0AH,0DH,'The result is: $'  ; Newline + result message
    ODD_MSG DB   'Odd$'        ; Message for odd number
    EVEN_MSG DB  'Even$'        ; Message for even number
.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Take input from user
    MOV AH, 01H   ; DOS interrupt to take single character input
    INT 21H       ; AL now contains ASCII value of input
    SUB AL, '0'   ; Convert ASCII to numeric value

    ; Check if the number is even or odd using TEST
    TEST AL, 1    ; Bitwise AND with 1 to check LSB
    JZ EVEN       ; If zero, it's even
    JMP ODD       ; Otherwise, it's odd

ODD:
    LEA DX, MSG2  ; Print "The result is:"
    MOV AH, 09H
    INT 21H
    LEA DX, ODD_MSG  ; Print "Odd"
    JMP DISPLAY

EVEN:
    LEA DX, MSG2  ; Print "The result is:"
    MOV AH, 09H
    INT 21H
    LEA DX, EVEN_MSG  ; Print "Even"
    JMP DISPLAY

DISPLAY:
    ; Display final message
    MOV AH, 09H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
