/*
Demonstrates loading bytes of data, and storing them
LDRB rx, [ry]  : LoaD Register rx with Byte from address ry

STRB rx, [ry]  : STore Register Byte
                 take last byte of rx, store into address ry

LDRSB rx, [ry] : LoaD Register rx with Byte from address ry
                 extend leftmost bit of byte to preserve sign
*/


.data
a:   .byte   6    @ 0x06
.align

.text
.global _start
_start:
LDR      r1, =a         @r1 <- address of a
LDRSB    r2, [r1]       @r2 <- a

ADD      r2, r2, #1     @r2 <- a + 1
STRB     r2, [r1]       @a  <- r2

end:  b end       @stop program
