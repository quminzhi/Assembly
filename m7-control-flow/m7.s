
m7.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <mov>:
#include <stdio.h>

long mov(long* ptr) {
   0:	f3 0f 1e fa          	endbr64 
    return *(ptr + 1);
   4:	48 8b 47 08          	mov    0x8(%rdi),%rax
}
   8:	c3                   	retq   

0000000000000009 <lea>:

long* lea(long* ptr) {
   9:	f3 0f 1e fa          	endbr64 
    return ptr + 1;
   d:	48 8d 47 08          	lea    0x8(%rdi),%rax
}
  11:	c3                   	retq   

0000000000000012 <arith>:

// 1st param: r(e)di
// 2nd param: r(e)si
// 3rd param: r(e)dx
int arith(int param1, int param2, int* ptr) {
  12:	f3 0f 1e fa          	endbr64 
    int local = param1 + *ptr;
  16:	89 f8                	mov    %edi,%eax
  18:	03 02                	add    (%rdx),%eax
    return local;
}
  1a:	c3                   	retq   

000000000000001b <bitwise>:

// bitwise negation
// sar: right shift (arithmetic signed)
int bitwise(int val, int mask) {
  1b:	f3 0f 1e fa          	endbr64 
    val &= -mask;
  1f:	f7 de                	neg    %esi
  21:	21 fe                	and    %edi,%esi
    return val >> 2;
  23:	89 f0                	mov    %esi,%eax
  25:	c1 f8 02             	sar    $0x2,%eax
}
  28:	c3                   	retq   

0000000000000029 <bitwise2>:

// shr: right shift (logical / unsigned)
int bitwise2(unsigned int val, unsigned int mask) {
  29:	f3 0f 1e fa          	endbr64 
    val &= -mask;
  2d:	f7 de                	neg    %esi
  2f:	21 fe                	and    %edi,%esi
    return val >> 2;
  31:	89 f0                	mov    %esi,%eax
  33:	c1 e8 02             	shr    $0x2,%eax
}
  36:	c3                   	retq   

0000000000000037 <lea_arith>:

// lea for arithemtic, addressed in 8 bytes, the upper half bytes
// will be discarded when assigned to a 4-byte register.
int lea_arith(int param1, int param2) {
  37:	f3 0f 1e fa          	endbr64 
    return 5 + param1 + (param2 * 4);
  3b:	8d 44 b7 05          	lea    0x5(%rdi,%rsi,4),%eax
}
  3f:	c3                   	retq   

0000000000000040 <promotion>:

// promotion
// movsb: sign extend
int promotion(signed char c) {
  40:	f3 0f 1e fa          	endbr64 
    return c;
  44:	40 0f be c7          	movsbl %dil,%eax
}
  48:	c3                   	retq   

0000000000000049 <promotion_u>:

// movzb: zero extend
unsigned int promotion_u(unsigned char c) {
  49:	f3 0f 1e fa          	endbr64 
    return c;
  4d:	40 0f b6 c7          	movzbl %dil,%eax
}
  51:	c3                   	retq   

0000000000000052 <arr_index>:

// index: sign extend, move 4 bytes to 8 bytes
int arr_index(int* arr, int i) {
  52:	f3 0f 1e fa          	endbr64 
    return arr[i]; // movslq %esi,%rsi
  56:	48 63 f6             	movslq %esi,%rsi
  59:	8b 04 b7             	mov    (%rdi,%rsi,4),%eax
}
  5c:	c3                   	retq   

000000000000005d <arr_index_u>:

// instead of movzlq, but mov
// mov dst is 4-byte subreg, complier will zero out upper 4 bytes 
// automatically
int arr_index_u(int* arr, unsigned int i) {
  5d:	f3 0f 1e fa          	endbr64 
    return arr[i]; // mov %esi,%esi
  61:	89 f6                	mov    %esi,%esi
  63:	8b 04 b7             	mov    (%rdi,%rsi,4),%eax
}
  66:	c3                   	retq   

0000000000000067 <if_then>:

/* control flow */
int if_then(int param) {
  67:	f3 0f 1e fa          	endbr64 
    if (param > 107) {
        param += 10;
  6b:	8d 47 0a             	lea    0xa(%rdi),%eax
  6e:	83 ff 6b             	cmp    $0x6b,%edi
  71:	0f 4f f8             	cmovg  %eax,%edi
    }
    return param - 5;
  74:	8d 47 fb             	lea    -0x5(%rdi),%eax
}
  77:	c3                   	retq   

0000000000000078 <main>:

int main(int argc, char* argv[]) {
  78:	f3 0f 1e fa          	endbr64 
     
    return 0;
}
  7c:	b8 00 00 00 00       	mov    $0x0,%eax
  81:	c3                   	retq   
