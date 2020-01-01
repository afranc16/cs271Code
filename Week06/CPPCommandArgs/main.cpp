
/**
  * Demonstrates the use of command line args
  *  Run from a command prompt with extra information after:
  *  CPPCommandArgs.exe this is some extra
  *
  *  Or, from QTCreator use Projects>Run settings to add Command
  *  line arguments
  */


#include <iostream>

using namespace std;

/**
 * @brief main start point of program
 * @param argc number of arguments
 * @param argv array of C-strings. First is program name, rest are extra args
 */
int main(int argc, char* argv[])
{
    cout << "argc is: " << argc << endl;

    for(int i = 0; i < argc; i++) {
        cout << "argv[" << i << "]: " << argv[i] << endl;
    }
}
