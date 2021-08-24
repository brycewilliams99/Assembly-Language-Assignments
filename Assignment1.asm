TITLE: Assembly Assignment #1
;Bryce Williams
;Assignment #1
;10-23-18
;The purpose of this program is to test various exercises for assembly language.  Each exercise has a header to distinguish one another.
 
include Irvine32.inc

.data
	mes1 byte "Enter a number to be reversed.",0ah, 0dh, 0
	str1 byte "The number in reverse order is = ",0								;The data section here is where I stored all the messages and strings used in the different programs.
	mes2 byte "Enter the first integer to find the GCD.",0ah, 0dh, 0
	mes3 byte "Enter the second integer to find the GCD.",0ah, 0dh, 0
	str2 byte "The GCD of the two numbers is = ",0
	mes5 byte "Enter a number to see if it is prime.",0ah, 0dh, 0
	str4 byte "The number entered is a prime number.",0
	str5 byte "The number entered is not a prime number.",0
	mes4 byte "Enter a number to see what its factors are.",0ah, 0dh, 0
	str3 byte "The factors of the number entered are = ",0

	num dword ?																	;num, num1, num2 are all variables that are being defined for the programs.
	num1 dword ?
	num2 dword ?


.code
main proc
;Part 1: Reversing a number.
	lea edx, mes1				;set edx to mes1
	call writeString			;print the string
	
	
	call readDec				;read in user input and set it to eax

	lea edx, str1				;set edx to str1
	call writestring			;print the string
	start:						;start of the while loop
		

		mov edx, 0     ;make edx 0
		mov num, eax	; mov the num into eax
		mov ebx, 10		; move 10 into ebx
	
		div ebx			; divide eax by ebx

		mov num, eax	; mov the quotient into num
	

		mov eax, edx	; mov edx into eax
	

		call writeDec	; print the remainder
		

		mov eax, num	; move eax back into num
		cmp eax, 0		; compare eax to 0
		jg start		; if eax is greater than zero, jump to start
		

	stop:				;end of the while loop
	
		call crlf		;new line

;Part 2: Finding the GCD of two numbers.
	lea edx, mes2		;mov mes2 into edx
	call writestring	;print mes2
	call crlf			;new line

	call readDec		;read in the first integer
	mov num1, eax		;mov the first integer into num1

	lea edx, mes3		;mov mes3 into edx
	call writeString	;print mes3
	call crlf			;new line

	call readDec		;read in the second integer
	mov ebx, eax		;mov the second integer into ebx

	mov eax, num1		;set eax to num1
		
	cmp eax, ebx		;compare eax to ebx
	je bye				;if they are equal to one another, then jump to bye

	go:					;start while loop
		
		cmp eax, ebx	;compare eax to ebx
		jg L1			;if eax is greater than ebx, then jump to L1
		
		sub ebx, eax	;subtract ebx from eax
		jmp L2			;once done, jump to L2

		L1:
			sub eax, ebx	;subtract eax from ebx
		L2:	

		cmp eax, ebx		;compare eax to ebx
		jne go				;if eax and ebx are not equal to each other, then jump to the beginning of the loop

	bye:					;end of the loop
		lea edx, str2		;set edx to str2
		call writestring	;print string
	
		call writeDec		;print number
		call crlf			;new line
	

;Part 3: Print the factors of a number
	
	lea edx, mes4			;set edx to mes4
	call writeString		;print string

	call readDec			;read in user input then set it to eax
	
	mov ecx, eax			;set ecx to eax

	doit:					;start of while loop
		push eax			;push eax into stack
		mov edx, 0			;clear remainder by setting edx to 0
		
		div ecx				;divide eax by ecx

		cmp edx, 0			;compare edx to 0
		jne NotFactor		;if edx is not equal to 0, then jump to NotFactor label

		mov eax, ecx		;set eax to ecx
		call writeDec		;print number

		mov eax, ' '		;set eax to a space
		call writechar		;print the space

		
		
		NotFactor:
		pop eax				;pop eax from the stack

	loop doit				;decrement the counter by 1

	call crlf				;new linec



	
;Part 4: Seeing if a number is prime or not.	
	lea edx, mes5			;set edx to mes5
	call writestring		;print the string

	call readDec			;read in the user input and set it to eax
	start2:					;start of while loop
		mov edx, 0			;set edx to 0 to clear the remainder
		mov num, eax		;set num to eax
		mov ebx, 2			;set ebx to 2

		div ebx				;divide eax by ebx
		
		mov eax, num		;set eax to num

		mov eax, edx		;set eax to edx
		
		cmp eax, 0			;compare eax to 0
		je L3				;if eax is equal to 0, then jump to L3
		jmp L4				;else jump to L4

		L3:
			lea edx, str5	;set edx to str5
			jmp stop2		;jump to the end of the loop
		L4:
			lea edx, str4	;set edx to str4
			jmp stop2		;jump to the end of the loop

		stop2:				;end of the loop
			call writestring	;print string
			call crlf			;new line
		
	
  
	exit						;exit to the operating system
main endp						;end procedure
end main						;end main