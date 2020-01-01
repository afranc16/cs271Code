/*
Demonstrates using inline assembly inside c++ code
*/

#include <iostream>


using namespace std;


int main() {

   int nums[] = {5, 2, 4, 7, 6, 18};
   int numsSize = 6;

   cout << "Original numbers: " << endl;
   for(int i = 0; i < numsSize - 1; i++)
      cout << nums[i] << " ";
   cout << nums[numsSize - 1] << endl;

   #ifdef __arm__
   //Only use inline assembly if compiling on ARM

   //multiply every value in array by 5
   //Use r4, as loopCounter, r5 as curValue,
   asm (
   "MOV r4, #0 \n"
   "B loopTest \n"
   "loopStart: \n"
   "LDR r5, [%[arrayAddr], r4, lsl #2] \n" /* r5 = arrayAddr + 4*counter */
   "ADD r5, r5, r5, lsl #2 \n"  			/* r5 *= 5 */
   "STR r5, [%[arrayAddr], r4, lsl #2] \n" /* store back to array */
   "ADD r4, r4, #1 \n"					/* increment counter */
   "loopTest: \n"
   "CMP r4, %[size] \n"
   "BLT loopStart \n"
   : 						/*output operands (none) */
   : [arrayAddr] "r" (nums),    	/* input operands */
     [size] "r" (numsSize)
   : "r4", "r5" 				/* clobbers */
   );
   #else
   for(int i = 0; i < numsSize; i++)
      nums[i] *= 5;
   #endif

   cout << "Multiplied by 5: " << endl;
   for(int i = 0; i < numsSize - 1; i++)
      cout << nums[i] << " ";
   cout << nums[numsSize - 1] << endl;


}
