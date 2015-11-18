; The following file contains definitions that make programming
; little easier. For example names of IO ports are defined in this file
.include "m328Pdef.inc"
.org 0x0000 ; Tells compiler to place instructions starting from address 0
//rjmp RESET
						; If program uses interrupt then interrupt vectors are
						; palced here. Therefore the first instruction is a jump
						; to start of program.
						; If interrupts are not used the jump can be removed
RESET:					;Reset Label 0001 0001 0x11 red and green 0000 0110 0x06
						; Initialize stack pointer
						; By Maksim Sisov
ldi R16, high(ramend)
out SPH, R16
ldi R16, low(ramend)
out SPL, R16
ldi R19, 0x02
		
rcall hwinit ; call subroutine that initializes IO-ports

main_loop:
	cpse R18, R19
	rcall buttons
	cp R18, R19
	breq change_light
continue:
	rjmp main_loop
	
stop_here:
	rjmp stop_here

; Read buttons
; combines values from two ports and
; inverts polarity so that one indicates that button is pressed
buttons:
	push R17
	in R17, PIND		; read PIND
	com R17
	mov R18, R17
	pop R17	
	ret

change_light:
	ldi R16, 0xE9   
	out PORTB, R16
	rcall delay		//5sec delay showing red for ped-s and yellow for cars
	ldi R16, 0xE6
	out PORTB, R16	//delay 15 sec when for ped is green and for cars it is red
	rcall delay15sec
	ldi R16, 0xE9
	out PORTB, R16	//show red for ped and yellow for cars
	rcall delay		// delay 5 sec
	ldi R16, 0xF1 
	out PORTB, R16	//show red for ped and green for cars
	ldi R18, 0		// save 0 to R18 in case of accidentelly the pushed button
	rcall delay15sec //delay 15 sec with checking the button. if pushed while delay, it will change the lights after full delay of 15 sec.
	rjmp continue


hwinit:				; Initialize input and output ports
	ldi R16, 0
	sts UCSR0B, R16 ; disable UASRT0

	out DDRD, R16	; Port D is input
	ldi R16, 0xFF
	out PORTD, R16	; writing ones to input port enables pull-ups

	ldi R16, 0xFF
	out DDRB, R16	; Port B is output
	ldi R16, 0xF1 
	out PORTB, R16	; writing ones to input port enables pull-ups

	ret


delay15sec:	
	rcall delay
	rcall delay
	rcall delay
	ret

delay:
	push R20
	ldi R16, 250
ddloop:
	rcall delay20ms
	dec R16
	brne ddloop
	pop R16
	ret

delay20ms:
	push XH
	push XL
	cpse R18, R19
	rcall buttons		//check button
	ldi XH, 0
	ldi XL, 0

deloop:
	nop
	adiw X, 1
	brcc deloop
	pop XL
	pop XH
	ret
