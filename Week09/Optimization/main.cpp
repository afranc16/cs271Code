#include <iostream>
#include <ctime>
#include <cmath>
#include <fstream>
#include <cstdlib>

using namespace std;

//Struct to pack together numbers with the count of their digits
struct numData {
    int number;
    int digitCount;
};

//Calculates number of decimal digits in an int
int numberOfDigits(int x) {
    int digits = 0;
    while(x > 0) {
        digits++;
        x /= 10;
    }
    return digits;
}


int main(){
    const int SIZE = 1024 * 1024;
    const int RUNS = 10;

    //storage for big list of numbers and the number of digits in each num
    int* numbers = new int[SIZE];
    int* digitCounts = new int[SIZE];

    //space to store same information in an array of structs
    numData* combined = new numData[SIZE];

    int total = 0;

    clock_t start = clock();    //start timer

    //Repeat work multiple times for better measurement
    for(int r = 0 ; r < RUNS; r++) {

        //Read data
        ifstream inFile;
        inFile.open("data.txt");
        for(int i = 0; i < SIZE; i++) {
            inFile >> numbers[i];
        }
        if(inFile.fail()) {
            cout << "Your read failed. Not running test." << endl;
            return 0;
        }
        inFile.close();


        //Do work
        for(int i = 0; i < SIZE; ++i) {
            digitCounts[i] = numberOfDigits(numbers[i]);
            total += digitCounts[i];
        }

    }

    double end = clock() - start;  //end timer
    cout << "Took: " << end / CLOCKS_PER_SEC << " seconds" << endl;

    return total;
}
