/*
Demonstrates loading of data from inside current section

Data placed in the same section can be loaded by label using
LoaD Register command

Data should be after halt/return so we don't try to run it!
*/

.text
_start:
LDR   r1, x       @r1 <- value of x
MOV   r0, r0      @Do nothing
@program ends / function returns
SWI   0x11        @halt

x:   .word   0x12345678
