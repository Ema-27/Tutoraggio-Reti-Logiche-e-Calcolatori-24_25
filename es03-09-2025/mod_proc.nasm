section .data
    ris equ 8
    n equ 12
    W equ 16
    V equ 20


section .text
    global proc

proc:
    push ebp
    mov ebp, esp
    pushad

    mov eax, [ebp + V]
    mov ebx, [ebp + W]
    mov esi, [ebp + n]
    xor edi, edi    ;indice

.loop:
    cmp edi, esi
    jge .end1

    mov cx, [eax + edi*2]   ;prelevo v[i]
    and cx, 15

    mov dx, [ebx +edi*2]    ;prelevo w[i]
    and dx, 15

    cmp cx, dx
    je .end0

    inc edi
    jmp .loop

.end0:
    mov eax, [ebp+ris]
    mov [eax], word 0
    popad
    pop ebp 
    ret 16


.end1:
    mov eax, [ebp+ris]
    mov [eax], word 1
    popad
    pop ebp
    ret 16