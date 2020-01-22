/*
   Infite loop with backward branch
*/

.text
_start:
   MOV   r1, #0      @init r1

loopStart:
   ADD   r1, r1, #1   @ r1++
   B     loopStart


end:  b end       @stop program
