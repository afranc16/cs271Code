/*
Demonstrates making use of C++ function in assembly
*/

@declare doubleNum as an external symbol
.extern doubleNum

.text
.global _start
_start:
   MOV   r0, #4
   BL    doubleNum   @doubleNum(4)

   @result is in r0... will be returned to system
   @can view with "echo $?" from command prompt

   MOV   r7, #1      @exit syscall code
   SWI 0
