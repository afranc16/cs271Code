/*
   Total elements of array into r6 using a loop based on a stored size
*/

.data
@an array of 5 ints
myArray:     .word   10, 20, 30, 40, 50
arraySize:   .word   5     @size of myArray


.text
_start:
LDR   r1, =arraySize    @ r1 = &arraySize
LDR   r1, [r1]          @ r1 = arraySize

LDR   r2, =myArray      @ load myArray start address
                        @ r2 will always point at array start

MOV   r3, #0            @ r3 = loop counter
MOV   r5, #0            @ r5 = bytes into array to current element
MOV   r4, #0            @ r4 = total

B     looptest          @ jump ahead to loop test

loopstart:
@Calculate address of current element by adding offset r5 to base address
LDR   r6, [r2, r5]      @ r6 = element at address r2 + r5
ADD   r4, r4, r6        @ total += current value

@go to next step
ADD   r3, r3, #1        @ add one to counter
ADD   r5, r5, #4        @ add 4 to offset value for "current element"

looptest:
CMP   r3, r1            @ Compare counter r3 to size of array in r1
BLT   loopstart         @ If counter Less Than size, go back to start

end:
B     end               @stop here