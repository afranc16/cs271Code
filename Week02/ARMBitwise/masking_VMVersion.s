/*
Demonstrates using ANDs or shifts to "mask" a bit pattern and only retain
a desired set of the bits.
*/


.text
.global start
_start:


@setup r5 with 1BADDEED
@ | means bitwise OR
MOV   r5,     #0x000000ED  @r5 = 0x000000ED
ORR   r5, r5, #0x0000DE00  @r5 = r5 | 0x0000DE00 = 0x0000DEED
ORR   r5, r5, #0x00AD0000  @r5 = r5 | 0x00AD0000 = 0x00ADDEED
ORR   r5, r5, #0x1B000000  @r5 = r5 | 0x1B000000 = 0x1BADDEED

@isolate bits 0-7 (last byte: 0xED)
@ & means bitwise OR
AND   r6, r5, #0xFF        @r6 = 0x1BADDEED & 0x000000FF = 0x000000ED

@isolate bits 8-15 (next to last byte: 0xDE)
AND   r7, r5, #0xFF00      @r7 = 0x1BADDEED & 0x0000FF00 = 0x0000DE00
@LSR   r7, r7, #8           @Shift so result in rightmost byte
MOV   r7, r7, LSR #8       @Same, but for VM

@isolate bits 16-27 (0xBAD from 0x1BADDEED)
@ want pattern 0x0FFF0000, but that takes too many bits to represent, build it
MOV   r8, #0x00FF0000   @Start with 00FF0000
ORR   r8, r8, #0x0F000000   @r8 = 00FF0000 | 0F000000 = 0FFF0000
AND   r8, r5, r8        @r8 = 0x1BADDEED & 0x0FFF0000 = 0x0BAD0000
@LSR   r8, r8, #16       @Move result into rightmost bytes
MOV   r8, r8, LSR #16       @Same, but for VM


@isolate bits 8-15 (next to last byte: 0x DE) using just shifts
@LSL   r9, r5, #16       @r9 = 0xDEED0000
MOV   r9, r5, LSL #16       @Same, but for VM
@LSR   r9, r9, #24       @r9 = 0x000000DE
MOV   r9, r9, LSR #24       @Same, but for VM

@isolate bits 16-27 (0xBAD from 0x1BADDEED) using just shifts
@LSL   r10, r5, #4       @r10 = 0xBADDEED0
MOV   r10, r5, LSL #4       @Same, but for VM
@LSR   r10, r10, #20     @r10 = 0x00000BAD
MOV   r10, r10, LSR #20       @Same, but for VM

end:  b end       @stop program

