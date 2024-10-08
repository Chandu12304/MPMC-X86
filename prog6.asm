;6a
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

;6b
AREA    PROG2, CODE, READONLY   ; Define a code area (PROG2)
        ENTRY                           ; Mark the entry point of the program

START
        LDR     R1, =0X00000006         ; Load the value 6 into R1
        LDR     R2, =0X00000001         ; Load the value 1 into R2

        ADD     R5, R1, R2              ; Add R1 and R2, store result in R5 (R5 = 6 + 1 = 7)
        SUB     R6, R1, R2              ; Subtract R2 from R1, store result in R6 (R6 = 6 - 1 = 5)
        MUL     R7, R1, R2              ; Multiply R1 by R2, store result in R7 (R7 = 6 * 1 = 6)

STOP
        B       STOP                    ; Infinite loop to stop the program

        END                             ; End of the program

;6c
AREA    PROG2, CODE, READONLY   ; Define a code area (PROG2)
        ENTRY                           ; Mark the entry point of the program

START
        LDR     R1, =0X00000003         ; Load the value 3 into R1 (Binary: 00000011)
        LDR     R2, =0X00000007         ; Load the value 7 into R2 (Binary: 00000111)

        AND     R3, R1, R2              ; Logical AND between R1 and R2, store result in R3
                                        ; R3 = 00000011 AND 00000111 = 00000011 (0x3)

        ORR     R4, R1, R2              ; Logical OR between R1 and R2, store result in R4
                                        ; R4 = 00000011 OR 00000111 = 00000111 (0x7)

        EOR     R5, R1, R2              ; Logical XOR between R1 and R2, store result in R5
                                        ; R5 = 00000011 XOR 00000111 = 00000100 (0x4)

STOP
        B       STOP                    ; Infinite loop to stop the program

        END                             ; End of the program