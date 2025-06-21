;Scrivere una procedura Assembly che riceve un vettore di word A e un intero k
;La procedura verifica se nell'array è presente una sequenza di 3 elementi contigui di
;segno alterno la cui somma sia maggiore di k.
;In tal caso la procedura restituirà 1, altrimenti 0.

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

    push dword [k]
    push lenA
    push dword a
    call proc
    add esp, 12

    mov [res], ax
    printw word [res]
    exit 0
