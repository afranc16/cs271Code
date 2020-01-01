/*
Demonstrates loading of large immediate value into register using
LoaD Register command

Data is tucked into end of segment
*/

.text
.global start
_start:
LDR   r1, =0xABCDABCD
LDR   r2, =45000

end:  b end       @stop program

