%include "utils.nasm"

section .data
    v dw 2,6,9,4,10,9,1,2,4,11
    w dw 8,3,6,5,9,5,3,2,10,12
    n equ ($ -w)/2

section .text
    global _start
    extern proc

_start:
    push n
    push w
    push v
    call proc

    xor esi, esi
ciclo:
    cmp esi, n
    jge end
    printw word [w+esi*2]
    inc esi
    jmp ciclo
end:
    exit 0

