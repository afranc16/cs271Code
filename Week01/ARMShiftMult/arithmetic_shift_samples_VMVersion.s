/*
Using Arithmetic Shift Right
In a right arithmetic shift, bits that "fall off" are discarded
Blanks on left are filled with a copy of leftmost bit to preserve sign

No Arithmetic shift left - just use logical
*/

_start:

MOV   r3, #160       @ r2 = 0x000000a0
@Shift 4 BITS or 1 hex digit
@ASR   r4, r3, #4     @ r4 = 0x0000000a
MOV	r4, r3, ASR #3    @ Same, for VM

MOV   r1, #-160      @ r1 = 0xffffff60
@Sign preserved for negative numbers
@ASR   r2, r1, #4     @ r2 = 0xfffffff6
MOV	r2, r1, ASR #4    @ Same, for VM

@right shift n bits = divide by 2^n
MOV   r5, #50
@ASR   r6, r5, #1     @ r6 = r5 / 2
MOV	r6, r5, ASR #1    @ Same, for VM
@ASR   r7, r5, #3     @ r7 = r5 / 8
MOV	r7, r5, ASR #3    @ Same, for VM

@left shift n bits = multiply by 2^n
MOV   r5, #50
@LSL   r8, r5, #10    @ r8 = r5 * 1024
MOV	r8, r5, LSL #10   @ Same, for VM

@Halt program
SWI   0x11
