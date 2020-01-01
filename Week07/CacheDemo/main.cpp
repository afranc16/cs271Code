#include <iostream>
#include <cstdlib>
#include <ctime>
#include <algorithm>

using namespace std;


const int NUM_ELEMENTS = 1024 * 1024;
const int NUM_ROWS = 1024;
const int NUM_COLS = NUM_ELEMENTS / NUM_ROWS;

const int TIMING_REPETITIONS = 256;

void loopCols(int* bigMatrix) {
    cout << "Looping Column Major Order... " << endl;
    long startTime = clock();

    long total = 0;
    for(int i = 0; i < TIMING_REPETITIONS; i++) {
        for(int c = 0; c < NUM_COLS; c++) {
            for(int r = 0; r < NUM_ROWS; r++) {
                total += bigMatrix[r * NUM_COLS + c];
            }
        }
    }

    long endTime = clock();
    cout << "Total= " << total << endl;
    cout << "   -took: " << (endTime - startTime) / static_cast<double>(CLOCKS_PER_SEC) << "sec" << endl;
}

void loopRows(int* bigMatrix) {
    cout << "Looping Row Major Order... " << endl;
    long startTime = clock();

    long total = 0;
    for(int i = 0; i < TIMING_REPETITIONS; i++) {
        for(int r = 0; r < NUM_ROWS; r++) {
            for(int c = 0; c < NUM_COLS; c++) {
                total += bigMatrix[r * NUM_COLS + c];
            }
        }
    }

    long endTime = clock();
    cout << "Total= " << total << endl;
    cout << "   -took: " << (endTime - startTime) / static_cast<double>(CLOCKS_PER_SEC) << "sec" << endl;
}


int main()
{
    //Allocate large 2-D array
    int* bigMatrix = new int[NUM_ELEMENTS];

    generate(bigMatrix, bigMatrix + NUM_ELEMENTS, rand);
    random_shuffle(bigMatrix, bigMatrix + NUM_ELEMENTS);

    //Add up values by working through array one column at a time
    loopCols(bigMatrix);


    //Add up values by working through array one row at a time
    loopRows(bigMatrix);


    return 0;
}
