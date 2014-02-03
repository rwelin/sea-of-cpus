;
; Example program that performs multiply-accumulate on two arrays. Any code
; except the actual loop is omitted for simplicity.
;
; Explicit operand forwarding is used to perform register indirect memory loads
; with post-increment. The data from the two memory loads is only stored in pipeline
; registers and are explicitly accessed by the MAC operation. The result is a
; fully utilised multiply-accumulate loop that performs two MAC operations in
; eight cycles.
;
; r0    loop counter
; r1    address of loop label
; r3    first array pointer
; r5    second array pointer
;
; m0    first pipeline register after the block RAM output
; m1    second pipeline register after the block RAM output

; <<setup code>>

loop:
    BNZ     r0  r1      ; if r0 = 0 then pc := r1; branch occurs 7 cycles later
    LDR     m1  r3++    ; m1 := *r3++
    LDR     m0  r5++    ; m0 := *r5++
    MAC     m0  m1      ; acc := acc + m0 * m1
    LDR     m1  r3++    ; m1 := *r3++
    LDR     m0  r5++    ; m0 := *r5++
    MAC     m0  m1      ; acc := acc + m0 * m1
    DEC     r0  2       ; r0 := r0 - 2

; <<tear down code>>
