;scrivere una procedura assembly che riceve 
;un vettore di word V ed un vettore di double word W,
; con V avente lunghezza n e W n-1, e tre paramentri
;a , b e k
;ciascun elemento di W è calcolato come segue:
; w[i] = 0 se a*V[i]+b*V[i+1]>k
;w[i] = 1 altrimenti
section .data
    V equ 28      
    n equ 24    
    a equ 20     
    b equ 16      
    k equ 12      
    W equ 8       

section .text
global proc

proc:
    push ebp
    mov ebp, esp
    pushad
    
    mov esi, [ebp + V]    ; indirizzo di V
    mov edi, [ebp + W]    ; indirizzo di W
    mov ecx, [ebp + n]    ; n
    dec ecx               ; n-1 iterazioni
    xor ebx, ebx         ; contatore i = 0

.loop:
    cmp ebx, ecx
    jge .end

    ; Calcolo a*V[i]
    mov ax, [esi + ebx*2]    ; V[i]
    imul ax, word [ebp + a]  ; a*V[i]
    mov dx, ax               ; salvo risultato in dx

    ; Calcolo b*V[i+1]
    mov ax, [esi + ebx*2 + 2] ; V[i+1]
    imul ax, word [ebp + b]   ; b*V[i+1]

    ; Sommo i risultati
    add ax, dx               ; ax = a*V[i] + b*V[i+1]

    ; Confronto con k
    cmp ax, [ebp + k]
    jle .minore_uguale

    ; Caso > k
    mov dword [edi + ebx*4], 0
    jmp .next

.minore_uguale:
    mov dword [edi + ebx*4], 1

.next:
    inc ebx
    jmp .loop

.end:
    popad
    pop ebp
    ret 24                   ; 6 parametri * 4 bytes