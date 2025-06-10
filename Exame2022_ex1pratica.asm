.8086
.model small
.stack 2048

dseg segment
    Vetor1 db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,'$'  ; tem msm tam que vetor2, logo só preciso
    Vetor2 dw 6,7,8,9,10,11,12,20,30,40,50,60,70,80,2,3,5,8,'$'
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    lea si, Vetor1

percorrer_vetor:
    mov al, Vetor1[si]
    cmp al, '$'
    je fim
    add al, 1

    mov bl, Vetor2[si]
    add bl, 1

    inc si

    jmp percorrer_loop

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start