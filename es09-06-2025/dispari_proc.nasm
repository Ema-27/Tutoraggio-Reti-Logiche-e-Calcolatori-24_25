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

    xor ebx, ebx    ; contatore scambi
    xor edx, edx    ; indice i=0

.loop:  
    cmp edx, ecx
    jge .end

    ; Carico i valori
    mov ax, [esi + edx*2]   ; v[i]
    mov cx, [edi + edx*2]   ; w[i]

    ; Test della disparità separatamente
    test ax, 1
    jz .pari       ; Se v[i] è pari, salta
    test cx, 1
    jz .pari       ; Se w[i] è pari, salta

    ; Se arriviamo qui, entrambi i numeri sono dispari
    ; Scambiamo i valori
    mov [esi + edx*2], cx   ; v[i] = w[i]
    mov [edi + edx*2], ax   ; w[i] = v[i]
    inc ebx                 ; incrementa contatore scambi

.pari:
    inc edx
    jmp .loop

.end: 
    mov eax, ebx
    pop ebp
    ret 12