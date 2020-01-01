/*
Using Rotate Right
In a Rotate, bits that "fall off" are wrapped around
*/


.text
.global _start
_start:

MOV   r1, #0x12      @ r1 = 0000 0000 ... 0000 0001 0010

@Rotate r1 right by 1 bit
ROR   r2, r1, #1     @ r2 = 0010 0000 ... 0000 0000 1001

@Rotate r1 right by 4 bits - one hex char
ROR   r3, r1, #4     @ r3 = 0010 0000 ... 0000 0000 0001

@Rotate r1 left 12 bits by ROR 20 bits (32 - 20 = 12); answer in r6
ROR   r6, r1, #20    @ r6 = 0x00012000


end:  b end       @stop program
