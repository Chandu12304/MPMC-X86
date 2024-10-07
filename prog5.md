Here is an explanation of each line in the code :

.MODEL SMALL
.STACK 100H

.MODEL SMALL: Specifies the memory model. In this case, the small model is used where code and data fit within a 64KB segment each.

.STACK 100H: Allocates 256 bytes (100H in hex) for the stack, which is used to store return addresses and local variables during function calls.


.DATA
    MSG1 DB "TIME IS: $"
    MSG2 DB 10,13,"DATE IS: 08/10/2024$"

.DATA: Defines the beginning of the data segment, where variables and strings are stored.

MSG1 DB "TIME IS: $": Defines a string "TIME IS: " that will be displayed. The $ symbol marks the end of the string for DOS interrupt 21h (09H service).

MSG2 DB 10,13,"DATE IS: 08/10/2024$": Defines a string for the date "08/10/2024" and includes 10 (newline LF) and 13 (carriage return CR) at the beginning for formatting. The $ ends the string.


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

.CODE: Starts the code segment where the instructions are written.

MAIN PROC: Defines the start of the MAIN procedure (the main function).

MOV AX, @DATA: Moves the data segment address into register AX. This prepares to load the DS register.

MOV DS, AX: Moves the data segment address from AX into DS. The DS register now points to the data segment, allowing access to the strings defined earlier.


LEA DX, MSG1
    MOV AH, 09H
    INT 21H

LEA DX, MSG1: Loads the address of the MSG1 string into register DX.

MOV AH, 09H: Sets AH to 09H, which is the DOS interrupt function to display a string on the screen.

INT 21H: Calls the DOS interrupt 21h to display the string at the address in DX ("TIME IS: ").


MOV AH, 2CH
    INT 21H

MOV AH, 2CH: Sets AH to 2CH, which is the DOS interrupt function to get the current system time (hours, minutes, and seconds).

INT 21H: Calls the DOS interrupt 21h to get the time, which is returned in registers CH (hours), CL (minutes), and DH (seconds).


MOV AL, CH
    CALL DISPLAY_NUMBER

MOV AL, CH: Moves the value of the hours (CH) into register AL.

CALL DISPLAY_NUMBER: Calls the DISPLAY_NUMBER procedure to display the hours as a 2-digit number.


MOV DL, ':'
    MOV AH, 02H
    INT 21H

MOV DL, ':': Moves the ASCII value for the colon (:) into register DL.

MOV AH, 02H: Sets AH to 02H, which is the DOS interrupt function to display a single character on the screen.

INT 21H: Calls the DOS interrupt 21h to display the colon.


MOV AL, CL
    CALL DISPLAY_NUMBER

MOV AL, CL: Moves the value of the minutes (CL) into register AL.

CALL DISPLAY_NUMBER: Calls the DISPLAY_NUMBER procedure to display the minutes as a 2-digit number.


MOV DL, ':'
    MOV AH, 02H
    INT 21H

Similar to the previous colon display. It prints another colon to separate the minutes and seconds.


MOV AL, DH
    CALL DISPLAY_NUMBER

MOV AL, DH: Moves the value of the seconds (DH) into register AL.

CALL DISPLAY_NUMBER: Calls the DISPLAY_NUMBER procedure to display the seconds as a 2-digit number.


MOV AH, 02H
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

MOV AH, 02H: Prepares to output a single character.

MOV DL, 10: Moves the ASCII code for a newline (LF) into DL.

INT 21H: Calls DOS interrupt to display the newline.

MOV DL, 13: Moves the ASCII code for a carriage return (CR) into DL.

INT 21H: Calls DOS interrupt to move the cursor to the beginning of the next line.


LEA DX, MSG2
    MOV AH, 09H
    INT 21H

LEA DX, MSG2: Loads the address of the MSG2 string ("DATE IS: 08/10/2024") into register DX.

MOV AH, 09H: Prepares to display the string.

INT 21H: Displays the date string.


MOV AH, 4CH
    INT 21H

MOV AH, 4CH: Prepares to exit the program by setting AH to 4CH, the DOS interrupt for program termination.

INT 21H: Calls DOS to terminate the program and return control to the operating system.


Displaying a 2-digit number

DISPLAY_NUMBER PROC
    PUSH AX
    AAM
    ADD AH, 30H
    ADD AL, 30H
    MOV DL, AH
    MOV AH, 02H
    INT 21H
    MOV DL, AL
    INT 21H
    POP AX
    RET
DISPLAY_NUMBER ENDP

PUSH AX: Saves the AX register on the stack because it will be modified in this procedure.

AAM: Converts the binary value in AL into two decimal digits (in AH and AL).

ADD AH, 30H: Converts the tens digit in AH to its ASCII equivalent.

ADD AL, 30H: Converts the units digit in AL to its ASCII equivalent.

MOV DL, AH: Moves the tens digit into DL for display.

MOV AH, 02H: Prepares to display the tens digit.

INT 21H: Displays the tens digit.

MOV DL, AL: Moves the units digit into DL for display.

INT 21H: Displays the units digit.

POP AX: Restores the original value of AX from the stack.

RET: Returns from the DISPLAY_NUMBER procedure.


END MAIN

Marks the end of the program. The MAIN procedure is the entry point of the program.


