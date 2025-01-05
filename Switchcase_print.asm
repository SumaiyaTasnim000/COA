
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Enter a number (1-4): $'

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
    SUB AL, '0'    
    
    
      ; Check input validity and jump to appropriate label
    CMP AL, 1
    JE ODD
    CMP AL, 3
    JE ODD
    CMP AL, 2
    JE EVEN
    CMP AL, 4
    JE EVEN
    
    
    ODD:
    MOV Dl,'o'
    JMP Display
    
    
     EVEN:
    MOV Dl,'e'
    JMP Display

   Display:
   MOV AH,2
   INT 21H
   
    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN