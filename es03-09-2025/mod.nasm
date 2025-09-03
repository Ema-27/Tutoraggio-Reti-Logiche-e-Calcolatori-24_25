;ESTRARRE IL RESTO:

;    mov cx, 23  ; in binario è 0001 0111
;    and cx, 15  ; 0001 0111 23
            ;AND   0000 1111 15

                ; il risultato è 0000 0111 cioè 7
                ; 23 % 16 = 7

;    AND cx, N-1 FUNZIONA SOLO CON N POTENZA DI 2

;    OPPURE UTILIZZANDO LA DIV

;    mov ax, 23  ;valore da dividere
;    mov bx, 10  ;divisore
;    xor dx,dx   ;azzera dx prima di dividere
;    div bx      ;AX/BX ->risultato in AX, resto in DX
    
%include "utils.nasm"

section .data
    V dw 6, 19, 3, 7, 54
    W dw 21, 34, 2, 22, 4
    n equ ($ -W)/2

section .bss
    ris resb 1

section .text
    global _start 
    extern proc

_start:
    push V 
    push W 
    push n 
    push ris 

    call proc 
    printw word[ris]

    exit 0


