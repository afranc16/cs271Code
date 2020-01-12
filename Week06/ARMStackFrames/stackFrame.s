/*
   Demonstrates stack frames for a simple function
*/

.text
.global _start
_start:
   @call bar(4)
   MOV   r0, #4
   BL    bar

   MOV   r4, r0   @Move returned value to r4

   @stop program
   end:  B     end
   @exit linux style
   @MOV   r7, #1
   @SWI   0



/*
Bar function - pointless demonstration function

int bar(int num) {
   int a = num + 1;
   a *= 2;
   return a;
}

Params:
 r0 = num
Return:
 r0 = a  (2*num + 1)

Stack Frame:
-------------------------------
FramePointer
Relative
Address           Contents
-------------------------------
   -12            a
   -8             num
   -4             old fp
   -0             my lr
*/

bar:
   @@@ Prologue --------------------------------------------
   PUSH  {fp, lr}       @push necessary registers to stack
                        @if we were using r4+ would need to push those too
                        @sp ends up 4 bytes into stack frame

   ADD   fp, sp, #4     @set frame pointer to top of frame

   SUB   sp, sp, #8     @move stack pointer down 8 bytes
                        @allocates space for num and a

   STR   r0, [fp, #-8]  @store r0 to location reserved for num

   @@@ Body --------------------------------------------

   @@@int a = num + 1
   LDR   r0, [fp, #-8]  @load num into r0
   ADD   r0, r0, #1
   STR   r0, [fp, #-12] @store result into a

   @@@a *= 2
   LDR   r0, [fp, #-12] @load a into r1
   LSL   r0, r0, #1     @ *= 2
   STR   r0, [fp, #-12] @store back into a

   @@@ Epilog --------------------------------------------
   LDR   r0, [fp, #-12] @load a into r0 for return
   ADD   sp, sp, #8     @move stack pointer up to remove 8 bytes
                        @releases space for num and a
   POP   {fp, lr}       @restore all registers
                        @if we were using r4+ would need to pop those too
   BX    lr             @return
