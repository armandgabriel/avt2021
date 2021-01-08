.model large
DATAM SEGMENT
	hello 				DB 'This program was done by$' ;0000 0000 
	author1 			DB 'Camner Armand Gabriel$' 
	author2 			DB 'Monica Ioana Vulpe$' 
	program 			DB 'Programs:$'
	program1 			DB 'Base64$'
	program2 			DB 'Vigenere$' 
	program3 			DB 'Playfair$'
	wtd					DB 'What do you want to do?$'
	mode 	 			DB 1
	PLAINTEXT			DB 16 dup(2)
	FILENAME			DB 12 dup(5)
DATAM ENDS

STACKSEGMENTM SEGMENT
	startStack label word  ; eticheta de 2 bytes ( 16 ) biti care indica adreasa 0000
	DW 64 dup (1)
STACKSEGMENTM ENDS


CODM SEGMENT
ASSUME CS:CODM,SS:STACKSEGMENTM,DS:DATAM
START:
	MOV AX, SEG DATAM
	MOV DS, AX
	
	MOV AX, SEG STACKSEGMENTM
	MOV SS, AX
	MOV AX, OFFSET startStack  	;LEA SP, startStack 			; = MOV SP, OFFSET startStack 
	MOV SP, AX
	
	MOV AX, SEG DATAM           ;0
	PUSH AX						;stores 16 bit value in the stack.	FFFE 2

	LEA AX, hello				;1
	PUSH AX						;stores 16 bit value in the stack.	FFFC, 4
	
	LEA AX, author1
	PUSH AX						; FFFA	6
	
	LEA AX, author2
	PUSH AX						; FFF8  8
	
	LEA AX, PROGRAM
	PUSH AX						; FFF6 10
	
	LEA AX, PROGRAM1
	PUSH AX						; FFF4 12
	
	LEA AX, PROGRAM2
	PUSH AX						; FFF2 14
	
	LEA AX, PROGRAM3
	PUSH AX						; FFF0 16
	
	LEA AX, wtd
	PUSH AX						; FFEE 18
	
	LEA AX, mode
	PUSH AX						; FFEC 20
	
	LEA AX, PLAINTEXT
	PUSH AX						; FFEA 22
	
	LEA AX, FILENAME
	PUSH AX						; FFE8 24
	
	; push cs 					  FFE6 26
		
	CALL FAR PTR ABOUT
	CALL PRINTNEWLINE
	CALL ENDPROGRAM


ABOUT PROC FAR
	PUSH BP				; FFFA-2 = FFF8 				28  OFFSET DATAM, 30 OFFSET HELLO
	MOV BP, SP
	
	LEA DX, DS:[hello]   ;8
	MOV ah, 09h
	INT 21h	
	
	MOV DL, 10		
	MOV ah, 02h
	INT 21h
	
	LEA DX, DS:[author1]
	MOV ah, 09h
	INT 21h	
	
	MOV DL, 10		
	MOV ah, 02h
	INT 21h
	
	LEA DX, DS:[author2]
	MOV ah, 09h
	INT 21h	
	
	MOV DL, 10		
	MOV ah, 02h
	INT 21h
	
	LEA DX, DS:[program]
	MOV ah, 09h
	INT 21h	
	
	MOV DL, 10		
	MOV ah, 02h
	INT 21h
	
	
	LEA DX, DS:[program1]
	MOV ah, 09h
	INT 21h	
	
	MOV DL, 10		
	MOV ah, 02h
	INT 21h
	
	LEA DX, DS:[program2]
	MOV ah, 09h
	INT 21h	
	
	MOV DL, 10		
	MOV ah, 02h
	INT 21h
	
	LEA DX, DS:[program3]
	MOV ah, 09h
	INT 21h	
	
	MOV DL, 10		
	MOV ah, 02h
	INT 21h
	
	LEA DX, DS:[wtd]
	MOV ah, 09h
	INT 21h	
	
	MOV DL, 10		
	MOV ah, 02h
	INT 21h
	
	; ===============================================
	; ===============================================
	; 		READ   	input1
	; ===============================================
	; ===============================================	
	lea si, DS:[mode]
	mov ah, 01H
	int 21h
	
	mov mode, al
	
	MOV DL, 10		
	MOV ah, 02h
	INT 21h
	
	LEA DX, mode
	MOV ah, 09h
	INT 21h	
	
	
	
	POP BP
	RETF 
ENDP

PRINTNEWLINE:
	MOV DL, 10		
	MOV ah, 02h
	INT 21h

ENDPROGRAM:
	MOV AX,4c00h
	INT 21h
CODM ENDS
END START

