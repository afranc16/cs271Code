/*
Demonstrates loading bytes of data, and storing them
LDRB rx, [ry]  : LoaD Register rx with Byte from address ry

STRB rx, [ry]  : STore Register
                 take last byte of rx, store into address ry

LDRSB rx, [ry] : LoaD Register rx with Byte from address ry
                 extend leftmost bit of byte to preserve sign
*/

.data
a:   .byte   6    @ 0x06
b:   .byte   34   @ 0x22
c:   .byte   -1   @ 0xFF
d:   .byte   0    @

.text
.global start
_start:
@Add one to a
LDR   r1, =a      @r1 <- address of a
LDRB  r2, [r1]    @r2 <- a

ADD   r2, r2, #1  @r2 <- a + 1
STRB  r2, [r1]    @a  <- r2


LDR   r3, =b      @r3 <- address of b
LDRB  r3, [r3]    @r3 <- b

LDR   r4, =c      @r4 <- address of c
@INCORRECT - load negative value as unsigned:
LDRB  r4, [r4]    @r4 <- 0x000000FF = 255!!!

LDR   r4, =c      @r4 <- address of c
@CORRECT - load negative value as signed:
LDRSB r4, [r4]    @r4 <- 0xFFFFFFFF = -1




ADD   r5, r3, r4  @r5 <- b + c
LDR   r6, =d      @r6 <- address of d
STR   r5, [r6]    @d <- b + c

end:  b end       @stop program
