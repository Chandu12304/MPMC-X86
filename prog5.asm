.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "TIME IS: $"          ; Message for displaying time
    MSG2 DB 10,13,"DATE IS: 02 08/10/2024$"  ; Predefined date string

.CODE
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

    ; Display "DATE IS: 08/10/2024"
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

; Procedure to display a 2-digit number (e.g., hours, minutes, seconds)
DISPLAY_NUMBER PROC
    AAM                       ; Convert number in AL to two digits: AH = tens, AL = units
    ADD AX, 3030H             ; Convert to ASCII
    MOV DX, AX
    XCHG DH, DL               ; Swap the digits to display the tens first
    MOV AH, 02H
    INT 21H                   ; Display tens digit
    MOV DL, DH
    MOV AH, 02H
    INT 21H                   ; Display units digit
    RET
DISPLAY_NUMBER ENDP

END
