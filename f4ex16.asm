.8086
.model small
.stack 2048

dseg segment
    numero dw 57950
    quant db 0
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    xor ax,ax
    xor cx,cx
    xor si,si
    xor dx,dx
    mov bx,10

    mov ax, numero

conta_digitos:
    xor dx,dx
    div bx  ; ax -> ah = resto, al = quociente
    cmp ax, 1 ; se quociente menor que 1 sai 
    jb numero_acabar ; se quociente menor que 1 sai 
    test dx,dx ; se for zero
    jz quantidade_zeros
    xor dx,dx ; poe o resto a 0, caso tenha ficado a um numero que nao zero, mas n afeta o quociente
    jmp conta_digitos 

quantidade_zeros:
    inc si
    mov cx, si
    mov quant, cl
    jmp conta_digitos
    
numero_acabar:
    cmp dx, 0
    jg imprimir 
    mov cx, si ; mover quantidade de zeros para quant, este mov n dunciona, si mais bits que quant
    mov quant, cl

imprimir: 
    mov dl, quant
    add dl, 30h
    mov ah, 02h
    int 21h
fim:
    mov ah, 4Ch
    int 21h

cseg ends