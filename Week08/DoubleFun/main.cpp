#include <iostream>
#include <iomanip>

using namespace std;

int main()
{
    double a = (0.1 + 0.2) + 0.3;
    double b = 0.1 + (0.2 + 0.3);

    double c = 100 * 0.1 + 100 * 0.2;
    double d = 100 * ( 0.1 + 0.2 );


    cout << setprecision(32);

    cout << "a: " << a << endl;
    cout << "b: " << b << endl;

    cout << "c: " << c << endl;
    cout << "d: " << d << endl;

    return 0;
}

