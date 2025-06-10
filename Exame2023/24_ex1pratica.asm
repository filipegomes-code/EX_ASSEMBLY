.8086
.model small
.stack 2048

dseg segment
    frase1 db 'A UC (unidade curricular) de TAC (Tecnologias e Arquiteturas de Computadores) vai ter uma taxa de aprovação elevada $'
    frase2 db 52 dup(?)
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    xor di,di
    lea si, frase1
comeco_loop:    
    mov al, frase1[si]
    cmp al, '$'
    je fim

    cmp al, '('
    je nao_copia
    
    mov frase2[di], al
    inc si 
    inc di
    jmp comeco_loop

nao_copia:
    inc si
    mov al, frase1[si]
    cmp al, ')'
    jne nao_copia
    jmp comeco_loop

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start