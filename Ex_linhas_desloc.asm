.8086
.model small
.stack 2048

dseg segment
    linha db 3 ; esta na linha 3
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    mov ax, 08B00H
    mov es, ax
    
    ; isto da me o endereço onde a frase começa correspondente a essa linha
    mov al, linha 
    mov bl, 160
    mul bl 
    mov bx, ax

    ; aqui adiciono o deslocamento de 15 à posicao inicial onde se encontra
    mov al, linha
    add al, 15
    mov bl, 160
    mul bl
    mov si, ax

    mov cx, 160 ; como copio os atributos e caracter , uso 2 bytes por celula  

    ciclo:
        mov ax, ES:[bx] ; copia o conteudo desse endereço (letra)
        mov ES:[si], ax
        add si, 2
        add bx, 2
        loop ciclo
    
fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start