.8086
.model small
.stack 2048

dseg segment 
    frase db 'O meU cAo GOSta dE Mim', '$'
dseg ends 

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    xor si,si 
    xor dl,dl
    xor cl,cl
    xor bl,bl

frase_loop:
    mov al, frase[si]
    cmp al, '$'
    je print_conts

    cmp al, 61h 
    jb contador_mais  
    cmp al, 7Ah
    ja contador_mais
    inc dl 
    jmp prox  

contador_mais:
    cmp al, 41h
    jb contador_num
    cmp al, 5Ah
    ja contador_num
    inc cl
    jmp prox

contador_num:
    cmp al, 30h
    jb prox
    cmp al, 39h
    ja prox
    inc bl
    jmp prox

prox:
    inc si 
    jmp frase_loop

print_conts:
    add dl, 30h
    mov ah, 02h
    int 21h

    mov dl, ' '
    mov ah, 02h
    int 21h

    mov dl, cl
    add dl, 30h
    mov ah, 02h
    int 21h

    mov dl, ' '
    mov ah, 02h
    int 21h

    mov dl, bl
    add dl, 30h
    mov ah, 02h
    int 21h

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start