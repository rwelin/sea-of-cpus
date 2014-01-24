    MOV     loop
    MOVAR   r1
    MOV     0

loop:
    DEC     r0  1   ; r0 := r0 - 1
    BNZ     p0  r1  ; if p0 = 0 then pc := r1
    ILDR    m1  r3  ; m1 := *++r3
    ILDR    m0  r5  ; m0 := *++r5
    NOP
    NOP
    NOP
    MAC     m0  m1  ; acc := acc + m0 * m1
