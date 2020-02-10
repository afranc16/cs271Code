#include <iostream>

using namespace std;

class Time {
private:
    int second;
    int minute;
    int hour;

public:
    Time();
    Time(int h, int m, int s);
    int getMinute();
    void setMinute(int m);
    void incrHour();
    int getHour();
};


Time::Time() {
    second = 0;
    minute = 0;
    hour = 0;
}

Time::Time(int h, int m, int s) {
    second = s;
    minute = m;
    hour = h;
}

int Time::getMinute() {
    return this->minute;
}

void Time::setMinute(int m) {
    this->minute = m;
}

void Time::incrHour() {
    hour++;
    if(hour == 24)
        hour = 0;
}

int Time::getHour() {
    return hour;
}


int main()
{
    Time time1;
    Time time2(2, 24, 45);

    time1.getHour();
    time2.getHour();

    return 0;
}

