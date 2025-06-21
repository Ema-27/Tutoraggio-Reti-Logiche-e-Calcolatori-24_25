section .data
    V equ 8
    W equ 12
    T equ 16
    n equ 20

section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    pushad

    ;carico i valori

    mov eax, [ebp + V]
    mov ebx, [ebp + W]
    mov ecx, [ebp + T]
    mov edi, [ebp + n]

    xor esi, esi    ;indice

.loop:
    cmp esi, edi
    jge .end

    mov dx, [eax + esi*2]   ;v[i]
    and dx, 1
    jnz .dispari    ;verifico se è pari

    mov dx, [ebx + esi*2]   ;w[i]
    and dx, 1
    jnz .dispari    ;verifico se è pari

    mov dx, [eax + esi*2]   ;v[i]
    mov [ecx + 4*esi], dx   ;T[i]
    mov dx, [ebx +esi*2]    ;w[i]
    mov [ecx + esi*4 +2], dx    ;T[i+1]

    inc esi
    jmp .loop

.dispari:
    mov dx, [eax + esi*2]   ;v[i]
    neg dx
    mov [ecx + 4*esi], dx   ;T[i]
    mov dx, [ebx + esi*2]   ;w[i]
    neg dx
    mov [ecx + esi*4 +2], dx    ;T[i+1]
    inc esi
    jmp .loop

.end:
    popad
    mov esp, ebp
    pop ebp

    ret 16