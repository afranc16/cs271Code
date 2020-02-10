#include <iostream>

using namespace std;

class Parent
{
public:
    virtual int getNum() { return 10; }
    virtual int getBigNum() { return 100; }
    int getX() { return x; }
private:
    int x = 1;
};

class Child : public Parent
{
public:
    virtual int getNum() { return 5; }
    virtual int getBigNum() { return 5000; }
    int getY() { return y; }
private:
    int y = 2;
};


int main()
{
    Parent p1;
    Child c1;

    Parent* pp1 = &p1;
    Parent* pp2 = &c1;

    cout << pp1->getNum()    << endl;  //parent version
    cout << pp2->getBigNum() << endl;  //child version
}

