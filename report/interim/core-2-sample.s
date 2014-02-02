;
; Example program that performs multiply-accumulate on two arrays.
;
; (Operand forwarding is assumed.)
;
; r0    loop counter
; r1    address of loop label
; r2    value fetched from memory using r3
; r3    first array pointer
; r4    value fetched from memory using r5
; r5    second array pointer

; <<setup code>>

loop:
    BNZ     r0  r1      ; if r0 = 0 then pc := r1; branch occurs 7 cycles later
    DEC     r0  1       ; r0 := r0 - 1
    LDR     r2  r3      ; r2 := *r3
    LDR     r4  r5      ; r4 := *r5
    MAC     r2  r4      ; acc := acc + r2 * r4
    INC     r3  1       ; r3 := r3 + 1
    INC     r5  1       ; r5 := r5 + 1
    NOOP

; <<tear down code>>