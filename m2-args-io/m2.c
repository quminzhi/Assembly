#include <stdio.h>
#include <stdlib.h>

int foo(int a, int b, int c, int d, int e, int f, int g, int h, int i) {
    return a + g + h + i;
}

int main(int argc, char* argv[]) {
    foo(1, 2, 3, 4, 5, 6, 7, 8, 9);
    
    int i = 0;
    if (i > 10) {
        printf("greater than 10\n");
    }

    return 0;
}
