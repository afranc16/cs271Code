/*
Demonstrates an implementation of:
r1 = 0
while(r1 < 5)
   r1++

Note: Assmebly conditions are typically reversed of the logic in high level
languages. Instead of specifying when to do something, they generally specify
when to NOT do the thing.
*/

.text
_start:
   MOV   r1, #0         @init r1

loopStart:
   CMP   r1, #5
   BGE   endLoop        @branch to endLoop when r1 >= 5
   ADD   r1, r1, #1     @ r1++  (r1 was < 5)
   B     loopStart      @go back to start of loop

endLoop:
   MOV   r0, r0         @do nothing... rest of program here

   SWI 0x11 @halt
