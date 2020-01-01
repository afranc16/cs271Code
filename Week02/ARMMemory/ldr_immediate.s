/*
Demonstrates loading of large immediate value into register using
LoaD Register command

Data is tucked into end of segment
*/

.text
_start:
LDR   r1, =0xABCDABCD

MOV   r0, r0      @Do nothing

@Halt program
SWI   0x11

@0xABCDABCD will be stored here 
