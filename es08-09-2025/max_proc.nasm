section .data
    V equ 8
    n equ 12

section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp +V]
    mov edi, [ebp + n]

    xor edx, edx

    xor ax, ax  ; somma valore assoluto el. val pari

    xor bx, bx  ; somma el. dispari

.loop:
    cmp edx, edi
    jge .comp

    mov ecx, edx

    and ecx, 1  ;maschera per verificare indice pari
    jz .checkpari

    mov cx, [esi + edx*2]
    add bx, cx

.checkpari;
    mov cx, [esi + edx*2]

    and cx, 1
    ;verifico valore pari in pos dispari
    jnz .next

    mov cx, [esi + edx*2]

    cmp cx,0
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