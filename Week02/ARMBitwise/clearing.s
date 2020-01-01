/*
Demonstrates the use of BItwise Clear instruction
*/


.text
.global start
_start:

LDR   r5, =0x1BADDEED

@Clear last three bits, place result into r6
BIC   r6, r5, #0b111         @or #0x7

@Clear bits 16-31 (first two bytes)
BIC   r7, r5,  #0xFF000000   @clear first byte
BIC   r7, r7,  #0x00FF0000   @now clear second


end:  b end       @stop program
