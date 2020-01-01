/*
Using the Subtract and Reverse Subtract instruction
*/


.text
.global _start
_start:

@Load some starting values
MOV   r1, #50
MOV   r2, #200
SUB   r2, r2, r1     @r2 = r2 - r1
SUB   r3, r1, r2     @r3 = r1 - r2
SUB   r4, r1, #10    @r4 = r1 - 10
@SUB   r4, #10, r1   @Invallid! Immediate value must be last

@RSUB reverses the order of the operands
MOV   r1, #50
MOV   r2, #200
RSB   r3, r2, r1    @r3 = r1 - r2 using RSUB
RSB   r5, r1, #10   @r5 = 10 - r1

end:  b end       @stop program