/*
Demonstrates thumb mode
*/

.data

.text
.arm            	@tell assembler to use arm instructions
_start:
   LDR   r0, =thumbStuff
   @Set 1's bit to 1 in address to indicate switch to thumb
   ADD   r0, #1
   BX    r0          @branch with mode exchange

.thumb               @tell assembler to use thumb instructions
thumbStuff:
   MOV   r1, #0x11
   MOV   r2, #0x22
   @MOV r3, #0xFF00  @No shift allowed!

   ADD   r4, r1, r2

   @Can't use r8+ in 3 op instructions
   @ADD r10, r1, r2
   @Can use in two operand instructions
   ADD   r10, r4    @r10 += r4

   MOV   r3, #5
   CMP   r3, #0
   BEQ   endIf
   MOV   r5, #0xAA
   @MOVNE  r5, #0xAA   @Only Branch can have conditions
endIf:

   @Leave 1's bit as 0 to switch back to arm
   LDR   r0, =armStuff
   BX    r0      @branch with mode exchange

.arm      @go back to using full arm instructions
armStuff:
   SWI   0x11
