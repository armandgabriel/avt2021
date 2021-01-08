.model large
DATAM SEGMENT
	hello 				DB 'This program was done by $'
	author1 			DB 'Camner Armand Gabriel$' 
	author2 			DB 'Monica Ioana Vulpe$' 
	program 			DB 'Programs:$'
	program1 			DB 'Base64$'
	program2 			DB 'Vigenere$' 
	program3 			DB 'Playfair$'
	wtd					DB 'What do you want to do?$'
	input1 	 			DB 16 dup(1) 
	input2				DB 16 dup(2)
	input3				DB 16 dup(3)
DATAM ENDS

STACKSEGMENTM SEGMENT
	DW 100 dup (?)
	startStack label word ; eticheta de 2 bytes ( 16 ) biti care indica adreasa 0000
STACKSEGMENTM ENDS


CODM SEGMENT
ASSUME CS:CODM,SS:STACKSEGMENTM,DS:DATAM
START:
	MOV AX, DATAM
	MOV DS, AX
	
	MOV AX, STACKSEGMENTM
	MOV SS, AX
	lea AX, startStack 
	MOV SP, AX
	
	MOV AX,  DATAM           	;0
	PUSH AX
	LEA AX, input1				;1
	PUSH AX
	
	;MOV AX, SEG DATAM			;2
	;PUSH AX
	;LEA AX, input2				;3
	;PUSH AX
	
	;MOV AX, SEG DATAM			;4
	;PUSH AX
	;LEA AX, input3				;5
	;PUSH AX
	
	;MOV AX, SEG DATAM			;6	
	;PUSH AX
	
	;LEA AX, hello				;7	
	;PUSH AX
	
	;LEA AX, author1				;8
	;PUSH AX
	
	;LEA AX, author2				;9
	;PUSH AX
	
	;LEA AX, program				;10
	;PUSH AX
	
	;LEA AX, program1			;11
	;PUSH AX
	
	;LEA AX, program2			;12
	;PUSH AX
	
	;LEA AX, program3			;13
	;PUSH AX
	
	;LEA AX, wtd					;14
	;PUSH AX
		
	CALL FAR PTR ABOUT
	CALL PRINTNEWLINE
	CALL ENDPROGRAM


ABOUT PROC FAR
	PUSH BP
	MOV BP, SP
	LEA DX, SS:[BP+1]
	MOV ah, 09h
	INT 21h	
	POP BP
	CALL PRINTNEWLINE
	PUSH BP
	LEA DX, SS:[BP+2]
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

