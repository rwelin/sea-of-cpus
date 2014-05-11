
    mova    as
    mova    bs
    movr    r0  6
    movr    r6  loop

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

setup:
    ldrr    r1  r2
    ldrr    r3  r4
    addr    r2  1
    addr    r4  1

    nop
    nop
    nop

loop:

    nop
    nop
    nop
    nop

    bnzd    r0  r6

    ldrr    r1  r2
    ldrr    r3  r4
    addr    r2  1
    addr    r4  1

    mac     r3  r1
    nop

teardown:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    mac     r3  r1
    
end:
    J       end
    nop
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
    -2
    6
    -1
    5
    -1
    1
    -3
