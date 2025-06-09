;Scrivere una procedura Assembly che riceve un vettore di word A e un intero k
;La procedura verifica se nell'array è presente una sequenza di 3 elementi contigui di
;segno alterno la cui somma sia maggiore di k.
;In tal caso la procedura restituirà 1, altrimenti 0.

section .data

    a equ 8
    lenA equ 12
    k equ 16

section .bss


section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp + a]
    mov ecx, [ebp + lenA]
    mov dx, [ebp + k]

    cmp ecx, 3  ;se <3 saltiamo alla fine
    jl .no_found

    xor edi, edi

.loop:

    mov eax, ecx
    sub eax, 2
    cmp edi, eax
    jg .no_found

    mov ax, word [esi + edi*2]              ;a[i]
    mov bx, word [esi + (edi+1)*2]          ;a[i+1]
    mov cx, word [esi + (edi+2)*2]          ;a[i+2]

    ;verifico il segno di ax e bx, se faccio il prodotto di due numeri 
    ;di segno alternato il risultato sarà negativo, altrimenti salto

    mov dx, ax
    imul dx, bx
    test dx, dx
    jge .next       ;se >=0, non sono alternati

    mov dx, bx
    imul dx, cx
    test dx, dx
    jge .next

    add ax, bx
    add ax, cx

    movsx edx, ax
    cmp edx, [ebp + k]
    jle .next

    mov ax, 1
    jmp .end

.next:
    inc edi
    mov ecx, [ebp+lenA]
    jmp .loop

.no_found:
    ;azzero il registro ax
    mov ecx, [ebp+lenA]
    xor ax, ax

.end: 
    pop ebp
    ret 12









