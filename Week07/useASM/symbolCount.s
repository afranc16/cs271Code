/*
Demonstrates declaring an assembly "function" for use in c++
*/

@declare symbolCount as a symbol visible to other units
.global symbolCount

.text
/*
symbolCount - count occurances of char in a string
r0 = address of null terminated string
r1 = char to count in the string
*/
symbolCount:
   PUSH  {r4, r5}    @preserve registers we will use

   MOV   r4, #0      @r4 = count

   B     loopTest
loopStart:
   @r5 is current char
   CMP   r5, r1
   ADDEQ r4, r4, #1  @if match, add to counter

   ADD   r0, r0, #1  @increment address for string to next char

loopTest:
   LDRSB r5, [r0]    @r5 = current char
   CMP   r5, #0      @is it null?
   BNE   loopStart


   MOV   r0, r4      @setup return value
   POP   {r4, r5}
   MOV   pc, lr      @return
