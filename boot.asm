[org 0x7c00]

mov bp, 0x8
mov sp, bp

; init cpt
mov bx, 4
read:
    ; read
    mov ah, 0
    int 0x16

    ; print
    mov ah, 0x0e
    int 0x10

    ; push on the stack
    push ax

    ; inc cpt, test for next iteration
    dec bx
    cmp bx, 0
    jne read

mov ah, 0x0e
mov bx, bp
times 2 dec bl
mov al, ' '
int 0x10
print:
    ; print
    mov al, [bx]
    int 0x10

    times 2 dec bl

    cmp al, 0
    jne print


jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
