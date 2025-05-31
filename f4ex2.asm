.8086
.model small
.stack 2048

dseg segment
    vetor1 db 1,6,8,4,2
    vetor2 db 5 dup(0)
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax
    
    xor si, si

copy_loop:
    mov al, vetor1[si]
    mov vetor2[si], al
    inc si
    cmp si, 5
    jne copy_loop

    xor si,si

print_loop:
    mov al, vetor2[si]
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h
    inc si
    cmp si, 5
    jne print_loop

fim:
    mov ah, 4ch
    int 21h
cseg ends
end start