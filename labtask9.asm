org 100h   ; Starting point for COM file

start:
    ; Prompt for first digit
    mov ah, 09h       ; DOS function to print string
    lea dx, prompt1   ; Load address of prompt1 message
    int 21h           ; Print message

    ; Read first digit
    mov ah, 01h       ; Function to read a character from input
    int 21h           ; Read character (AL gets the value)
    sub al, '0'       ; Convert ASCII to integer
    mov bl, al        ; Store first digit in BL

    ; Print a newline
    mov ah, 09h       ; DOS function to print string
    lea dx, newline   ; Load address of newline
    int 21h           ; Print newline

    ; Prompt for second digit
    mov ah, 09h       ; DOS function to print string
    lea dx, prompt2   ; Load address of prompt2 message
    int 21h           ; Print message

    ; Read second digit
    mov ah, 01h       ; Function to read a character from input
    int 21h           ; Read character (AL gets the value)
    sub al, '0'       ; Convert ASCII to integer

    ; Compare both digits
    cmp bl, al        ; Compare the first and second digits
    je equal          ; If equal, jump to equal section
    jne not_equal     ; If not equal, jump to not_equal section

equal:
    ; Print "Numbers are equal"
    mov ah, 09h       ; DOS interrupt to print a string
    lea dx, msg_equal ; Load address of the message
    int 21h           ; Print message
    jmp done          ; Jump to end of the program

not_equal:
    ; Print "Numbers are not equal"
    mov ah, 09h       ; DOS interrupt to print a string
    lea dx, msg_not_equal ; Load address of the message
    int 21h           ; Print message

done:
    ; Exit the program
    mov ah, 4Ch       ; DOS terminate program function
    int 21h           ; Exit program

prompt1 db 'Enter first digit: $'    ; Prompt message for first digit
prompt2 db 'Enter second digit: $'   ; Prompt message for second digit
msg_equal db 'Numbers are equal$', 0
msg_not_equal db 'Numbers are not equal$', 0
newline db 0Dh, 0Ah, '$'             ; Newline character (carriage return + line feed)
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                        