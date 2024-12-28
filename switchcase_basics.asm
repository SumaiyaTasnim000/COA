;Switch case 
CMP AX,0
JL Negative ;AX < 0
JE Zero      ;AX = 0
JG Positive  ;AX > 0


Negative: 
MOV BX,-1
JMP END_CASE ;jump to Exit switch
Zero:
MOV BX,0
JMP END_CASE
Positive: 
MOV BX,1
END_CASE:  ;exit switch