/*
Demonstrates the unconditional Branch instruction
*/

.text
_start:
   MOV   r1, #1    @load some values
   MOV   r2, #2
   B     target    @branch to target
   MOV   r3, #3    @skipped
   MOV   r4, #4    @skipped
target:
   MOV   r5, #5

   SWI 0x11 @halt
