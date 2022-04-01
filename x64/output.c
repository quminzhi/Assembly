#include <stdio.h>

int plus(int a, int b) {
    asm volatile(
        "mov %edi, %eax;"
        "add %esi, %eax;");
}

int plusii(int a, int b) {
    int c = 0;
    asm volatile(
        "mov %1, %0;"
        "add %2, %0;"
        : "=r"(c)
        : "r"(a), "r"(b));
    return c;
}

int main(int argc, char *argv[]) {
    int a = 1;
    int b = 2;

    printf("%d\n", plus(a, b));
    printf("%d\n", plusii(a, b));

    return 0;
}
