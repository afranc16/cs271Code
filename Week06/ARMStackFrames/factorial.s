/*
   Demonstrates stack frames used for recursive function fact (factorial)
*/

.text
.global _start
_start:
   @call factorial(4)
   MOV   r0, #5
   BL    fact

   MOV   r4, r0   @result to r4

   @stop program
   end:  B     end
   @exit linux style
   @MOV   r7, #1
   @SWI   0




/* fact function
int fact(int n) {
   if( n == 0 )
      return 1;

   int nextValue = fact(n - 1);
   return nextValue * n;
}

Params:
 r0 = num
Return:
 r0 = num!

Stack Frame:
-------------------------------
FramePointer
Relative
Address           Contents
-------------------------------
   -12               nextValue
   -8                n
   -4                old fp
   0                 my lr
*/

fact:
   @@@ Prologue --------------------------------------------
   PUSH  {fp, lr}          @store my return address and previous FP
   ADD   fp, sp, #4        @set fp to point at start of frame
   SUB   sp, sp, #8        @Make 8 bytes space for two local variables/parameters
   STR   r0, [fp, #-8]     @store r0 to n in stack frame

   @@@ Body --------------------------------------------

   @if (n == 0) return 1
   LDR   r0, [fp, #-8]     @load n into r0
   CMP   r0, #0            @check if == 0
   MOVEQ r0, #1            @if so, store 1 to r0
   BEQ   factExit          @and jump to exit point

   @int nextValue = fact(n - 1);
   LDR   r0, [fp, #-8]     @load n into r0
   SUB   r0, r0, #1
   @Save r0-3 if we care about them... do not
   BL fact
   STR  r0, [fp, #-12]     @store return into nextvalue
   @no registers to restore


   @@@return nextValue * n;
   LDR  r1, [fp, #-12]     @get nextValue into r1
   LDR  r2, [fp, #-8]      @get n into r1
   MUL  r0, r1, r2         @r0 = nextValue * n

factExit:
   @@@ Epilog --------------------------------------------
   @r0 already has return
   ADD   sp, sp, #8        @Release 8 bytes for local variables
   POP   {fp, lr}          @restore all registers
   MOV   PC, LR            @return
