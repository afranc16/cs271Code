/*
Demonstrates loading of data and alignment

Note: No real code, just check data at memory address 0x1000
*/

.data
@a and b take up 1 byte each
a:    .byte    4
b:    .byte    0xBB

.align @adds 0's to fill until word boundary

@Word is 4 bytes
@Should align to 4 bytes before placing word
c:    .word    0xCCCCCCCC

@d takes up 2 bytes (half-word)
d:    .hword   0xDDDD

@e/f can go in same word as d
e:    .byte    0xEE
f:    .byte    -1    @0xFF

@g: starts a new word
g:    .byte    0x12

.text
MOV r1, r1           @do nothing

end:  b end          @stop program


