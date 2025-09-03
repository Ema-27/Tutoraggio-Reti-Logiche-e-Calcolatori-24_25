%include "utils.nasm"

section .data
   
    W dw -5, -12, 6, 2, 1, -3    ;16bit
    V dd 3, -1, -2, 6, -12, 5   ;32bit
    n equ ($ -V)/4

section .text
    global _start 
    extern proc

_start:
    push n
    push W
    push V

    call proc

    printw ax

    exit 0


