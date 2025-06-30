%include "utils.nasm"

section .data
    V dw 5,18,3,6,4,1,-3,1,4,2
    n equ ($ -V)/2

section .text
    global _start
    extern proc

_start:
    push n 
    push dword V

    call proc

    printd eax

    exit 0

