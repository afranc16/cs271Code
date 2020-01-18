/*
Demonstrates using ANDs or shifts to "mask" a bit pattern and only retain
a desired set of the bits.
*/

.text
.global _start
_start:   

LDR   r5, =0x1BADDEED

@isolate bits 0-7 (last byte: 0xED)
@ & means bitwise OR
AND   r6, r5, #0xFF        @r6 = 0x1BADDEED & 0x000000FF = 0x000000ED


@isolate bits 8-15 (next to last byte: 0xDE)
AND   r7, r5, #0xFF00      @r7 = 0x1BADDEED & 0x0000FF00 = 0x0000DE00


@isolate bits 16-27 (0xBAD from 0x1BADDEED)
@ want pattern 0x0FFF0000, but that takes too many bits to represent, so build it
MOV   r8, #0x00FF0000      @Start with 00FF0000
ORR   r8, r8, #0x0F000000  @r8 = 00FF0000 | 0F000000 = 0FFF0000
AND   r8, r5, r8           @r8 = 0x1BADDEED & 0x0FFF0000 = 0x0BAD0000

@isolate bits 2-5 : 
@Use mask         0000 ... 0011 1100 = 3C
@r5 has           ???? ... 1110 1101 (...ED)
@   result ==     0000 ... 0010 1100 = 0x2C
AND   r8, r5, #0x3C        @r8 = 0x1BADDEED & 0x0000003C = 0x0000002C

end:  b end       @stop program
