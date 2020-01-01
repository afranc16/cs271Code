/*
Demonstrates the use of bitwise OR (ORR), AND and ExclusiveOR
*/

_start:

@AND keeps 1 if both inputs are 1
MOV   r1,      #0xac             @ r1 = 0000 ... 1010 1100
@              #0xFD                    0000 ... 1111 1101
AND   r2, r1,  #0xFD             @ r2 = 0000 ... 0010 1100

@ORR keeps 1 from either pattern
MOV   r4,      #0xac             @ r4 = 0000 ... 1010 1100
MOV   r5,      #0xF1             @ r5 = 0000 ... 1111 0001  
ORR   r6, r4, r5                 @ r6 = 0000 ... 1010 1101         


@EOR gives 1 if bits are different
MOV   r7,      #0xac              @ r7 = 0000 ... 1010 1100
@              #0xFD                     0000 ... 1111 0110
EOR   r8, r7,  #0xFF              @ r8 = 0000 ... 0101 1010

MOV   r9,      #0xAC              @ r9 = 0000 ... 1010 1100
MVN   r10, r9                     @ r10= 1111 ... 0101 0011
MVN   r11, r10                    @ r11= 0000 ... 1010 1100


SWI   0x11       @halt
