%include "utils.nasm"

section .data
    V dw 5,8,10,13,7,3,-4,3,-1,12
    W dd 2,-1,3,4,-2
    nv equ ($ -V)/2
    nw equ ($ -W)/4

section .text
    global _start
    extern proc

_start:
    push dword nw
    push dword nv
    push W
    push V

    call proc

    printb al       ;richiede di restituire un byte

    exit 0

