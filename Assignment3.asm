TITLE: Assignment #3
;Bryce Williams
;COSC 220
;The purpose of this program is to scan, move, store, and load strings.

include Irvine32.inc

.data

	str1 byte "Pack my red box with five dozen quality jugs",0
	str2 byte 50 DUP (?)
	str5 byte 'five'
	str7 byte 'quality'
	str8 byte 'red'
	


	mes1 byte "For moving a string to another string, enter 1.",0ah, 0dh, 0
	mes2 byte "To scan a string to find five to be replaced, enter 2.",0ah, 0dh, 0
	mes3 byte "To search a string to replace red, enter 3.",0ah, 0dh, 0
	mes4 byte "To scan the string to replace quality, enter 4.", 0ah, 0dh, 0
	mes5 byte "To reverse a string, enter 5.",0ah, 0dh, 0										;List of all the messages and strings used in the program.
	mes6 byte "To count how many vowels there are, enter 6.", 0ah, 0dh, 0

	mes7 byte "The content in str2 is: ",0
	mes8 byte "The sub-string is found at position: ,0"
	mes9 byte "The beginning of the sub-string starts at position: ",0

	mes10 byte "The original string was: ",0
	mes11 byte "The string in reverse is:",0

	mes12 byte "There are ",0
	mes13 byte " vowels in the string.",0
	mes14 byte "There is a mismatch!",0ah,0dh,0

	count dword 0

.code
main proc
	start:
		lea edx, mes1			;set edx to the beginning of mes1
		call writestring		;print mes1
		call crlf				;new line

		lea edx, mes2			;set edx to the beginning of mes2
		call writestring		;print mes2
		call crlf				;new line
	
		lea edx, mes3			;set edx to the beginning of mes3
		call writestring		;print mes3
		call crlf				;new line

		lea edx, mes4			;set edx to the beginning of mes4
		call writestring		;print mes4
		call crlf				;new line

		lea edx, mes5			;set edx to the beginning of mes5
		call writestring		;print mes5
		call crlf				;new line

		lea edx, mes6			;set edx to the beginning of mes6
		call writestring		;print mes6
		call crlf				;new line

		call readDec			;read user's input

		cmp eax, 1				;compare eax to 1
		je movstr				;if equal then go to movstr
		cmp eax, 2				;compare eax to 2
		je fivetofour			;if equal then go to fivetofour
		cmp eax, 3				;compare eax to 3
		je redtoblue			;if equal then go to redtoblue
		cmp eax, 4				;compare eax to 4
		je qualitytoliquor		;if equal then go to qualitytoliquor
		cmp eax, 5				;compare eax to 5
		je reverse				;if equal then go to reverse
		cmp eax, 6				;compare eax to 6
		je vowelcount			;if equal then go to vowel count
		

	stop:

	exit
main endp

movstr proc

	lea esi, str1				;move to the beginning of str1
	lea edi, str2				;move to the beginning of str2

	mov ecx, lengthof str1		;set ecx to the length of str1
	cld							;automatically increment the str1
	rep movsb					;data will be moved from str1 to str2

	mov edi, offset str2		;set edi to the beginning of str2
	mov ecx, lengthof str1		;set ecx to the length of str1

	mov edx, offset mes7		;set edx to the beginning of mes7
	call writestring			;print str7

	movstr2:			

		mov eax, [edi]			;point eax to edi

		call writechar			;print character from the string
		add edi, type str2		;add the character to str2
		loop movstr2			;loop movstr2
		call crlf				;new line

	ret							;return to main

movstr endp

fivetofour proc

	mov edi, offset str1		;set edi to the beginning of str1
	mov ecx, lengthof str1		;set ecx to the length of str1
	cld							;automatically increment throught the string

	mov al, 'f'					;set al to the letter f
	repne scasb					;scan for f
	je match					;if f is found, jump to match

	match:
		mov al, 'o'				;set al to the letter o
		stosb					;store o
		mov al, 'u'				;set al to the letter u
		stosb					;store u
		mov al, 'r'				;set al to the letter r
		stosb					;store r

		mov edx, offset str1	;set edx to the beginning of str1
		call  writestring		;print string
		call crlf				;new line
		

	ret							;return

fivetofour endp

redtoblue proc

	mov edi, offset str1		;set edi to the beginning of str1
	mov ecx, lengthof str1		;set ecx to the length of str1
	cld							;automatically increment through the string

	mov al, str8				;set al to str8
	repne scasb					;scan through the string for blue
	je match3

	match3:
	
		dec edi					;decrement edi
		mov al, 'b'				;set al to the letter b
		stosb					;store b
		mov al, 'l'				;set al to the letter l
		stosb					;store l
		mov al, 'u'				;set al to the letter u
		stosb					;store u
		mov al, 'e'				;set al to the letter e
		stosb					;store e

	mov edx, offset str1		;set edx to the beginning of str1
	call writestring			;print str1
	call crlf					;new line

	ret							;return

redtoblue endp


qualitytoliquor proc

	mov edi, offset str1		;set edi to the beginning of str1
	mov ecx, lengthof str1		;set ecx to the length of str1
	cld							;automatically increment through the string

	mov al, str7				;set al to str7
	repne scasb					;scan through the string to find the substring str7

	je match2					;jump to match2 if the substring is found

	match2:
		dec edi					;decrement edi
		mov al, 'l'				;set al to the letter l
		stosb					;store l
		mov al, 'i'				;set al to the letter i
		stosb					;store i
		mov al, 'q'				;set al to the letter q
		stosb					;store q
		mov al, 'u'				;set al to the letter u
		stosb					;store u
		mov al, 'o'				;set al to the letter o
		stosb					;store o
		mov al, 'r'				;set al to the letter r
		stosb					;store r
		mov al, ' '				;set al to a space
		stosb					;store the space
		

	mov edx, offset str1		;set edx to the beginning of str1
	call writestring			;print the string
	call crlf					;new line

	ret							;return

qualitytoliquor endp

reverse proc
	lea edx, mes10				;set edx to the beginning of mes10
	call writestring			;print the string

	lea edx, str1				;set edx to the beginning of str1
	call writestring			;print str1
	call crlf					;new line

	lea esi, str1				;set esi to the beginning of str1
	mov ecx, lengthof str1		;set ecx to the length of str1
	start5:
		mov eax, [esi]			;set eax to the pointer of esi
		push eax				;push eax
		inc esi					;increment esi
		loop start5				;loop start5

	mov edx, offset mes11		;set edx to the beginning of mes11
	call writestring			;print mes11

	mov ecx, lengthof str1		;set ecx to the length of str1
	start5pt2:
		pop eax					;pop eax
		call writechar			;print the character
		loop start5pt2			;loop start5pt2

		call crlf				;new line
		ret						;return

reverse endp

vowelcount proc

	mov esi, offset str1		;set esi to the beginning of str1
	mov ecx, lengthof str1		;set ecx to the length of str1

	start6:
		lodsb					;load the memory from the string

		cmp al, 'a'				;compare al to the letter a
		je L6					;if equal jump to L6
		cmp al, 'e'				;compare al to the letter e
		je L6					;if equal jump to L6
		cmp al, 'i'				;compare al to the letter i
		je L6					;if equal jump to L6
		cmp al, 'o'				;compare al to the letter o
		je L6					;if equal jump to L6
		cmp al, 'u'				;compare al to the letter u
		je L6					;if equal jump to L6
		jne L7					;if not equal jump to L7

		L6:
			inc count			;increment count
			loop start6			;loop start6

		L7:
			loop start6			;loop start6
	
	stop6:

		mov edx, offset mes12	;set edx to the beginning of mes12
		call writestring		;print mes12

		mov eax, count			;set eax to count
		call writedec			;print eax

		mov edx, offset mes13	;set edx to the beginning of mes13
		call writestring		;print mes13
		call crlf				;new line

	ret							;return
vowelcount endp
end main