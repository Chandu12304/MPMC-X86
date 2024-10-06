.MODEL SMALL

.STACK 100H

.DATA
    A DW 5,2,8,4,1       ; Array to be sorted
    NO DW 5              ; Number of elements in the array
    MSG DB 'Array is sorted$', 0

.CODE
    ; Initialize program
    MOV AX, @DATA        ; Load the data segment
    MOV DS, AX

    ; Start sorting the array
START_SORT:
    MOV CX, NO           ; CX will control the number of passes (NO - 1)
    DEC CX               ; After (NO - 1) passes, the array will be sorted

PASS_LOOP:
    MOV SI, 0            ; SI points to the first array element
    MOV BX, CX           ; BX controls the number of comparisons in each pass

COMP_LOOP:
    MOV AX, A[SI]        ; Load the current element (A[SI]) into AX
    CMP AX, A[SI+2]      ; Compare it with the next element (A[SI+1])
    JBE NO_SWAP          ; If A[SI] <= A[SI+1], no swap needed

    ; Swap the elements if A[SI] > A[SI+1]
    XCHG AX, A[SI+2]     ; Swap A[SI] and A[SI+1]
    MOV A[SI], AX        ; Put the swapped value back in A[SI]

NO_SWAP:
    ADD SI, 2            ; Move to the next element (each DW is 2 bytes)
    DEC BX               ; Decrease the comparison count
    JNZ COMP_LOOP        ; Repeat comparison until BX = 0

    LOOP PASS_LOOP       ; Repeat passes until the array is sorted

    ; Display message "Array is sorted"
    MOV AH, 09H          ; DOS interrupt for displaying strings
    LEA DX, MSG          ; Load the address of the message
    INT 21H              ; Call interrupt to print the message

    ; End program
    MOV AH, 4CH          ; DOS interrupt to terminate the program
    INT 21H

END START_SORT
