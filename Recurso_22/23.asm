;;;;;;;;;;;;;;;;;;;;;;;;;; ESTE EXERCICIO É SUPOSTO SER FACIL, MAS É O MAIS DIFICIL DO DOS EXAMES, ATÉ O DA FRASE É MAIS FACIL 

.8086
.model small
.stack 2048

dseg segment
    v db 5, 65, 12, 200, 61, 30
    max db ?
    min db ?
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:

    mov ax, dseg
    mov ds, ax

    lea si, v
    mov cx, [si]
    inc si

    mov al, [si]

    mov max, al
    mov min, al
    dec cx
    inc si

percorrer_maior_menor:
    mov al, [si]
    cmp al, max
    jle menor
    mov max, al
    inc si

menor:
    cmp al, min 
    jg continua
    mov min, al

continua:
    inc si 
    loop percorrer_maior_menor

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start