/*Write a program that initializes registers R16, R17, R1, R0, R18 and R19. Use the following
numbers as initial values for the registers (in specified order): 12, 7, 3, 9, 5, 8. When
registers are initialized the program performs following calculation:
R1:R0 = (R16 * R17) + R1:R0 – (R18*R19).
Note that the result of multiplication is always stored in registers R1:R0. This means that
you have to copy intermediate results in to temporary registers. You can choose the
temporary registers any way you like from R0 – R31.
Here is a template for your program:
*/

; The following file contains definitions that make programming
; little easier. For example names of IO ports are defined in this file
;821

.include "m328Pdef.inc"
.org 0x0000					
; Tells compiler to place instructions starting from address 0
; Write your program here

LDI R16, 12
LDI R17, 7
LDI R26, 3
MOV R1, R26     
LDI R25, 9
MOV R0, R25      
LDI R18, 5
LDI R19, 8

MUL R16, R17
ADD R0, R25
ADC R1, R26
MOV R25, R0
MOV R26, R1
MUL R18, R19
SUB R25, R0
SBC R26, R1 
MOV R0, R25
MOV R1, R26

; Do not write anything after this line
; This is an infinite loop that prevents CPU from going in to
; area which does not contain instructions

FOREVER:
rjmp FOREVER