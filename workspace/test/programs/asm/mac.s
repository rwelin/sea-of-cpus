   
    movr    8   r0
    movr    loop    r6    
    mova    as
    mova    bs
    nop
    nop
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
    nop
    nop

loop:
    ldrr    r2  r1
    ldrr    r4  r3
    subr    1   r0
    addr    1   r2
    addr    1   r4

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    mac     r1  r3

    nop
    nop
    nop
    nop
    nop
    nop
    nop

    bnz     r6  r0

    nop
    nop
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
    0
    -1
    0
    1
    0
    -1
    0
 
