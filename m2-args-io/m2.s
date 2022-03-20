
m2.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <foo>:
#include <stdio.h>
#include <stdlib.h>

int foo(int a, int b, int c, int d, int e, int f, int g, int h, int i) {
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   %rbp
   5:	48 89 e5             	mov    %rsp,%rbp
   8:	89 7d fc             	mov    %edi,-0x4(%rbp)
   b:	89 75 f8             	mov    %esi,-0x8(%rbp)
   e:	89 55 f4             	mov    %edx,-0xc(%rbp)
  11:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  14:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
  18:	44 89 4d e8          	mov    %r9d,-0x18(%rbp)
    return a + g + h + i;
  1c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  1f:	8b 45 10             	mov    0x10(%rbp),%eax
  22:	01 c2                	add    %eax,%edx
  24:	8b 45 18             	mov    0x18(%rbp),%eax
  27:	01 c2                	add    %eax,%edx
  29:	8b 45 20             	mov    0x20(%rbp),%eax
  2c:	01 d0                	add    %edx,%eax
}
  2e:	5d                   	pop    %rbp
  2f:	c3                   	retq   

0000000000000030 <main>:

int main(int argc, char* argv[]) {
  30:	f3 0f 1e fa          	endbr64 
  34:	55                   	push   %rbp
  35:	48 89 e5             	mov    %rsp,%rbp
  38:	48 83 ec 20          	sub    $0x20,%rsp
  3c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  3f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    foo(1, 2, 3, 4, 5, 6, 7, 8, 9);
  43:	6a 09                	pushq  $0x9
  45:	6a 08                	pushq  $0x8
  47:	6a 07                	pushq  $0x7
  49:	41 b9 06 00 00 00    	mov    $0x6,%r9d
  4f:	41 b8 05 00 00 00    	mov    $0x5,%r8d
  55:	b9 04 00 00 00       	mov    $0x4,%ecx
  5a:	ba 03 00 00 00       	mov    $0x3,%edx
  5f:	be 02 00 00 00       	mov    $0x2,%esi
  64:	bf 01 00 00 00       	mov    $0x1,%edi
  69:	e8 00 00 00 00       	callq  6e <main+0x3e>
  6e:	48 83 c4 18          	add    $0x18,%rsp
    
    int i = 0;
  72:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    if (i > 10) {
  79:	83 7d fc 0a          	cmpl   $0xa,-0x4(%rbp)
  7d:	7e 0c                	jle    8b <main+0x5b>
        printf("greater than 10\n");
  7f:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 86 <main+0x56>
  86:	e8 00 00 00 00       	callq  8b <main+0x5b>
    }

    return 0;
  8b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  90:	c9                   	leaveq 
  91:	c3                   	retq   
