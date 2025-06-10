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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FAZER O MSM EXERCICIO COM PROCS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

    lea si, frase1
    xor di,di

percorrer_frase:
    call valida_letra
    inc si
    mov al, frase1[si]
    cmp al, '$'
    je fim
    jmp percorrer_frase

valida_letra PROC

    mov al, frase1[si]
    cmp al, '('
    je ignora
    
    mov frase2[di], al
    inc di
    ret

    ignora: 
        call ignora_tudo
        ret

valida_letra ENDP

ignora_tudo PROC
    inc si

    nao_copia:
        mov al, frase1[si]
        cmp al, ')'
        jne nao_copia
        inc si
        ret
ignora_tudo ENDP

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start






