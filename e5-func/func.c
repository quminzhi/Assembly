#include "stdio.h"

int plus(int a, int b) {
    int c = 2;

    return a + b + c;
}

int main(int argc, char* argv[]) {
    int result = plus(3, 4);

    return 0;
}
