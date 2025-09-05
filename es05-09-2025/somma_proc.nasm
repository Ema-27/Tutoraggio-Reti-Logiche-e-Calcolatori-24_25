section .data
    V equ 8
    n equ 12

section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp + V]      ; indirizzo del vettore V
    mov ecx, [ebp + n]      ; lunghezza n del vettore

    ; Verifica se n < 2
    cmp ecx, 2
    jl .non_trovato

    ; Calcolo della somma totale
    xor eax, eax            ; somma totale = 0
    xor edi, edi            ; indice

.calc_somma_totale:
    cmp edi, ecx
    jge .inizio_ricerca
    
    movsx ebx, word [esi + edi*2]
    add eax, ebx
    inc edi
    jmp .calc_somma_totale

.inizio_ricerca:
    xor edi, edi            ; indice i
    xor edx, edx            ; somma da V[0] a V[i]

.loop_principale:
    mov ebx, ecx
    dec ebx
    cmp edi, ebx
    jge .non_trovato

    ; Aggiungi V[i] alla somma sinistra
    movsx ebx, word [esi + edi*2]
    add edx, ebx

    ; Calcola somma destra
    mov ebx, eax
    sub ebx, edx            ; somma_dx = somma_totale - somma_sx

    ; Verifica ENTRAMBE le condizioni:
    ; 1) somma_sx = 2 * somma_dx
    mov ecx, ebx
    imul ecx, 2
    cmp edx, ecx
    jne .continua

    ; 2) somma_sx = (2/3) * somma_totale (equivale a 3*somma_sx = 2*somma_totale)
    mov ebx, edx
    imul ebx, 3             ; 3 * somma_sx
    mov ecx, eax
    imul ecx, 2             ; 2 * somma_totale
    cmp ebx, ecx
    je .trovato

.continua:
    inc edi
    mov ecx, [ebp + n]
    jmp .loop_principale

.trovato:
    mov eax, edi
    jmp .fine

.non_trovato:
    mov eax, -1

.fine:
    pop ebp
    ret 8