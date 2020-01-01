/*
   Use the LDR rd, [rm, rn, lsl #] format to access items in an array.

   This program has an array and empty space to hold another array of the same size.
   It copies from the array to the empty space, doubling each element.
*/

.data
@An array of 5 ints
myArray:    .word   10, 20, 30, 40, 50
arraySize:  .word   5         @size of myArray

doubled:   .space  20        @20 bytes = 5 words


.text
_start:
LDR   r1, =arraySize    @ r1 = &arraySize
LDR   r1, [r1]          @ r1 = arraySize

LDR   r2, =myArray      @ load myArray start address
LDR   r3, =doubled     @ load newArray start address

MOV   r4, #0            @ r4 = loop counter

B     looptest          @ jump ahead to loop test

loopstart:
@Get current element r4 from myArray
LDR   r5, [r2, r4, lsl #2]          @ r5 = current value in myArray

LSL	r5, r5, #1			@double r5

@Store value out to element r4 in newArray
STR   r5, [r3, r4, lsl #2]          @ currnet value in newArray = r5

@go to next step
ADD   r4, r4, #1        @ add one to counter

looptest:
CMP   r4, r1            @ Compare counter r4 to size of array in r1
BLT   loopstart         @ If counter Less Than size, go back to start


end:
B     end                     @stop here