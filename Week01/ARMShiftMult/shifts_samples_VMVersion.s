/*
Using Logical Shifts
In a logical shift, bits that "fall off" are discarded
0's are always used to fill blanks
*/


.text
.global _start
_start:

MOV	r1, #0x12     @ r1 = 0000 ... 0000 0001 0010

@Shift 4 BITS or 1 hex digit to the left
@LSL	r2, r1, #4    @ r2 = 0000 ... 0001 0010 0000
MOV	r2, r1, LSL #4    @ Same, for VM

@LSR	r3, r1, #2    @ r3 = 0000 ... 0000 0000 0100
MOV	r3, r1, LSR #2    @ Same, for VM

@Shift r1 by number of bits in r3 (4), result in r5
@LSL   r5, r1, r3
MOV	r5, r1, LSL r3    @ Same, for VM


end:  b end       @stop program

