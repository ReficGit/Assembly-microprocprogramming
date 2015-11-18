/**Calculating??absolute??values??
Write a program that calculates absolute values of two’s complement numbers in
registers R0 and R1. The result must be stored in register R0 at the end.
Values in registers R0 and R1 can be either positive or negative. Start your program by
setting initial values to the registers. Test with different signs and magnitudes.
What are the smallest and largest values that your program works without causing an
overflow. Write your answer in comment at the end of your program.
Hints??
NEG-instruction changes the sign of of number in a register.
Test one register at a time for negative/positive. If number is negative then change sign.
Finally add the absolute values. Remember to answer the questions about overflow!
Here is a template for your program:
*/

; The following file contains definitions that make programming
; a little easier. For example names of IO ports are defined in this file

.include "m328Pdef.inc"
.org 0x0000             ; Tells compiler to place instructions starting from address 0

ldi R16, 2
ldi R17, -64
mov R0, R17   
ldi R18, -63
mov R1, R18   

loop:
	tst R16				;If 0, then exit_loop, if not , then skip
	breq exit_loop
	cpi R17, 0			;R17=R0 >= 0??? no - then skip next string
	brmi change_sign
	cpi R18, 0
	brmi change_sign2
	dec R16
	rjmp loop

change_sign:
	NEG R17
	mov R0, R17
	dec R16
	rjmp loop
change_sign2:
	NEG R18
	mov R1, R18
	dec R16
	rjmp loop

exit_loop:	
	ADD R0, R1

FOREVER:
rjmp FOREVER

; the program works with numbers from +-63 to +-64 without causing an overflow