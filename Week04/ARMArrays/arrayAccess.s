/*
Demonstration of loading and storing values from an array of
consecutive words in memory:
   myArray[4] = myArray[0] + myArray[1]
*/

.data
@An array of 4 words
myArray:      .word   5, 10, 15, 20, 0
@myArray will store address of first word
@ each additional one if 4 bytes after the last

.text
_start:
   LDR   r1, =myArray   @ load myArray start address

   LDR   r2, [r1]       @ r2 = value at address of myArray
                        @    = myArray[0]

   LDR   r3, [r1, #4]   @ r2 = value at address of myArray + 4 bytes
                        @    = myArray[1]

   ADD   r4, r2, r3     @ r4 = myArray[0] + myArray[1]

   STR   r4, [r1, #16]  @ store r4 (sum) to 16 bytes after start of myArray
                        @ myArray[4] = r4

   SWI 0x11    @halt
