    MOVR   2    R0
    MOVR   loop R1
    MOVR   0    R2
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
