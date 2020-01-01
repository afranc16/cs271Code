/*
Using Multiply instruction
No multiplying by immediate values - only register * register
*/

.text
.global start
_start:

MOV   r1, #5
MOV   r2, #3

MUL   r1, r1, r2   @r3 = r1 * r2


MOV   r5, #2
MOV   r6, #3
MOV   r7, #7

MOV   r8, #1000
MOV   r9, #100
MOV   r10, #1

@set r11 to (r5*r8) + (r6*r9) + (r7*r10)
MUL   r11, r5, r8          @(r5*r8)
MLA   r11, r6, r9, r11     @(r6*r9) + (r5*r8)
MLA   r11, r7, r10, r11    @(r7*r10) + (r6*r9) + (r5*r8)

end:  b end       @stop program

