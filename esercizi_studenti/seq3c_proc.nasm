section .data
    a equ 8
    lenA equ 12
    k equ 16

section .text
    global proc

proc:
    push ebp
    mov ebp, esp

    mov esi, [ebp + a]     
    mov ecx, [ebp + lenA]
    mov dx, [ebp+k]  

    cmp ecx, 3 ; se è < 3  salta alla fine
    jl .no_found

    xor edi, edi

.loop:
    mov eax, ecx
    sub eax, 2
    cmp edi, eax
    jg .no_found

    mov ax, word [esi + edi*2]         ; A[i]
    mov bx, word [esi + (edi+1)*2]     ; A[i+1]
    mov cx, word [esi + (edi+2)*2]     ; A[i+2]

    ;verifico il segno di bx e ax, se faccio la mul di due numeri
    ;di segno alternato il numero sarà negativo
    mov dx, ax
    imul dx, bx
    test dx, dx
    jge .next       ; se >= 0, non alternati

    mov dx, bx
    imul dx, cx
    test dx, dx
    jge .next        ; se >= 0, non alternati

    add ax, bx
    add ax, cx

    movsx edx, ax
    cmp edx, [ebp + k]
    jle .next  

    mov ax, 1
    jmp .end

.next:
    inc edi
    jmp .loop

.no_found: 
    ;azzero ax, non ho trovato la sequenza
    xor ax, ax

.end:
    pop ebp
    ret 12                