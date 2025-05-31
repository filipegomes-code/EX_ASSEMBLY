.8086
.model small
.stack 2048

dseg segment
    frase db 'OLa O mEU nOme e FILipe' , 0
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    xor si, si

loop_frase:
    mov al, frase[si]
    cmp al, 0
    je inicializa_cont_zero

check_maisucula:
    mov al, frase[si]
    cmp al, 'A'
    jb prox
    mov al, frase[si] 
    cmp al, 'Z'
    ja prox

    or al, 20h
    mov frase[si], al 
prox:
    inc si
    jmp loop_frase

inicializa_cont_zero:
    xor si,si
print_frase: ; imprime letra por letra, podia usar o operador '$' e assim imprimia logo a frase toda
    mov al, frase[si]
    mov dl, al
    mov ah, 02h
    int 21h
    inc si
    cmp al, 0
    jne print_frase

fim: 
    mov ah, 4Ch
    int 21h

cseg ends
end start
