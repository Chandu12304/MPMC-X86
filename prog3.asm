.MODEL SMALL
.STACK 100H

.DATA
STR DB " MADAME$"          ; The original string with a '$' sign to indicate the end
LEN EQU $-1-STR          ; Calculate the length of the string excluding the '$'
RSTR DB 10 DUP('$')      ; Buffer to hold the reversed string, initialized with '$'
MSG DB 10,13," REVERSE STRING IS: $"   ; Message to display the reversed string
MSG1 DB 10,13," STRING IS A PALINDROME $"   ; Message for palindrome confirmation
MSG2 DB 10,13," STRING IS NOT A PALINDROME $" ; Message if the string is not a palindrome

.CODE
MAIN:
    ; Initialize data segment and extra segment for string manipulation
    MOV AX, @DATA
    MOV DS, AX

    ; Initialize SI to point to the original string (STR)
    LEA SI, STR
    
    ; Initialize DI to point to the reversed string buffer (RSTR)
    LEA DI, RSTR
    
    ; Move DI to the last character position in the reversed string buffer
    ADD DI, LEN-1
    
    ; Set CX to the length of the string (number of characters to reverse)
    MOV CX, LEN

    ; Loop to reverse the string
REVERSE_LOOP:
    MOV AL, [SI]        ; Load character from original string
    MOV [DI], AL        ; Store it in the reversed string buffer
    INC SI              ; Move to the next character in the original string
    DEC DI              ; Move to the previous position in the reversed string
    LOOP REVERSE_LOOP   ; Repeat until the string is fully reversed

    ; Display the original string
    LEA DX, STR
    MOV AH, 09H
    INT 21H

    ; Display the message: " REVERSE STRING IS: "
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; Display the reversed string
    LEA DX, RSTR
    MOV AH, 09H
    INT 21H

    ; Compare the original string with the reversed string to check for palindrome
    LEA SI, STR         ; SI points to the original string
    LEA DI, RSTR        ; DI points to the reversed string
    MOV CX, LEN         ; CX holds the number of characters to compare
    REPE CMPSB          ; Compare strings byte by byte

    ; If the strings are not equal, jump to the "NOTPAL" label
    JNE NOTPAL

    ; If the strings are equal, display the palindrome message
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    JMP EXIT

NOTPAL:
    ; If not a palindrome, display the "not palindrome" message
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

EXIT:
    ; Terminate the program
    MOV AH, 4CH
    INT 21H

END MAIN
