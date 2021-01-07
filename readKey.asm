.model large
DATAM SEGMENT
	hello 				DB 'This program was done by $'
	author1 			DB 'Camner Armand Gabriel$' 
	author2 			DB 'Monica Ioana Vulpe$' 
	program 			DB 'Please Read the following table content in order to run the program:'
	program1 			DB 'Base64$'
	program2 			DB 'Vigenere$' 
	program3 			DB 'Playfair$'
	wtd					DB 'What do you want to do?$'
	input1 	 			DB 30 dup(1) 
	input2				DB 30 dup(2)
	input3				DB 30 dup(3)
DATAM ENDS

STACKSEGMENTM SEGMENT
	startStack label word ; eticheta de 2 bytes ( 16 ) biti care indica adreasa 0000
	dw 124 dup (1)
STACKSEGMENTM ENDS


CODM SEGMENT
ASSUME DS:DATAM,CS:CODM,SS:STACKSEGMENTM
START:
	MOV AX, SEG DATAM
	MOV DS, AX
	MOV AX, seg STACKSEGMENTM
	MOV SS, AX
	MOV SP, offset startStack 
	
	MOV AX, SEG DATAM
	PUSH AX
	LEA AX, input1
	PUSH AX
	
	MOV AX, SEG DATAM
	PUSH AX
	LEA AX, input2
	PUSH AX
	
	MOV AX, SEG DATAM
	PUSH AX
	LEA AX, input3
	PUSH AX
	
	MOV AX, SEG DATAM					; 
	PUSH AX
	
	LEA AX, hello						; 
	PUSH AX
	
	LEA AX, author1
	PUSH AX
	
	LEA AX, author2
	PUSH AX
	
	LEA AX, program
	PUSH AX
	
	LEA AX, program1
	PUSH AX
	
	LEA AX, program2
	PUSH AX
	
	LEA AX, program3
	PUSH AX
	
	LEA AX, wtd
	PUSH AX
		
	CALL FAR PTR ABOUT
	CALL PRINTNEWLINE
	CALL ENDPROGRAM


ABOUT PROC FAR
	PUSH BP
	MOV BP, SP
	LEA DX, SS:[BP+2]
	MOV ah, 09h
	INT 21h	
	CALL PRINTNEWLINE
	LEA DX, SS:[BP+4]
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

