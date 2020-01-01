/*
Demonstrates a C++ function that can be used from assembly
*/

//Declare doubleNum as a function that uses C-linkage
extern "C" int doubleNum(int x) {
   return 2 * x;
}
