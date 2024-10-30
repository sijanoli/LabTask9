org 100h      ; Origin, necessary for .COM file

    ; Print prompt to ask the user to enter a single digit
    mov ah, 09h
    lea dx, prompt_msg
    int 21h        ; DOS interrupt to print the message

    ; Read input from the user (single digit)
    mov ah, 01h
    int 21h        ; DOS interrupt to take input (character stored in AL)

    ; Convert ASCII digit to integer
    sub al, '0'    ; Convert ASCII to actual number

    ; Check if the number is odd or even
    mov ah, 00h    ; Clear AH to use AX
    mov bl, 02     ; BL = 2 (to divide the number)
    div bl         ; AL = AL / BL, remainder in AH

    cmp ah, 00h    ; Check if remainder is 0 (even)
    je even        ; If zero, jump to even section

odd:
    ; Print "odd" message
    mov ah, 09h
    lea dx, odd_msg
    int 21h
    jmp done       ; Jump to end

even:
    ; Print "even" message
    mov ah, 09h
    lea dx, even_msg
    int 21h

done:
    ; Exit the program
    mov ah, 4Ch    ; DOS interrupt to terminate the program
    int 21h

prompt_msg db 'Enter a single digit number: $'
even_msg db 'The number is even.$'
odd_msg  db 'The number is odd.$'
