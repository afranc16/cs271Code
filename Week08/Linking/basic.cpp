
const int CONST = 10;
int global = 5;

int foo() {
    return 42;
}

int foo(int x) {
    int z = 5 * x;
    return z;
}

int bam(int x, int z) {
    int temp = 0;
    temp = foo(x);
    temp = temp + 5;
    return temp;
}

void bar() {
    static int counter = 0;
    counter++;

    global += counter;
}


int main() {
    int extra = 2;



    int temp = foo();

    temp = foo(temp);

    bam(3, 2);


    return temp;
}
