.8086
.model small
.stack 2048

dseg segment
    oldvetor db 2,5,7,1,3
    numelem EQU 5
    newvetor db numelem dup(0)
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax
    xor si,si

double_loop:
    mov al, oldvetor[si]
    mov bl, 2
    mul bl
    mov newvetor[si], al
    inc si
    cmp si, numelem
    jne double_loop
    xor si,si

print_loop:
    mov al, newvetor[si]
    add al, 30h
    mov dl , al
    mov ah, 02h
    int 21h
    inc si
    cmp si, numelem
    jne print_loop
fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start