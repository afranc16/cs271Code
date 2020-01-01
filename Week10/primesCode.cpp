
//Compile in godbolt using
// x86-64 gcc 8.3 and pass flag -m32
// compare to
// ARM gcc 8.2 and pass flag -marm

#include <cstdio>
using namespace std;


bool isPrime(int number) {
    int i = 2;
    while(i < number) {
        if( number % i == 0 ) {
            return false;
        }
        i++;
    }
    return true;
}

int countPrimes(int limit) {
    int numberOfPrimes = 0;
    int numbersOnLine = 0;
    int number = 2; // number we are testing for primeness
    while (number <= limit)
    {
        if( isPrime(number) ) {
            numberOfPrimes++;
        }
        number++;
    }

    return numberOfPrimes;
}


int main()
{

    printf("Find all prime numbers <= n, enter n: ");
    int n;
    scanf("%d", &n);

    int numPrimes = countPrimes(n);

    printf("I found %d primes.\n", numPrimes);

    return 0;
}
