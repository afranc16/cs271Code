/*
Note: conditional execution is an interesting feature of ARM
You should be aware of it, and may find it handy, but will NOT
be expected to produce it on a test.

Translation using conditional execution of:
if(x == 2)
    y = 5;
else
    y = 3;
*/

.data
x:      .word   2
y:      .word   0


.text
_start:
   LDR     r1, =x      @load x's address
   LDR     r1, [r1]    @r1 = x

   CMP     r1, #2      @test r1 vs 2 (calculate r1 - 2)

   MOVEQ   r2, #5      @only executed if CMP set status indicating values EQual
   MOVNE   r2, #3      @only executed if CMP set status indicating values Not Equal

   LDR     r3, =y      @load y's address
   STR     r2, [r3]    @store result back to y

end:  b end       @stop program
