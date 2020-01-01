/*
Using the Move Negated instruction
*/


.text
.global start
_start:

@Load r1, then load its negation into r2
MOV   r1, #1      @ r1 = 0000 0000 ... 0001
MVN   r2, r1      @ r2 = 1111 1111 ... 1110

@Load r3, then load its negation into r4
MOV   r3, #0xA3   @ r3 = 0000 0000 ... 1010 0011
MVN   r4, r3      @ r4 = 1111 1111 ... 0101 1100

@Load the negation of 0000 0000 0000 ... 1111 into r5
MVN   r5, #0xF    @ r5 = 1111 1111 ... 0000

end:  b end       @stop program
