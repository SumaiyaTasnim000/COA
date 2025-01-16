;Convert a binary decimal byte into its equivalent ascii decimal digit. Use the OR Instruction to set bit 4 and 5
.MODEL SMALL   ; Define small memory model
.STACK 100H    ; Define stack size

.DATA
    msg1 DB 'Enter a digit (0-9): $'   ; Prompt message (string must end with '$')
    newline DB 0DH, 0AH, '$'           ; Newline string
    msg2 DB 'The ASCII equivalent is: $'  ; Output label message
    user_input DB ?   ; Variable to store user input

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Print prompt message
    LEA DX, msg1
    MOV AH, 09H
    INT 21H        ; Print "Enter a digit (0-9):"

    ; Take user input
    MOV AH, 01H    ; DOS function: take single character input
    INT 21H        ; Read input into AL (ASCII character)

    MOV user_input, AL  ; Store input for later use

    ; Print a newline for formatting
    LEA DX, newline
    MOV AH, 09H
    INT 21H

    ; Print label for output
    LEA DX, msg2
    MOV AH, 09H
    INT 21H        ; Print "The ASCII equivalent is:"

    ; Convert ASCII digit ('0'-'9') to Binary Decimal
    MOV AL, user_input  ; Load input
    SUB AL, 30H         ; Convert ASCII to numeric (0-9)

    ; Set bit 4 and 5 using OR instruction
    OR AL, 30H          ; Convert back to ASCII by setting bit 4 and 5

    ; Print the converted ASCII character
    MOV DL, AL
    MOV AH, 02H
    INT 21H        ; Display the result

    ; Print a newline for formatting
    LEA DX, newline
    MOV AH, 09H
    INT 21H

    ; Exit the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN











