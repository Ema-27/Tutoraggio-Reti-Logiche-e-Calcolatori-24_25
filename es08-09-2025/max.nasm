%include "utils.nasm"

section .data
    V dw -2,3,7,6,2,-10,-3,5
    n equ ($ -V)/2

section .text
    global _start
    extern proc

_start:
    push n
    push V

    call proc

    printw ax

    exit 0