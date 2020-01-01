/*
Note: conditional execution is an interesting feature of ARM
You should be aware of it, and may find it handy, but will NOT
be expected to produce it on a test.

Translation using conditional execution of:
r1 = r1 - 10
if( r1 < 0 )
    r1 = 0
*/

.text
_start:
   MOV      r1, #5         @init r1

   SUBS     r1, r1, #10    @r1 -= 10
                           @Update status flags based on result

   MOVMI    r1, #0         @set r1 to 0
                           @If status flags show MInus (negative)

   MOV      r0, r0         @do nothing... rest of program here

   SWI 0x11          @halt
