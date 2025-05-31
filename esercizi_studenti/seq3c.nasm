%include "utils.nasm"

section .data
    a dw -3, -5, 20, -2
    lenA equ ($ -a)/2
    k dw 8

section .bss
    res resw 1

section .text
    global _start
    extern proc

_start:
    ;movzx eax, word [b]   ; estendi a 32 bit per push
    push dword [k] 
    push lenA
    ;movzx eax, word [a]
    push dword a
    call proc
    add esp, 12

    mov [res], ax         ; salva il risultato a 16 bit
    printw word [res]
    exit 0