.MODEL SMALL
.STACK 100H

.DATA
N DW 7                ; Value of n (nCr calculation)
R DW 3                ; Value of r (nCr calculation)
NCR DW 0              ; Result of nCr, initially 0

.CODE
MOV AX, @DATA         ; Initialize data segment
MOV DS, AX

MOV AX, N             ; Load n into AX register
MOV BX, R             ; Load r into BX register
CALL NCR_PROC         ; Call the nCr calculation procedure

MOV AH, 4CH           ; DOS function to terminate program
INT 21H

ncr_proc PROC
    CMP AX, BX        ; Compare n (AX) and r (BX)
    JZ N1             ; If n == r, set nCr = 1 (nCr for n == r is always 1)

    CMP BX, 0         ; Check if r = 0
    JZ N1             ; If r == 0, set nCr = 1 (nCr for r = 0 is always 1)

    CMP BX, 1         ; Check if r = 1
    JZ N2             ; If r == 1, set nCr = n (nCr for r = 1 is n)

    MOV CX, AX        ; Store n in CX for further checks
    DEC CX            ; Compute n - 1
    CMP CX, BX        ; Check if r = n - 1
    JZ N2             ; If true, set nCr = n (nCr for r = n-1 is n)

    PUSH AX           ; Save current n (AX) on stack
    PUSH BX           ; Save current r (BX) on stack
    DEC AX            ; Compute n - 1 for recursive call
    CALL ncr_proc     ; Call nCr(n-1, r)

    POP BX            ; Restore r from stack
    POP AX            ; Restore n from stack

    DEC AX            ; Compute n - 1 for the next recursive call
    DEC BX            ; Compute r - 1 for the next recursive call
    CALL ncr_proc     ; Call nCr(n-1, r-1)

    JMP LAST          ; Skip over the specific case handling to the end of procedure

n1:
    ADD NCR, 1        ; If n == r or r == 0, nCr = 1
    RET

n2:
    ADD NCR, AX       ; If r = 1 or r = n-1, nCr = n
    RET

LAST:
    RET               ; End of nCr procedure, return to caller

ncr_proc ENDP
END
