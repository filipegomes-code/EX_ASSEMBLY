DADOS segment

Address1 db 5
Address2 db 7
Address3 db 0

DADOS ends

CODIGO SEGMENT 
	ASSUME CS:CODIGO, DS:DADOS
INICIO:
		Mov al , Address1
		Add al, Address2
		add Address3, al
		CODIGO ENDS

END INICIO