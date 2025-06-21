%include "utils.nasm"

section .data
    V dw 2,6,9,4,10,9,1,2,4,11
    W dw 8,3,6,5,8,5,3,2,10,2
    n equ ($ -V)/2

section .bss
    T resw 2*n

section .text
    global _start
    extern proc

_start:
    push dword n
    push T 
    push W 
    push V

    call proc

    xor esi, esi    ;indice
.loop:
    cmp esi, n
    jge .end
    mov ax, [T + esi*2]
    printw ax
    inc esi
    jmp .loop

.end:
    exit 0