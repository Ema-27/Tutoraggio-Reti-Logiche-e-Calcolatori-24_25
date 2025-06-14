%include "utils.nasm"

section .data
    v equ 8
    w equ 12
    n equ 16


section .text
    global proc

proc:
    push ebp
    mov ebp, esp
    pushad

    ;prima metà

    mov eax, [ebp+v]
    mov ebx, [ebp+w]
    mov edi, [ebp+n]

    add eax, edi    ;V+n/2 *2
    shr edi, 1  ;n/2

    xor esi, esi

ciclo_1:
    cmp esi, edi    ;i<n/2
    jge fine_ciclo_a
    mov cx, [ebx + esi*2]   ;w[i]
    mov dx, [eax + esi*2]   ;v[n/2+i]
    cmp cx, dx 
    jle cond_falsa_a

    add cx, dx
    jmp avanti_a

cond_falsa_a:
    xor cx, cx    ;mettiamo 0
avanti_a:
    mov [ebx + esi*2], cx   ;carichiamo il valore di x
    inc esi
    jmp ciclo_1

fine_ciclo_a:
    ;seconda metà
    mov eax, [ebp +v]
    lea ebx, [ebx + edi*2]  ;W+n/2*2
    xor esi, esi

ciclo_2:
    cmp esi, edi
    jge fine_ciclo_b
    mov cx, [ebx+esi*2]
    mov dx, [eax+esi*2]
    cmp cx, dx  
    jle cond_falsa_b
    add cx, dx
    jmp avanti_b

cond_falsa_b:
    xor cx, cx  ;poniamo x=0
avanti_b:
    mov [ebx+esi*2], cx
    inc esi
    jmp ciclo_2

fine_ciclo_b:
    popad
    pop ebp
    ret 12