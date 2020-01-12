/*
   Main program is using registers 1, 4 and 5
   It is responsible for storing/restoring r1 while calling function
*/
.text
.global _start
_start:
   MOV   r1, #0xAA
   MOV   r4, #30
   MOV   r5, #-12

   PUSH  {r1}        @I want to keep r1 safe, so save it
   MOV   r0, r4      @set up parameter for abs call
   BL    abs
   MOV   r4, r0      @save result from the function back to r4
   POP   {r1}        @restore r1

   PUSH  {r1}        @I want to keep r1 safe, so save it
   MOV   r0, r5      @setup param
   BL    abs
   MOV   r5, r0      @save result
   POP   {r1}        @restore r1

end:
   B     end         @stop here



@----------------------------------------------------------------------
/*AbsoluteValue
Calculates absolute value of a value passed in via r0.

Demonstrates register responsibility:
Uses r0, r1, r4, r5 - must preserve existing values in r4/r5

Equivelent to:
int abs(int x) {
   if (x < 0) x = -x;
   return x;
}

Params:
r0 = number
Return:
r0 = |number|
*/
abs:
   @store any registers 4+ I want to use
   PUSH  {r4, r5}

   @do work, using 
   MOV   r1, #0
   CMP   r0, r1         @compare parameter in r0 to 0
   BGE   end_absIf      @if r0 was >= jump ahead
   MVN   r4, r0         @r0 was negative... copy its bitwise negation to r4
   ADD   r5, r4, #1     @add 1 to get 2's complement negation into r5
   MOV   r0, r5         @move negated version into r0

end_absIf:
   @r0 has correct answer at this point
   @restore any registers 4+ I used
   POP   {r4, r5}
   BX    LR         @return
