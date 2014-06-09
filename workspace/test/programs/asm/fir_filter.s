
    mova    res
    mova    0
    movr    r1  loop
    movr    r2  10
    movr    r0  0
    datam   9
    coefa   cs
    dataa   ds
    datao   0
    nop
    movra   r3

loop:
    cmac
    nop
    nop
    bnzd    r1  r2
    cstr    r0
    nop
    nop
    nop
    nop
    nop
    addr    r3  1
    sta     r3
    

end:
    J   end
    nop
    nop
    nop
    nop
    nop
    nop
    nop

cs:
    1
    2
    1
    0
    -1
    -2
    -1
    0
    1
    2

ds:
    1
    2
    3
    4
    5
    6
    7
    8
    1
    2

res:
    nop
