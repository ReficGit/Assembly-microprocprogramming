/*
* Loop
* Write a program that calculates the sum of ten successive numbers. The first number
* must be the last digit of your student number. Use a loop to calculate the sum.
*/

/*.include "m328Pdef.inc"
.org 0x0000

ldi R16, 5
ldi R17, 10
ldi R18, 0
mov R0, R18

loop:
	tst R17
	breq FOREVER
	add R0, R16
	dec R17
	inc R16
	rjmp loop

FOREVER:
rjmp FOREVER
*/

/*
* Comparisons??
* Write a program that reserves 32 bytes of RAM and writes a sequence of unsigned
* numbers to the reserved area. Then the program calculates how many of the numbers is
* greater than 100.
* The sequence of number is calculated as follows:
* Initialize R16 to 1.
* On every round add 57 to R16 and then write result to memory. Ignore all types of
* overflow.
*/

.include "m328Pdef.inc"
.org 0x0000

ldi XH, high(my_table)
ldi XL, low(my_table)
ldi R16, 1
ldi R20, 0
mov R0, R20
ldi R31, 57
ldi R30, 32

loop:	
	tst R30
	breq exit
	ld R17, X
	st X+, R16
	add R16, R31
	dec R30
	brne loop
	
exit:
 rjmp exit
.dseg
my_table:
	.byte 1
