/*
Demonstrates an implementation of:
while(r1 < 5)
   r1++

This version reduces the number of statements "in the loop" by placing update
at start and test at end.
*/

.text
_start:
   MOV   r1, #0      @init r1

   B     loopTest    @kick start loop by jumping ahead to test

loopStart:
   ADD   r1, r1, #1  @ r1++
loopTest:
   CMP   r1, #5      @compare r1 to 5
   BLT   loopStart   @if r1 Less Than 5, go to loopStart

   MOV   r0, r0      @do nothing... rest of program here



end:  b end       @stop program