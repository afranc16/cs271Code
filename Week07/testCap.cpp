
#include <iostream>
#include <cstdlib>
#include <ctime>


using namespace std;

extern "C" void cap(int* data, int size, int max);


int main() {
    int numValues = 20;
    srand(time(0));

    int* values = new int[numValues];

    //Fill with -250 to 250
    for(int i = 0; i < numValues; i++) {
        values[i] = rand() % 501 - 250;
    }

    cap(values, numValues, 100);

    for(int i = 0; i < numValues - 1; i++) {
        cout << values[i] << ", ";
    }
    cout << values[numValues - 1];
}
