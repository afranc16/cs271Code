/*
Using Arithmetic Shift Right
In a right arithmetic shift, bits that "fall off" are discarded
Blanks on left are filled with a copy of leftmost bit to preserve sign

No Arithmetic shift left - just use logical
*/


.text
.global start
_start:

MOV   r1, #5
LSL   r2, r1, #1  @ r6 = 10 or 0xA
LSL   r3, r1, #2  @ r6 = 20 or 0x14

@right shift n bits = divide by 2^n
MOV   r5, #50
ASR   r6, r5, #1     @ r6 = r5 / 2 = 25 or 0x19
ASR   r7, r5, #3     @ r7 = r5 / 8 = 6 or 0x6
MOV   r8, #-200 
ASR   r9, r8, #6     @ r9 = r8 / 64 = -3 or 0xFFFFFFFC


end:  b end       @stop program