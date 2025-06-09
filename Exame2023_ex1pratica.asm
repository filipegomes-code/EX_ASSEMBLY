start .8086
.model small
.stack 2048

dseg segment
    PREMIO db  1, 20, 23, 47, 49, 6, 7
    APOSTA db  23, 45, 3, 40, 12, 4, 3
    NUMEROS db 0
    ESTRELAS db 0
    INVALIDOS db 0
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    mov cx, 7
    xor si,si

percorrer_loop:
    push cx
    call validar_num
    pop cx
    inc si
    loop percorrer_loop

fim:
    mov ah, 4Ch
    int 21h

validar_num PROC 
    xor ax,ax 
    mov al , APOSTA[si]
    cmp ax, 1
    jb invalido
    cmp ax, 50
    ja invalido
    cmp si, 5
    jae estrelas

    estrelas:
        cmp al, 1
        jb invalido
        cmp al, 12
        ja invalido

    valido: 
        call testaPremio 

    invalido: 
        inc INVALIDOS
        ret
    
    RET
validar_num ENDP

testaPremio PROC 
    xor di,di
    cmp si, 5
    jae estrelas_iguais      ; se for acima é estrela 
    ; mov cx, 5   ; isto está no sitio errado, é dentro do numeros_iguais.
    jb numeros_iguais 

    mov di, 5
    estrelas_iguais:
        cmp al, PREMIO[di]
        jz inc_estrelas
        inc di
        cmp di,6
        jae estrelas_iguais
        ret

    mov cx, 5
    mov di, 0
    numeros_iguais:
        cmp al, PREMIO[di]
        jz inc_numeros
        inc di
        loop numeros_iguais
        ret

    inc_estrelas:
        inc ESTRELAS
        ret

    inc_numeros:
        inc NUMEROS
        ret

    RET
testaPremio ENDP

cseg ends
end start