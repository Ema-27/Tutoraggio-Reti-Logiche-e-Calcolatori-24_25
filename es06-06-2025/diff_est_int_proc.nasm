section .data

    V equ 8
    lenV equ 12
    d equ 16

section .bss

section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp + V]  ; V
    mov ecx, [ebp + lenV]   ; len V

    mov bx, [ebp + d]       ;d
    neg bx                  ;-d

    xor edi, edi
    xor dx, dx

.primo_blocco:

    mov ax, word [esi + edi*2]      ;primo elemento di v[i]
    
    inc edi 

    cmp ax, 0
    je .secodo_blocco

    ;siamo ancora nel primo blocco

    cmp ax, [ebp + d ]
    jg .aggiungi_dx_primo       ;se v[i] > d, è un elemento esterno

    cmp ax, bx
    jl .aggiungi_dx_primo       ; elemento esterno v[i] < -d

    jmp .primo_blocco

.aggiungi_dx_primo:
    add dx, ax
    jmp .primo_blocco

.secodo_blocco:
    ; a - (+b)
    ; a - b

    cmp edi, ecx    ;verifico di essere arrivato alla fine
    je .end

    mov ax, word [esi + edi*2] 
    inc edi

    cmp ax, [ebp + d]
    jg .secodo_blocco

    cmp ax, bx          ;-d
    jl .secodo_blocco

    ;andiamo a fare dx - ax

    sub dx, ax  ;elementi del primo blocco - elementi del secondo blocco
    jmp .secodo_blocco

.end:
    mov ax, dx
    pop ebp 

    ret 12



