.MODEL SMALL

.STACK

.DATA
M1 DB 'SEARCH FAILS $'
M2 DB 'SEARCH IS SUCCESSFUL$'
NO DW 8            ; Number of elements in the array
A DW 1,2,3,4,5,6,7,8  ; Array elements
KEY DW 8           ; The key to search for (8 in this case)

.CODE
START:
    MOV AX,@DATA   ; Set up data segment
    MOV DS,AX

    MOV SI,0       ; Initialize low pointer (SI) to 0
    MOV DI,NO      ; Set high pointer (DI) to number of elements (8)
    DEC DI         ; Decrease by 1 to get the last element index

BINARY_SEARCH:
    CMP SI,DI      ; Compare low pointer (SI) and high pointer (DI)
    JA NOT_FOUND_MSG ; If low > high, key not found

    ; Calculate midpoint
    MOV BX,SI
    ADD BX,DI
    SHR BX,1       ; Midpoint = (low + high) / 2

    ; Compare midpoint element with key
    MOV AX,A[BX]   ; AX = A[mid]
    CMP AX,KEY     ; Compare A[mid] with the key
    JE FOUND_MSG   ; If equal, key is found
    JB ADJUST_LOW  ; If A[mid] < key, search in upper half

    ; Adjust high pointer (search in lower half)
    MOV DI,BX
    DEC DI         ; high = mid - 1
    JMP BINARY_SEARCH

ADJUST_LOW:
    ; Adjust low pointer (search in upper half)
    MOV SI,BX
    INC SI         ; low = mid + 1
    JMP BINARY_SEARCH

NOT_FOUND_MSG:
    LEA DX,M1      ; Load "SEARCH FAILS" message
    JMP DISPLAY

FOUND_MSG:
    LEA DX,M2      ; Load "SEARCH IS SUCCESSFUL" message

DISPLAY:
    MOV AH,9       ; DOS function to display string
    INT 21H

    MOV AH,4CH     ; Terminate program
    INT 21H

END START
