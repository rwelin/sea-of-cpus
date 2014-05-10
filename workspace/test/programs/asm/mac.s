
    mova    as
    mova    bs
    movr    8   r0
    movr    loop    r6
    nop
    nop
    nop
    nop
    movra   r2
    movra   r4
    mova    0
    nop
    nop
    nop
    nop

loop:
    subr    1   r0
    ldrr    r2  r1
    ldrr    r4  r3
    addr    1   r2
    addr    1   r4

    nop
    nop
    nop
    nop

    bnz     r6  r0
    mac     r1  r3

    nop
    nop
    nop
    nop
    nop

end:
    J end
    nop
    nop
    nop
    nop
    nop
    nop

as:
    1
    2
    3
    4
    5
    6
    7
    8
bs:
    1
    -1
    1
    -1
    1
    -1
    1
    -1
