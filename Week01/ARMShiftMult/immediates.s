
/* Demonstrates illegal and legal immediate values */
   
.text
.global _start
_start:

@Legal - requires a rotate
MOV   r1, #41728

@Legal - requires rotating FF
MOV   r2, #FF0000

@Legal - no rotate required for values < 256
MOV   r2, #A0

@Illegal - can't be represented - comment out to fix
MOV   r2, #10000


end:  b end       @stop program