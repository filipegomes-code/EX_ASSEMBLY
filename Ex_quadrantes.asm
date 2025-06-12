.8086
.model small
.stack 2048

dseg segment
    v db '1234'
dseg ends

cseg segment
    assume cs:cseg, ds:dseg
MAIN PROC
start:
    mov ax, dseg
    mov ds, ax
    
    mov ax, 0B800H
    mov es, ax

    xor bx,bx

    mov al, '1'
    mov ah, 07h

    mov cx, 12*40
    
    quadrante1:
        ;imprimir linhas
        mov es:[bx], ax
        add bx, 2

        loop quadrante1

    mov di, 1
    xor bx,bx
    mov ax, 40

    ;endereço inicial coluna , n preciso da linha pq começa na zero
    mov bl, 2
    mul bl
    mov si, ax

    mov cx, 12*40

    quadrante2:
        mov al, '2'
        mov ah, 07h

        mov es:[si], ax
        add si, 2
        ; cmp cx, 40 * di , isto n funciona como quero pq o cx decrementa. 
        jne continua
        inc di
        add si, 160
        
    continua:
        loop quadrante2
MAIN ENDP

fim:
    mov ah, 4Ch
    int 21h

MAIN ENDP
cseg ends
end start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; RESOLUÇAO COM 2 CX's, 1 para linhas outro para colunas  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.8086
.model small
.stack 2048

dseg segment
    ; variáveis aqui
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    mov ax, 0B800H
    mov es, ax

    ; 1º quadrante
    xor bx, bx
    mov cx, 12

    linhas:
        push cx
        mov cx, 40
    colunas:    
        mov al, '1'
        mov ah, 07H

        mov es:[bx], ax
        add bx, 2

        loop colunas
        add bx, 80
        pop cx
        loop linhas

    ; 2º quadrante
    mov ax, 40
    mov bl, 2
    mul bl
    mov si, ax
    mov bx, si

    mov cx, 12

    linhas:
        push cx
        mov cx, 40
    colunas:    
        mov al, '2'
        mov ah, 07H

        mov es:[bx], ax
        add bx, 2

        loop colunas
        add bx, 80
        pop cx
        mov bx, si
        loop linhas

    ; 3º quadrante
    mov ax, 12
    mov bl, 80
    mul bl
    mov bx, ax

    mov cx, 12

    linhas:
        push cx
        mov cx, 40
    colunas:    
        mov al, '3'
        mov ah, 07H

        mov es:[bx], ax
        add bx, 2

        loop colunas
        add bx, 80
        pop cx
        loop linhas

    ; 4º quadrante
    ;endereço da linha onde começa
    mov ax, 12
    mov bl, 80
    mul bl
    mov bx, ax

    ;endereço da coluna onde começa 
    mov ax, 40
    mov bl, 2
    mul bl
    mov si, ax

    mov cx, 12

    linhas:
        push cx
        mov cx, 40
        mov dx, si
    colunas:    
        mov al, '4'
        mov ah, 07H

        mov es:[bx + dx], ax
        add dx, 2

        loop colunas
        add bx, 80
        pop cx
        loop linhas
    
fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start












