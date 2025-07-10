%include "utils.nasm"

section .data
    v dw -2,3,7,6,2,-10,-3,5
    n equ ($ -v)/2

section .text
    global _start
    extern proc

_start:
    push n
    push v

    call proc

    printw ax
        
    exit 0