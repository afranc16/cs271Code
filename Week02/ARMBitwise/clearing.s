/*
Demonstrates the use of BItwise Clear instruction
*/


.text
.global _start
_start:

LDR   r5, =0x1BADDEED

@Clear bits 25-29
BIC   r6, r5,  #0x3E000000

@Clear bits 16-31 (first two bytes)
BIC   r7, r5,  #0xFF000000   @clear first byte
BIC   r7, r7,  #0x00FF0000   @now clear second


end:  b end       @stop program
