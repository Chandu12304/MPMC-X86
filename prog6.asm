AREA    PROG1, CODE, READONLY   ; Define a code area
        ENTRY                           ; Mark the entry point of the program

START
        LDR     R2, =0X05               ; Load the value 5 into R2 (number of elements to copy)
        LDR     R0, =SOURCE             ; Load the address of SOURCE into R0
        LDR     R1, =DEST               ; Load the address of DEST into R1

UP
        LDR     R3, [R0], #4            ; Load value from SOURCE (R0) into R3 and increment R0 by 4
        STR     R3, [R1], #4            ; Store value from R3 into DEST (R1) and increment R1 by 4
        SUBS    R2, #1                  ; Subtract 1 from R2 and update flags
        BNE     UP                      ; If R2 is not zero, branch to UP and repeat

STOP
        B       STOP                    ; Infinite loop to stop the program

        AREA    SOURCE, DATA, READONLY   ; Define a data area for SOURCE
        DCD     0X10, 0X20, 0X30, 0X40, 0X50  ; Data to be copied

        AREA    DEST, DATA, READWRITE    ; Define a data area for DEST (empty)

        END                             ; End of the program