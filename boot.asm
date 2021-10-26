[org 0x7c00]

; init cpt
mov bx, 0
read:
    ; read
    mov ah, 0
    int 0x16

    ; print
    mov ah, 0x0e
    int 0x10

    ; save to buff
    mov [buff + bx], al

    ; inc cpt, test for next iteration
    inc bx
    cmp bx, 16
    jne read


mov ah, 0x0e
mov bx, buff
loop:
    mov al, [bx]
    int 0x10
    inc bx
    cmp al, 0
    jne loop

str:
    db "Hello wolrd", 0

buff:
    times 16 db 0, 0

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
