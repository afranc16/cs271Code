/*
Demonstrates loading bytes of data, and storing them
LDRB rx, [ry]  : LoaD Register rx with Byte from address ry
LDRSB rx, [ry] : LoaD Register rx with Byte from address ry
                 extend leftmost bit of byte to preserve sign
*/

.data

b:   .byte   34   @ 0x22
c:   .byte   -1   @ 0xFF
d:   .byte   0    @

.align


.text
.global _start
_start:
@Add one to a
LDR   r3, =b      @r3 <- address of b
LDRB  r3, [r3]    @r3 <- b

LDR   r4, =c      @r4 <- address of c
@INCORRECT - load negative value as unsigned:
LDRB  r4, [r4]    @r4 <- 0x000000FF = 255!!!

LDR   r4, =c      @r4 <- address of c
@CORRECT - load negative value as signed:
LDRSB r4, [r4]    @r4 <- 0xFFFFFFFF = -1
