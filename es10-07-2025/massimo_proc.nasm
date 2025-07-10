
section .data
    v equ 8
    n equ 12


section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp + v]
    mov edi, [ebp + n]

    xor edx, edx

    xor ax, ax  ;somma VALORE ASSOLUTO
                ;ELEMENTI VALORE PARI

    xor bx, bx  ;somma ELEMENTI DISPARI

.loop:
    cmp edx, edi
    jge .comp

    mov ecx, edx

    and ecx,1
    ;verifico che la posizione è pari
    jz .check_pari

    mov cx, [esi +edx*2]    ;v[i]
    add bx, cx

.check_pari:
    mov cx, [esi +edx*2]    ;v[i]

    ;controllo il valore indipendentemente dalla posizione

    and cx, 1
    jnz .next

    mov cx, [esi +edx*2]

    ;valore pari -calcolo valore assoluto e somma

    cmp cx, 0
    jge .add_pari

    neg cx

.add_pari:
    add ax, cx

.next:
    inc edx
    jmp .loop

.comp:
    cmp ax, bx
    jge .end
    mov ax, bx

.end:
    mov esp, ebp
    pop ebp

    ret 8

    