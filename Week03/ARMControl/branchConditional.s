/*
Demonstrates the CoMPare instruction and conditional Branch instruction
*/

.text
_start:
   MOV   r1, #1      @load some values
   MOV   r2, #2

   CMP   r1, r2
   BEQ   target1     @Branch EQual
                     @ jump ahead to "target1" if r1 == r2
   MOV   r3, #3      @skipped if r1 == r2
   B     end         @skip ahead to "end"

target1:
   MOV     r4, #4

end:
   SWI 0x11 @halt
