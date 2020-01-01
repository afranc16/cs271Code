/*
Count e's in the string myString - place number in r1

Roughly equivelent to:
   int eCount = 0;
   int i = 0;
   while(myString[i] != '\0') {
      char current = myString[i];
      if (current == 'e')
         eCount += 1;
      i++;
   }
*/

.data
myString:   .asciz  "hello there people"
.align      @force alignment to word boundary


.text
_start:
MOV   r1, #0         @ r1 = eCount

LDR   r2, =myString  @ r2 = base address of myString
MOV   r3, #0         @ i = 0   - r3 will be index

B     looptest       @ Jump to loop test

loopstart:
   @We know that r4 has current char from doing test
   CMP   r4, #'e'       @ compare current char to e (0x65)
   BNE   endIf
   ADD   r1, #1         @ if equal, add one to counter

   endIf:
   ADD   r3, r3, #1     @ i++

looptest:
LDRB  r4, [r2, r3]   @ r4 = current char (myString[i])
                     @ Load as a BYTE!!!

CMP   r4, #0         @ 0 char signifies end of string
BNE   loopstart      @ If not null char, go through a loop iteration

end:
B     end                  @stop here
