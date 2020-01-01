/*
Demonstrates loading of data and alignment

Note: No real code, just check data at memory address 0x1000
*/

.data
@a and b take up 1 byte each
a:    .byte    6
b:    .byte    0x22

.align @adds 0's to fill until word boundary

@Word is 4 bytes
@Should align to 4 bytes before placing word
c:    .word    0xCCCCCCCC

@d takes up 2 bytes (half-word)
d:    .hword   0xABCD

@e can go in same word as d
e:    .byte    -1  @0xFF
f:    .byte    -1  @0xFF

@g: starts a new word
g:    .byte    0xAA

.align 1   @adds 0's to align to a 2-byte boundary
h:    .hword   0x1234

.text
MOV r1, r1   @do nothing


@Halt program
SWI   0x11
