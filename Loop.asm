.model small
.data
    hello db 0dh, "Hello World$"
    bye db 0DH, "Bye World$"
    count db 5

.code
    mov AX, @data
    mov DS, AX

    ; Initialize loop counter
    mov cx, 5

print_hello:
    mov ah, 09h     ; DOS function to print a string
    lea dx, hello   ; Load address of hello string
    int 21h         ; Call DOS 
    
     ; Print a newline character
    mov ah, 02h     ; DOS function to print a character
    mov dl, 0AH     ; ASCII code for newline
    int 21h         ; Call DOS

   ;Decremen the counter  
    dec cx;

    ; Check if we've printed "Hello World" five times
    CMP cx,0;
    JG  print_hello:
   
    JNE print_bye    ; If count is zero, jump to print_bye

  
print_bye:
    ; Print a newline character
    mov ah, 02h     ; DOS function to print a character
    mov dl, 0Ah     ; ASCII code for newline
    int 21h         ; Call DOS

    ; Print "Bye World"
    mov ah, 09h     ; DOS function to print a string
    lea dx, bye     ; Load address of bye string
    int 21h         ; Call DOS

    ; Exit the program
    mov ah, 4Ch     ; DOS function to exit
    int 21h         ; Call DOS

end




