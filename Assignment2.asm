TITLE: Assignment #2
;Bryce Williams
;COSC 220
;10/31/18
;The purpose of this program is to calculate the price of a vacation package depending on how many people plan on attending.

 
include Irvine32.inc

.data
	mes1 byte "Which vacation is being planned?",0ah, 0dh, 0
	vac1 byte "For Devil's Courthouse Adventure enter 1.",0ah, 0dh, 0
	vac2 byte "For Scuba Bahama enter 2.",0ah, 0dh, 0
	vac3 byte "For Sky Dive Colorado enter 3.",0ah, 0dh, 0
	vac4 byte "For Barron Cliff Spelunk enter 4.",0ah, 0dh, 0
	mes2 byte "How many people are attending?",0ah, 0dh, 0
	str1 byte "How many need instructions?",0ah, 0dh, 0
	str2 byte "How many days is the equipment going to be used for?",0ah, 0dh, 0						;All the different strings and messages used in the program.
	str3 byte "How many need equipment?",0ah, 0dh, 0
	str4 byte "How many days is the vacation?",0ah, 0dh, 0
	error byte "That is not a valid option!",0
	mes3 byte "The total cost of the vacation will be = ",0
	depositmes byte "Since your party is 5 or more, the required deposit will be = ",0
	logw byte "How many are staying at Wilderness Lodge?",0ah, 0dh, 0
	logl byte "How many are staying at Luxury Inn?",0ah, 0dh, 0

	
	people dword ?								
	instructions dword ?
	rentals dword ?
	totalcost dword 0									;Different variables that were used in the program defined.
	equipcost dword ?
	days dword ?
	hotelcost dword ?

.code
main proc
	
	lea edx, mes1			;set edx to mes1
	call writestring		;print mes1
	call crlf				;new line

	lea edx, vac1			;set edx to vac1
	call writestring		;print vac1
	
	lea edx, vac2			;set edx to vac2
	call writestring		;print vac2

	lea edx, vac3			;set edx to vac3
	call writestring		;print vac3

	lea edx, vac4			;set edx to vac4
	call writestring		;print vac4

	call crlf				;new line

	call readDec			;read in users choice of vacation.
	
	start:
	cmp eax, 1				;if users choice was not devil court, then jump to choice 2.
	je L1
	jne choice2
		L1:
		call devilcourt
		jmp stop

	choice2:
	cmp eax, 2				;if users choice was not scuba, then jump to choice 3
	je L2
	jne choice3
		L2:
		call scubaba
		jmp stop
		
	choice3:
	cmp eax, 3				;if users choice was not skydive, then jump to choice 4
	je L3
	jne choice4
		L3:
		call skydive
		jmp stop

	choice4:
	cmp eax, 4				;if users choice was not barron cliff, then jump to the error message.
	je L4
	jne errormes1
		L4:
		call barroncliff
		jmp stop

	errormes1:
	lea edx, error			;error message.
	call writestring
	call crlf
	jmp stop

	stop:

	exit
main endp

devilcourt proc					;start of the devil court procedure
	lea edx, mes2				;set edx to mes2
	call writestring			;print mes2

	call readDec				;user input
	mov people, eax				;set eax to people
	cmp eax, 5					;check to see if party was greater than or equal to 5
	jge more3					;if greater than or equal, then jump to more3
	jmp below3					;else jump below3

	more3:
		mov ebx, 850			;set ebx to  850
		mul ebx					;multiply people by 850
		mov totalcost, eax		;set eax to totalcost

		mov eax, people			;set people to eax
		mov ebx, 10				;set 10 to ebx
		mul ebx					;multiply eax and ebx

		sub totalcost, eax		;subtract eax from totalcost

		lea edx, str1			;set edx to str1
		call writestring		;print str1
	
		call readDec			;user input
		mov ebx, 100			;set 100 to ebx
		mul ebx					;mul ebx to eax
	
		add totalcost, eax		;add eax to totalcost

		lea edx, str3			;set str3 to edx
		call writestring		;print str3

		call readDec			;user input

		mov ebx, 60				;set 60 to ebxc
		mul ebx					;multiply ebx and eax
		mov equipcost, eax		;mov eax to equipcost

		lea edx, str2			;set str2 to edx
		call writestring		;print str2
		call readdec			;user input
		mov ebx, equipcost		;set equipcost to ebx

		mul ebx					;multiply eax and ebx

		add eax, totalcost		;add eax to totalcost

		lea edx, mes3			;set edx to mes3
		call writestring		;print mes3
		call writedec			;print the result
		call crlf				;new line

		mov edx, 0				;mov 0 to edx
		mov totalcost, eax		;mov totalcost to eax
		mov ebx, 2				;mov 2 to eax
		div ebx					;divide eax and ebx

	

		lea edx, depositmes		;set depositmes to edx
		call writestring		;print depositmes
		call writedec			;print result
		call crlf				;new line

		ret						;return to main procedure

	below3:
		mov ebx, 850			;All of this is the same as more3 minus the division portion.
		mul ebx			
		mov totalcost, eax

	
		lea edx, str1
		call writestring
	
		call readDec
		mov ebx, 100
		mul ebx
	
		add totalcost, eax

		lea edx, str3
		call writestring

		call readDec

		mov ebx, 60
		mul ebx
		mov equipcost, eax

		lea edx, str2
		call writestring
		call readdec
		mov ebx, equipcost

		mul ebx

		add eax, totalcost

		lea edx, mes3
		call writestring
		call writedec
		call crlf

		ret
	

devilcourt endp

scubaba proc					;start of the scuba bahama procedure
	lea edx, mes2				;set edx to mes2
	call writestring			;print mes2

	call readDec				;read user input
	mov people, eax				;move eax to people
	cmp eax, 5					;compare to see if the party is greater than or equal to 5
	jge more1					;if the party is greater than or equal to, then jump to more1
	jmp below1					;if the party is less than 5, then jump to below1

	more1:
		
		mov ebx, 2500			;set 2500 to ebx
		mul ebx					;multiply eax to ebx
		mov totalcost, eax		;set eax to totalcost

		mov eax, people			;set people to eax
		mov ebx, 10				;set 10 to ebx
		mul ebx					;multiply ebx to eax

		sub totalcost, eax		;subtract eax from totalcost

		lea edx, str1			;set str1 to edx
		call writestring		;print str1

		call readDec			;read user input
		mov ebx, 100			;set 100 to ebx
		mul ebx					;multiply ebx to eax
		add totalcost, eax		;add eax to totalcost

		lea edx, mes3			;set mes3 to edx
		call writestring		;print mes3
		call writedec			;print result
		call crlf				;new line

		mov edx, 0				;move 0 to edx
		mov totalcost, eax		;set eax to totalcost
		mov ebx, 2				;set 2 to ebx
		div ebx					;divide eax by ebx

	

		lea edx, depositmes		;set depositmes to edx
		call writestring		;print depositmes
		call writedec			;print result
		call crlf				;new line

		ret						;return to main procedure
		

	below1:							;All of this is the same as more1 minus the division portion.
		mov ebx, 2500
		mul ebx
		mov totalcost, eax

		lea edx, str1
		call writestring

		call readDec
		mov ebx, 100
		mul ebx
		add eax, totalcost
	

		lea edx, mes3
		call writestring
		call writedec
		call crlf

		ret


scubaba endp

skydive proc						;start of the skydive procedure

	lea edx, mes2					;set edx to mes2
	call writestring				;print mes2

	call readDec					;read user input
	mov people, eax					;set people to eax
	cmp eax, 5						;check to see if party is greater than or equal to 5
	jge more4						;if greater than or equal, jump to more4
	jmp below4						;if less than, jump to below4
	more4:

		mov ebx, 600					;set 600 to ebx
		mul ebx							;multiply ebx to eax
		mov totalcost, eax				;set eax to totalcost


		lea edx, logw					;set logw to edx
		call writestring				;print logw

		call readDec					;read user input
		mov ebx, 85						;set ebx to 85
		mul ebx							;multiply eax to ebx

		mov ebx, 4						;set 4 to ebx
		mul ebx							;multiply eax to ebx
	
		add totalcost, eax				;add eax to totalcost

		lea edx, logl					;set logl to edx
		call writestring				;print logl

		call readDec					;read user input
		mov ebx, 140					;move 140 to ebx
		mul ebx							;multiply ebx to eax

		mov ebx, 4						;move 4 to ebx
		mul ebx							;multiply ebx to eax

		add eax, totalcost				;add totalcost to eax

		lea edx, mes3					;move edx to mes3
		call writestring				;print mes3
		call writedec					;print result
		call crlf

		mov edx, 0						;mov 0 to edx
		mov totalcost, eax				;mov eax to totalcost
		mov ebx, 2						;mov 2 to ebx
		div ebx							;divide eax by ebx

	

		lea edx, depositmes				;move depositmes to edx
		call writestring				;print depositmes
		call writedec					;print result
		call crlf						;new line

		ret								;return to main procedure


	below4:

		mov ebx, 600					;set 600 to ebx
		mul ebx							;multiply ebx to eax
		mov totalcost, eax				;set eax to totalcost


		lea edx, logw					;set logw to edx
		call writestring				;print logw

		call readDec					;read user input
		mov ebx, 85						;set ebx to 85
		mul ebx							;multiply eax to ebx

		mov ebx, 4
		mul ebx
	
		add totalcost, eax

		lea edx, logl					;set logl to edx
		call writestring				;print logl

		call readDec					;read user input
		mov ebx, 140
		mul ebx

		mov ebx, 4
		mul ebx

		add eax, totalcost

		lea edx, mes3
		call writestring
		call writedec
		call crlf

		ret


skydive endp

barroncliff proc						;start of the barron cliff procedure

	lea edx, mes2						;set mes2 to edx
	call writestring					;print mes2

	call readDec						;read user input
	mov people, eax						;set eax to people
	cmp eax, 5							;compare the party size to 5
	jge more2							;if greater than or equal to 5, then jump to more2
	jmp below2							;if less than 5, then jump to below2

		more2:

			mov ebx, 1050				;set 1050 to ebx
			mul ebx						;multiply eax to ebx
			mov totalcost, eax			;set eax to totalcost

			mov eax, people				;set people to eax
			mov ebx, 10					;set 10 to ebx
			mul ebx						;multiply eax to ebx

			sub totalcost, eax			;subtract eax from totalcost

			lea edx, str3				;set str3 to edx
			call writestring			;print str3
			
			call readDec				;read user input

			mov ebx, 80					;set 80 to ebx
			mul ebx						;multiply ebx to eax
			mov equipcost, eax			;set eax to equipcost

			lea edx, str2				;set str2 to edx
			call writestring			;print str2
			call readdec				;read user input
			mov ebx, equipcost			;set equipcost to ebx

			mul ebx						;multiply ebx to eax

			add eax, totalcost			;add totalcost to eax

			lea edx, mes3				;set mes3 to edx
			call writestring			;print mes3
			call writedec				;print result
			call crlf					;new line

			mov edx, 0					;set 0 to edx
			mov totalcost, eax			;set eax to totalcost
			mov ebx, 2					;set 2 to ebx
			div ebx						;divide eax by ebx

	

			lea edx, depositmes			;set depositmes to edx
			call writestring			;print depositmes
			call writedec				;print result
			call crlf					;new line

			ret							;return result to main procedure

		below2:							;All of this is the same as more2 minus the division portion.

			mov ebx, 1050
			mul ebx
			mov totalcost, eax

			lea edx, str3
			call writestring

			call readDec

			mov ebx, 80
			mul ebx
			mov equipcost, eax

			lea edx, str2
			call writestring
			call readdec
			mov ebx, equipcost

			mul ebx

			add eax, totalcost

			lea edx, mes3
			call writestring
			call writedec
			call crlf

			ret

barroncliff endp


end main