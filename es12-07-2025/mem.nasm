%include "utils.nasm"

section .data
    V dw 5,-1,4
    n equ ($ -V)/2
    W dw 2,7,3

section .text
    global _start
    extern proc

_start:
    push n
    push W 
    push V

    call proc

    add esp,12

    printw ax

    exit 0