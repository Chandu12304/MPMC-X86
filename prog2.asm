.MODEL SMALL
.STACK 100H

.DATA
    A DB 7, 3, 9, 1, 5  ; Array elements (5 elements)
    N DB 5              ; Number of elements in the array
    MSG DB 'Sorted Array: $'

.CODE
START:
    MOV AX, @DATA       ; Initialize data segment
    MOV DS, AX

    ; Display message
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; Bubble sort algorithm
    MOV CX, N           ; CX controls number of passes
    DEC CX              ; (N-1) passes required

SORT_PASS:
    MOV SI, 0           ; SI points to the first element in the array
    MOV BX, CX          ; BX controls the number of comparisons

SORT_COMP:
    MOV AL, A[SI]       ; Load current element (A[SI]) into AL
    CMP AL, A[SI+1]     ; Compare it with the next element (A[SI+1])
    JBE NO_SWAP         ; If A[SI] <= A[SI+1], no swap is needed

    ; Swap the elements
    XCHG AL, A[SI+1]    ; Swap AL with A[SI+1]
    MOV A[SI], AL       ; Store the swapped value in A[SI]

NO_SWAP:
    INC SI              ; Move to the next element
    DEC BX              ; Decrease comparison count
    JNZ SORT_COMP       ; Repeat comparisons for current pass

    LOOP SORT_PASS      ; Repeat the passes until array is sorted

    ; Display sorted array
    MOV CX, N           ; Set CX to the number of elements
    MOV SI, 0           ; Start from the first element

DISPLAY_ARRAY:
    MOV DL, A[SI]       ; Load array element into DL
    ADD DL, 30H         ; Convert number to ASCII
    MOV AH, 02H         ; Function to display character
    INT 21H             ; Display the character
    MOV DL, ' '         ; Display a space
    INT 21H

    INC SI              ; Move to the next element
    LOOP DISPLAY_ARRAY  ; Repeat until all elements are displayed

    ; Exit program
    MOV AH, 4CH
    INT 21H

END START
