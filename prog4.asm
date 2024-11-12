.MODEL SMALL
.STACK 100H  ; Define stack size

.DATA
    N DW 6            ; Store n (6)
    R DW 2            ; Store r (2)
    NCR DW 0          ; Store result of nCr (initially 0)

.CODE
MAIN:
    MOV AX, @DATA     ; Initialize data segment
    MOV DS, AX        ; Set DS register to point to the data segment

    MOV AX, N         ; Load value of N into AX
    MOV BX, R         ; Load value of R into BX

    CALL NCR_PROC     ; Call the procedure to calculate nCr

    MOV AH, 4CH       ; DOS interrupt to terminate the program
    INT 21H

; Recursive procedure to calculate nCr
NCR_PROC PROC
    CMP AX, BX        ; Compare n and r
    JZ N1             ; If n == r, result is 1 (jump to N1)

    CMP BX, 0         ; If r == 0
    JZ N1             ; If yes, result is 1 (jump to N1)

    CMP BX, 1         ; If r == 1
    JZ N2             ; If yes, result is n (jump to N2)

    MOV CX, AX        ; Save n into CX
    DEC CX            ; Decrement CX (n-1)
    CMP CX, BX        ; Compare (n-1) with r
    JZ N2             ; If (n-1) == r, result is n (jump to N2)

    ; Recursive calculation for nCr using the formula: nCr = (n-1)Cr + (n-1)C(r-1)
    PUSH AX           ; Save n
    PUSH BX           ; Save r
    DEC AX            ; Decrement n (n-1)
    CALL NCR_PROC     ; Recursive call for (n-1)Cr
    POP BX            ; Restore r
    POP AX            ; Restore n

    MOV CX, NCR       ; Store result of (n-1)Cr in CX

    PUSH AX           ; Save n
    PUSH BX           ; Save r
    DEC AX            ; Decrement n (n-1)
    DEC BX            ; Decrement r (r-1)
    CALL NCR_PROC     ; Recursive call for (n-1)C(r-1)
    POP BX            ; Restore r
    POP AX            ; Restore n

    ADD CX, NCR       ; Add the result of (n-1)C(r-1) to (n-1)Cr

LAST:
    MOV NCR, CX       ; Store final result in NCR
    RET

N1:
    ADD NCR, 1        ; If n == r or r == 0, result is 1
    RET

N2:
    ADD NCR, AX       ; If r == 1 or r == n-1, result is n
    RET

NCR_PROC ENDP

END MAIN
