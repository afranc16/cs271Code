/*
Using Arithmetic and Logical Shifts on final operand in other instructions

Cool feature of ARM influenced by architecture. You may use these if you want
but are not required to and will not be tested on them
*/

_start:

MOV   r1, #0x5
@Take r1, left shift value by 1 bit (multiplies by 2) and move into r2
MOV   r2, r1, LSL #1       @r2 = r1 * 2
LSL   r2, r1, #1           @Same!!!


@Use ASR 2 bits to divide by 4 while moving value
MOV   r3, #-100
MOV   r4, r3, ASR #2       @r4 = r3 / 4

@Use use LSL 2 bits to multiply value of r8 by 4 while adding to itself
@  to produce 5 * r8
MOV   r8, #3
ADD   r9, r8, r8, LSL #2   @r9 = r8 + r8 * 4
                           @   = 5 * r8

@Calculate (2 * r5) - r6 in one line using LSL and ReverseSuBtract
MOV   r5, #6
MOV   r6, #9
RSB   r7, r6, r5, LSL #1   @r7 = r5 * 2 - r6

@Halt program
SWI   0x11
