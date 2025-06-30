section .data
    V equ 8
    n equ 12


section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp+V]
    mov ecx, [ebp+n]

    mov edi, -1     ;indice risultato

    xor ebx, ebx    ;contatore
    xor dx, dx      ;somma parziale

.loop:
    cmp ebx, ecx
    jge .end

    mov ax, [esi+ebx*2]
    add dx, ax

    mov ax, dx  ;copia la somma in ax per non sovrascriverlo
    and ax, 1   ;verifico sia pari->se pari risultato 0
    jnz .continua   ;se dispari continua

    mov edi, ebx
    
.continua:
    inc ebx
    jmp .loop

.end:
    mov eax, edi

    pop ebp
    ret 8
