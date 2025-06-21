%include "utils.nasm"

section .data
    V dw 3,-1,-2,6,-12,5    ; vettore V iniziale
    W dw 3,7,5,13,-3,-9     ; vettore W iniziale
    n equ ($ -V)/2

section .bss
    scambi resw 1          

section .text
    global _start
    extern proc

_start:
    ; Push dei parametri
    push n                ; dimensione n
    push dword W          ; indirizzo vettore W
    push dword V          ; indirizzo vettore V
    
    call proc
    add esp, 12          

    mov [scambi], ax

    printw word [scambi]

    exit 0