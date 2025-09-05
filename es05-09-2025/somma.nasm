%include "utils.nasm"

section .data
    ; Esempio dal testo: V = [5, -3, 8, 4, 0, -18, 14, 5]
    ; Indice 2: V[0]+V[1]+V[2] = 5+(-3)+8 = 10
    ; V[3]+V[4]+V[5]+V[6]+V[7] = 4+0+(-18)+14+5 = 5
    ; 10 = 2*5 ✓
    V dw 5, -3, 8, 4, 0, -18, 14, 5
    n equ ($ - V)/2

section .bss
    risultato resd 1

section .text
    global _start
    extern proc

_start:
    push n
    push dword V
    
    call proc
    
    mov [risultato], eax
    printd dword [risultato]
    
    exit 0