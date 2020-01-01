/*
Demonstrates how you can swap two registers in place wihtout using a temp
*/

_start:

@Call r1 x and r2 y
MOV   r1, #9         @x = 9 = 1001
MOV   r2, #7         @y = 7 = 0111

@ ^ means EOR

@r2 = x ^ y
EOR   r2, r1, r2     @r2 = 1001 ^ 0111 = 1110

@r1 = x ^ (x ^ y)
@   = x ^ (x ^ y)
@   = (x ^ x) ^ y
@   =   (0)   ^ y
@   = y
EOR   r1, r1, r2     @r1 = 1001 ^ 1110 = 0111


@r2 = y ^ (x ^ y)
@   = x ^ (y ^ y)
@   = x ^   (0)
@   = x
EOR   r2, r1, r2     @r2 = 0111 ^ 1110 = 1001


@Halt program
SWI   0x11
