.8086
.model small
.stack 2048
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;             ALINEA B            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dseg segment
    Vetor1 db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,'$'  ; tem msm tam que vetor2, logo só preciso
    Vetor2 dw 6,7,8,9,10,11,12,20,30,40,50,60,70,80,2,3,5,8,'$'
dseg ends

cseg segment
    assume cs:cseg, ds:dseg

start:
    mov ax, dseg
    mov ds, ax

    lea si, Vetor1

percorrer_vetor:
    mov al, Vetor1[si]
    cmp al, '$'
    je fim
    add al, 1

    mov bl, Vetor2[si]
    add bl, 1

    inc si

    jmp percorrer_loop

fim:
    mov ah, 4Ch
    int 21h

cseg ends
end start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;             ALINEA C             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dseg segment
    var1 dw 350
    var2 db 2
dseg ends

cseg segment
main PROC
    assume cs:cseg, ds:dseg

    mov ax, dseg
    mov ds, ax

    mov bl, var2
    mov ax, var1

    mul bl

    mov ah, 4Ch
    int 21h
main ENDP


cseg ends
end start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;             ALINEA D            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.8086
.model small
.stack 2048

dseg segment
    string db 'a', 'b', 'c', 'z', '0'
dseg ends

cseg segment
main proc
    assume cs:cseg, ds:dseg

    mov ax,dseg
    mov ds,ax

    xor si,si

cic: 
    mov al, string[si]
    cmp al, '0'
    JE fim

    add al, 1h
    cmp al, 'z'+1
    je volta_inicio
    mov string[si], al
    inc si
    jmp cic

volta_inicio:
    mov al, 'a'
    mov string[si], al
    inc si
    jmp cic
fim:
    mov ah, 4Ch
    int 21h
main ENDP
cseg ends
end main


