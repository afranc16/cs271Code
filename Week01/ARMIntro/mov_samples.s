/*
ARM basic syntax and the move instruction
*/

/* Multiline comment
   _start marks begining of program */

.text
.global _start
_start:

@Line comment
MOV   r1, #100    @Place 100 base 10 in r1
MOV   r2, #0xff   @Place hex ff (255) in r2
MOV   r3, #0b1100 @Place 1100 binary in r3 (12 in deciamal, 0xC in Hex)
MOV   r4, #'A'    @Place char 'A' or 65 in r4
MOV   r5, r3      @Copy value in r3 into r5


end:  b end       @stop program
