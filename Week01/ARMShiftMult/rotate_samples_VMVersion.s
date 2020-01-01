/*
Using Rotate Right
In a Rotate, bits that "fall off" are wrapped around
*/

_start:

MOV   r1, #0x12      @ r1 = 0000 0000 ... 0000 0001 0010
@ROR   r2, r1, #1     @ r2 = 0010 0000 ... 0000 0000 0001
MOV	r2, r1, ROR #1    @ Same, for VM
@ROR   r3, r2, #4     @ r3 = 0001 0010 ... 0000 0000 0000
MOV	r3, r2, ROR #4    @ Same, for VM

@No Rotate Left, instead rotate left x bits with ROR by (32-x)
MOV   r5, #0xFF      @ r5 = 0x000000FF
@Rotate r5 left 12 bits by ROR (32-12) = 20 bits; answer in r6
@ROR   r6, r5, #20    @ r6 = 0x000FF000
MOV	r6, r5, ROR #20    @ Same, for VM

@Halt program
SWI   0x11
