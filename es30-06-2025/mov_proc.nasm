section .data
    V equ 8
    W equ 12
    nv equ 16
    nw equ 20


section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp+V]    ;V word
    mov edi, [ebp+W]    ;W double word
    mov ecx, [ebp+nw]   ;numero di passi in W

    mov ebx, [edi]      ;prelevo il valore W[0]
    mov ax, [esi+ebx*2] ;V[W[0]]

    xor edx, edx        ;indice
    inc edx             ;parto dal successivo

.loop:
    cmp edx, ecx
    jge .end

    add ebx, [edi+edx*4]    ;prelevo il valore W[i+1]->*4 perchè double

    cmp [esi+ebx*2], ax
    jge .decrescente        ;condizione non rispetta 

    mov ax, [esi+ebx*2]
    inc edx

    jmp .loop

.decrescente:
    mov al, 0
    mov esp, ebp
    pop ebp

    ret 16

.end:
    mov al, 1

    mov esp, ebp
    pop ebp

    ret 16
