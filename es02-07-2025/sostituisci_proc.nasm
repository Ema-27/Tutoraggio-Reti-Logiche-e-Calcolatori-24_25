section .data
    V equ 8
    W equ 12
    nv equ 16
    nw equ 20


section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    pushad

    mov ebx, [ebp + W]
    mov ecx, [ebp + V]
    mov edi, [ebp + nw]

    xor esi, esi

.loop:
    cmp esi, [ebp + nv]
    jge .end

    ;calcolo indice W usando la div

    mov eax, esi
    xor edx, edx

    div dword edi   ;dividi esi per nw, il resto va in edx

    mov ax, [ecx + esi*2]   ;prendiamo V[esi]

    add ax, [ebx + edx*2]   ;aggiungi W[esi % nw]

    mov [ecx + esi*2], ax

    inc esi
    jmp .loop


.end:
    popad
    mov esp, ebp
    pop ebp

    ret 16