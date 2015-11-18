; The following file contains definitions that make programming
; a little easier. For example names of IO ports are defined in this file

.include "m328Pdef.inc"

.org 0x0000 ; Tells compiler to place instructions starting from address 0

; Write your program here

;R0 = (R2 + R3) * (R4 + (R3 * R5)).

 LDI R16, 4
 MOV R2, R16
 LDI R16, 1
 MOV R3, R16
 LDI R16, 7
 MOV R4, R16
 LDI R16, 5
 MOV R5, R16

 ADD R2, R3
 MUL R3, R5
 ADD R4, R0
 MUL R2, R4

; Do not write anything after this line
; This is an infinite loop that prevents CPU from going in to
; area which does not contain instructions

FOREVER:
rjmp FOREVER
 
 
 
 

	


