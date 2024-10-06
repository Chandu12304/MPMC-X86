.MODEL SMALL
.STACK 100H

.DATA
    ; Array of numbers to sort
    NUMS DW 5, 3, 8, 1, 6  ; Array elements
    COUNT DW 5              ; Number of elements in the array
    MSG DB 'Sorting complete$', 0  ; Message to display after sorting

.CODE
START:
    ; Initialize the data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Start Bubble Sort
    MOV CX, COUNT        ; CX holds the number of elements - outer loop counter
    DEC CX               ; CX = COUNT - 1 (we only need COUNT-1 passes)
    
OUTER_LOOP:
    MOV SI, 0            ; SI is the array index
    MOV BX, CX           ; BX holds the number of comparisons in each pass
    
INNER_LOOP:
    MOV AX, NUMS[SI]     ; Load current element into AX
    CMP AX, NUMS[SI+2]   ; Compare it with the next element
    JBE NO_SWAP          ; If current element <= next element, no swap needed
    
    ; Swap the elements if current element > next element
    XCHG AX, NUMS[SI+2]  ; Swap AX with the next element
    MOV NUMS[SI], AX     ; Store the swapped value back in current position
    
NO_SWAP:
    ADD SI, 2            ; Move to the next pair of elements (each DW is 2 bytes)
    DEC BX               ; Decrease comparison count
    JNZ INNER_LOOP       ; If BX != 0, repeat comparisons
    
    DEC CX               ; Decrease outer loop counter
    JNZ OUTER_LOOP       ; If CX != 0, repeat passes

    ; Display "Sorting complete" message
    MOV AH, 09H          ; DOS interrupt to print string
    LEA DX, MSG          ; Load address of message into DX
    INT 21H              ; Print the message

    ; End program
    MOV AH, 4CH          ; DOS interrupt to terminate program
    INT 21H

END START
