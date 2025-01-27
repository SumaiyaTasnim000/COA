;Hexa input, binary output
.MODEL SMALL  
.STACK 100H
.DATA
Msg1 DB 0AH,0DH,'Type a hexa number(0-FFFF): $'   
Msg2 DSTARTB 0AH,0DH,'IN binary is: $'
Msg3 DB 0AH,oDH,'Illegal Hexa digit!$'   

.CODE
MAIN PROC
 MOV AX,@DATA
 MOV DS,AX
 
 ;print Msg1
 LEA DX,Msg1
 MOV AH,9
 INT 21H
 
 :
 XOR BX,BX
 MOV CL,4
 MOV AH,1
 INT 21H  
 
 ;Check for errors in input
 While:
 CMP AL,0DH   ;checks if enter key is pressed
 JE End_While
 CMP AL,'0'
 JL ERR
 CMP AL,'9'
 JG ERR
 CMP AL,'A' 
 JL ERR
 CMP AL,'F'
 JG ERR
 SUB AL,37 ;Substracts 37 from ASCII A-F to convert into 10-15
 
;checks all the 4 letters 1 by one through left shift 
 SHIFT:
 SHL BX,CL
 OR BL,AL
 INT 21H
 JMP While 
 
 
 
 End_While:
 LEA DX Msg2
 MOV AH,9
 INT 21H
 MOV CX,16 ;4 digit hexa makes up 16 digit binary output
 MOV AH,2
 
 ;Print binary outputs:
 SHOW:
 SHL BX,1
 JC ONE
 MOV DL,'0'
 int 21H
 JMP LOOP1
 
 ONE:
 MOV DL,'1'
 INT 21H
 
 LOOP1:
 Loop SHOW
 JMP OUT
 
 
 ERR:
 LEA DX,Msg3
 MOV AH,9
 INT 21H 
 JMP START
 
 OUT:
 MOV AH,4ch
 int 21H
 
MAIN ENDP
END MAIN
 
    