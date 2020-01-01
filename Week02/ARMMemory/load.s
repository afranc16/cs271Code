/*
Demonstrates loading of data from outside current section

Data in other sections cannot be loaded directly. First load address, then
load value at address using [register]
*/


.data
x:   .word   0x12345678

.text
.global start
_start:
LDR   r1, =x      @r1 <- address of x
                  @int* r1 = &x; in c++

LDR   r2, [r1]    @r2 <- value at address stored in r1
                  @int r2 = *r1; in C++

end:  b end       @stop program