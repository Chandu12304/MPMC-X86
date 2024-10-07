.MODEL SMALL
.STACK 100H

.DATA
    ; Array of numbers to sort (using DB)
    NUMS DB 5, 3, 8, 1, 6  ; Array elements (as bytes)
    COUNT DB 5              ; Number of elements in the array (as a byte)
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
    MOV AL, NUMS[SI]     ; Load current element into AL (byte register)
    CMP AL, NUMS[SI+1]   ; Compare it with the next element
    JBE NO_SWAP          ; If current element <= next element, no swap needed
    
    ; Swap the elements if current element > next element
    XCHG AL, NUMS[SI+1]  ; Swap AL with the next element
    MOV NUMS[SI], AL     ; Store the swapped value back in current position
    
NO_SWAP:
    INC SI               ; Move to the next pair of elements (each DB is 1 byte)
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
