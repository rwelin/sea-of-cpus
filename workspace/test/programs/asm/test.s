    MOVA    2
    MOVA    loop
    MOVA    0
    NOP
    NOP
    NOP
    NOP
    NOP
    MOVRA   R0
    MOVRA   R1
    MOVRA   R2
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
loop:
    SUBR    1   R0
    ADDR    2   R2
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    BNZ     R1  R0
    MOVAR   R2
