/*
Translation of:
if(x == 2)
    y = 5;

Note: Assmebly conditions are typically reversed of the logic in high level
languages. Instead of specifying when to do something, they generally specify
when to NOT do the thing.
*/

.data
x:      .word   2
y:      .word   0

.text
_start:
   LDR     r1, =x      @load x's address
   LDR     r1, [r1]    @r1 = x

   CMP     r1, #2      @test r1 vs 2 (calculate r1 - 2)
   BNE     endIf       @branch past "if body" if r1 Not Equal to 2

   @These instructions only executed if r1 was == 2
   MOV     r2, #5
   LDR     r3, =y      @load y's address
   STR     r2, [r3]    @y = 5

endIf:
   MOV     r0, r0      @do nothing... rest of program here


   SWI 0x11 @halt
