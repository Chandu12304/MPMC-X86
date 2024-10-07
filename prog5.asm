.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "TIME IS: $"
    MSG2 DB 10,13,"DATE IS: 08/10/2024$"  ; Predefined date string

.CODE
MAIN PROC
    MOV AX, @DATA        ; Initialize the data segment
    MOV DS, AX
    
    ; Display "TIME IS: "
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Get and display the current time
    MOV AH, 2CH           ; DOS interrupt to get system time
    INT 21H               ; Time is returned in CH = hours, CL = minutes, DH = seconds
    
    ; Display hours
    MOV AL, CH
    CALL DISPLAY_NUMBER

    ; Display colon
    MOV DL, ':'
    MOV AH, 02H
    INT 21H

    ; Display minutes
    MOV AL, CL
    CALL DISPLAY_NUMBER

    ; Display colon
    MOV DL, ':'
    MOV AH, 02H
    INT 21H

    ; Display seconds
    MOV AL, DH
    CALL DISPLAY_NUMBER

    ; New line
    MOV AH, 02H
    MOV DL, 10             ; ASCII code for newline (LF)
    INT 21H
    MOV DL, 13             ; ASCII code for carriage return (CR)
    INT 21H

    ; Display "DATE IS: 08/10/2024"
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; Procedure to display a 2-digit number (e.g., hours, minutes, seconds)
DISPLAY_NUMBER PROC
    PUSH AX
    AAM                       ; Convert number in AL to two digits: AH = tens, AL = units
    ADD AH, 30H               ; Convert to ASCII
    ADD AL, 30H
    MOV DL, AH                ; Display tens digit
    MOV AH, 02H
    INT 21H
    MOV DL, AL                ; Display units digit
    INT 21H
    POP AX
    RET
DISPLAY_NUMBER ENDP

END MAIN
