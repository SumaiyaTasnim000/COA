;character conversion of an user input from lowercase to uppercase
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0DH,0AH,'Enter a lower case letter:$'
MSG2 DB 0DH,0AH,'It is in upper case:$'

CHAR db ?,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

;print user prompt
LEA DX,MSG1
MOV AH,9
INT 21H

;input a character
MOV AH,1
INT 21H
  
;Convert to upper case
SUB AL,20H  ;ADD AL,20H would result in upper to lowercase conversion
MOV CHAR,AL


;Display on the next line
LEA DX,MSG2
MOV AH,9
INT 21H

;character display
LEA DX,CHAR
MOV AH,9
INT 21H

;DOS Exit
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
