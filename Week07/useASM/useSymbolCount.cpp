/*
Demonstrates making use of linking to asm function
*/

#include <iostream>
#include <cstdio>

using namespace std;


//Declare the function in the assembly module
// extern "C" tells the compiler not to mangle the function name
extern "C" int symbolCount(char* string, char symbol);


int main() {

   char buffer[100];
   cout << "Enter a string: ";

   //read up to 100 chars into buffer from stdin
   fgets(buffer, 100, stdin);

   char target;
   cout << "Enter a char to count: ";
   cin >> target;

   int result = symbolCount(buffer, target);

   cout << "I found " << result << " copies" << endl;

}
