.8086
.model small
.stack 2048

dseg segment
    coluna db 2
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    mov ax, 0B800H
    mov es, ax

    ; endereço inicial de onde se encontra na coluna
    mov al, coluna
    mov bl, 2
    mul bl
    mov bx, ax
    
    ;endereço de destino, aqui faço o deslocamento 
    mov al, coluna
    add al, 20
    mov bl, 2
    mul bl
    mov si, ax

    mov cx, 25

    ciclo:
        mov ax, es:[bx] ; copia a 2 coluna
        mov es:[si], ax ; cola a 2 coluna na posicao 22

        mov ax, es:[bx+2] ; copia a 3 coluna
        mov es:[si+2], ax ; cola na posicao 23

        add bx, 160 ; desce uma linha para copiar verticalemnte e ficar o texto em coluna
        add si, 160 ; desce uma linha no destino para copiar verticalemnte e ficar o texto em coluna
        loop ciclo 
    
fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start