%include "utils.nasm"

section .data
    V dw 17,4,19,10,23,1,6,25
    W dw 3,7,10
    nv equ ($ -V)/2
    nw equ ($ -W)/2

section .text
    global _start
    extern proc

_start:
    push dword nw
    push dword nv
    push W
    push V

    call proc

    ;stampo i valori di V:
    xor esi, esi ;indice 

.loop:
    cmp esi, nv
    jge .end
    mov ax, [V + esi*2]
    printw ax
    inc esi
    jmp .loop

.end:
    exit 0