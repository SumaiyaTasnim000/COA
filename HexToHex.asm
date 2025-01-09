; reads a hexadecimal number from user input, stores it as a binary value in BX, and then outputs it back as a hexadecimal number
.MODEL SMALL
.STACK 100

.CODE
    mov bx, 0  ;Initializes BX to store the final binary value
    mov cl, 4  ;Sets CL = 4 to shift 4 bits for each hex digit.
    mov ah, 1  ;reading a character, brings the blinking cursor
    
    for1:
    int 21h
    cmp al, 0Dh  ;Check if Enter key is pressed
    JE Output    ;If Enter key is pressed, go to Output section
    CMP AL, 41H  ;Check if AL is 'A' (41H in ASCII)
    JGE letter   ;If AL >= 'A', it's a letter (A-F)
    and al, 0Fh  ;Convert '0'-'9' to 0-9
    JMP shift    ;Jump to shift part
    
    letter: 
    sub al, 37h  ;Subtracts 37 from ASCII 'A'-'F' to convert it to 10-15.
    
    shift:
    shl bx, cl   ;create space for a new digit
    or bl, al    ; Store the new digit in the lower nibble of BX
    JMP for1     ; Repeat for the next character
    
    ;print output in a new line
    Output:  
    mov ah,2 
    mov dl, 0Dh  
    int 21h
    mov dl, 0AH
    int 21h
    
    mov cx, 4   ;Sets up a loop to process 4 nibbles (16-bit number)
    mov ah, 2
    
    for2:
    mov dl, bh    ; Get high byte of BX
    shr dl, 4     ; Extract high nibble
    ROL BX, 4     ; Rotate BX left (brings next nibble to BH) 
    
    ;Convert to ASCII
    CMP DL, 10    ;If nibble is <10, add 30 to convert to ASCII.
    JGE outputLetter
    add dl, 48    ;Convert 0-9 to ASCII '0'-'9'
    int 21h   
    JMP Exit2
    
    
    outputLetter:
    add dl, 55   ;Convert 10-15 to 'A'-'F' by adding 55 
    int 21h
    
    ;Loop until all digits are printed
    Exit2:
    loop for2
    
    
   
    mov ah, 4ch
    int 21h




