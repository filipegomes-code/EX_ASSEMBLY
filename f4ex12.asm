.8086
.model small
.stack 2048

dseg segment
    frase db 'Olá sou o ruca hehe', 0
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax
    xor si,si
    xor dl,dl

loop_frase:
    mov al, frase[si]
    cmp al, 0
    je print_cont
    cmp al , 20h
    je cont_space
    inc si
    jmp loop_frase

cont_space:
    inc dl
    inc si
    jmp loop_frase

print_cont:
    mov al, dl
    add al, 30h
    mov dl , al
    mov ah, 02h
    int 21h

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start