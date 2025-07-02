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

    

.end:
    popad
    mov esp, ebp
    pop ebp

    ret 16