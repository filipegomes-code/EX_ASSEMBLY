start .8086
.model small
.stack 2048

dseg segment
    linha db 2
    coluna db 4
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, 08B00h
    mov es, ax

    mov al, linha
    mov ah, coluna

    xor cl,cl 

    call calcMinas

calcMinas PROC
    ;endereço inicial linha

   ; mov al, linha
   ; mov bl, 160
   ; mul bl
   ; mov bx, ax

    ;endereço inicial coluna
   ; mov ah, coluna
   ; mov bl, 2
   ; mul bl
   ; mov si, ax

   ; mov ax, ES: [bx + si] ; isto junta as linhas com as colunas, dando as coordenadas

    cima: 
        mov al, linha
        dec al
        mov bl, 160
        mul bl
        mov bx, ax

        mov ah, coluna
        mov bl, 2
        mul bl
        mov si, ax

        mov al, ES:[bx + si]
        cmp al, '*'
        je tem_ast
    
    baixo: 
        mov al, linha
        inc al
        mov bl, 160
        mul bl
        mov bx, ax

        mov al, coluna
        mov bl, 2
        mul bl
        mov si, ax

        mov al, ES:[bx + si]
        cmp al, '*'
        je tem_ast

    direita: 
        mov al, linha
        mov bl, 160
        mul bl
        mov bx, ax

        mov al, coluna
        inc al
        mov bl, 2
        mul bl
        mov si, ax

        mov al, ES:[bx + si]
        cmp al, '*'
        je tem_ast

    esquerda:
        mov al, linha
        mov bl, 160
        mul bl
        mov bx, ax

        mov al, coluna
        dec al
        mov bl, 2
        mul bl
        mov si, ax

        mov al, ES:[bx + si]
        cmp al, '*'
        je tem_ast

    tem_ast:
        inc cl

calcMinas ENDP

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start