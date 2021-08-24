TITLE: Assignment #4
;The purpose of this program is to incorporate a macro, color, object, and moving the object

;Bryce Williams
;COSC 220
;Assignment #4

include Macros.inc
include Irvine32.inc

hface Macro

.data

	mes1 byte  "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",0dh, 0ah, 0
	mes2 byte  "$           ooooooo           $",0dh, 0ah, 0
	mes3 byte  "$         o         o         $",0dh, 0ah, 0
	mes4 byte  "$       o             o       $",0dh, 0ah, 0
	mes5 byte  "$     oo                o     $",0dh, 0ah, 0
	mes6 byte  "$    oo     G     G      oo   $",0dh, 0ah, 0
	mes7 byte  "$  oo                     oo  $",0dh, 0ah, 0
	mes8 byte  "$ ooo           _\        ooo $",0dh, 0ah, 0
	mes9 byte  "$  oo                     oo  $",0dh, 0ah, 0
	mes10 byte "$    oo     \____/      oo    $",0dh, 0ah, 0
	mes11 byte "$     oo               oo     $",0dh, 0ah, 0
	mes12 byte "$       o             o       $",0dh, 0ah, 0
	mes13 byte "$        o           o        $",0dh, 0ah, 0
	mes14 byte "$          ooooooooo          $",0dh, 0ah, 0
	mes15 byte "$            HAPPY            $",0dh, 0ah, 0
	mes16 byte "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",0dh, 0ah, 0

.code

	push eax
	mov eax, yellow
	call settextcolor
	pop eax
																				;Code and data for the macro hface, which is the first face that will be printed.
	call Gotoxy
	push edx
	lea edx, mes1
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes2
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes3
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes4
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes5
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes6
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes7
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes8
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes9
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes10
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes11
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes12
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes13
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes14
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes15
	call writestring
	pop edx
	inc dh
	call Gotoxy

	lea edx, mes16
	call writestring
	call crlf

	endM

.data
	

	mes17 byte  "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",0dh, 0ah, 0
	mes18 byte  "$           ooooooo           $",0dh, 0ah, 0
	mes19 byte  "$         o         o         $",0dh, 0ah, 0
	mes20 byte  "$       o             o       $",0dh, 0ah, 0
	mes21 byte  "$     oo                o     $",0dh, 0ah, 0
	mes22 byte  "$    oo     G     G      oo   $",0dh, 0ah, 0
	mes23 byte  "$  oo                     oo  $",0dh, 0ah, 0
	mes24 byte  "$ ooo           _\        ooo $",0dh, 0ah, 0
	mes25 byte  "$  oo                     oo  $",0dh, 0ah, 0
	mes26 byte  "$    oo     ______      oo    $",0dh, 0ah, 0
	mes27 byte  "$     oo               oo     $",0dh, 0ah, 0
	mes28 byte  "$       o             o       $",0dh, 0ah, 0
	mes29 byte  "$        o           o        $",0dh, 0ah, 0
	mes30 byte  "$          ooooooooo          $",0dh, 0ah, 0
	mes31 byte  "$           NEUTRAL           $",0dh, 0ah, 0
	mes32 byte  "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",0dh, 0ah, 0

	mes33 byte  "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",0dh, 0ah, 0
	mes34 byte  "$           ooooooo           $",0dh, 0ah, 0
	mes35 byte  "$         o         o         $",0dh, 0ah, 0
	mes36 byte  "$       o             o       $",0dh, 0ah, 0
	mes37 byte  "$     oo                o     $",0dh, 0ah, 0
	mes38 byte  "$    oo     G     G      oo   $",0dh, 0ah, 0
	mes39 byte  "$  oo                     oo  $",0dh, 0ah, 0
	mes40 byte  "$ ooo           _\        ooo $",0dh, 0ah, 0
	mes41 byte  "$  oo                     oo  $",0dh, 0ah, 0
	mes42 byte  "$    oo     _____        oo   $",0dh, 0ah, 0
	mes43 byte  "$     oo   /     \     oo     $",0dh, 0ah, 0
	mes44 byte  "$       o             o       $",0dh, 0ah, 0
	mes45 byte  "$        o           o        $",0dh, 0ah, 0
	mes46 byte  "$          ooooooooo          $",0dh, 0ah, 0
	mes47 byte  "$             SAD             $",0dh, 0ah, 0
	mes48 byte  "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",0dh, 0ah, 0

	row db ?
	col db ?

.code
main proc
	mov ecx, 2
	
	L1:
		call clrscr				;clear screen
		mov dh, 2				;mov dh to 2
		mov dl, 10				;mov dl to 10
		call Gotoxy				;call Gotoxy procedure
		
		hface					;call hface macro
		
		mov eax, 500			;set eax to 500
		call Delay				;call delay procedure

		mov dh, 2				;set dh to 2
		mov dl, 20				;set dl to 20
		call clrscr				;clear screen
		call nface				;call nface procedure
	
		mov eax, 500			;set eax to 500
		call Delay				;call delay procedure

		mov dh, 2				;set dh to 2
		mov dl, 30				;set dl to 30
		
		call Gotoxy				;call Gotoxy procedure
		
		call sface				;call sface procedure
		

		mov eax, 500			;set eax to 500
		call delay				;call delay procedure
		jmp L1					;jump back to L1 to cause infinite loop4
	exit
main endp


nface proc

	call clrscr

	push eax
	mov eax, green
	call settextcolor
	pop eax
	
	call Gotoxy
	push edx
	lea edx, mes17
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes18
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes19
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes20
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes21
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes22
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes23
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes24
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes25
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes26
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes27
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes28
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes29
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes30
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes31
	call writestring
	pop edx
	inc dh
	call Gotoxy

	lea edx, mes32
	call writestring
	call crlf

	ret

nface endp

sface proc

	call clrscr

	push eax
	mov eax, blue
	call settextcolor
	pop eax

	call Gotoxy
	push edx
	lea edx, mes33
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes34
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes35
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes36
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes37
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes38
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes39
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes40
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes41
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes42
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes43
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes44
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes45
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes46
	call writestring
	pop edx
	inc dh
	call Gotoxy

	push edx
	lea edx, mes47
	call writestring
	pop edx
	inc dh
	call Gotoxy

	lea edx, mes48
	call writestring
	call crlf

	ret

sface endp

end main