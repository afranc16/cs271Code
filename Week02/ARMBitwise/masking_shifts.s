/*
Demonstrates using ANDs or shifts to "mask" a bit pattern and only retain
a desired set of the bits.
*/

.text
.global _start
_start:   

LDR   r5, =0xE0821003

@isolate bits 12-15 using just shifts
LSL   r9, r5, #16          @r9 = 0x10030000
LSR   r9, r9, #28          @r9 = 0x00000001

LDR   r6, =0x1BADDEED
@isolate bits 16-27 (0xBAD from 0x1BADDEED) using just shifts
LSL   r10, r6, #4          @r10 = 0xBADDEED0
LSR   r10, r10, #20        @r10 = 0x00000BAD

end:  b end       @stop program
