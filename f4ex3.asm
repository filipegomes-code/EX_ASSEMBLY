.8086
.model small
.stack 2048

dseg segment
    vetor1 db 1,4,7,3,6
    vetor2 db 4,6,1,5,3
    vetor3 db 5 dup(0)
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax
    xor si,si 

add_loop:
    mov al, vetor1[si]
    add al, vetor2[si]
    mov vetor3[si], al
    inc si
    cmp si,5
    jne add_loop
    xor si,si
    
print_loop:
    mov al, vetor3[si]
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h
    inc si
    cmp si,5
    jne print_loop

fim:
    mov ah,4ch
    int 21h
cseg ends
end start