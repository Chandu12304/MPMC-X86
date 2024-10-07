.MODEL SMALL
.STACK 100H

.DATA
    N DW 6             ; n = 6
    R DW 2             ; r = 2
    MSG DB 'NCR Calculated$'
    NCR DW 0           ; Result will be stored here

.CODE
MAIN:
    MOV AX, @DATA      ; Initialize data segment
    MOV DS, AX
    
    MOV AX, N          ; Load n into AX
    MOV BX, R          ; Load r into BX
    
    CALL NCR_PROC      ; Call NCR procedure to calculate nCr
    
    ; Code to display MSG
    MOV DX, OFFSET MSG
    MOV AH, 09H        ; DOS interrupt to print NCR
    INT 21H
    
    MOV AH, 4CH        ; Terminate the program
    INT 21H

; Recursive procedure to compute nCr
NCR_PROC PROC
    CMP AX, BX         ; Compare n and r
    JZ N1              ; If n == r, result is 1
    CMP BX, 0          ; If r == 0, result is 1
    JZ N1
    CMP BX, 1          ; If r == 1
    JZ N2              ; Result is n

    PUSH AX            ; Save n
    PUSH BX            ; Save r

    ; First recursive call: (n-1)Cr
    DEC AX             ; n = n - 1
    CALL NCR_PROC      ; Call NCR_PROC with (n-1)Cr
    MOV CX, NCR        ; Store result of (n-1)Cr in CX
    
    POP BX             ; Restore r
    POP AX             ; Restore n

    PUSH AX            ; Save n
    PUSH BX            ; Save r

    ; Second recursive call: (n-1)C(r-1)
    DEC AX             ; n = n - 1
    DEC BX             ; r = r - 1
    CALL NCR_PROC      ; Call NCR_PROC with (n-1)C(r-1)
    ADD CX, NCR        ; Add result of (n-1)Cr and (n-1)C(r-1)

    MOV NCR, CX        ; Store final result in NCR
    
    POP BX             ; Restore r
    POP AX             ; Restore n
    RET

N1: MOV NCR, 1         ; If r == 0 or r == n, result is 1
    RET

N2: MOV NCR, AX        ; If r == 1 or r == n-1, result is n
    RET

NCR_PROC ENDP

END MAIN