#include <stdio.h>

typedef struct Fraction {
    long numer, denom;
} Fraction;

long displacement(long* arr) {
    return arr[1];
}

long disp_struct(Fraction* f) {
    return f->denom;
}

long scale_index(long* arr, long i) {
    return arr[i];
}

void mem_to_mem(long* arr, long i) {
    arr[i] = arr[i+1];
}

// q = 8 bytes = 64 bits
// l = 4 bytes = 32 bits
// w = 2 bytes = 16 bits
// b = 1 bytes = 8  bits
void suffix(short* ptr) {
    *(ptr + 2) = 5;
}

int main(int argc, char* argv[]) {
    Fraction i;
    disp_struct(&i);

    long arr[10];
    displacement(arr);
    scale_index(arr, 5);
    mem_to_mem(arr, 1);

    return 0;
}
