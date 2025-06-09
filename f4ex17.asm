start .8086
.model small
.stack 2048

dseg segment
    String db 5, '1', '2', '3', '4', '8'
    gerado dw 0 ; posso por 0 ou ?

dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    mov si, 1
    mov cx ,4
    mov bh, 10

; Pode se fazer este ex com potencias (afinal n dá, n existe potencias em asm) ou com multiplicação progressiva
comeco_loop:
    mov al, string[si]
    sub al, 48
juntar_num;
    mov ax, gerado
    mul bh
    add ax, al
    mov gerado, ax
    inc si
    loop comeco_loop

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start