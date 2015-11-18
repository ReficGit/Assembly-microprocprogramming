/**Sorting??
Write a program that sorts three unsigned numbers in registers R0, R1 and R2. The
smallest number must be in register R0 and the largest number must be in register R2.
Set initial values to registers at the beginning of your program. Test with many
combinations of numbers of different and equal sizes.
Hints??
You need at least three comaprisons.
1. Compare registers R0 and R1. If R0 is greater exchange values.
2. Compare registers R1(0) and R2. If R1 is greater exchange values.
3. Finally compare registers R0 and R1. If R0 is greater exchange values.*/

.include "m328Pdef.inc"
.org 0x0000 ; Tells compiler to place instructions starting from address 0

ldi R16, 5
mov R0, R16
ldi R16, 3
mov R1, R16
ldi R16, 20
mov R2, R16

	cp R0, R1           ;If R0 >= R1
	brsh change_1
next:
	cp R1, R2			;If R1 >= R2
	brsh change_2
next2:
	cp R0, R1
	brsh change_3
	rjmp forever
	

change_1:
	mov R16, R0
	mov R0, R1
	mov R1, R16
	rjmp next

change_2:
	mov R16, R1
	mov R1, R2
	mov R2, R16
	rjmp next2

change_3:
	mov R16, R0
	mov R0, R1
	mov R1, R16
	rjmp forever



FOREVER:
rjmp FOREVER