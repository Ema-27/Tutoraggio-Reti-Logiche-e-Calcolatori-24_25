%include "utils.nasm"

section .data
    V dw 3,7,3,-1,5,6,-1,2,3,4,2,1,-1,10,11,1
    n equ ($ -V)/2
    k equ 10
    
section .text
    global _start
    extern proc

_start:
    push n
    push V
    push k

    call proc

    printb al
    
    exit 0
