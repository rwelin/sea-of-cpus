;
; Example program that performs multiply-accumulate on two arrays.
;
; The example uses software pipelining to interleave instructions and create a
; very well utilised multiply-accumulate loop. Two MAC operations are performed
; every iteration in order to prevent the use of NOOPs. The two MACs are marked
; with #1 and #2 in the comments. Any code except the actual loop is omitted for
; simplicity.
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
    ILDR    r2  r3      ; #1; r2 := *++r3
    ILDR    r4  r5      ; #1; r4 := *++r5
    MAC     r2  r4      ; #2; acc := acc + r2 * r4; r2, r4 from previous iteration
    ILDR    r2  r3      ; #2; r2 := *++r3; r2 used in next iteration
    ILDR    r4  r5      ; #2; r4 := *++r4; r4 used in next iteration
    MAC     r2  r4      ; #1; acc := acc + r2 * r4
    DEC     r0  2       ; r0 := r0 - 2

; <<tear down code>>
