/*
Demonstrates making use of C libraries from assembly to read an integer
*/

@declare all the C functions we will be using
.extern scanf
.extern printf

.data
prompt:        .asciz "Enter a number: "
inputFormat:   .asciz "%i"            @one integer
messageEven:   .asciz "That is even\n"
messageOdd:    .asciz "That is odd\n"


.align
inputNum:   .word   0

.text

@When using c std libs, we must call our entry point main
@ the c library defines a _start that will call our main
.global main
main:
   LDR   r0, =prompt       @load string address to r0
   BL    printf

   LDR   r0, =inputFormat  @load &readFormat to r0
   LDR   r1, =inputNum     @load &inputNum to r1
   BL    scanf
   @result should be inputNum contains entered integer

   LDR   r4, =inputNum
   LDR   r4, [r4]          @r4 = inputNum
   AND   r4, r4, #1        @mask lowest bit
   CMP   r4, #0            @lowest bit == 0?
   LDREQ r0, =messageEven
   LDRNE r0, =messageOdd

   @print one of the two messages just loaded
   BL    printf

   @call standard library to exit
   BL    exit
