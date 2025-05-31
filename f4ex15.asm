.8086
.model small
.stack 2048

dseg segment
    vetor db 5,2,7,8,2,6,1,16,23,24,0
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    xor si,si
    xor bx,bx
    mov bl, 2

loop_vetor:
    mov al, vetor[si]
    cmp al, 0
    je print_soma

    xor ah,ah
    div bl
    cmp ah, 0
    je prox
    add bh, vetor[si]

    jmp prox

prox:
    inc si
    jmp loop_vetor

print_soma: ; TENHO QUE IMPRIMIR DIGITO POR DIGITO
    mov al, bh
    xor ah, ah
    mov bl, 10

    div bl            ;  EX : numero 72 , isto so funciona para numeros com 2 digitos

    mov dl, ah        ; imprime o numero decimal  ex:  aqui imprime 7, que é o quociente
    add dl, 30h
    mov ah, 02h
    int 21h

    mov dl, al       ; imprime o numero das unidades  ex: aqui imprime 2 que é o resto
    add dl, 30h
    mov ah, 02h
    int 21h

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start