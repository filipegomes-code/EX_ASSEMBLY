.8086
.model small
.stack 2048

dseg segment
    vetor db 2,253,3,2,2,2,2,2,0
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    xor ax, ax
    lea si , [vetor] 
    mov cx,10

loop_vetor:
    mov bl, [si]
    cmp bl , 0
    je var_converte
    test bl, 1  ; se ultimo bit significativo é 1, significa que numero é par
    jz prox
    test bl, 1  ; verifica se o ultimo bit é 1 , logo 
    add al, bl
    adc ah, 0

prox:
    inc si
    jmp loop_vetor
var_converte: 
    xor dx,dx
    mov si,0

converte:
    div cx 
    add dl, 30h
    push dx 
    inc si
    xor dx, dx
    test ax, ax 
    jnz converte

    mov cx, si    
print:
    pop dx
    mov ah, 02h
    int 21h
    loop print

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start 