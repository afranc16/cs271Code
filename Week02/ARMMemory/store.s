/*
Demonstrates setting memory location y to 2 * x

STR rx, [ry] : STore Register places value in rx into memory location ry

*/

@Will automatically be after code
.data
x:   .word   5
y:   .word   0

.text
.global _start
_start:
LDR   r1, =x      @r1 <- address of x  (&x)
LDR   r2, [r1]    @r2 <- x

LSL   r2, r2, #1  @r2 <- r2 * 2

LDR   r3, =y      @r3 <- address of y  (&y)
STR   r2, [r3]    @store from r2 to location given by r3
                  @y <- r2

end:  b end       @stop program
