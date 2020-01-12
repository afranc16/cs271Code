/*
   Demonstrates behavior of BL instruction
*/

.text
.global _start
_start:
   @do pointless work
   MOV   r0, r0

   @Branch to myFunction
   @set Link register to address of next line after this
   BL    myFunction

   MOV   r1, r0      @copy r0 to r1
   MOV   r0, #0      @clear r0

   @Branch to myFunction
   @set Link register to address of next line after this
   BL    myFunction

   @stop here
end:
   B     end


/*
* Minimal function that just needs to return to
* where we came from.
*/
myFunction:
   MOV   r0, #10     @put 10 in r0
   BX    lr          @return