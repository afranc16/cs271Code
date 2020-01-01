/*
   Demonstrates an assembly "function" that returns the smaller
   of two values.

   Program finds min of x, y, and z and leaves answer in r0
*/

.data
x:    .word    12
y:    .word    10
z:    .word    18

.text
.global _start
_start:
   @Get x, y and z
   LDR   r5, =x      @get address of x
   LDR   r5, [r5]    @r5 = x
   LDR   r6, =y      @get address of y
   LDR   r6, [r6]    @r6 = y
   LDR   r7, =z      @get address of z
   LDR   r7, [r7]    @r7 = z

   @Use min function to determine min(x,y)
   @Put first param in r0, second in r1
   MOV   r0, r5      @x
   MOV   r1, r6      @y
   BL    min
   @r0 now has smaller of x and y

   @Use min function again to find min( min(x, y), z )
   @r0 already has min(x, y)
   MOV   r1, r7      @z
   BL    min
   @final answer is in r0

   @exit program
   SWI   0x11


/*
   Returns smaller of two values. Equivalent to:
   int min(int a, int b) {
      if(b < a)
         a = b;
      return a;
   }
Inputs:
   r0: a
   r1: b
Output:
   r0: min value
*/
min:
   CMP   r0, r1   @compare parameters
   @if r1 is < r0, replace r0 with r1, otherwise r0 has correct value
   BLE   doneMinIf
   MOV   r0, r1   @b was smaller, copy into r0
doneMinIf:
   MOV   PC, LR   @copy Link Register into PC to return
