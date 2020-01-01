#include <iostream>
#include <thread>
#include <vector>
#include <sstream>
#include <ctime>
#include <mutex>

using namespace std;


int globalInfo = 100;

std::mutex global_lock;

void func() {
    for(int j = 0; j < 2000; j++) {
        //global_lock.lock();

        //Add 10 to globalInfo
        int temp = globalInfo;
        temp += 10;
        globalInfo = temp;

        //Let someone else in to run...
        this_thread::yield();

        //Subtract the 10
        globalInfo = globalInfo - 10;

        //global_lock.unlock();
    }
    return;
}

int main()
{
    int NUM_THREADS = 4;
    //Variable sized list of threads
    vector<thread> threads;

    cout << "Starting workers. globalInfo = " << globalInfo << endl;

    for(int i = 0; i < NUM_THREADS; i++) {
        threads.push_back( thread(&func) );
    }

    for(int i = 0; i < NUM_THREADS; i++){
        //Wait for each of the threads before continuing on with program
        threads[i].join();
    }

    cout << "Everyone done. globalInfo = " << globalInfo << endl;

    return 0;
}
