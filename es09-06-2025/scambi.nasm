;scrivere una procedura assembly che riceve un vettore di word V ed un vettore di double word W, con V avente lunghezza n e W n-1, e tre paramentri
;a , b e k
;ciascun elemento di W è calcolato come segue:
; w[i] = 0 se a*V[i]+b*V[i+1]>k
;w[i] = 1 altrimenti

%include "utils.nasm"
section .data
    V dw 7,4,-2,6,-1
    n equ ($-V)/2
    a dw -3
    b dw 1
    k dw 4

section .bss
    W resd n-1

section .text
    global _start
    extern proc

_start:

    PUSH dword V          
    PUSH dword n
    MOVSX EAX, word [a]  
    PUSH EAX
    MOVSX EAX, word [b]   
    PUSH EAX
    MOVSX EAX, word [k]   
    PUSH EAX
    PUSH dword W          

    CALL proc
    add esp, 24
    
    XOR ESI,ESI
ciclo:
    CMP ESI,n-1
    JGE fine
    printd dword [W+ESI*4]
    INC ESI
    JMP ciclo
fine:
    exit 0

