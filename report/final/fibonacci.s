    mova    stack
    mova    base_case
    mova    fibonacci
    movr    r1  10  ; the fibonacci value to be calculated
    ...
    movra   r15     ; stack pointer
    movra   r17     ; recurse label
    movra   r16     ; fibonacci label
    ...
    call    r18 r16 ; call fibonacci function
    ...

end:
    J   end
    ...

fibonacci:
    subr    r1  1   ; N-1
    addr    r15 1   ; increment stack pointer
    strr    r15 r18 ; push return address
    nop
    bz      r1  r17 ; N == 0 -> base case
    ...
    bz      r1  r17 ; N-1 == 0 -> base case
    ...
recurse:
    addr    r15 1   ; increment stack pointer
    strr    r15 r1  ; push N-1
    call    r18 r16 ; recurse to fibonacci
    ...
    subr    r15 1   ; decrement stackpointer
    ...
    ldrr    r15 r1  ; pop N-1
    addr    r15 1   ; increment stack pointer
    strr    r15 r0  ; push fib(N-1)
    nop
    subr    r1  1   ; N-2
    nop
    call    r18 r16 ; recurse to fibonacci
    ...
return:
    subr    r15 1   ; decrement stack pointer for fib(N-1)
    ...
    subr    r15 1   ; decrement stack pointer for return address
    addrm   r0  r15 ; fib(N-2)+fib(N-1)
    ...
    ldrr    r15 r18 ; pop return address
    ...
    br      0   r18
    ...
base_case:
    subr    r15 1   ; decrement stack pointer
    ...
    movr    r0  1   ; return 1
    ldrr    r15 r18 ; pop return address
    ...
    br      0   r18
    ...

stack:
    nop
