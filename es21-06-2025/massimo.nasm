%include "utils.nasm"

section .data
    V dw 1,2,-6,3,-2,4
    n equ ($ -V)/2

section .bss
    ris resw 1

section .text
    global _start
    extern proc

_start:
    push n
    push dword V

    call proc

    mov [ris], ax
    printw word [ris]

    exit 0