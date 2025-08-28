section .data
    k equ 8
    V equ 12
    n equ 16

section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov edi, [ebp + V]      ;vettore V
    mov cx, [ebp + k]       ;k

    mov al, 1

    xor dx, dx      ;somma blocchi
    xor esi, esi    ;contatore

.loop:
    cmp esi, [ebp + n]
    jge .verifica_finale

    mov bx, [edi + esi *2]  ;carico il valore corrente
    cmp bx, -1      ;verifico fine blocco
    je .verifica

    add dx, bx          ;aggiungo il valore attuale alla somma
    inc esi

    jmp .loop

.verifica:
    cmp dx, cx      ;verifica se la somma è maggiore di k
    jge .next

    mov al, 0
    jmp .end

.next:
    inc esi
    xor dx, dx

    jmp .loop

.verifica_finale:
    ;verifica la somma dell'ultimo blocco (non seguito da -1)
    cmp dx, cx
    jge .end

    mov al, 0   ;ultimo blocco non valido

.end:

    mov esp, ebp
    pop ebp

    ret 12




