section .data
    V equ 8
    W equ 12
    n equ 16

section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp + V]  ;V
    mov edi, [ebp + W]  ;W

    ;mov ax, [edi+ edx*4]   ;Mem[W[i]]

    xor edx, edx    ;indice
    
    ;Calcoliamo il primo prodotto come massimo iniziale
    mov ax, [esi]   ;V[0]
    mov bx, [edi]   ;W[0]
    imul ax, bx     ;v[0]*W[0]
    mov cx, ax      ;massimo iniziale

    inc edx

.loop:
    cmp edx, [ebp + n]
    jge .end

    mov ax, [esi + edx*2]       ;v[i]
    mov bx, [edi + edx*2]       ;w[i]
    imul ax, bx

    cmp ax,cx
    jle .next

    mov cx, ax      ;aggiorno il max

.next:
    inc edx
    jmp .loop

.end:
    mov ax, cx

    mov esp, ebp
    pop ebp
    ret
