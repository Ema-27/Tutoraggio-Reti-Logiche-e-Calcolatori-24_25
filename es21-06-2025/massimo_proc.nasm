section .data
    V equ 8
    n equ 12

    max dw 0

section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp + V]  ;v[i]
    mov ecx, [ebp + n]  ;n

    xor edx, edx    ;indice
    xor edi, edi    ;indice del max

    mov eax, ecx
    shr eax, 1      ;n/2

.loop:
    cmp edx, eax    ;confronto con n/2
    jge .end

    mov bx, [esi + edx*2]   ;v[i]

    mov ecx, [ebp + n]
    sub ecx, edx    ;n-i
    dec ecx         ;n-i-1

    sub bx, [esi + ecx*2]       ;v[i] - v[n-i-1]

    cmp bx, 0
    jge .positivo

    neg bx

.positivo:
    cmp bx, [max]
    jle .next

    mov [max], bx
    mov edi, edx

.next:
    inc edx
    jmp .loop

.end:
    mov eax, edi

    pop ebp
    ret 8



