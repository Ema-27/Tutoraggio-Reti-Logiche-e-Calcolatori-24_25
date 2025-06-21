%include "utils.nasm"

section .data
    V dw 2, -10 , 13, 5, 0, 1, -9, 3
    lenV equ ($ -V)/2
    d dw 7

section .bss
    res resw 1

section .text
    global _start
    extern proc

_start: 

    push dword [d]
    push lenV
    push dword V
    call proc
    add esp, 12

    mov [res], ax
    printw word [res]
    exit 0