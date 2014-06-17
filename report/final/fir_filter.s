    mova    res
    mova    0
    movrf   r0  0       ; read from fifo
    nop
    nop
    nop
    nop
    nop
    movra   r3          ; r3 := res
    datam   9           ; set data size
    datao   0           ; set initial offset
    coefa   cs          ; set coefficient address
    dataa   ds          ; set data address

loop:
    cmac                ; perform multiply-accumulate
    nop
    nop
    nop
    cstr    r0          ; store
    movrf   r0  0       ; read from fifo
    shfta   8           ; shift result by the number of decimal bits
    mova    0
    nop
    J       loop        ; loop indefinitely
    nop
    nop
    nop
    nop
    addr    r3  1       ; increment result pointer
    star    r3          ; store result

cs:                     ; coefficients
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

ds:                     ; data
    0
    0
    0
    0
    0
    0
    0
    0
    0
    0

res:                    ; result
    nop
