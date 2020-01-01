/*
Translation of:
if(x < 2)
    y = 5;
else
    y = 3;
*/

.data
x:      .word   1
y:      .word   0

.text
_start:
   LDR     r1, =x       @load x's address
   LDR     r1, [r1]     @load x

   CMP     r1, #2       @test x vs 2 (x - 2)
   BGE     else         @branch to else if x Greater or Equal

   @if part
   MOV     r2, #5
   B       endElse      @done with if part... get past else

else:
   @else part
   MOV     r2, #3

endElse:
   @done with if/else
   LDR     r3, =y       @load y's address
   STR     r2, [r3]     @y = value set in if/else

   SWI 0x11 @halt
