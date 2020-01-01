/*
Demonstrates making use of C libraries to make a random number
*/

@declare all the c functions we will be using
.extern time
.extern srand
.extern rand
.extern printf

.data
message:    .asciz "You rolled %i\n"
.align


.text
@When using c std libs, we must call our entry point main
@ the c library defines a _start that will call our main
@ also should let gcc do linking
.global main
main:
   MOV   r0, #0      @load null pointer
   BL    time        @call cstdlib time function

   @r0 has return value from time, pass it into srand
   BL    srand

   BL    rand
   @r0 has random number

   MOV   r5, #20
   @SDIV = signed division
   SDIV  r4, r0, r5     @r4 = rand / 20  (floored due to int division)
   MUL   r4, r5, r4     @r4 = 20 * floor(rand / 20)
   SUB   r6, r0, r4     @r6 = rand % 20
   ADD   r6, r6, #1     @r6 = 1-20

   @call printf to print result
   LDR   r0, =message   @load format string into r0
   MOV   r1, r6      @r1 gets first variable to place in string
   BL    printf


   @call standard library to exit
   BL    exit
