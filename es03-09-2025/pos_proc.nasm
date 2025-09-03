section .data
    V equ 8
    W equ 12
    n equ 16

section .text
    global proc

proc:

    push ebp
    mov ebp, esp

    mov esi, [ebp + V]
    mov edi, [ebp + W]
    mov ecx, [ebp + n]

    xor edx, edx    ;indice ciclo
    xor eax, eax    ;contatore risultato

.loop:
    cmp edx, ecx
    jge .end

    ;calcolo posizione complementare n-p-1
    mov ebx, ecx    ;n
    sub ebx, edx    ;n-p
    dec ebx         ;n-p-1

    ;carico W[p']
    movsx ebx, word [edi + ebx*2]   ;W[p']
    neg ebx                 ;-w[p']

    ;confronto -W[p'] con V[p]
    cmp ebx, [esi + edx*4]
    jne .next

    inc eax

.next:
    inc edx
    jmp .loop

.end:
    mov esp, ebp
    pop ebp
    ret 12
