
func.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <plus>:
#include "stdio.h"

int plus(int a, int b) {
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   rbp
   5:	48 89 e5             	mov    rbp,rsp
   8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
   b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int c = 2;
   e:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [rbp-0x4],0x2

    return a + b + c;
  15:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  18:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  1b:	01 c2                	add    edx,eax
  1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  20:	01 d0                	add    eax,edx
}
  22:	5d                   	pop    rbp
  23:	c3                   	ret    

0000000000000024 <main>:

int main(int argc, char* argv[]) {
  24:	f3 0f 1e fa          	endbr64 
  28:	55                   	push   rbp
  29:	48 89 e5             	mov    rbp,rsp
  2c:	48 83 ec 20          	sub    rsp,0x20
  30:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  33:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    int result = plus(3, 4);
  37:	be 04 00 00 00       	mov    esi,0x4
  3c:	bf 03 00 00 00       	mov    edi,0x3
  41:	e8 00 00 00 00       	call   46 <main+0x22>
  46:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

    return 0;
  49:	b8 00 00 00 00       	mov    eax,0x0
}
  4e:	c9                   	leave  
  4f:	c3                   	ret    
