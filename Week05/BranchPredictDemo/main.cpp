#include <iostream>
#include <cstdlib>
#include <ctime>
#include <algorithm>

using namespace std;


const unsigned int BIG_SIZE = 200000000;


//Generate array with random numbers 0-255
//Possibly sort it
//Add all values < 128
void createDataAndConditonallySum(bool sortFirst)
{
    // Generate data
    int* data = new int[BIG_SIZE];

    for (unsigned c = 0; c < BIG_SIZE; ++c)
        data[c] = std::rand() % 256;


    // !!! With this, the next loop runs faster
    if(sortFirst) {
        cout << "Sorting array..." << endl;
        std::sort(data, data + BIG_SIZE);
        cout << "Adding up large values..." << endl;
    } else {
        cout << "Adding up large values..." << endl;
    }

    clock_t startTime = clock();
    unsigned long long sum = 0;
    // Primary loop
    for (unsigned c = 0; c < BIG_SIZE; ++c)
    {
        if (data[c] >= 128)
            sum += data[c];
    }

    cout << "   -sum : " << sum << " (ignore - printed just so work can't be optimized out)" << endl;
    cout << "   -took: " << (clock() - startTime) / static_cast<double>(CLOCKS_PER_SEC) << "sec" << endl;
    delete [] data;
}



int main()
{
    //Generate array with random numbers 0-255
    //Add all values < 128
    createDataAndConditonallySum(false);

    //Generate array with random numbers 0-255
    //Sort it
    //Add all values < 128
    createDataAndConditonallySum(true);

    return 0;
}
