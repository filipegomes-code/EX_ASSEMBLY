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
    ;mov ax, dseg
    ;mov ds, ax
    
    ;mov ax, 0B800H
    ;mov es, ax

    ;xor bx,bx

    ;mov al, '1'
    ;mov ah, 07h

    ;mov cx, 12*40
    
    ;quadrante1:
        ;imprimir linhas
    ;    mov es:[bx], ax
    ;    add bx, 2

    ;    loop quadrante1

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
        cmp cx, 40 * di
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