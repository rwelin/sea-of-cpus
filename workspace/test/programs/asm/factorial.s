    mova    stack
    mova    recurse
    mova    factorial
    movr    r1  4   ; the factorial value to be calculated
    nop
    nop
    nop
    nop
    nop
    movra   r15     ; stack pointer
    movra   r17     ; recurse label
    movra   r16     ; factorial label
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call    r18 r16
    nop
    nop
    nop
    nop
    nop
    nop

end:
    J   end
    nop
    nop
    nop
    nop
    nop
    nop

factorial:
    subr    r1  1   ; N-1
    movrr   r2  r1  ; store N
    addr    r15 1   ; increment stack pointer
    strr    r15 r18 ; push return address
    nop
    nop
    nop
    nop
    nop
    bnz     r1  r17 ; N != 0 -> recurse
    nop
    nop
    nop
    nop
    nop
    nop
base_case:
    subr    r15 1   ; decrement stack pointer
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    movr    r0  1   ; return 1
    ldrr    r15 r18 ; pop return address
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    br      0   r18
    nop
    nop
    nop
    nop
    nop 
    nop
recurse:
    addr    r15 1   ; increment stack pointer
    strr    r15 r2  ; push parameter N
    nop
    nop
    call    r18 r16 ; recurse to factorial
    nop
    nop
    nop
    nop
    nop
    nop
return:
    subr    r15 1   ; decrement stack pointer for parameter
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    subr    r15 1   ; decrement stack pointer for return address
    mulrm   r0 r15  ; multiply return value with parameter N
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldrr    r15 r18 ; pop return address
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    br      0   r18
    nop
    nop
    nop
    nop
    nop
    nop


stack:
    nop
