MODEL small
.STACK 100h

.DATA
	hello DB 'This program was done by $'
	author1 DB 'Camner Armand Gabriel$' 
	author2 DB 'Monica Ioana Vulpe$' 
	program DB 'Please Read the following table content in order to run the program:'
	program1 DB 'Base64$'
	program2 DB 'Vigenere$' 
	program3 DB 'Playfair$'
.CODE

main PROC
	; MOV DATA into AX registry
	mov ax, @DATA
	mov ds, ax
	LEA dx, hello
	; 09h to print on screen
	mov ah, 09h
	int 21h	
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	; mov dl,10 , ah 02h directive to print on new line
	mov dl, 10		
	mov ah, 02h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
		
	lea dx, author1
	mov ah, 09h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	; mov dl,10 , ah 02h directive to print on new line
	mov dl, 10		
	mov ah, 02h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	lea dx, author2
	mov ah, 09h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	; mov dl,10 , ah 02h directive to print on new line
	mov dl, 10		
	mov ah, 02h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	lea dx, program
	mov ah, 09h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	; mov dl,10 , ah 02h directive to print on new line
	mov dl, 10		
	mov ah, 02h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	lea dx, program1
	mov ah, 09h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	; mov dl,10 , ah 02h directive to print on new line
	mov dl, 10		
	mov ah, 02h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	lea dx, program2
	mov ah, 09h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	; mov dl,10 , ah 02h directive to print on new line
	mov dl, 10		
	mov ah, 02h
	int 21h
	
	; empty the dx registry in order to print new line
	xor dx,dx
	
	lea dx, program3
	mov ah, 09h
	int 21h	
	
	; EXIT
    mov ax, 4C00h       ; AH=4Ch, AL=00h -> exit (0)
    int 21h             ; Call MSDOS
main ENDP

END main