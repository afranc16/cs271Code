/*
Note: conditional execution is an interesting feature of ARM
You should be aware of it, and may find it handy, but will NOT
be expected to produce it on a test.

Translation using conditional execution of:
r1 = 5
while(r1 >= 0)
   r1--
*/

.text
_start:
   MOV      r1, #5      @init r1

   B        loopTest    @branch to test
loopStart:
   SUBS     r1, r1, #1  @r1--
                        @Set the status flags based on result
loopTest:
   BPL      loopStart   @branch to start
                        @If status flags indicate PLus (zero or positive)

   MOV      r0, r0      @do nothing... rest of program here
   SWI 0x11 @halt
