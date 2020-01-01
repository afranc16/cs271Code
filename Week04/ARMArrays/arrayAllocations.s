/*
Demonstration allocating various arrays of storage
*/

.data
@array of 4 words (32-bit integers)
myArray:      .word   5, 6, 8, 9

@array of 6 bytes (8 bit integers)
myBytes:      .byte   10, 11, 12, 13, 14, 15

.align   @make sure we are padded to a full word
@always do this after allocating bytes before allocating larger chunks!

@40 bytes or 10 words (integers) worth of empty space
myEmptyArray: .space  40

@Easy to spot pattern at end of storage
.word   0xFFFFFFFF

@no real code...
.text
SWI 0x11    @halt
