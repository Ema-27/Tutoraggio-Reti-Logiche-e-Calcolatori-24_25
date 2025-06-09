%include "utils.nasm"
section .data
    V dw 7,4,-2,6,-1
    n equ ($-V)/2
    a dw -3
    b dw 1
    k dw 4

section .bss
    W resd n-1

section . text
    global _start
    extern proc
_start:
       PUSH V
       PUSH n
       PUSH a
       PUSH b
       PUSH k 
       PUSH W
       CALL proc
       XOR ESI,ESI
ciclo:
       CMP ESI,n-1
       JGE fine
       printd dword [W+ESI*4]
       INC ESI
       JMP ciclo
fine:
       exit 0