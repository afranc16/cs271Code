/*
Demonstration of loading and storing values from an array of
consecutive SIGNED bytes in memory:
   myArray[3] = myArray[0] + myArray[1]
*/

.data
@an array of 4 SIGNED bytes
myArray:    .byte   -3, 4, 10, 0

.align   @make sure we are padded to a full word
@not needed here, but good to always do it

.text
_start:
   LDR   r1, =myArray      @ load arrays start address

   LDRSB r2, [r1]          @ r2 = myArray[0] as Signed Byte

   LDRSB r3, [r1, #1]      @ r3 = myArray[1] (1 byte from start)

   ADD   r4, r2, r3        @ r4 = myArray[0] + myArray[1]

   @STore Register r4 back to array as Byte
   STRB  r4, [r1, #3]      @ myArray[2] (2 bytes from start) = r4 (sum)


   SWI 0x11    @halt
