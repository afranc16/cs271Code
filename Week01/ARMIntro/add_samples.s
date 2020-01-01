/*
Demonstrates the use of the ADD instruction
*/

.text
.global start
_start:
@Load some starting values
MOV   r1, #100
MOV   r2, #200
ADD   r3, r1, r2        @r3 = r1 + r2
ADD   r4, r1, #1        @r4 = r1 + 1
ADD   r4, r4, #1        @r4++

end:  b end       @stop program