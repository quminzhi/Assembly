global _start

section .text
_start:
    mov ebx, 1   ; set exit code
    mov ecx, 4   ; number of iterations
loop:
    add ebx, ebx ; ebx += ebx
    dec ecx      ; ecx -= 1
    cmp ecx, 0   ; compare ecx with 0
    jg loop      ; jump to loop if greater
    mov eax, 1   ; sys_exit system call
    int 0x80
