/*
Translation of program to sum all the numbers from 1 to max:
   int sum = 0;
   int max = 10;

   for(r2 = 1; r2 <= max; r2++)
      sum += r2;
*/

.data
sum:   .word   0
max:   .word   10

.text
_start:
   LDR   r1, =max    @r1 = &max
   LDR   r1, [r1]    @r1 = max

   MOV   r2, #0      @r2 is counting variable (i)
   MOV   r3, #0      @r3 is sum

@Use the test at end loop strategy
   B     loopTest    @Start loop by jumping to test
loopStart:
   ADD   r3, r3, r2  @sum += r2
   ADD   r2, r2, #1  @r2++
loopTest:
   CMP   r2, r1      @Compare counter in r2 to max in r1
   BLE   loopStart   @branch to start if i (r2) <= y (r1)

   LDR   r4, =sum    @r4 = &sum
   STR   r3, [r4]    @sum = r3 


end:  b end       @stop program
