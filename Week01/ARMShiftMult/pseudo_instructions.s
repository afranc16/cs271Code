/*
Demonstration of how assembler uses pseudo instructions to
provide
*/

.text
.global start
_start:

@MOV can only load 8 significant bits shifted an even number of bits
MOV   r1, #0b10000001         @OK, only 8 bits to represent
MOV   r1, #0b10000001000000   @OK, only 8 bits to represent number
                              @    shifted 6 bits

@MOV   r1, #0b100000001       @Illegal - too many bits required to represent
                              @  value

@This should be illegal... too many bits
MOV   r6, #0b11111111111111111111111111111111    @ r6 = #0xFFFFFFFF or #-1

@But this is legal and has same effect
MVN   r6, #0             @ r6 = 1111 1111 ...

@These all assemble to same instruction:
MOV   r6, #-1            @ r6 = 1111 1111 ...
MOV   r6, #0xffffffff    @ r6 = 1111 1111 ...
MVN   r6, #0             @ r6 = 1111 1111 ...

@So do these:
ADD   r6, r6, #-1    
SUB   r6, r6, #1      


end:  b end       @stop program

