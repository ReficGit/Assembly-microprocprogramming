.include "m328Pdef.inc"
.org 0x0000 ;Places the following code from address 0x0000
RESET: ;Reset Label
		ldi XH, 0x01
		ldi XL, 0x00
		ldi R16, 0
		ldi R19, 32
nollaa:
		st X+, R16
		dec R19
		brne nollaa
		ldi R16, 42
		ldi R17, 0x23
		add R16,R17
		sts 0x100, R16
		mov R0, R16
		ldi R16, -120
		sub R0, R16
		ldi R19, -20
		ldi R20, 19
		add R20, R19
		sts 0x101, R20
		ldi R18, high(1786)
		ldi R19, low(1786)
		ldi R22, high(201)
		ldi R23, low(201)
		add R18, R22
		adc R19, R23
		movw X, R18
		sts 0x102, R17
		sts 0x103, R18
		ldi R16, -20
		add R18, R16
		ldi R19, 1 ; replace 3 with first number of your student number
		ldi R20, 2 ; replace 3 with second number of your student number
		add R19, R20
		ldi R20, 0 ; replace 3 with third number of your student number
		add R19, R20
		ldi R20, 4 ; replace 3 with fourth number of your student number
		add R19, R20
		ldi R20, 1 ; replace 3 with fifth number of your student number
		add R19, R20
		ldi R20, 7 ; replace 3 with sixth number of your student number
		add R19, R20
		ldi R20, 5 ; replace 3 with seventh number of your student number
		add R19, R20
		ldi XH, 0x01
		ldi XL, 0x00
silmu1:
		st X+, R19
		dec R19
		brne silmu1
stop_here:
		rjmp stop_here