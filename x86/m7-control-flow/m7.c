#include <stdio.h>

long mov(long* ptr) {
    return *(ptr + 1);
}

long* lea(long* ptr) {
    return ptr + 1;
}

// 1st param: r(e)di
// 2nd param: r(e)si
// 3rd param: r(e)dx
int arith(int param1, int param2, int* ptr) {
    int local = param1 + *ptr;
    return local;
}

// bitwise negation
// sar: right shift (arithmetic signed)
int bitwise(int val, int mask) {
    val &= -mask;
    return val >> 2;
}

// shr: right shift (logical / unsigned)
int bitwise2(unsigned int val, unsigned int mask) {
    val &= -mask;
    return val >> 2;
}

// lea for arithemtic, addressed in 8 bytes, the upper half bytes
// will be discarded when assigned to a 4-byte register.
int lea_arith(int param1, int param2) {
    return 5 + param1 + (param2 * 4);
}

// promotion
// movsb: sign extend
int promotion(signed char c) {
    return c;
}

// movzb: zero extend
unsigned int promotion_u(unsigned char c) {
    return c;
}

// index: sign extend, move 4 bytes to 8 bytes
int arr_index(int* arr, int i) {
    return arr[i]; // movslq %esi,%rsi
}

// instead of movzlq, but mov
// mov dst is 4-byte subreg, complier will zero out upper 4 bytes 
// automatically
int arr_index_u(int* arr, unsigned int i) {
    return arr[i]; // mov %esi,%esi
}

/* control flow */
int if_then(int param) {
    if (param > 5) {
        param |= 1;
    } else {
        param ^= 3;
    }

    return param;
}

int while_loop(int n) {
    int sum = 0, i = 1;
    while (i < n) {
        sum += i;
        i++;
    }

    return sum;
}

int for_loop(int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += i;
    }

    return sum;
}

int main(int argc, char* argv[]) {
     
    return 0;
}
