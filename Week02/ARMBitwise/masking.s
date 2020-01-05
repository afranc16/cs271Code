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

@-----------------------------------------------------------------

LDR   r5, =0xE0821003

@isolate bits 12-15 using just shifts
LSL   r9, r5, #16          @r9 = 0x10030000
LSR   r9, r9, #28          @r9 = 0x00000001

LDR   r6, =0x1BADDEED
@isolate bits 16-27 (0xBAD from 0x1BADDEED) using just shifts
LSL   r10, r6, #4          @r10 = 0xBADDEED0
LSR   r10, r10, #20        @r10 = 0x00000BAD

end:  b end       @stop program
