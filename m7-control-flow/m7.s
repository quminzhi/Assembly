
m7.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <mov>:
#include <stdio.h>

long mov(long* ptr) {
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   %rbp
   5:	48 89 e5             	mov    %rsp,%rbp
   8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return *(ptr + 1);
   c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10:	48 8b 40 08          	mov    0x8(%rax),%rax
}
  14:	5d                   	pop    %rbp
  15:	c3                   	retq   

0000000000000016 <lea>:

long* lea(long* ptr) {
  16:	f3 0f 1e fa          	endbr64 
  1a:	55                   	push   %rbp
  1b:	48 89 e5             	mov    %rsp,%rbp
  1e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return ptr + 1;
  22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  26:	48 83 c0 08          	add    $0x8,%rax
}
  2a:	5d                   	pop    %rbp
  2b:	c3                   	retq   

000000000000002c <arith>:

// 1st param: r(e)di
// 2nd param: r(e)si
// 3rd param: r(e)dx
int arith(int param1, int param2, int* ptr) {
  2c:	f3 0f 1e fa          	endbr64 
  30:	55                   	push   %rbp
  31:	48 89 e5             	mov    %rsp,%rbp
  34:	89 7d ec             	mov    %edi,-0x14(%rbp)
  37:	89 75 e8             	mov    %esi,-0x18(%rbp)
  3a:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    int local = param1 + *ptr;
  3e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  42:	8b 10                	mov    (%rax),%edx
  44:	8b 45 ec             	mov    -0x14(%rbp),%eax
  47:	01 d0                	add    %edx,%eax
  49:	89 45 fc             	mov    %eax,-0x4(%rbp)
    return local;
  4c:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
  4f:	5d                   	pop    %rbp
  50:	c3                   	retq   

0000000000000051 <bitwise>:

// bitwise negation
// sar: right shift (arithmetic signed)
int bitwise(int val, int mask) {
  51:	f3 0f 1e fa          	endbr64 
  55:	55                   	push   %rbp
  56:	48 89 e5             	mov    %rsp,%rbp
  59:	89 7d fc             	mov    %edi,-0x4(%rbp)
  5c:	89 75 f8             	mov    %esi,-0x8(%rbp)
    val &= -mask;
  5f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  62:	f7 d8                	neg    %eax
  64:	21 45 fc             	and    %eax,-0x4(%rbp)
    return val >> 2;
  67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  6a:	c1 f8 02             	sar    $0x2,%eax
}
  6d:	5d                   	pop    %rbp
  6e:	c3                   	retq   

000000000000006f <bitwise2>:

// shr: right shift (logical / unsigned)
int bitwise2(unsigned int val, unsigned int mask) {
  6f:	f3 0f 1e fa          	endbr64 
  73:	55                   	push   %rbp
  74:	48 89 e5             	mov    %rsp,%rbp
  77:	89 7d fc             	mov    %edi,-0x4(%rbp)
  7a:	89 75 f8             	mov    %esi,-0x8(%rbp)
    val &= -mask;
  7d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80:	f7 d8                	neg    %eax
  82:	21 45 fc             	and    %eax,-0x4(%rbp)
    return val >> 2;
  85:	8b 45 fc             	mov    -0x4(%rbp),%eax
  88:	c1 e8 02             	shr    $0x2,%eax
}
  8b:	5d                   	pop    %rbp
  8c:	c3                   	retq   

000000000000008d <lea_arith>:

// lea for arithemtic, addressed in 8 bytes, the upper half bytes
// will be discarded when assigned to a 4-byte register.
int lea_arith(int param1, int param2) {
  8d:	f3 0f 1e fa          	endbr64 
  91:	55                   	push   %rbp
  92:	48 89 e5             	mov    %rsp,%rbp
  95:	89 7d fc             	mov    %edi,-0x4(%rbp)
  98:	89 75 f8             	mov    %esi,-0x8(%rbp)
    return 5 + param1 + (param2 * 4);
  9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  9e:	8d 50 05             	lea    0x5(%rax),%edx
  a1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  a4:	c1 e0 02             	shl    $0x2,%eax
  a7:	01 d0                	add    %edx,%eax
}
  a9:	5d                   	pop    %rbp
  aa:	c3                   	retq   

00000000000000ab <promotion>:

// promotion
// movsb: sign extend
int promotion(signed char c) {
  ab:	f3 0f 1e fa          	endbr64 
  af:	55                   	push   %rbp
  b0:	48 89 e5             	mov    %rsp,%rbp
  b3:	89 f8                	mov    %edi,%eax
  b5:	88 45 fc             	mov    %al,-0x4(%rbp)
    return c;
  b8:	0f be 45 fc          	movsbl -0x4(%rbp),%eax
}
  bc:	5d                   	pop    %rbp
  bd:	c3                   	retq   

00000000000000be <promotion_u>:

// movzb: zero extend
unsigned int promotion_u(unsigned char c) {
  be:	f3 0f 1e fa          	endbr64 
  c2:	55                   	push   %rbp
  c3:	48 89 e5             	mov    %rsp,%rbp
  c6:	89 f8                	mov    %edi,%eax
  c8:	88 45 fc             	mov    %al,-0x4(%rbp)
    return c;
  cb:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
}
  cf:	5d                   	pop    %rbp
  d0:	c3                   	retq   

00000000000000d1 <arr_index>:

// index: sign extend, move 4 bytes to 8 bytes
int arr_index(int* arr, int i) {
  d1:	f3 0f 1e fa          	endbr64 
  d5:	55                   	push   %rbp
  d6:	48 89 e5             	mov    %rsp,%rbp
  d9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  dd:	89 75 f4             	mov    %esi,-0xc(%rbp)
    return arr[i]; // movslq %esi,%rsi
  e0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  e3:	48 98                	cltq   
  e5:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  ec:	00 
  ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  f1:	48 01 d0             	add    %rdx,%rax
  f4:	8b 00                	mov    (%rax),%eax
}
  f6:	5d                   	pop    %rbp
  f7:	c3                   	retq   

00000000000000f8 <arr_index_u>:

// instead of movzlq, but mov
// mov dst is 4-byte subreg, complier will zero out upper 4 bytes 
// automatically
int arr_index_u(int* arr, unsigned int i) {
  f8:	f3 0f 1e fa          	endbr64 
  fc:	55                   	push   %rbp
  fd:	48 89 e5             	mov    %rsp,%rbp
 100:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 104:	89 75 f4             	mov    %esi,-0xc(%rbp)
    return arr[i]; // mov %esi,%esi
 107:	8b 45 f4             	mov    -0xc(%rbp),%eax
 10a:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 111:	00 
 112:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 116:	48 01 d0             	add    %rdx,%rax
 119:	8b 00                	mov    (%rax),%eax
}
 11b:	5d                   	pop    %rbp
 11c:	c3                   	retq   

000000000000011d <if_then>:

/* control flow */
int if_then(int param) {
 11d:	f3 0f 1e fa          	endbr64 
 121:	55                   	push   %rbp
 122:	48 89 e5             	mov    %rsp,%rbp
 125:	89 7d fc             	mov    %edi,-0x4(%rbp)
    if (param > 5) {
 128:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
 12c:	7e 06                	jle    134 <if_then+0x17>
        param |= 1;
 12e:	83 4d fc 01          	orl    $0x1,-0x4(%rbp)
 132:	eb 04                	jmp    138 <if_then+0x1b>
    } else {
        param ^= 3;
 134:	83 75 fc 03          	xorl   $0x3,-0x4(%rbp)
    }

    return param;
 138:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
 13b:	5d                   	pop    %rbp
 13c:	c3                   	retq   

000000000000013d <while_loop>:

int while_loop(int n) {
 13d:	f3 0f 1e fa          	endbr64 
 141:	55                   	push   %rbp
 142:	48 89 e5             	mov    %rsp,%rbp
 145:	89 7d ec             	mov    %edi,-0x14(%rbp)
    int sum = 0, i = 1;
 148:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 14f:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
    while (i < n) {
 156:	eb 0a                	jmp    162 <while_loop+0x25>
        sum += i;
 158:	8b 45 fc             	mov    -0x4(%rbp),%eax
 15b:	01 45 f8             	add    %eax,-0x8(%rbp)
        i++;
 15e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    while (i < n) {
 162:	8b 45 fc             	mov    -0x4(%rbp),%eax
 165:	3b 45 ec             	cmp    -0x14(%rbp),%eax
 168:	7c ee                	jl     158 <while_loop+0x1b>
    }

    return sum;
 16a:	8b 45 f8             	mov    -0x8(%rbp),%eax
}
 16d:	5d                   	pop    %rbp
 16e:	c3                   	retq   

000000000000016f <for_loop>:

int for_loop(int n) {
 16f:	f3 0f 1e fa          	endbr64 
 173:	55                   	push   %rbp
 174:	48 89 e5             	mov    %rsp,%rbp
 177:	89 7d ec             	mov    %edi,-0x14(%rbp)
    int sum = 0;
 17a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    for (int i = 0; i < n; i++) {
 181:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 188:	eb 0a                	jmp    194 <for_loop+0x25>
        sum += i;
 18a:	8b 45 fc             	mov    -0x4(%rbp),%eax
 18d:	01 45 f8             	add    %eax,-0x8(%rbp)
    for (int i = 0; i < n; i++) {
 190:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 194:	8b 45 fc             	mov    -0x4(%rbp),%eax
 197:	3b 45 ec             	cmp    -0x14(%rbp),%eax
 19a:	7c ee                	jl     18a <for_loop+0x1b>
    }

    return sum;
 19c:	8b 45 f8             	mov    -0x8(%rbp),%eax
}
 19f:	5d                   	pop    %rbp
 1a0:	c3                   	retq   

00000000000001a1 <main>:

int main(int argc, char* argv[]) {
 1a1:	f3 0f 1e fa          	endbr64 
 1a5:	55                   	push   %rbp
 1a6:	48 89 e5             	mov    %rsp,%rbp
 1a9:	89 7d fc             	mov    %edi,-0x4(%rbp)
 1ac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     
    return 0;
 1b0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1b5:	5d                   	pop    %rbp
 1b6:	c3                   	retq   
